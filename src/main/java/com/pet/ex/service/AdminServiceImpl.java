package com.pet.ex.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.pet.ex.mapper.AdminMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	public AdminMapper mapper;

	/* 상품관리 */

	@Override
	public List<GoodsVO> getList(Criteria cri) {

		cri.setAmount(5);
		return mapper.getList(cri);
	}

	@Override
	public int getTotalGoods(Criteria cri) {

		return mapper.getTotalGoods(cri);
	}

	@Override
	public List<GoodsVO> getCatelist(int category_id, Criteria cri) {
		
		cri.setAmount(5);
		return mapper.getCatelist(category_id, cri);
	}

	@Override
	public int getTotalCateGoods(int category_id, Criteria cri) {

		return mapper.getTotalCateGoods(category_id, cri);
	}
	
	@Override
	public List<CategoryVO> getCatengoods() {

		return mapper.getCatengoods();
	}

	@Override
	public List<CategoryVO> getSort(CategoryVO categoryVO) {

		return mapper.getSort(categoryVO);
	}

	@Override
	public GoodsVO getGoods(int goods_id) {

		return mapper.getGoods(goods_id);
	}

	@Override
	public List<StockVO> getStock() {

		return mapper.getStock();
	}

	@Override
	public List<CategoryVO> getCategory() {

		return mapper.getCategory();
	}

	@Override
	public void goodsInput(GoodsVO goodsVO) {

		mapper.goodsInput(goodsVO);
		
	}

	@Override
	public void goodsModify(GoodsVO goodsVO) {

		mapper.goodsModify(goodsVO);
	}

	@Override
	public void goodsDelete(int goods_id) {

		 
		mapper.goodsDelete(goods_id);
	}

 

	/* 상품게시글관리 */

	@Override
	public List<GoodsVO> getNboard() {
		log.info("getNboard");
		return mapper.getNboard();
	}

	@Override
	public void boardInput(BoardVO boardVO ) {

		mapper.boardInput(boardVO);
	 

	}
	
	@Override
	public void boardDelete(int goods_id) {
		
		
	 
		mapper.boardDelete(goods_id);
	}

	 
	@Override
	public void detailInput( ImageVO imageVO) {

		mapper.detailInput(imageVO);
	}

	@Override
	public void updateCheck(BoardVO boardVO) {
	 
		mapper.updateCheck(boardVO);
	}

	@Override
	public BoardVO getBoard(int board_id) {

		return mapper.getBoard(board_id);
	}
	
	@Override
	public List<ImageVO> getImg(int goods_id) {
		 
		return mapper.getImg(goods_id);
	}

	@Override
	public BoardVO getRateone(int goods_id) {

		return mapper.getRateone(goods_id);
	}

	@Override
	public BoardVO getboardInfo(int board_id) {

		return mapper.getboardInfo(board_id);
	}

	@Override
	public List<CategoryVO> getsortBoard(CategoryVO categoryVO) {

		return mapper.getsortBoard(categoryVO);
	}

	@Override
	public List<CategoryVO> getcateBoard() {

		return mapper.getcateBoard();
	}

	
	
	/* 회원관리 */
	@Override
	public List<MemberVO> getMemberlist(Criteria cri) {
		log.info("Memberlist");
		cri.setAmount(20);
		return mapper.getMemberlist(cri);   
	}

	@Override
	public int getMembertotal() {
		log.info("getMembertotal");
		return mapper.getMembertotal();
	}

	@Override
	public MemberVO getMemberdetail(String nickname) {
		log.info("getMemberdetail");
		return mapper.getMemberdetail(nickname);
	}

	@Override
	public void memberDelete(String member_id) {
		log.info("memberDelete");
		mapper.memberDelete(member_id);
	}

	//  조회수
	@Override
	public void hit(int board_id) {
		mapper.hit(board_id);
	}
	// 질문과 답변 글 수정하기
	@Override
	public void modify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	//공지사항 리스트
	@Override
	public List<BoardVO> getNoticeList(Criteria cri) {
		log.info("getNoticeList(cri)");
		return mapper.getNoticeWithPaging(cri);
	}
	

	// 공지사항 페이징 처리용 토탈카운트
	@Override
	public int getNoticeTotal(Criteria cri) {
		log.info("getNoticeTotal()");
		return mapper.getNoticeTotalCount(cri);
	}
	
	@Override
	public BoardVO getNoticeView(int board_id) {
		log.info("mapper.getNoticeView()");
		return mapper.getNoticeView(board_id);
	}
	
	//공지사항 글 작성
	@Override
	public void writeNotice(BoardVO boardVO) {
		log.info("mapper.writeNotice()호출");
		mapper.writeNotice(boardVO);
		
	}
	
	@Override
	public void noticeDelete(int board_id) {
		mapper.noticeImgDelete(board_id);
		mapper.noticeDelete(board_id);
	}
	



	@Override
	public void nodify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	@Override
	public List<ImageVO> getNoticeImg(int board_id) {
		log.info("getNoticeImg");
		return mapper.getNoticeImg(board_id);
	}

	@Override
	public void NoticeImgInput(ImageVO imageVO) {
		log.info("NoticeImgInput");
		mapper.NoticeImgInput(imageVO);
	}
	
	@Override
	public BoardVO getNoticeBoard_id() {
		log.info("getNoticeBoard_id");
		return mapper.getNoticeBoard_id();
	}
	
	@Override
	public BoardVO getBoardInfo1(int board_id) {

		return mapper.getboardInfo1(board_id);
	}

	@Override
	public BoardVO getBoard1(int board_id) {

		return mapper.getBoard1(board_id);
	}


	@Override
	public void ImgModify(ImageVO imageVO) {

		mapper.ImgModify(imageVO);
	}

	   // 질문과 답변 댓글 가져오기
	   @Override
	   public List<BoardVO> getReviewList(BoardVO boardVO, Criteria cri) {
	      log.info("getReviewList()");
	      return mapper.getReviewList(boardVO,cri);
	   }

	   // 질문과 답변 댓글 가져오기
	   @Override
	   public ImageVO getReviewImg(int board_id) {
	      log.info("getReviewImg()");
	      return mapper.getReviewImg(board_id);
	   }

	
	   

}
