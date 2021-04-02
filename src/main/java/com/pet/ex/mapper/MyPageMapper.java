package com.pet.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;

@Mapper
public interface MyPageMapper {
	BoardVO getBoard(String board_id);
}
