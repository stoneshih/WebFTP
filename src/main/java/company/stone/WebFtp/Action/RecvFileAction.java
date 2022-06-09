package company.stone.WebFtp.Action;

import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import company.stone.WebFtp.Action.Form.FileUploadForm;

public class RecvFileAction extends Action {
	@Override
	 public ActionForward execute(ActionMapping mapping, ActionForm form,
	            HttpServletRequest request, HttpServletResponse response)
	            throws Exception {

		System.out.println("XXXXXX");

		FileUploadForm fileUploadForm = (FileUploadForm) form;

		List<FormFile> files = fileUploadForm.getUpload();

		String filePath = (String) request.getSession().getAttribute("dir");
		String toCompany				=	((FileUploadForm) form).getToCompany();
		if (toCompany.equals("yes")) {
			filePath = filePath +"/ClientToCompany";
		} else if (toCompany.equals("no") ) {
			filePath = filePath +"/CompanyToClient";
		}

		System.out.println(filePath);

		File folder = new File(filePath);
		if (!folder.exists()) {
			folder.mkdir();
		}

		for (int i = 0; i < files.size(); i++) {
			FormFile file = files.get(i);
			System.out.println(i);
			System.out.println(file.getFileName());
			System.out.println(file.getContentType());
			System.out.println(file.getFileSize());
			File newFile = new File(filePath, file.getFileName());
			if (newFile.exists()) {
				DateTimeFormatter DTF = DateTimeFormatter.ofPattern("MM-dd_HHmmss");
		        LocalDateTime dt = LocalDateTime.now();
		        ZoneId z0 = ZoneId.systemDefault();
		        ZonedDateTime zdt = ZonedDateTime.of(dt, z0);
		        String dtStr = zdt.format(DTF);
		        String fName = file.getFileName()+"."+dtStr;
				newFile = new File(filePath, fName);
				System.out.println(i);

			}
			if ( file.getFileSize() != 0) {
				FileOutputStream fos = new FileOutputStream(newFile);
				fos.write(file.getFileData());
				fos.flush();
				fos.close();
			}
		}

        return mapping.findForward("success");

	 }
}
