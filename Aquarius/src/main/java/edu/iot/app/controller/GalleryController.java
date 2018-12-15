package edu.iot.app.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.iot.common.model.Gallery;
import edu.iot.common.model.GalleryImage;
import edu.iot.common.service.GalleryService;
import edu.iot.common.util.ImageUtil;
import edu.iot.common.util.Util;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gallery")
public class GalleryController {
	@Autowired
	GalleryService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="orderBy", defaultValue="gallery_id") String orderBy,
			Model model) throws Exception {
		
		
		model.addAttribute("today", Util.getToday());
		model.addAllAttributes(service.getPage(page, orderBy));
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void createForm(Gallery gallery) throws Exception {

	}

	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createSubmit(@Valid Gallery gallery,
				BindingResult result) throws Exception {
		if(result.hasErrors()) {
			return "gallery/create"; 
		}
		
		service.create(gallery);
		log.info(gallery.toString());
		return "redirect:/gallery/update/" + gallery.getGalleryId();	// 어디로 이동할 것인가?
	}
	
	
	@RequestMapping(value="/update/{galleryId}", method=RequestMethod.GET)
	public String updateForm(
			@PathVariable long galleryId, Model model) throws Exception {

		Gallery gallery = service.findById(galleryId);
		model.addAttribute("gallery", gallery);
		
		return "gallery/update";
	}
	
	@RequestMapping(value="/update/{galleryId}", method=RequestMethod.POST)
	public String updateSubmit(@Valid Gallery gallery, 
							BindingResult result) throws Exception {
		if(result.hasErrors()) {
			return "gallery/update"; 
		}
		
		service.update(gallery);
		
		return "redirect:/gallery/update/" + gallery.getGalleryId();	
	}

	@RequestMapping(value="/update/add_image", 
					method=RequestMethod.POST)
	public String addImageSubmit(GalleryImage image, 
			@RequestParam("file") MultipartFile imageFile) throws Exception {
		
		uploadImage(image, imageFile);
		service.addImage(image);
		
		return "redirect:/gallery/update/" + image.getGalleryId();
	}
	
	
	@RequestMapping(value="/update/add_images", method=RequestMethod.POST)	
	public String addImagesSubmit(GalleryImage image,
							MultipartHttpServletRequest request) 
		throws Exception {
		
		List<MultipartFile> fileList = request.getFiles("files");
		for(MultipartFile imageFile : fileList) {
			uploadImage(image, imageFile);
			service.addImage(image);
		}
			
		return "redirect:/gallery/update/" + image.getGalleryId();
	}

	
	
	private void uploadImage(GalleryImage image, MultipartFile imageFile) throws Exception {
		// 원본 이미지 파일명
		String fname = imageFile.getOriginalFilename();
		// 서버에서의 이미지 파일명
		long timestamp = System.currentTimeMillis();
		String serverFileName = timestamp + "_" + fname; 
		
		// 업로드 파일 재배치
		File dest = new File("c:/temp/upload/" + serverFileName);
		imageFile.transferTo(dest);
		
		// thumbnail 이미지 생성
		ImageUtil.saveThumb(dest);
		
		
		// GalleryImage 정보 설정
		image.setFileName(fname); 
		image.setServerFileName(serverFileName);
	}

	@RequestMapping(value="/view/{galleryId}", 
					method=RequestMethod.GET)
	public String view(
			@PathVariable long galleryId,
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) throws Exception {

		Gallery gallery = service.findById(galleryId);
		model.addAttribute("gallery", gallery);
		model.addAttribute("page", page);
		return "gallery/view";
	}
	
	@RequestMapping(value="/{mode}/{imageId}", 
			method=RequestMethod.GET)
	public String image(
						@PathVariable String mode,
						@PathVariable long imageId,
						Model model) throws Exception {
		
		GalleryImage image = service.getImage(imageId);
		String path = "c:/temp/upload/";
		if(mode.equals("thumb")) {
			path  += "thumb/";
		} 		
		path += image.getServerFileName();		
			
		String type = context.getMimeType(path);	// 파일의 Mimetype 문자열
		model.addAttribute("path", path);
		model.addAttribute("type", type);
		
		return "fileView";
	}
	
	@RequestMapping(value="/download/{imageId}", 
			method=RequestMethod.GET)
	public String downlaod(
						@PathVariable long imageId,
						Model model) throws Exception {
		
		GalleryImage image = service.getImage(imageId);
		String path = "c:/temp/upload/"+ image.getServerFileName();		
		String fileName = image.getFileName();
		String type = context.getMimeType(path);	
		model.addAttribute("path", path);
		model.addAttribute("fileName", fileName);
		model.addAttribute("type", type);
		
		return "download";
	}
}




