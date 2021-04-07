package com.pet.ex.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.FileMapper;
import com.pet.ex.vo.ImageVO;
 

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class FileServiceImpl implements FileService {

	@Autowired
	public FileMapper mapper;

	@Override
	public void fileUpload(String imgname) {
		log.info("fileUpload");
		mapper.uploadFile(imgname);
	}

	@Override
	public List<ImageVO> getImgtest() {
		log.info("getImgtest");
		return mapper.getImgtest();
	}
}
