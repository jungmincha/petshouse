package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.MemberVO;

public interface LoginService {
	List<CategoryVO> listCategory();

	MemberVO emailCheck(MemberVO member);

	void updateCertify(MemberVO member);

}
