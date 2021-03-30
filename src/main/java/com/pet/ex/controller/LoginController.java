package com.pet.ex.controller;

import java.security.Principal;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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

	// 비밀번호 찾기
	@RequestMapping("/findpw")
	public ModelAndView findpw(@RequestParam(value = "msg", required = false) String msg, ModelAndView mav) {
		log.info("login/login");
		mav.addObject("msg", msg);
		mav.setViewName("/login/login");
		return mav;

	}

	// 회원가입 작성 후 INSERT
	@PostMapping("/register/insert")
	public ModelAndView setInsertMember(MemberVO member, ModelAndView mav) throws Exception {
		log.info("/login/register/insert");
		if (securityService.insertMember(member) > 0) {
			mav.setViewName("/login/login");
			return mav;
		} else {
			mav.setViewName("/login/register");
			return mav;
		}
	}

	// 이메일 확인 페이지 이동
	@GetMapping("/email")
	public ModelAndView emailPage(ModelAndView mav) {
		log.info("/login/email");
		mav.setViewName("/login/email");
		return mav;
	}

	// 이메일 전송
	@GetMapping(value = "/email/send")
	public void sendmail(MemberVO member) throws MessagingException {
		log.info("/login/email/send");
		StringBuffer emailcontent = new StringBuffer();
		emailcontent.append("<!DOCTYPE html>");
		emailcontent.append("<html>");
		emailcontent.append("<head>");
		emailcontent.append("</head>");
		emailcontent.append("<body>");
		emailcontent.append(" <div"
				+ "	style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 400px; height: 600px; border-top: 4px solid #02b875; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"
				+ "	<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"
				+ "		<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">펫츠하우스</span><br />"
				+ "		<span style=\"color: #02b875\">메일인증</span> 안내입니다." + "	</h1>\n"
				+ "	<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"
				+ member.getName() + "		님 안녕하세요.<br />" + "		펫츠하우스에 가입해 주셔서 진심으로 감사드립니다.<br />"
				+ "		아래 <b style=\"color: #02b875\">'메일 인증'</b> 버튼을 클릭하여 회원가입을 완료해 주세요.<br />" + "		감사합니다."
				+ "	</p>" + "	<a style=\"color: #FFF; text-decoration: none; text-align: center;\""
				+ "	href=\"http://localhost:8383/login/email/certify?member_id=" + member.getMember_id() + "&certify="
				+ member.getCertify() + "\" target=\"_blank\">" + "		<p"
				+ "			style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #02b875; line-height: 45px; vertical-align: middle; font-size: 16px;\">"
				+ "			메일 인증</p>" + "	</a>" + "	<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>"
				+ " </div>");
		emailcontent.append("</body>");
		emailcontent.append("</html>");
		emailService.sendMail(member.getMember_id(), "[펫츠하우스 이메일 인증]", emailcontent.toString());
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

	@RequestMapping("/oauth2/register")
	public ModelAndView oauht2(ModelAndView mav, Principal principal) throws Exception {

		MemberVO member = securityService.getMember(principal.getName());

		if (member == null) {
			mav.addObject("category", loginService.listCategory());
			mav.setViewName("/login/oauth2Register");
		} else {
			mav.setViewName("home/home");
		}
		return mav;

	}

	// 네이버로 로그인
	@RequestMapping("/oauth2/code/naver")
	public ModelAndView oauth2Naver(ModelAndView mav, Principal principal) throws Exception {

		mav.setViewName("home/home");

		return mav;

	}

	// 카카오로 로그인
	@RequestMapping("/oauth2/code/kakao")
	public ModelAndView oauth2Kakao(ModelAndView mav, Principal principal) throws Exception {

		mav.setViewName("home/home");

		return mav;

	}

}
