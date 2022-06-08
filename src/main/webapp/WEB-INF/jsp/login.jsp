<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<div>

		<p>若有疑問，請聯絡工程師.</p>
	<p>施東榮 電話：03-5795588#390 或 手機：0909369771</p>

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

