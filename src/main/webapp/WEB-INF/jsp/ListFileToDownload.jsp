<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
	import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.function.Consumer,java.util.stream.Stream,java.time.ZoneId"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<div style="padding:10px;">
	<%
	Path path;
	String client  = (String) session.getAttribute("clientName");
	String company = (String) session.getAttribute("company");
	String toCompany = request.getParameter("toCompany");
	String title;
	String dir = (String) request.getSession().getAttribute("dir") ;
	String dir_1;
	//System.out.println("dir="+dir);
	if (toCompany != null && toCompany.equals("yes")) {

		path = Paths.get(dir + "/ClientToCompany");
		dir_1 = "ClientToCompany";
		title = "傳檔方向：從 " + client + " 到 " + company;
	} else if (toCompany != null && toCompany.equals("no")) {
		path = Paths.get((String) request.getSession().getAttribute("dir") + "/CompanyToClient");
		dir_1 = "CompanyToClient";
		title = "傳檔方向：從 " + company + " 到 " + client;
	} else {
		out.print("<p style='color:red;'>Error: Can't decide 'toCompany' or not. Stop listing!</p>");
		return;
	}

	out.write("<p style='font-size:2em;font-weight:bold;'>" + title + "</p>");
%>
	<p style='font-size:1.5em;font-weight:normal;'>目前檔案列表，點選進行下載。</p>

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
					String mtimeTmp = Files.getLastModifiedTime(p).toInstant().
							atZone(ZoneId.systemDefault()).toLocalDateTime().toString();
					String mTime = mtimeTmp.replaceAll("\\.[0-9]+$", ""); // Cut down the trailing digits after "."
					String str = String.format(
							"<a style='font-size:1.3em;font-weight:normal;' href='%s/DownloadFile.do?file=%s&dir=%s'>檔名：%-30s 檔案大小: %-15d bytes 上傳時間: %-15s</html:link><br>",
							ctxtPath, fName, dir_1,
							fName, Files.size(p), mTime);
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
