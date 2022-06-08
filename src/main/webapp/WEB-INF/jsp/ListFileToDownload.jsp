<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
	import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.function.Consumer,java.util.stream.Stream"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<div style="margin:10px;">
	<p>List present files, click to download.</p>
	<p>目前檔案列表，點選進行下載。</p>
	<%
	Path path;
	session.getAttribute("client");
	String toIsland = request.getParameter("toIsland");
	String title;
	String dir_1;
	if (toIsland != null && toIsland.equals("yes")) {
		path = Paths.get((String) request.getSession().getAttribute("dir") + "/ClientToIsland");
		dir_1 = "ClientToIsland";
		title = "esun To Island";
	} else if (toIsland != null && toIsland.equals("no")) {
		path = Paths.get((String) request.getSession().getAttribute("dir") + "/IslandToClient");
		dir_1 = "IslandToClient";
		title = "Island To esun";
	} else {
		out.print("<p style='color:red;'>Error: Can't decide 'toIsland' or not. Stop listing!</p>");
		return;
	}

	out.write("<b>" + title + "</b><br/><br/>");

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
					String str = String.format(
							"<a href='%s/DownloadFile.do?file=%s&dir=%s'>%-30s : %15d bytes</html:link><br>",
							ctxtPath, fName, dir_1,
							fName, Files.size(p));
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
</div>
