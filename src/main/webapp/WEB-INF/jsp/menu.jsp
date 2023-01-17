<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String dLinkPre = "<span>";
String dLinkSuf = "</span>";

if (session.getAttribute("login") == (Boolean) true) {
	
		dLinkPre = "<a href='Link.do?method=UploadFile>";
		dLinkSuf = "</a>";

}
%>
<div style="margin: 10px; width: 200px; border: 3px #fefefe solid;">

	<a href="Link.do?method=Home" style="font-size: 1.5em;">首頁<br />
	</a> </br>
	
	<br />

	<fieldset
		style="font-size: 1em; width: 300px; border: 3px #fefefe groove; padding: 10px;">
		<legend> 依序執行合併PDF檔 </legend>
		<span style="font-size: 1.5em;"> 
			<a href="Link.do?method=UploadFile">1. 上傳欲合併檔案 </a><br/><br/>
			<a href="Link.do?method=ListFileToMerge">2. 檢視預定合併檔案</a><br/><br/>
			<a href="Link.do?method=MergeFile">3. 合併檔案<br/><br/>
			<a href="Link.do?method=ListFileToDownloadMerge">4. 下載已合併檔案</a><br/><br/>
		</a>
		</span>
	</fieldset>
	<br /> <a href="Link.do?method=Logout&" style="font-size: 1.5em;">登出<br />
	</a>
</div>

