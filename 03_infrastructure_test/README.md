# BASIC INFRASTRUCTURE

The aim of the project is to run `terraform apply` and be able to spin up 2 aws ec2 instances in 2 different availability zones.

As we can see in the diagram I set a VPC, and 2 different subnets.

- public subnet: will be serving a front end web application
- private subnet: will be serving a database

The `public subnet`, will have access to the internet, so the user can send requests.

    - in this subnet we can host our front end web application which will accept TCP traffic from users and be able to navigate the web site. As sysadmin we can still ssh inside the instance. For this purpose i left a ssh folder inside the project just be fast on running command to access the instance, but surely i strongly racomand to move this folder and protect the ssh keys to avoid security breach.


The `private subnet` , this subnet does not have any access to the internet.
    
    - This subnet is totally disconected from the public internet access. It has a specific security group which allow communication only throu specific TCP protocols and PORTS. This will allow our `public subnet` to communicate with this insitance over secure connection to send request on behalf of the user and retrieve responses from the database.

The project has been developed in a basic manner just for demostration purpose.
Such us in the `database security group` I opened port 27017 (assuming its a mongoDB) to random *IPs* just to test that my code was working and hitting my instances detail once i run `terraform apply`.
More security level might be considered to isolate further more instances from security breach and future problems and connections.

# LAST BUT NOT LEAST



```├── Basic Iac.png
├── dev
│   ├── dev.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── ssh
│   │   ├── aws
│   │   └── aws.pub
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
│   ├── variable.tf
│   └── version.tf
├── modules
│   ├── database
│   │   ├── database.tf
│   │   ├── output.tf
│   │   ├── securitygroup.tf
│   │   ├── variables.tf
│   │   └── version.tf
│   ├── instances
│   │   ├── instance.tf
│   │   ├── output.tf
│   │   ├── securitygroup.tf
│   │   ├── variables.tf
│   │   └── version.tf
│   └── vpc
│       ├── output.tf
│       ├── variables.tf
│       ├── versions.tf
│       └── vpc.tf
└── README.md
```

When working on a IaC (infrastructure as Code) using terraform, I like to separate my modules (separation of concerns) to keep my code neat and organized.
In folder Modules, i keep all my infrastructure separated in folders(VPC,instances,databases,loadbalancers etc).
Dev folder is the development stage, where i call all my modules for testing purpose, and all the code running from this folder, will be assigned with the ENV= DEV tag

I usually duplicate the project in another folder which i call *deployment* where all the tested and working code will be placed and ready to be deployed in future.





