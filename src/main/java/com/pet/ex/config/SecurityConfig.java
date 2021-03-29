package com.pet.ex.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.pet.ex.oauth2.PrincipalOauth2UserService;
import com.pet.ex.security.handlers.AuthFailureHandler;
import com.pet.ex.security.handlers.AuthProvider;
import com.pet.ex.security.handlers.AuthSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	AuthProvider authProvider;

	@Autowired
	AuthSuccessHandler authSuccessHandler;

	@Autowired
	AuthFailureHandler authFailureHandler;

	@Autowired
	PrincipalOauth2UserService principalOauth2UserService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();

		filter.setEncoding("UTF-8");

		filter.setForceEncoding(true);

		http.addFilterBefore(filter, CsrfFilter.class);
		// rest of your code
		// CSRF 설정을 해제합니다
		// 초기 개발시에만 설정합니다
		http.csrf().disable();

		http.authorizeRequests().antMatchers("/user/**").access("hasRole('ROLE_USER')") // /user/** 경로의 경우 ROLE_USER의
																						// 권한을 가진 경우에 허용한다
				// .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')") // /admin/** 경로의 경우
				// ROLE_ADMIN의 권한을 가진 경우에
				// 허용한다

				// //누구나 접속할 수 있는 페이지이기 때문에 누구나 접근이 가능하다 (.permitAll())
				.antMatchers("/home", "/content/**", "/login/login",  "/login/register",
						"/login/register/idCheck", "/login/find", "/login/register/insert","/login/email/certify","/popup/jusoPopup.jsp")
				.permitAll().antMatchers("/**").authenticated(); // 기타 /** 의 경로는 인증을 필요로 한다

		http.formLogin()
				.loginPage("/login/login") // 로그인 페이지
				.loginProcessingUrl("/login/login-processing") // 로그인 버튼을 누를시 /login-processing 경로로
				.usernameParameter("id") // 로그인시 파라미터로 "id", "password"를 받습니다
				.passwordParameter("password") // 로그인시 파라미터로 "id", "password"를 받습니다
				//.defaultSuccessUrl("/home", true) // 로그인이 성공할 경우 기본 페이지는 /home
				// .failureUrl("/login-error") // 로그인을 실패 할 경우 /login-error
				.failureHandler(authFailureHandler) // 로그인 실패시 수행하는 클래스
				.successHandler(authSuccessHandler) // 로그인 성공시 수행하는 클래스
				.and().oauth2Login().loginPage("/login/login").defaultSuccessUrl("/home",true).userInfoEndpoint()
				.userService(principalOauth2UserService);

		http.logout().logoutRequestMatcher(new AntPathRequestMatcher("/login/logout")) // logout 경로로 요청이 들어올 경우 /로 리다이렉트
																						// 하고 세션 초기화
				.logoutSuccessUrl("/login/login") // /로 리다이렉트 하고
				.invalidateHttpSession(true); // 세션 초기화

	}

	// JSP의 리소스 파일이나 자바스크립트 파일이 저장된 경로는 무시를 한다
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/api/**", "/resources/**");
	}

	// 패스워드 인코더
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
