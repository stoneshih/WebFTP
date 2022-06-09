package company.stone.WebFtp.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class LinkAction extends DispatchAction {

	public ActionForward ListFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("ListFile");
		} else {
			return mapping.findForward("Login");
		}
	}

	public ActionForward ListFileToDownload(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("ListFileToDownload");
		} else {
			return mapping.findForward("Login");
		}
	}

	public ActionForward UploadFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String toCompany	=	request.getParameter("toCompany");
		String client	=	(String) request.getSession().getAttribute("client");
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			if ( toCompany.equals("no") && ! client.equals("yes")) {
				return mapping.findForward("UploadFile");
			} else if ( toCompany.equals("yes") && client.equals("yes")) {
				return mapping.findForward("UploadFile");
			} else {
				return mapping.findForward("NotAllowUpload");
			}
		} else {
			return mapping.findForward("Login");
		}
	}

	public ActionForward Note(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("Note");
		} else {
			return mapping.findForward("Login");
		}
	}

	public ActionForward Home(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("Home");
		} else {
			return mapping.findForward("Login");
		}
		}

	public ActionForward Login(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("Login");
	}

	public ActionForward Logout(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("Logout");
	}
}