package island.stone.WebFtp.Action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import island.stone.WebFtp.Action.Form.LoginForm;

public class LoginAction extends Action {
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
        String client 	= realm.getProperty(u+".client");
/*
 *  Sample setting for  "realm.properties"
 *
 *	esun.password=island123
 *	esun.directory=D:/temp1/esun
 *	esun.client=yes
 *	esunIsland.password=island123
 *	esunIsland.client=esun
 *
 *  Note: "esunIsland" is the counterpart of client "esun"
 *
 */
        if ( up != null && up.equals(p)) {
        	if ( u.endsWith("Island") && ! u.equals("Island")) { // Is-land Account
        		request.getSession().setAttribute("login", true);
        		String	clientUser = u.replaceAll("Island", "");
        		request.getSession().setAttribute("client", clientUser );
        		dir 		= realm.getProperty(clientUser+".directory");
        		request.getSession().setAttribute("dir", dir );
        		request.getSession().setAttribute("user", u );
        		request.getSession().setAttribute("proj",  clientUser );
        	} else if ( client.equals("yes")) { // Client Account
        		request.getSession().setAttribute("login", true);
        		request.getSession().setAttribute("client", "yes");
        		dir 		= realm.getProperty(u+".directory");
        		request.getSession().setAttribute("dir", dir );
        		request.getSession().setAttribute("user", u );
        		request.getSession().setAttribute("proj", u );
        	} else {
                return mapping.findForward("failure");
        	}
            return mapping.findForward("success");
        } else {
        	request.getSession().setAttribute("login", false);
            return mapping.findForward("failure");
        }
    }

}