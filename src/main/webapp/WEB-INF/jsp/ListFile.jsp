<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
	import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.function.Consumer,java.util.stream.Stream,java.time.ZoneId
        "%>
<div>
	<div style='margin:15px;text-align:left;'>
	<%

	Path path ;
	String client 	= (String) session.getAttribute("clientName");
	String company	= (String) session.getAttribute("company");
	String toCompany = request.getParameter("toCompany");
	String title;
	if ( toCompany != null && toCompany.equals("yes")) {
		path = Paths.get((String) request.getSession().getAttribute("dir")+"/ClientToCompany");
		title = "傳檔方向：從 " + client + " 到 " + company;
	} else if ( toCompany != null && toCompany.equals("no")){
		path = Paths.get((String) request.getSession().getAttribute("dir")+"/CompanyToClient");
		title = "傳檔方向：從 " + company + " 到 " + client;
	} else {
		out.print("<p style='color:red;'>Error: Can't decide 'toCompany' or not. Stop listing!</p>");
		return ;
	}
	//out.write("<b>"+path.toString()+"</b><br>");
	out.write("<p style='font-size:2em;font-weight:bold;'>"+title+"</p>");
	//out.write("<pre>");
%>
	<p style='font-size:1.5em;font-weight:normal;'>目前檔案列表，包括檔名、檔案大小、檔案最後修改時間。檔名最後若被附加了時間戳記(格式為"MM-dd_HHmmss")，表示該檔案上傳時，已經存在同名檔案。</p>

<%
	try {
		final JspWriter out1 = out;

		try (Stream<Path> entries = Files.walk(path, 1)) {
			entries.forEach(new Consumer<Path>() {
		@Override
		public void accept(Path p) {
			try {
				String mtimeTmp = Files.getLastModifiedTime(p).toInstant().
						atZone(ZoneId.systemDefault()).toLocalDateTime().toString();
				String mTime = mtimeTmp.replaceAll("\\.[0-9]+$", ""); // Cut down the trailing digits after "."
				if (p.toFile().isFile() == true) {
					String str = String.format("<p style='font-size:1.3em;font-weight:normal;'>檔名：%-50s 檔案大小: %-15d bytes 上傳時間: %-15s</p>",
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
	out.write("</pre>");
	out.write("</div>");

	%>
</div>
