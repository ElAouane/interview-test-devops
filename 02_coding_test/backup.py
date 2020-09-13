

# Import required python libraries

import os
import time
import datetime
import pipes
import boto3
from secrets import access_key, secret_access_key

#=============================================
#
# DATABASE CREDENTIALS TO BACKUP
#
#=============================================

DB_HOST = 'localhost'
DB_USER = 'root'
DB_USER_PASSWORD = ''
DB_NAME = 'mysql'
BACKUP_PATH = '/home/nayden/Desktop/Bink/02_coding_test'

#=============================================
#
# PATH WHERE TO STORE YOUR BACKUP IN LOCAL
#
#=============================================
TODAYBACKUPPATH = '/home/nayden/Desktop/Bink/02_coding_test'


#=============================================
#
# CHECK FOR SINGLE OR MULTIPLE DATABASES
#
#=============================================
print("checking for databases names file.")
if os.path.exists(DB_NAME):
    file1 = open(DB_NAME)
    multi = 1
    print("Databases file found...")
    print("Starting backup of all dbs listed in file " + DB_NAME)

else:
    print("Databases file not found...")
    print("Starting backup of database " + DB_NAME)
    multi = 0

# Starting actual database backup process.
if multi:
    in_file = open(DB_NAME, "r")
    flength = len(in_file.readlines())
    in_file.close()
    p = 1
    dbfile = open(DB_NAME, "r")

    while p <= flength:
        db = dbfile.readline()   # reading database name from file
        db = db[:-1]         # deletes extra line
        dumpcmd = "mysqldump -h " + DB_HOST + " -u " + DB_USER + " -p" + DB_USER_PASSWORD + \
            " " + db + " > " + pipes.quote(TODAYBACKUPPATH) + "/" + db + ".sql"
        os.system(dumpcmd)
        gzipcmd = "gzip " + pipes.quote(TODAYBACKUPPATH) + "/" + db + ".sql"
        os.system(gzipcmd)
        p = p + 1
    dbfile.close()
else:
    db = DB_NAME
    dumpcmd = "mysqldump -h " + DB_HOST + " -u " + DB_USER + " -p" + DB_USER_PASSWORD + \
        " " + db + " > " + pipes.quote(TODAYBACKUPPATH) + "/" + db + ".sql"
    os.system(dumpcmd)
    gzipcmd = "gzip " + pipes.quote(TODAYBACKUPPATH) + "/" + db + ".sql"
    os.system(gzipcmd)

print("")
print("Backup script completed")
print("Your backups have been created in '" + TODAYBACKUPPATH + "' directory")



#=============================================
#
# RETRIEVE CRED FROM SECRETS AND PUSH THE BACKUP
# INTO YOUR AWS BUCKET
#
#=============================================
client = boto3.client('s3', aws_access_key_id=access_key,
                      aws_secret_access_key=secret_access_key)
for file in os.listdir():
    print(file)
    if '.gz' in file:
        upload_file_bucket = 'elaouane'
        upload_file_key = 'mysql/' + str(file)
        client.upload_file(file, upload_file_bucket, upload_file_key)
