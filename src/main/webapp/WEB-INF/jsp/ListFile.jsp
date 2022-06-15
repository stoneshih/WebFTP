<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
	import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.function.Consumer,java.util.stream.Stream,java.time.ZoneId
        "%>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 5px;
}
</style>
<div>
	<div style='margin: 15px; text-align: left;'>
		<%
		Path path;
		String client = (String) session.getAttribute("clientName");
		String company = (String) session.getAttribute("company");
		String toCompany = request.getParameter("toCompany");
		String title;
		if (toCompany != null && toCompany.equals("yes")) {
			path = Paths.get((String) request.getSession().getAttribute("dir") + "/ClientToCompany");
			title = "從 " + client + " 傳給 " + company + " 的檔案";
		} else if (toCompany != null && toCompany.equals("no")) {
			path = Paths.get((String) request.getSession().getAttribute("dir") + "/CompanyToClient");
			title = "從 " + company + " 傳給 " + client + " 的檔案";
		} else {
			out.print("<p style='color:red;'>Error: Can't decide 'toCompany' or not. Stop listing!</p>");
			return;
		}
		//out.write("<b>"+path.toString()+"</b><br>");
		out.write("<p style='font-size:2em;font-weight:bold;'>" + title + "</p>");
		%>
		<p style='font-size: 1.3em; font-weight: normal;'>目前檔案列表，包括檔名、檔案大小、檔案最後修改時間(即為"上傳時間")。檔名最後若被附加了時間戳記(格式為"MM-dd_HHmmss")，表示該檔案上傳時，已經存在同名檔案。</p>
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

				try (Stream<Path> entries = Files.walk(path)) {
					entries.forEach(new Consumer<Path>() {
				@Override
				public void accept(Path p) {
					try {
						String mtimeTmp = Files.getLastModifiedTime(p).toInstant().atZone(ZoneId.systemDefault())
								.toLocalDateTime().toString();
						String mTime = mtimeTmp.replaceAll("\\.[0-9]+$", ""); // Cut down the trailing digits after "."
						if (p.toFile().isFile() == true) {
							String str = String.format("<tr><td>%-50s</td><td>%-15d bytes</td><td>%-15s</td></tr>",
									p.toFile().getName(), Files.size(p), mTime);
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
			out.write("</div>");
			%>
		</table>

	</div>