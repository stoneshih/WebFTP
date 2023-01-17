<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<div style="padding-top:20px;padding-left:20px;font-size:2em;">
已經logout囉！
</div>
<%
session.setAttribute("login", false);
session.invalidate();
%>

