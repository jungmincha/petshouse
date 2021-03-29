package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ImageVO {

	private int image_id;
	private String imagename;
	private String imagepath;
	
	//외래키
	private BoardVO boardVO;
	
}
