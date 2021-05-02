package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
 

public interface AdminService {

 

	// 상품 조회
	public List<GoodsVO> getList(Criteria cri);	
	public int getTotalGoods(Criteria cri); 

	//카테고리별 상품조회
	public List<GoodsVO> getCatelist(int category_id, Criteria cri);
	public int getTotalCateGoods(int category_id, Criteria cri); 
	
	//카테고리
	public List<CategoryVO> getCatengoods();
	public List<CategoryVO> getSort(CategoryVO categoryVO);
	
	//상품 상세조회
	public GoodsVO getGoods(int goods_id);
	public List<StockVO> getStock();
	public List<CategoryVO> getCategory();

	//상품등록
	public void goodsInput(GoodsVO goodstVO);

	//상품수정
	public void goodsModify(GoodsVO goodsVO);

	//상품삭제/상품게시글삭제/리뷰삭제 
	public void goodsDelete(int goods_id);

	//상품 게시글 등록
	public  List<GoodsVO> getNboard();
	public void boardInput(BoardVO boardVO ); 
	public void detailInput(ImageVO imageVO);
	public void updateCheck(BoardVO boardVO);
	
	//상품 게시글 삭제
	public void boardDelete(int goods_id);
	
	//상품 게시글 상세조회
	public BoardVO getBoard(int board_id);
	public BoardVO getRateone(int goods_id);
	public BoardVO getboardInfo(int board_id);
	public List<CategoryVO> getsortBoard(CategoryVO categoryVO);
	public List<CategoryVO> getcateBoard();
	public List<ImageVO> getImg(int goods_id);
	
	
	//회원 목록 조회
	public List<MemberVO> getMemberlist(Criteria cri);
	public int getMembertotal();
	
	//회원 상세 조회
	public MemberVO getMemberdetail(String nickname);
	
	//회원 삭제
	public void memberDelete(String member_id);
	
 
	// 조회수 어쩔거임
	public void hit(int board_id);
	
	// 질문과 답변 글 수정하기
	public void modify(BoardVO boardVO);
	
	// 공지사항 리스트 끌고오기
	public List<BoardVO> getNoticeList(Criteria cri);
	
	// 공지사항 페이징 처리 출력
	public int getNoticeTotal(Criteria criteria);
	
	//공지사항 특정 글 보기
	public BoardVO getNoticeView(int board_id);
	
	//공지사항 글 쓰기
	public void writeNotice(BoardVO boardVO);
	
	//공지사항 삭제하기
	public void noticeDelete(int board_id);
	
	//공지사항 수정하기
	public void nodify(BoardVO boardVO);

	//공지사항 이미지 가져오기
	public List<ImageVO> getNoticeImg(int board_id);
	
	//공지사항 이미지 삽입
	public void NoticeImgInput(ImageVO imageVO);
	
	//공지사항 번호 가져오기
	public BoardVO getNoticeBoard_id();

	//공지사항 글
	public BoardVO getBoard1(int board_id);
	
	//공지사항 글	
	public BoardVO getBoardInfo1(int board_id);
	
	public void ImgModify(ImageVO imageVO);

	public List<BoardVO> getReviewList(BoardVO boardVO, Criteria cri);
	public ImageVO getReviewImg(int board_id);
	
	


}
