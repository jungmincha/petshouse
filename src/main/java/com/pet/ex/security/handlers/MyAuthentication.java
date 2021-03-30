package com.pet.ex.security.handlers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.pet.ex.vo.MemberVO;

import lombok.Getter;
import lombok.Setter;

//현재 로그인한 사용자 객체 저장 DTO

@Getter
@Setter
public class MyAuthentication extends UsernamePasswordAuthenticationToken implements OAuth2User, UserDetails {
	private static final long serialVersionUID = 1L;

	@Autowired
	MemberVO member;

	List<GrantedAuthority> grantedAuthorityList;

	public MyAuthentication(String id, String password, List<GrantedAuthority> grantedAuthorityList, MemberVO member) {
		super(id, password, grantedAuthorityList);
		this.grantedAuthorityList = grantedAuthorityList;
		this.member = member;
	}
	
	
	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {

		return member.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return member.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
