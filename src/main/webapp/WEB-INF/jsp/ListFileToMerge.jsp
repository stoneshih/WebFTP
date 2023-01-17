<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page
        import="java.io.IOException,java.nio.file.Files, java.nio.file.Path,
        java.nio.file.Paths, java.util.Comparator,java.util.function.Consumer,java.util.stream.Stream,java.time.ZoneId
        "%>
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
	String title = "xxx";
	String dir_temp = (String) request.getSession().getAttribute("dir_temp");

		path = Paths.get(dir_temp);

	//out.write("<p style='font-size:2em;font-weight:bold;'>" + title + "</p>");
	%>
	<p style='font-size: 1.5em; font-weight: normal;'>目前預定要合併的PDF檔案列表，點選進行下載進行確認。</p>
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

            //try (Stream<Path> entries = Files.walk(path, 1).sorted() ) {
                    //entries.forEach(new Consumer<Path>() {

                   // Comparator<Path> cmp = Comparator.comparingLong( p -> p.toFile().lastModified())  ;
                    try (Stream<Path> entries = Files.walk(path).sorted()  ) {
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
                                                    ctxtPath, fName, dir_temp, fName, Files.size(p), mTime);
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
