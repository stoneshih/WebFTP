package company.stone.WebFtp.Action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import company.stone.WebFtp.Action.Form.LoginForm;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;


public class LoginAction extends Action {

	private String	company = "micro-ip";
	
	
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        LoginForm loginForm = (LoginForm) form;
        Properties	realm	=	new Properties();
        realm.load(this.getClass().getClassLoader().getResourceAsStream("realm.properties"));
        String u=loginForm.getUserName(),p = loginForm.getPassword();

        String up 		= realm.getProperty(u+".password");
        String dir 		;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss");
    	LocalDateTime now = LocalDateTime.now();
    	String	dtstamp = dtf.format(now);

		request.getSession().setAttribute("company", company );
        if ( up != null && up.equals(p)) {      	
    		request.getSession().setAttribute("login", true);
    		request.getSession().setAttribute("user", u);

    		dir	= realm.getProperty(u+".directory");
    		request.getSession().setAttribute("dir", dir );
    		/*
    		 * Create temporary working directory
    		 */
    		String tmpDir;
    		tmpDir = dir+"/"+dtstamp ;
    		try {
    			Files.createDirectories(Paths.get(tmpDir));
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			request.getSession().setAttribute("login", false);
                return mapping.findForward("failure");
    		}
    		request.getSession().setAttribute("dir_temp", tmpDir );
            return mapping.findForward("success");
        } else {
        	request.getSession().setAttribute("login", false);
            return mapping.findForward("failure");
        }
    }

}