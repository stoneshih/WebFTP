<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print("<pre>");
out.print("login     = " +session.getAttribute("login")+"<br/>");
out.print("client    = " + session.getAttribute("client")+"<br/>");
out.print("directory = " + session.getAttribute("dir")+"<br/>");
out.print("user      = " + session.getAttribute("user")+"<br/>");
out.print("proj      = " + session.getAttribute("user")+"<br/>");
out.print("ContextPath =" + application.getContextPath() + "<br/>");
out.print("</pre>");

%>
</body>
</html>