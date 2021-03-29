package com.pet.ex.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.pet.ex.vo.MemberVO;

public interface SecurityService extends UserDetailsService {

	// 유저네임으로 멤버조회
	UserDetails loadUserByUsername(String id);

	// 멤버조회
	MemberVO getMember(String id) throws Exception;

	// 회원가입
	int insertMember(MemberVO member) throws Exception;

	// 비밀번호 틀린횟수 증가
	int updateTryCount(String id) throws Exception;

	// 로그인 성공시 비밀번호 틀린횟수 초기화
	int updateResetTryCount(String id) throws Exception;

}
