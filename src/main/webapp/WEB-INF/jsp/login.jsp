<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<div>

	<p>若有疑問，請聯絡客服經理或工程師.</p>
	<p>Please contact our Service manager or engineer to use this
		interface.</p>
	<div>

		<%--     <html:form action="/Login" focus="userName" > --%>
		<%--     Username : <html:text property="userName" /> --%>
		<!--         <br> -->
		<%--     Password : <html:password property="password" /> --%>
		<!--         <br> -->
		<%--         <html:submit value="Enter" /> --%>
		<%--     </html:form> --%>

		<form name="loginForm" method="post" action="/WebFTP/Login.do">
			使用者名稱(Username) : <input type="text" name="userName" value=""> <br>
			密碼(Password) : <input type="password" name="password" value=""> <br>
			<input type="submit" value="確定(Enter)">
		</form>

	</div>
</div>

