<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String client = (String) request.getSession().getAttribute("client");
String dLinkPre_1 = "<span>";
String dLinkSuf_1 = "</span>";
String dLinkPre_2 = "<span>";
String dLinkSuf_2 = "</span>";
if (session.getAttribute("login") == (Boolean) true) {
	if (!client.equals("yes")) {
		dLinkPre_1 = "<a href='Link.do?method=UploadFile&toIsland=no'>";
		dLinkSuf_1 = "</a>";
	}
	if (client.equals("yes")) {
		dLinkPre_2 = "<a href='Link.do?method=UploadFile&toIsland=yes'>";
		dLinkSuf_2 = "</a>";
	}
}
%>
<div style="margin: 10px; width: 200px; border: 3px #fefefe solid;">
	<a href="Link.do?method=Home">首頁<br />(Home)
	</a><br />
	<br />
		<p style="font-size: 1.3em;">
			Island To
			<%=(String) session.getAttribute("proj")%>:
		</p>	<div style="border: 3px #fefefe groove; padding: 5px;">

		<a href="Link.do?method=ListFile&toIsland=no">已經上傳的檔案<br />(Uploaded
			Files)
		</a><br />
		<br />
		<%=dLinkPre_1%>
		檔案上傳<br />(Upload Files)
		<%=dLinkSuf_1%><br />
		<br /> <a href="Link.do?method=ListFileToDownload&toIsland=no">檔案下載<br />(Download
			Files)
		</a><br>
	</div>
	<br />
	<p style="font-size: 1.3em;"><%=(String) session.getAttribute("proj")%>
		To Island:
	</p>
	<div style="border: 3px #fefefe groove; padding: 5px;">
		<a href="Link.do?method=ListFile&toIsland=yes">已經上傳的檔案<br />(Uploaded
			Files)
		</a><br />
		<br />
		<%=dLinkPre_2%>
		檔案上傳<br />(Upload Files)
		<%=dLinkSuf_2%><br />
		<br /> <a href="Link.do?method=ListFileToDownload&toIsland=yes">檔案下載<br />(Download
			Files)
		</a><br>
	</div>
	<br /> <a href="Link.do?method=Logout&a=xxx">登出<br />(Logout)
	</a>
</div>

