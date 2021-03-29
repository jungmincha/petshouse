package com.pet.ex.oauth2;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Oauth2Controller {
	@GetMapping("/test/oauth2/login")
	public String testLogin(Authentication authentication, @AuthenticationPrincipal OAuth2User oauth) {
		OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
		System.out.println(authentication.getPrincipal());
		System.out.println(oauth2User.getAttributes());
		System.out.println(oauth.getAttributes());
		return "세션확인";

	}
}
