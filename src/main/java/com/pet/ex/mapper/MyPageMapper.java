package com.pet.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PointVO;

@Mapper
public interface MyPageMapper {
	public BoardVO getBoard(String board_id);

	public PointVO getPoint(String member_id);
}
