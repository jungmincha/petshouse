package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.MemberVO;

@Mapper
public interface LoginMapper {

	// 회원정보조회
	public MemberVO getMember(String id);

	// 회원가입
	public int insertMember(MemberVO member);

	// 비밀번호 틀린횟수 증가
	public int updateTryCount(String id);

	// 로그인 성공시 비밀번호 틀린횟수 초기화
	public int updateResetTryCount(String id);

	// 회원가입 시 카테고리리스트 가져옴
	public List<CategoryVO> listCategory();

	// 이메일 인증(certify 확인)
	public MemberVO emailCheck(MemberVO member);

	// 이메일 인증 성공시 certify 'Y'로 update
	void updateCertify(MemberVO member);

}
