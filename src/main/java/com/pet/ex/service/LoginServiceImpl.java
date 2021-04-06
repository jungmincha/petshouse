package com.pet.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.LoginMapper;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;

	// 회원가입 시 카테고리리스트 가져옴
	@Override
	public List<CategoryVO> listCategory() {
		log.info("listCategory()");
		return loginMapper.listCategory();
	}

	// 이메일 인증(certify 확인)
	@Override
	public MemberVO emailCheck(MemberVO member) {
		log.info("emailCheck()");
		return loginMapper.emailCheck(member);
	}

	// 이메일 인증 성공시 certify 'Y'로 update
	@Override
	public void updateCertify(MemberVO member) {
		log.info("updateCertify()");
		loginMapper.updateCertify(member);

	}

}
