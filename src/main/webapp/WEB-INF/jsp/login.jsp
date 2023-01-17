<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<div >

	<div >

		<%--     <html:form action="/Login" focus="userName" > --%>
		<%--     Username : <html:text property="userName" /> --%>
		<!--         <br> -->
		<%--     Password : <html:password property="password" /> --%>
		<!--         <br> -->
		<%--         <html:submit value="Enter" /> --%>
		<%--     </html:form> --%>

		<form name="loginForm" method="post" action="/WebMergePDF/Login.do">
		<table style="border:0px solid;padding:100px;font-size:1.5em">
		<tr><td style='padding: 10 10 10 10;'>
			使用者名稱(Username) :</td>
			<td> <input type="text" name="userName" value=""> </td>
			</tr>
		<tr><td>
			密碼(Password) :
			</td>
			<td> <input type="password" name="password" value=""> 
			
			</td></tr>
			<tr><td colspan="2" style='text-align:right;'>
			<input type="submit" value="確定" style="height: 40px; width: 80px;font-size:1.2em;">
			</td></tr>
			</table>
		</form>

	</div>
</div>

