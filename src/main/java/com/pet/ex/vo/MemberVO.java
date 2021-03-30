package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor

public class MemberVO {

	public MemberVO() {
		this.roleVO = new RoleVO();
		this.logintypeVO = new LogintypeVO();
		this.categoryVO = new CategoryVO();
	}

	private String member_id;

	private String password;

	private String name;

	private String nickname;

	private int tel;

	private String address;

	private String certify;

	private int trycount;

	private int enable;

	// 외래키
	private RoleVO roleVO;

	private LogintypeVO logintypeVO;

	private CategoryVO categoryVO;

	// 시큐리티 용
	private String username;

	private String provider;

}
