package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CommunityMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.PlikeVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	public CommunityMapper mapper;
	
	//베스트 상품 총 개수	
	@Override
	public List<ImageVO> getTipsCount() {
		log.info("getTipsCount");
		return mapper.getTipsCount();
	}
	

	@Override
	public void deleteQnaComment(BoardVO boardVO) {

		mapper.deleteComment(boardVO);
	}

	@Override
	public void deleteTipsComment(BoardVO boardVO) {

		mapper.deleteComment(boardVO);
	}

	@Override
	public BoardVO getBoardInfo(int board_id) {

		return mapper.getboardInfo(board_id);
	}

	@Override
	public BoardVO getBoard(int board_id) {

		return mapper.getBoard(board_id);
	}

	@Override
	public List<ImageVO> getImg(int board_id) {

		return mapper.getImg(board_id);
	}

	@Override
	public int tcount(int board_id) {
		log.info("tcounta()");
		System.out.println(board_id);
		return mapper.tcount(board_id);
	}

	// 노하우 메인페이지 리스트 출력
	@Override
	public List<ImageVO> getTipsList(Criteria cri) {
		log.info("mapper.getTipsList()");
		return mapper.getTipsList(cri);
	}

	// 노하우 글 작성
	@Override
	public void writeTips(BoardVO boardVO) {
		log.info("mapper.writeTips()호출");
		mapper.writeTips(boardVO);
	}

	// 노하우 동물에 해당하는 글
	@Override
	public List<ImageVO> getPetTips(int category_id) {
		log.info("mapper.getPetTips()");
		return mapper.getPetTips(category_id);
	}

	// 노하우 인기 게시글
	@Override
	public List<ImageVO> getTipsRate() {
		log.info("mapper.getTipsRate()");
		return mapper.getTipsRate();
	}

	@Override
	public BoardVO getTipsBoard_id() {
		log.info("getTipsBoard_id");
		return mapper.getTipsBoard_id();
	}

	// 노하우 글 수정
	@Override
	public void tmodify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	// 노하우 글 삭제
	@Override
	public void tipsdelete(int board_id) {
		log.info("mapper.delete()호출");
		mapper.delete(board_id);
	}


	@Override
	public BoardVO getTipsComment(int board_id) {
		log.info("getTipsComment()");
		return mapper.getTipsComment(board_id);
	}

	// 노하우 댓글 작성
	@Override
	public void insertTipsComment(BoardVO boardVO) {
		log.info("insertTipsComment");
		mapper.insertTipsComment(boardVO);

	}

	// 노하우 댓
	@Override
	public List<BoardVO> getTipsCommentList(int board_id, Criteria cri) {
		return mapper.getTipsCommentList(board_id, cri);
	}

	// 질문과 답변 메인 리스트 출력
	@Override
	public List<BoardVO> getQnaList(Criteria cri) {
		log.info("getQnaList(cri)");
		return mapper.getQnaList(cri);
	}

	// 질문과 답변 페이징 처리용 토탈카운트
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal()");
		return mapper.getTotalCount(cri);
	}

	// 질문과 답변 글 진짜로 작성
	@Override
	public void writeQna(BoardVO boardVO) {
		log.info("mapper.writeQna()호출");
		mapper.writeQna(boardVO);
	}

	// 질문과 답변 글 수정하기
	@Override
	public void modify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	// 질문과 답변 글 삭제하기
	@Override
	public void qnadelete(int board_id) {
		log.info("mapper.qdelete()호출");
		mapper.delete(board_id);
	}

	@Override
	public BoardVO getQnaInfo(int board_id) {

		return mapper.getQnaInfo(board_id);
	}

	@Override
	public BoardVO getQnaBoard(int board_id) {

		return mapper.getQnaBoard(board_id);
	}

	@Override
	public int qcount(int board_id) {
		log.info("qcount()");
		System.out.println(board_id);
		return mapper.qcount(board_id);
	}

	// 질문과 답변 동물에 해당하는 글
	@Override
	public List<BoardVO> getPetQna(int category_id) {
		log.info("mapper.getPetQna()");
		return mapper.getPetQna(category_id);
	}

	// 질문과 답변 태그
	@Override
	public List<BoardVO> getQnatag(String keyword) {
		log.info("mapper.getQnatag()호출");
		return mapper.getQnatag(keyword);
	}

	// 질문과 답변 글 검색
	@Override
	public List<BoardVO> getQnasearch(String keyword) {
		log.info("mapper.getQnasearch()호출");
		return mapper.getQnasearch(keyword);
	}

	@Override
	public BoardVO getQnaBoard_id() {
		log.info("getQnaBoard_id");
		return mapper.getQnaBoard_id();
	}

	  @Override 
	  public int qscount(String keyword){
		log.info("qscount()");
		return mapper.qscount(keyword); 
	  }
	  
	@Override
	public BoardVO getComment(int Board_id) {
		log.info("getComment()");
		return mapper.getComment(Board_id);
	}

	// 질문과 답변 댓글 작성
	@Override
	public void insertComment(BoardVO boardVO) {
		log.info("");
		mapper.insertComment(boardVO);

	}

	@Override
	public List<BoardVO> getcommentsList(Criteria cri, int board_id) {
		return mapper.getcommentsList(cri, board_id);
	}

	@Override
	public void ImgInput(ImageVO imageVO) {
		log.info("ImgInput");
		mapper.ImgInput(imageVO);
	}

	// 조회수
	@Override
	public void hit(int board_id) {
		mapper.hit(board_id);
	}

	@Override
	public void ImgDelete(int board_id) {
		mapper.ImgDelete(board_id);

	}

	@Override
	public String getPresetnNickname(String member_id) {
		return mapper.getPresetnNickname(member_id);
	}

	@Override
	public String getNickname(int board_id) {
		return mapper.getNickname(board_id);
	}

	@Override
	public List<ImageVO> getUserboard(String nickname) {
		return mapper.getUserboard(nickname);
	}

	@Override
	public int getLiketotal(int board_id) {
		return mapper.getLiketotal(board_id);
	}

	@Override
	public int isLike(PlikeVO plikeVO) {
		return mapper.isLike(plikeVO);
	}

	@Override
	public List<PlikeVO> getLikelist(PlikeVO plikeVO) {
		return mapper.getLikelist(plikeVO);
	}

	@Override
	public void like(PlikeVO plikeVO) {
		mapper.like(plikeVO);
		
	}

	@Override
	public void likecancel(PlikeVO plikeVO) {
		mapper.likecancel(plikeVO);
		
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
	public List<BoardVO> countComment(BoardVO boardVO) {
		 
		return mapper.countComment(boardVO);
	}
	

	
	/*
	 * @Override public List<BoardVO> getTipsCatetotal(ImageVO imageVO) {
	 * 
	 * return mapper.getTipsCatetotal(imageVO); }
	 * 
	 * @Override public List<ImageVO> getTipsCategory(ImageVO imageVO, Criteria cri)
	 * { log.info("getTipsCategory"); return mapper.getTipsCategory(imageVO, cri); }
	 * }
	 */}
