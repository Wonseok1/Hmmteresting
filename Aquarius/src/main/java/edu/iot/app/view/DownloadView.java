package edu.iot.app.view;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component("download")
public class DownloadView extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String path = (String) model.get("path");
		String type = (String) model.get("type");
		String fileName = (String) model.get("fileName");
		fileName =URLEncoder.encode(fileName, "utf-8");

		File file = new File(path);
		// 응답 헤더 설정
		response.setContentType(type);
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", 
				"attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		FileUtils.copyFile(file, response.getOutputStream());
		
	}
}

