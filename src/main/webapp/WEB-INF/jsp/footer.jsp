<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<div align="center">&copy; MIS Unit.</div>
<%
Boolean	flag = (Boolean) session.getAttribute("login");

if ( flag != null && flag == false ) {
	session.invalidate();
	}

%>
