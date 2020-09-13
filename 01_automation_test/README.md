## VAGRANT

in this folder, you will find my VagrantFile. 

You can run `vagrant up` to spin up the virtual box, ansible will:

    - Install apache2
    - Bind apache *IP* to *0.0.0.0* on port *8081*
    - install docker
    - Copy the content of html folder in the virtualbox, in apache default path

Once the virtualbox is up. You can visit the virtualbox `IP: 192.168.10.100:8081` and you will be able to display apache webserver serving the `index.html` we passed during the provisioning.

## IMPORTANT
If for any reason, you will not be able to display the index.html at the given IP.. please try to input the IP in the following way:

`192.168.10.100:8081/`