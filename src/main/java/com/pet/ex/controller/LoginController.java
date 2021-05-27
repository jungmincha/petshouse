package com.pet.ex.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.EmailService;
import com.pet.ex.service.LoginService;
import com.pet.ex.service.SecurityService;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private SecurityService securityService;

	@Autowired
	private LoginService loginService;

	@Autowired
	private EmailService emailService;

	// 회원가입 페이지 이동
	@GetMapping("/register")
	public ModelAndView join(ModelAndView mav) {
		log.info("login/register");

		mav.addObject("category", loginService.listCategory());
		mav.setViewName("/login/register");

		return mav;
	}

	// 로그인 페이지 이동
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "msg", required = false) String msg, ModelAndView mav) {
		log.info("login/login");

		mav.addObject("msg", msg);
		mav.setViewName("/login/login");

		return mav;

	}

	// 아이디 중복체크 실행(ajax)
	@PostMapping("/register/idCheck")
	public String idCheck(@RequestParam String inputId) throws Exception {
		log.info("/register/idCheck");

		MemberVO member = securityService.getMember(inputId);
		String canUse = member != null ? "" : "Y";

		return canUse;
	}

	// 닉네임 중복체크 실행(ajax)
	@PostMapping("/register/nicknameCheck")
	public String nicknameCheck(@RequestParam String nickname) throws Exception {
		log.info("/register/nicknameCheck");

		MemberVO member = securityService.getMemberByNickname(nickname);
		String canUse = member != null ? "" : "Y";

		return canUse;
	}

	// 전화번호 중복체크 실행(ajax)
	@PostMapping("/register/telCheck")
	public String telCheck(@RequestParam int tel) throws Exception {
		log.info("/register/telCheck");

		MemberVO member = securityService.getMemberByTel(tel);
		String canUse = member != null ? "" : "Y";

		return canUse;
	}

	// 회원가입 작성 후 INSERT
	@PostMapping("/register/insert")
	public ModelAndView setInsertMember(MultipartHttpServletRequest multi, MemberVO member, ModelAndView mav,
			String socialCheck) throws Exception {
		log.info("/login/register/insert");
		
		if (multi.getFile("file").getOriginalFilename().equals("")) {
			member.setThumbnail("profile.jpg");
		} else {
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
				member.setThumbnail(thumbnail);
			}

		}
		if (securityService.insertMember(member) > 0) {
			if (socialCheck == null) {
				MemberVO members = securityService.getMember(member.getMember_id());
				StringBuffer emailcontent = new StringBuffer();
				emailcontent.append("<!DOCTYPE html>");
				emailcontent.append("<html>");
				emailcontent.append("<head>");
				emailcontent.append("</head>");
				emailcontent.append("<body>");
				emailcontent.append(" <div"
						+ "	style=\"font-family: 'MY FONT', 'sans-serif' !important; width: 600px; height: 600px; border-top: 4px solid  #e7ab3c; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"
						+ "	<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"
						+ "		<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">펫츠하우스</span><br />"
						+ "		<span style=\"color:  #e7ab3c\">메일인증</span> 안내입니다." + "	</h1>\n"
						+ "	<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"
						+ members.getName() + "		님 안녕하세요.<br />" + "		펫츠하우스에 가입해 주셔서 진심으로 감사드립니다.<br />"
						+ "		아래 <b style=\"color:  #e7ab3c\">'메일 인증'</b> 버튼을 클릭하여 회원가입을 완료해 주세요.<br />"
						+ "		감사합니다." + "	</p>"
						+ "	<a style=\"color: #FFF; text-decoration: none; text-align: center;\""
						+ "	href=\"http://localhost:8383/login/email/certify?member_id=" + members.getMember_id()
						+ "&certify=" + members.getCertify() + "\" target=\"_blank\">" + "		<p"
						+ "			style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background:  #e7ab3c; line-height: 45px; vertical-align: middle; font-size: 16px;\">"
						+ "			메일 인증</p>" + "	</a>"
						+ "	<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>" + " </div>");
				emailcontent.append("</body>");
				emailcontent.append("</html>");
				emailService.sendMail(members.getMember_id(), "[펫츠하우스 이메일 인증]", emailcontent.toString());
			}

			securityService.insertRegisterPoint(member.getMember_id());
			mav.setViewName("/login/registerSuccess");
			return mav;
		} else {
			mav.setViewName("/login/register");
			return mav;
		}
	}

	// 이메일 인증 certify확인
	@GetMapping(value = "/email/certify")
	@Transactional
	public ModelAndView checkmail(HttpServletRequest request, MemberVO member, ModelAndView mav)
			throws MessagingException {
		log.info("/login/email/certify");
		HttpSession session = request.getSession();
		MemberVO emailCheck = loginService.emailCheck(member);

		if (emailCheck != null) {
			loginService.updateCertify(member);
			SecurityContextHolder.getContext().setAuthentication(null);
			session.removeAttribute("Authorization");
		}
		mav.setViewName("/login/emailSuccess");
		return mav;
	}

	// 소셜 유저 회원가입 (이미 회원가입시 홈으로)
	@RequestMapping("/oauth2/register")
	public ModelAndView oauht2(ModelAndView mav, Authentication authentication) throws Exception {
		log.info("/login/oauth2/register");
		String id = authentication.getPrincipal().toString();
		MemberVO member = securityService.getMember(id);

		if (member == null) {
			mav.addObject("category", loginService.listCategory());
			mav.setViewName("/login/oauth2Register");
		} else {
			mav.setViewName("redirect:/store/home");
		}
		return mav;

	}

	// 비밀번호 재설정 메일보내기
	@PostMapping("/passwordChange/{member_id}")
	public void passwordChange(@PathVariable String member_id) throws Exception {
		log.info("/login/passwordChange");
		MemberVO members = securityService.getMember(member_id);
		StringBuffer emailcontent = new StringBuffer();
		emailcontent.append("<!DOCTYPE html>");
		emailcontent.append("<html>");
		emailcontent.append("<head>");
		emailcontent.append("</head>");
		emailcontent.append("<body>");
		emailcontent.append(" <div"
				+ "	style=\"font-family: 'MY FONT', 'sans-serif' !important; width: 600px; height: 600px; border-top: 4px solid  #e7ab3c; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"
				+ "	<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"
				+ "		<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">펫츠하우스</span><br />"
				+ "		<span style=\"color:  #e7ab3c\">비밀번호 재설정</span> 안내입니다." + "	</h1>\n"
				+ "	<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"
				+ members.getName() + "		님 안녕하세요.<br />" + "		비밀번호 재설정이 요청되었습니다. <br />"
				+ "		아래 <b style=\"color:  #e7ab3c\">'비밀번호재설정'</b> 버튼을 클릭하여 비밀번호를 재설정 해주세요.<br />" + "		감사합니다."
				+ "	</p>" + "	<a style=\"color: #FFF; text-decoration: none; text-align: center;\""
				+ "	href=\"http://localhost:8383/login/passwordChange/certify?member_id=" + members.getMember_id()
				+ "\" target=\"_blank\">" + "		<p"
				+ "			style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background:  #e7ab3c; line-height: 45px; vertical-align: middle; font-size: 16px;\">"
				+ "			비밀번호 재설정</p>" + "	</a>"
				+ "	<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>" + " </div>");
		emailcontent.append("</body>");
		emailcontent.append("</html>");
		emailService.sendMail(members.getMember_id(), "[펫츠하우스 비밀번호 재설정]", emailcontent.toString());

	}

	// 비빈번호 재설정 메일 인증 후 재설정 페이지로
	@GetMapping("/passwordChange/certify")
	public ModelAndView passwordChangeCertify(@RequestParam String member_id, ModelAndView mav) throws Exception {
		log.info("/login/passwordChange/certify");
		mav.addObject("member_id", member_id);
		mav.setViewName("/login/pwChange");
		return mav;
	}

	@PostMapping("/passwordChange/change")
	public ModelAndView passwordChangeChange(String member_id, String password, ModelAndView mav) throws Exception {
		log.info("/login/passwordChangeChange");
		securityService.updatePassword(member_id, password);
		mav.setViewName("/login/login");
		return mav;
	}

}
