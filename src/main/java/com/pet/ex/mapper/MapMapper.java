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

	public void write(BoardVO boardVO);

	public BoardVO content_view(int board_id);

	public void inputDelete(int board_id);

}
