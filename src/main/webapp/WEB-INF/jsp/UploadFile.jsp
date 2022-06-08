<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<div style="padding:10px;">
	<p>選擇一個或多個檔案之後，按"確定"按鈕，開始上傳檔案到伺服器。上傳成功之後，會顯示"檔案上傳成功"。
		要是中途斷線或發生錯誤而中斷，可以檢查"已經上傳的檔案"，再重傳。</p>
	<%
	String client  = (String) session.getAttribute("clientName");
	String company = (String) session.getAttribute("company");
	String toCompany = request.getParameter("toCompany");
	String title = "";
	if (toCompany != null && toCompany.equals("yes")) {
		title = "傳檔方向：從 " + client + " 到 " + company;
	} else if (toCompany != null && toCompany.equals("no")) {
		title = "傳檔方向：從 " + company + " 到 " + client;
	}
	out.write("<b>" + title + "</b><br/><br/>");
	%>
	<html:form action="/RecvFileAction" method="post"
		enctype="multipart/form-data">

  		<html:hidden property="toCompany" value="<%=toCompany%>"/>

		選擇檔案 1 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 2 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 3 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 4 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 5 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 6 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 7 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 8 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 9 : <html:file property="upload" size="50" />
		<br />
		選擇檔案 10 : <html:file property="upload" size="50" />
		<br />
		<br />
		<html:submit> 確定 </html:submit>
	</html:form>

	<html:messages id="err_name" property="common.file.err">
		<div style="color: red">
			<bean:write name="err_name" />
		</div>
	</html:messages>



</div>
