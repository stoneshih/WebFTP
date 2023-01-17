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

	public ActionForward ListFileToMerge(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("ListFileToMerge");
		} else {
			return mapping.findForward("Login");
		}
	}

	public ActionForward UploadFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("UploadFile");
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
	
	public ActionForward MergeFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("MergeFile");
		} else {
			return mapping.findForward("Login");
		}
	}

	public ActionForward ListFileToDownloadMerge(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getSession().getAttribute("login") == (Boolean) true) {
			return mapping.findForward("ListFileToDownloadMerge");
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