package com.pet.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.pet.ex.mapper.MapMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class MapServiceImpl implements MapService {

	private MapMapper mapper;
	
	@Override
	public List<ImageVO>getList(Criteria cri) {
	log.info("getList...");
	cri.setAmount(8);
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
	public List<ImageVO> getHashtag(BoardVO boardVO) {
	
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



	@Override
	public void deleteplike(BoardVO boardVO) {
		mapper.deleteplike(boardVO);
		
	}







	@Override
	public List<ImageVO> imageupload(ImageVO imageVO) {
	
		return mapper.imageupload(imageVO);
	}


	//좋아요수 조회
	@Override
	public int getLiketotal(int board_id) {
		
		return mapper.getLiketotal(board_id);
	}


	//좋아요 유무 체크
	@Override
	public int isLike(PlikeVO plikeVO) {
	
		return mapper.isLike(plikeVO);
	}


	//좋아요 리스트 조회
	@Override
	public List<PlikeVO> getLikelist(PlikeVO plikeVO) {
	
		return mapper.getLikelist(plikeVO);
	}


	//좋아요
	@Override
	public void like(PlikeVO plikeVO) {
		mapper.like(plikeVO);
		
	}


	//좋아요 취소
	@Override
	public void likecancel(PlikeVO plikeVO) {
		mapper.likecancel(plikeVO);
		
	}


	//회원정보 조회
	@Override
	public MemberVO getMemberinfo() {
		// TODO Auto-generated method stub
		return mapper.getMemberinfo();
	}


	//좋아요 수 전체 출력
	@Override
	public List<PlikeVO> getLikeprint() {
		
		return mapper.getLikeprint();
	}


	//현재 닉네임 얻는것
	@Override
	public String getPresetnNickname(String member_id) {
		// TODO Auto-generated method stub
		return mapper.getPresetnNickname(member_id);
	}


	//최신글 1개 출력(rownum 이용해서)
	@Override
	public BoardVO getLocationBoard_id() {
		
		return mapper.getLocationBoard_id();
	}


	//게시글 삭제하면서 동시에 사진 삭제
	@Override
	public void depeteimage(int board_id) {
	
		mapper.depeteimage(board_id);
		
	}


	//content_view 안에서 사진 출력
	@Override
	public List<ImageVO> getPhoto(int board_id) {
		
		return mapper.getPhoto(board_id);
	}


	//전체 좋아요 출력
	@Override
	public List<PlikeVO> getAllLikelist(PlikeVO plikeVO) {
		
		return mapper.getAllLikelist(plikeVO);
	}


	//댓글더보기
	@Override
	public List<BoardVO> getcommentsList(Criteria cri, int board_id) {
	log.info("getcommentsList...");
		return mapper.getcommentsList(cri,board_id);
	}


	//댓글 카운트
	@Override
	public int qcount(int board_id) {
		log.info("qcount...");
		return mapper.qcount(board_id);
	}


	//현재 장소
	@Override
	public String getPresetnLocation(String member_id) {
		log.info("getPresetnLocation...");
		return mapper.getPresetnLocation(member_id);
	}


//리스트 객체 수 구하기
	@Override
	public int getListTotal(BoardVO boardVO) {
		log.info("getListTotal...");
		return mapper.getListTotal(boardVO);
	}





	



	

	



	

}
