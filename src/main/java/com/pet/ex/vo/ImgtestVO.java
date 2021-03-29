package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ImgtestVO {

//	private int imgtest_id;
	// original imgname
	private String imgname;
	// save imgname
//	private String simgname; 
//	private int filesize;
//	private String savepath;

	// 외래키
	private BoardVO boardVO;
}
