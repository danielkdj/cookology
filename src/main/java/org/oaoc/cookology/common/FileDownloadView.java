package org.oaoc.cookology.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("filedown")  //설정파일에 자동 등록 처리함
public class FileDownloadView extends AbstractView {
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		//전달된 model 의 정보 추출
		File renameFile = (File)model.get("renameFile");
		File downFile = (File)model.get("originFile");

		//한글 파일명 깨지지 않도록 인코딩 처리를 위해 파일명만 추출
		String fileName = downFile.getName();
		
		//클라이언트로 전송하기 위한 설정
		response.setContentType("text/plain; charset=utf-8");
		response.addHeader("Content-Disposition", 
				"attachment; filename=\""
				+ new String(
					fileName.getBytes("UTF-8"), "ISO-8859-1") 
				+ "\"");
		response.setContentLength((int)renameFile.length());

		FileInputStream fin = new FileInputStream(renameFile);
		OutputStream out = response.getOutputStream();

		FileCopyUtils.copy(fin, out);
		
		fin.close();
	}

}






