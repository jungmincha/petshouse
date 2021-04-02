package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.FileService;
import com.pet.ex.vo.ImgtestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/file")
public class FileController {
	@Autowired
	FileService fileservice;

	@GetMapping("/fileForm")
	public ModelAndView formFile(ModelAndView mav) {
		mav.setViewName("file/fileupload");
		return mav;
	}

	@PostMapping("/fileUpload")
	public ModelAndView fileUpload(MultipartHttpServletRequest multi, ModelAndView mav) throws IllegalStateException, IOException {
		log.info("fileUpload");
		//파일 경로 설정
		String path = multi.getSession().getServletContext().getRealPath("/static/img/file");  
		
		path = path.replace("webapp", "resources");
	      
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");
		
		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
				UUID uuid = UUID.randomUUID();
				// 본래 파일명
				String imgname = mf.get(i).getOriginalFilename();

				String savePath = path + "\\" + imgname; // 저장 될 파일 경로

				mf.get(i).transferTo(new File(savePath)); // 파일 저장

				fileservice.fileUpload(imgname);
			}
		}
		mav.setViewName("file/fileupload");
		return mav;
	}

	@GetMapping("/filelist")
	public ModelAndView filelist(ImgtestVO imgtestVO, ModelAndView mav) {
		log.info("filelist");
		mav.addObject("filelist", fileservice.getImgtest());
		mav.setViewName("file/filelist");
		return mav;
	}
}
