package com.pet.ex.oauth2;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.LoginMapper;
import com.pet.ex.security.handlers.MyAuthentication;
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

		Map<String, Object> map = (Map<String, Object>) oauth2User.getAttributes().get("response");

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		String provider = userRequest.getClientRegistration().getClientName(); // google
		String member_id = null;
		String name = null;
		int loginType =0;
		if (provider.equals("Google")) {

			member_id = oauth2User.getAttribute("email");
			name = oauth2User.getAttribute("name");
			loginType = 4;

		} else if (provider.equals("Naver")) {
			member_id = (String) map.get("email");
			name = (String) map.get("name");
			loginType = 3;

		}
		member = loginMapper.getMember(member_id);
		if (member == null) {
			member = new MemberVO();
			System.out.println("구글 로그인 이 최초입니다.");
			member.setName(name);
			member.setMember_id(member_id);
			member.setUsername(member_id);
			member.setPassword("펫츠하우스");
			member.getLogintypeVO().setLogintype_id(loginType);
		} else {
			System.out.println("구글 아이디가 있습니다.");
			authorities.add(new SimpleGrantedAuthority(member.getRoleVO().getRolename()));
		}

		return new MyAuthentication(member_id, member.getPassword(), authorities, member);
	}
}
