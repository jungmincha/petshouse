package com.pet.ex.security.handlers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.pet.ex.service.SecurityService;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthProvider implements AuthenticationProvider {

	@Autowired
	SecurityService securityService;

	// 로그인 버튼을 누를 경우
	// 실행 1
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = authentication.getName();
		String password = authentication.getCredentials().toString();
		System.out.println(password);
		return authenticate(id, password);
	}

	// 실행 2
	private Authentication authenticate(String id, String password) throws AuthenticationException {

		List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>();

		MemberVO member = new MemberVO();
		member = (MemberVO) securityService.loadUserByUsername(id);

		if (member == null) {
			log.info("사용자 정보가 없습니다.");
			throw new UsernameNotFoundException(id);
		} else if (member != null && !new BCryptPasswordEncoder().matches(password, member.getPassword())) {
			log.info("비밀번호가 틀렸습니다.");
			throw new BadCredentialsException(id);
		}

		grantedAuthorityList.add(new SimpleGrantedAuthority(member.getRoleVO().getRolename()));

		return new MyAuthentication(id, password, grantedAuthorityList, member);

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
