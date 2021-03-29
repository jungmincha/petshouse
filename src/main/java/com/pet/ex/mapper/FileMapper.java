package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.pet.ex.vo.ImgtestVO;

@Mapper
public interface FileMapper {

	public void uploadFile(String imgname);

	public List<ImgtestVO> getImgtest();
}
