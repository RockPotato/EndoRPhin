package kr.or.ddit.image.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.image.service.IImagesService;

@RequestMapping("/images")
@Controller
public class ImagesController {

	private Logger logger = LoggerFactory.getLogger(ImagesController.class);
	
	@Resource(name="imagesService")
	IImagesService imagesService;
	
	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@RequestMapping(path="/getImage")
	public void getImage(String imageName,HttpServletResponse resp) throws IOException{
		resp.setContentType("image");
//		Image image = null;
//		File file = new File(imageName);
//        try {
//            image = ImageIO.read(file);
//        } catch (IOException e) {
//        	e.printStackTrace();
//        }
//        logger.debug("이미지 : {}", file.getAbsolutePath());
//        return image;
		if(imageName==null){
			return;
		}
		FileInputStream fis;
		
		fis = new FileInputStream(new File(imageName));
		BufferedInputStream bis = new BufferedInputStream(fis);
		ServletOutputStream sos = resp.getOutputStream();
		
		byte[] buff = new byte[512];
		int len = 0;
		while((len=bis.read(buff))!=-1){
			sos.write(buff);
		}
		bis.close();
		sos.close();
		fis.close();
	}
}
