package com.pet.ex.security.handlers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import com.pet.ex.vo.MemberVO;

import lombok.Getter;
import lombok.Setter;

//현재 로그인한 사용자 객체 저장 DTO

@Getter
@Setter
public class MyAuthentication extends UsernamePasswordAuthenticationToken {
	private static final long serialVersionUID = 1L;

	@Autowired
	MemberVO member;

	public MyAuthentication(String id, String password, List<GrantedAuthority> grantedAuthorityList, MemberVO member) {
		super(id, password, grantedAuthorityList);

		this.member = member;
	}

}
