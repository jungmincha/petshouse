package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.ImgtestVO;

public interface FileService {
	public void fileUpload(String imgname);
	
	public List<ImgtestVO> getImgtest();
	
}
