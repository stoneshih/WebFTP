<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<div>
	<p>選擇一個或多個檔案之後，按"確定"按鈕，開始上傳檔案到伺服器。上傳成功之後，會顯示"檔案上傳成功"。
		要是中途斷線或發生錯誤而中斷，可以檢查"已經上傳的檔案"，再重傳。</p>
	<p>Choose one or multiple files to upload. If it aborts for some
		reason, check the "Uploaded Files" and upload files again.</p>
	<%
	session.getAttribute("client");
	String toIsland = request.getParameter("toIsland");
	String title = "";
	if (toIsland != null && toIsland.equals("yes")) {
		title = "esun To Island";
	} else if (toIsland != null && toIsland.equals("no")) {
		title = "Island To esun";
	}
	out.write("<b>" + title + "</b><br/><br/>");
	%>
	<html:form action="/RecvFileAction" method="post"
		enctype="multipart/form-data">

  		<html:hidden property="toIsland" value="<%=toIsland%>"/>

		選擇檔案 1 (Choose File 1): <html:file property="upload" size="50" />
		<br />
		選擇檔案 2 (Choose File 2): <html:file property="upload" size="50" />
		<br />
		選擇檔案 3 (Choose File 3): <html:file property="upload" size="50" />
		<br />
		選擇檔案 4 (Choose File 4): <html:file property="upload" size="50" />
		<br />
		選擇檔案 5 (Choose File 5): <html:file property="upload" size="50" />
		<br />
		選擇檔案 6 (Choose File 6): <html:file property="upload" size="50" />
		<br />
		選擇檔案 7 (Choose File 7): <html:file property="upload" size="50" />
		<br />
		選擇檔案 8 (Choose File 8): <html:file property="upload" size="50" />
		<br />
		選擇檔案 9 (Choose File 9): <html:file property="upload" size="50" />
		<br />
		選擇檔案 10 (Choose File 10): <html:file property="upload" size="50" />
		<br />
		<br />
		<html:submit> 確定(Enter) </html:submit>
	</html:form>

	<html:messages id="err_name" property="common.file.err">
		<div style="color: red">
			<bean:write name="err_name" />
		</div>
	</html:messages>



</div>
