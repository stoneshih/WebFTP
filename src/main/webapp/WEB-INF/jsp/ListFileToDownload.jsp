<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
	import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.function.Consumer,java.util.stream.Stream,java.time.ZoneId"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 5px;
}
</style>
<div style='margin: 15px; text-align: left;'>
	<%
	Path path;
	String client = (String) session.getAttribute("clientName");
	String company = (String) session.getAttribute("company");
	String toCompany = request.getParameter("toCompany");
	String title;
	String dir = (String) request.getSession().getAttribute("dir");
	String dir_1;
	//System.out.println("dir="+dir);
	if (toCompany != null && toCompany.equals("yes")) {

		path = Paths.get(dir + "/ClientToCompany");
		dir_1 = "ClientToCompany";
		title = "從 " + client + " 傳給 " + company + " 的檔案";
	} else if (toCompany != null && toCompany.equals("no")) {
		path = Paths.get((String) request.getSession().getAttribute("dir") + "/CompanyToClient");
		dir_1 = "CompanyToClient";
		title = "從 " + company + " 傳給 " + client + " 的檔案";
	} else {
		out.print("<p style='color:red;'>Error: Can't decide 'toCompany' or not. Stop listing!</p>");
		return;
	}

	out.write("<p style='font-size:2em;font-weight:bold;'>" + title + "</p>");
	%>
	<p style='font-size: 1.5em; font-weight: normal;'>目前檔案列表，點選進行下載。</p>
	<table style="border: 1px solid;">
		<thead>
			<tr>
				<th>檔名</th>
				<th>檔案大小</th>
				<th>上傳時間</th>
			</tr>
		</thead>
		<%
		try {
			final JspWriter out1 = out;

			try (Stream<Path> entries = Files.walk(path, 1)) {
				entries.forEach(new Consumer<Path>() {
			@Override
			public void accept(Path p) {
				try {
					if (p.toFile().isFile() == true) {
						// <html:link action="/DownloadIt">struts-tutorial.zip</html:link>
						//<a href="/FileDownload/DownloadIt.do">struts-tutorial.zip</a>
						String fName = p.toFile().getName();
						String ctxtPath = application.getContextPath();
						String mtimeTmp = Files.getLastModifiedTime(p).toInstant().atZone(ZoneId.systemDefault())
								.toLocalDateTime().toString();
						String mTime = mtimeTmp.replaceAll("\\.[0-9]+$", ""); // Cut down the trailing digits after "."
						String str = String.format(
								"<tr><td><a style='font-size:1.3em;font-weight:normal;' href='%s/DownloadFile.do?file=%s&dir=%s'>%-30s</td><td>%-15d bytes</td><td>%-15s</a></td></tr>",
								ctxtPath, fName, dir_1, fName, Files.size(p), mTime);
						out1.write(str);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				});
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		%>
	</table>

</div>
