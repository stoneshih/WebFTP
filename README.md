WebFTP
======
A file exchange tool by http protocol. The original purpose of this web application is to ease the requirement of files exchange between a service provider and his client. It was expected to provide the following useful features when doing files exchange:

1. Simplify the configuration of network fire wall and ftp server.
2. Keep secure enough to protect our target files from improper or invalid access.
3. Provide simple and distinct places(folders) to store relevant files.
4. Make the file exchange procedure clear, open and reliable.

Configuration
-------------
1. The configuration file is located in WEB-INF/classes/realm.properties
2. We must prepare the related directories specified in client_name.directory owned by tomcat process user recursively. Under this directory, we must create 2 directories, namely, "ClientToCompany" and "CompanyToClient", see the example. 

###### Tables 1: WEB-INF/classes/realm.properties


```
nuvoton.password=xxxxxx
nuvoton.directory=/home/webftp/nuvoton
nuvoton.client=yes
nuvoton_micro-ip.password=yyyyyy
nuvoton_micro-ip.client=nuvoton
```
###### Table 2: Folder structure

```
└── webftp
    └── nuvoton
        ├── ClientToCompany
        └── CompanyToClient
            ├── 119384454654608057.h2h
            ├── IAM_release_2022_0614.tar
            ├── install_env_root.pdf
            ├── pa_install.tar.gz
            ├── System_Requirement.pdf
            └── 系統安裝需求.pdf
```

server.xml
----------
1. The size limit of uploaded file is affected in server.xml
2. The UTF-8 file name support is configured in server.xml, too.
3. An example is placed in folder named as "server-config".

###### Table 3: Server.xml for handling UTF-8 file name and increasing size of uploaded files.

```    
<Connector port="8080" URIEncoding="UTF-8" protocol="HTTP/1.1"
           connectionTimeout="20000"
	       maxPostSize="1073741824"
               redirectPort="8443" />
```

TODO 
----
Some activities need to be recorded for trouble shooting etc.

1. Log in/out, upload and download activities.
2. Format: Timestamp, remote IP, UserName, Do What etc.     
