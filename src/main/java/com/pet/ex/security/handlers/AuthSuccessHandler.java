package com.pet.ex.security.handlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import com.pet.ex.service.SecurityService;
import lombok.extern.slf4j.Slf4j;

/*
 * 
 * 스프링 시큐리티를 사용하며, 로그인 성공시 부가 작업을 하려면, 
 * org.springframework.security.web.authentication.AuthenticationSuccessHandler를 구현해야 한다.
 *별도로 authenticationSuccessHandler를 지정하지 않으면 기본적으로 
 * org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler를 사용하게 된다.
 */
@Slf4j
@Component
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	SecurityService securityService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		log.info("::::::::::::::::::::::::::::: 로그인 성공 ::::::::::::::::::::::::::::: ");

		String id = "";
		try {

			id = authentication.getName().toString();

			securityService.updateResetTryCount(id);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.setDefaultTargetUrl("/store/home");
		super.onAuthenticationSuccess(request, response, authentication);

	}

}
