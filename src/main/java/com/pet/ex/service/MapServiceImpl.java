package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.pet.ex.mapper.MapMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class MapServiceImpl implements MapService {

	private MapMapper mapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
	log.info("getList...");
		return mapper.getList(cri);
	}

	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return  mapper.getTotal(cri);
	}



	@Override
	public void write(BoardVO boardVO) {
		
		
		
	mapper.write(boardVO);
		
	}



	@Override
	public BoardVO content_view(int board_id) {
		
		return mapper.content_view(board_id);
	}



	@Override
	public void inputDelete(int board_id) {
		
		mapper.inputDelete(board_id);
		
	}



	@Override
	public void insertLoc(MemberVO memberVO) {
		
		mapper.insertLoc(memberVO);
		
	}



	@Override
	public List<MemberVO> getMemberList(String getMember_id) {
		
		return mapper.getMemberList(getMember_id);
	}



	@Override
	public List<BoardVO> getSerchList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getSerchList(cri);
	}



	@Override
	public List<BoardVO> listComment(int board_id) {
		
		return mapper.listComment(board_id);
	}



	@Override
	public void insertComment(BoardVO boardVO) {
		mapper.insertComment(boardVO);
		
	}



	@Override
	public BoardVO getComment(int Board_id) {
		
		return mapper.getComment(Board_id);
	}



	@Override
	public List<BoardVO> getHashtag(BoardVO boardVO) {
	
		return mapper.getHashtag(boardVO);
	}



	@Override
	public void fileUpload(String imgname) {
		mapper.fileUpload(imgname);
		
	}



	@Override
	public void detailInput(ImageVO imageVO) {
		mapper.detailInput(imageVO);
		
	}



	@Override
	public void modify(BoardVO boardVO) {


		mapper.modify(boardVO);
		
	}



	@Override
	public void deleteComment(BoardVO boardVO) {
		mapper.deleteComment(boardVO);
		
	}



	@Override
	public void hit(int board_id) {
		mapper.hit(board_id);
		
	}



	@Override
	public void insertplike(BoardVO boardVO) {
		mapper.insertplike(boardVO);
		
	}



	



	

	



	

}
