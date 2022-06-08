<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
	import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.function.Consumer,java.util.stream.Stream,java.time.ZoneId
        "%>
<div>
	<div style='margin:15px;'>
	<p>List present files for file name and its length.</p>
	<p>目前檔案列表，包括檔名、檔案大小、檔案最後修改時間</p>
	<p>檔名最後若被附加了時間戳記(格式為"MM-dd_HHmmss")，表示該檔案上傳時，已經存在同名檔案。</p>
	<%

	Path path ;
	session.getAttribute("client");
	String toIsland = request.getParameter("toIsland");
	String title;
	if ( toIsland != null && toIsland.equals("yes")) {
		path = Paths.get((String) request.getSession().getAttribute("dir")+"/ClientToIsland");
		title = "esun To Island";
	} else if ( toIsland != null && toIsland.equals("no")){
		path = Paths.get((String) request.getSession().getAttribute("dir")+"/IslandToClient");
		title = "Island To esun";
	} else {
		out.print("<p style='color:red;'>Error: Can't decide 'toIsland' or not. Stop listing!</p>");
		return ;
	}
	//out.write("<b>"+path.toString()+"</b><br>");
	out.write("<b>"+title+"</b><br/><br/>");
	out.write("<pre>");

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
					String str = String.format("%-50s : %15d bytes: %15s<br>",
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
