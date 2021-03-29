package com.pet.ex.oauth2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.LoginMapper;
import com.pet.ex.vo.MemberVO;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	LoginMapper loginMapper;

	private MemberVO member;

	// 구글로 부터 받은 userRequest 데이터에 대한 후처리되는 함수
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration());
		System.out.println("getAccessToken :" + userRequest.getAccessToken().getTokenValue());
		System.out.println("getAttributes : " + super.loadUser(userRequest).getAttributes());

		OAuth2User oauth2User = super.loadUser(userRequest);

		String provider = userRequest.getClientRegistration().getClientId(); // google
		String member_id = oauth2User.getAttribute("email");
		String password = passwordEncoder.encode("펫츠하우스");

		member = loginMapper.getMember(member_id);

		if (member == null) {
			if(provider.equals("google")) {
				member.getLogintypeVO().setLogintype_id(4);
			}
			
			member.setMember_id(member_id);
			member.setUsername(member_id);
			member.setPassword(password);
			member.getRoleVO().setRole_id(1);
			loginMapper.insertMember(member);
			member.setAttributes(oauth2User.getAttributes());	
		} 
		return member;
	}
}
