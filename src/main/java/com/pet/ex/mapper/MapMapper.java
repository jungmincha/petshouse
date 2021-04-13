package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

@Mapper
public interface MapMapper {

	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);

	public void write(BoardVO boardVO);

	public BoardVO content_view(int board_id);

	public void inputDelete(int board_id);

	public void insertLoc(MemberVO memberVO);

	public List<MemberVO> getMemberList(String getMember_id);

	public List<BoardVO> getSerchList(Criteria cri);

	public List<BoardVO> listComment(int board_id);

	public void insertComment(BoardVO boardVO);

	public BoardVO getComment(int board_id);

	public List<BoardVO> getHashtag(BoardVO boardVO);

	public void fileUpload(String imgname);

	public void detailInput(ImageVO imageVO);



}
