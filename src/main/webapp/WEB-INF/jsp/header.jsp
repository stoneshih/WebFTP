<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div align="center">
	<span style="font-weight: bold; font-size: 1.5em;">廠商與客戶之間檔案傳遞 Web
		FTP </span>
	<%
	String user = (String) session.getAttribute("user");
	if (user.length() == 0)
		out.print("Not yet Login");
	else
		out.print("<p> 目前登入帳號： " + "<span style=\"color:red;font-weight:bold;font-size:1.5em\">" 
					+ user + " </span></p>");
	%>
</div>

