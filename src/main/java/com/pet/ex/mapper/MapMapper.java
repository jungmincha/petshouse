package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.vo.BoardVO;

@Mapper
public interface MapMapper {

	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);

}
