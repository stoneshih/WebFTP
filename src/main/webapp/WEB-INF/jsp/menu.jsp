<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String client = (String) request.getSession().getAttribute("client");
String dLinkPre_1 = "<span>";
String dLinkSuf_1 = "</span>";
String dLinkPre_2 = "<span>";
String dLinkSuf_2 = "</span>";
if (session.getAttribute("login") == (Boolean) true) {
	if (!client.equals("yes")) {
		dLinkPre_1 = "<a href='Link.do?method=UploadFile&toCompany=no'>";
		dLinkSuf_1 = "</a>";
	}
	if (client.equals("yes")) {
		dLinkPre_2 = "<a href='Link.do?method=UploadFile&toCompany=yes'>";
		dLinkSuf_2 = "</a>";
	}
}
%>
<div style="margin: 10px; width: 200px; border: 3px #fefefe solid;">

	<a href="Link.do?method=Home" style="font-size: 1.5em;">首頁<br />
	</a> </br>
	<fieldset
		style="font-size: 1em; width: 300px; border: 3px #fefefe groove; padding: 10px;">
		<legend>
			從<%=(String) session.getAttribute("company")%>
			傳給
			<%=(String) session.getAttribute("proj")%>
			的檔案
		</legend>
		<span style="font-size:1.5em;">
		<a href="Link.do?method=ListFile&toCompany=no">檢視已經上傳檔案<br />
		</a><br />
		<%=dLinkPre_1%>
		檔案上傳<br />
		<%=dLinkSuf_1%><br /> <a
			href="Link.do?method=ListFileToDownload&toCompany=no">檔案下載<br />
		</a>
		</span>
	</fieldset>
	<br />

	<fieldset
		style="font-size: 1em; width: 300px; border: 3px #fefefe groove; padding: 10px;">
		<legend>
			從<%=(String) session.getAttribute("proj")%>
			傳給
			<%=(String) session.getAttribute("company")%>
			的檔案
		</legend>
		<span style="font-size:1.5em;">
		<a href="Link.do?method=ListFile&toCompany=yes">檢視已經上傳檔案<br />
		</a><br />
		<%=dLinkPre_2%>
		檔案上傳<br />
		<%=dLinkSuf_2%><br /> <a
			href="Link.do?method=ListFileToDownload&toCompany=yes">檔案下載<br />
		</a>
		</span>
	</fieldset>
	<br /> <a href="Link.do?method=Logout&" style="font-size: 1.5em;">登出<br />
	</a>
</div>

