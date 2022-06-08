package island.stone.WebFtp.Action.Form;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

public class FileUploadForm extends ActionForm{

//	private FormFile file;
//	public FormFile getFile() {
//		return file;
//	}
//
//	public void setFile(FormFile file) {
//		this.file = file;
//	}

	String	toIsland;

	public String getToIsland() {
		return toIsland;
	}

	public void setToIsland(String toIsland) {
		this.toIsland = toIsland;
	}

	protected ArrayList<FormFile> uploaded = new ArrayList<>();

    public void setUpload(List<FormFile> file) { uploaded.addAll(file); }

    public List<FormFile> getUpload() { return uploaded; }

	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors errors = new ActionErrors();

		if (request.getSession().getAttribute("login") == (Boolean) false) {
			 errors.add("common.file.err",
				    	new ActionMessage("error.common.file.required"));
		}

	    return errors;
	}


}
