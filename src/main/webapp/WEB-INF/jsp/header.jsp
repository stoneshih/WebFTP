<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div align="center" style="margin:10px;">
	<span style="font-weight: bold; font-size: 2.5em;">合併PDF檔 </span>
	<%
	String user = (String) session.getAttribute("user");
	if (user.length() == 0)
		out.print("Not yet Login");
	else
		out.print("<p> 目前登入帳號： " + "<span style=\"color:red;font-weight:bold;font-size:1.5em\">" 
					+ user + " </span></p>");
	%>
</div>

