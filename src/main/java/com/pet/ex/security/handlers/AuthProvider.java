package com.pet.ex.security.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.pet.ex.service.SecurityService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthProvider implements AuthenticationProvider {

	@Autowired
	private SecurityService securityService;

	// 로그인 버튼을 누를 경우
	// 실행 1
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		log.info("authenticate() 로그인 실행1");
		String id = authentication.getName();
		String password = authentication.getCredentials().toString();
		System.out.println(password);
		return authenticate(id, password);
	}

	// 실행 2
	private Authentication authenticate(String id, String password) throws AuthenticationException {
		log.info("authenticate() 로그인 실행2");
		MyAuthentication myInfo = (MyAuthentication) securityService.loadUserByUsername(id);

		if (myInfo == null) {
			log.info("사용자 정보가 없습니다.");
			throw new UsernameNotFoundException(id);
		} else if (myInfo != null && !new BCryptPasswordEncoder().matches(password, myInfo.getPassword())) {
			log.info("비밀번호가 틀렸습니다.");
			throw new BadCredentialsException(id);
		}

		return myInfo;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
