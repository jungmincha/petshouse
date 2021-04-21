package com.pet.ex.security.handlers;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.AuthenticationException;

import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import org.springframework.stereotype.Component;

import com.pet.ex.service.SecurityService;

import lombok.extern.slf4j.Slf4j;

/**
 * 로그인 실패 핸들러
 * 
 */
@Slf4j
@Component
public class AuthFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	private SecurityService securityService;

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		log.info("::::::::::::::::::::::::::::: 로그인 실패 :::::::::::::::::::::::::::::");

		String id = "";
		String msg = "";
		try {

			id = exception.getMessage();
			log.info(id);
			if (!securityService.getMember(id).getCertify().equals("Y")) {
				msg = "이메일을 인증해주세요.";
			} else if (securityService.getMember(id) != null) {
				securityService.updateTryCount(id);
				msg = "비밀번호가 잘못되었습니다.";
			} else {
				msg = "아이디가 없습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info(msg);
		msg = URLEncoder.encode(msg, "utf-8");

		response.sendRedirect("/login/login?msg=" + msg);

	}

}
