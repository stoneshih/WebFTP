<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div align="center" >
<span style="font-weight: bold;font-size:1.5em;">Simple Web FTP </span>
<%
String user = (String) session.getAttribute("user");
if ( user.length() == 0 )
	out.print("Not yet Login");
else
	out.print(" Login user is '" + user +"'");
%>
</div>

