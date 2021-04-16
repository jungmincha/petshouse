package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.service.MyhomeService;

import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")
public class Myhomecontroller {

	@Autowired
	private MyhomeService service;

	@GetMapping("/{nickname}")
	public ModelAndView myPageHome(@PathVariable("nickname") String nickname, MemberVO memberVO, ModelAndView mav)
			throws Exception {

		memberVO = service.getNicknameInfo(nickname);
		log.info("nickname");

		mav.addObject("user", service.getUser(memberVO.getNickname()));

		mav.setViewName("myPage/Home");

		return mav;
	}

	// 프로필사진수정하기
	@GetMapping("/view")
	public ModelAndView member_modify_View(ModelAndView mav) throws Exception {

		mav.setViewName("myPage/profileModify");

		return mav;
	}

	@PostMapping("/modify")
	public ModelAndView profile_modify(MultipartHttpServletRequest multi, MemberVO memberVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("profile_modify");
		String path = multi.getSession().getServletContext().getRealPath("/static/img/member/profile");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		List<MultipartFile> mf = multi.getFiles("file");
		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
			UUID uuid = UUID.randomUUID();
			// 본래 파일명
			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			String thumbnail = uuid + "." + ext;
			String savePath = path + "\\" + thumbnail; // 저장 될 파일 경로
			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			memberVO.setThumbnail(thumbnail);
		}

		service.memberModify(memberVO);
		mav.setView(new RedirectView("view", true));

		return mav;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 연희

}
