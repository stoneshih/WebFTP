WebFTP
======
A file exchange tool by http protocol. The original purpose of this web application is to ease the requirement of files exchange between a service provider and his client. It was expected to provide the following useful features when doing files exchange:

1. Simplify the configuration of network fire wall and ftp server.
2. Keep secure enough to protect our target files from improper or invalid access.
3. Provide simple and distinct places(folders) to store relevant files.
4. Make the file exchange procedure clear, open and reliable.

server.xml
----------
1. The size limit of uploaded file is affected in server.xml
2. The UTF-8 file name support is configured in server.xml, too.
3. An example is placed in folder named as "server-config".

Example:

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
