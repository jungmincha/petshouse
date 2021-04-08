package com.pet.ex.vo;

import java.sql.Timestamp;

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

	private Timestamp pdate;

	// 외래키
	private RoleVO roleVO;

	private LogintypeVO logintypeVO;

	private CategoryVO categoryVO;

	// 시큐리티 용
	private String username;

	// 번호 순으로 정렬
	private int rnum;

	// 관심사
	private String concern;
	
	private String location;

}
