package company.stone.WebFtp.Action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class DownloadFileAction extends Action{
/**
 *
 */
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String fName = request.getParameter("file");
		String dir = request.getParameter("dir");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fName,"UTF-8"));

        int len = 0 ;
        try
    	{
        	//Get it from file system
        	String path = (String) request.getSession().getAttribute("dir");
        	FileInputStream in =
        		new FileInputStream(new File(dir +"/" +fName));

        	ServletOutputStream out = response.getOutputStream();

        	byte[] outputByte = new byte[4096];


        	len = in.read(outputByte, 0, 4096);
        	while( len != -1)
        	{
        		if ( len == 4096 )
        				out.write(outputByte, 0 , 4096);
					else
						out.write(outputByte, 0, len);
            	len = in.read(outputByte, 0, 4096);
        	}
        	in.close();
        	out.flush();
        	out.close();

    	}catch(Exception e){
    		e.printStackTrace();
    	}

		return null;
	}

}