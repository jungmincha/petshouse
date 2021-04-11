package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.service.AdminService;
import com.pet.ex.service.SnsService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;


@Slf4j
@RestController
@RequestMapping("/commu")
public class SnsController {

	@Autowired
	/* private SnsService service; */
	private AdminService adminService;
	private SnsService service;

	@GetMapping("/sns")
	public ModelAndView index(ModelAndView mav) throws Exception {

		log.info("index");
		mav.setViewName("sns/sns_list");

		return mav;
	}
	
	@GetMapping("/sns/write_view")
	public ModelAndView write(ModelAndView mav) throws Exception {

		log.info("write");
	
		mav.setViewName("sns/sns_write");

		return mav;
	}
	
	// 상품 게시글 등록
		@PostMapping("/sns/write")
		public ModelAndView snsInput(MultipartHttpServletRequest multi, ImageVO imageVO, BoardVO boardVO, ModelAndView mav) 
				throws IllegalStateException, IOException {
			
			
			log.info("snsInput");
			String path = multi.getSession().getServletContext().getRealPath("/static/img/member/sns");

			path = path.replace("webapp", "resources");

			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdir();
			}

			List<MultipartFile> mf = multi.getFiles("btnAtt");

			 
				for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
					
					UUID uuid = UUID.randomUUID();			// 파일명 랜덤으로 변경
					
					String originalfileName = mf.get(i).getOriginalFilename();		  		
		  			String ext = FilenameUtils.getExtension(originalfileName);
		  			//저장 될 파일명
		  			String imgname=uuid+"."+ext; 
				

					String savePath = path + "\\" + imgname; // 저장 될 파일 경로
					
					mf.get(i).transferTo(new File(savePath)); // 파일 저장
					imageVO.setImgname(imgname);
					imageVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
					/* service.imgInput(imageVO); */
				}	
				service.snsInput(boardVO, imageVO);
				 
			mav.setView(new RedirectView("/commu/sns", true));

			return mav;
			
		
		}
	
	@GetMapping("/ex")
	public ModelAndView ex(ModelAndView mav) throws Exception {

		log.info("ex");
		mav.setViewName("sns/ex");

		return mav;
	}
	
	
}
