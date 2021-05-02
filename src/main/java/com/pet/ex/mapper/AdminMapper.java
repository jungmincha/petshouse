package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;

@Mapper
public interface AdminMapper {
	
	/* 상품관리 */
	public List<GoodsVO> getList(Criteria cri);
	
	public int getTotalGoods(Criteria cri);
	
	public List<GoodsVO> getCatelist(int category_id, Criteria cri);
	
	public int getTotalCateGoods(int category_id, Criteria cri);
	
	public List<CategoryVO> getCatengoods();
	
	public List<CategoryVO> getSort(CategoryVO categoryVO);
	
	public GoodsVO getGoods(int goods_id);
	
	public List<StockVO> getStock();
	
	public List<CategoryVO> getCategory();
	
	public void goodsInput(GoodsVO goodsVO);
	
	public void goodsModify(GoodsVO goodsVO);

	/* public void reviewDelete(int goods_id); */
	
	public void imgDelete(int goods_id);

	public void boardDelete(int goods_id);

	public void goodsDelete(int goods_id);

	
	
	
	/* 상품게시글관리 */
	public List<GoodsVO> getNboard();
	
	public void boardInput(BoardVO boardVO);

	public void detailInput(ImageVO imageVO);
	
	public BoardVO getboardInfo(int board_id);

	public BoardVO getBoard(int board_id);

	public List<ImageVO> getImg(int goods_id);
	
	public BoardVO getRateone(int goods_id);

	public List<CategoryVO> getcateBoard();

	public List<CategoryVO> getsortBoard(CategoryVO categoryVO);
	



	


 
	
	/* 회원관리 */
	public List<MemberVO> getMemberlist(Criteria cri);

	public int getMembertotal();

	public MemberVO getMemberdetail(String nickname);

	public void memberDelete(String member_id);

	public List<String> getGoodsSize(int goods_id);

	public void updateCheck(BoardVO boardVO);
 

	// 조회수 어쩔거임
	public void hit(int board_id);
	// 글 수정하기
	public void modify(BoardVO boardVO);
	
	// 공지사항 페이징 처리 리스트 출력
	public List<BoardVO> getNoticeWithPaging(Criteria cri);
		
	// 공지사항 페이징 처리용 토탈카운트,,,,
	public int getNoticeTotalCount(Criteria cri);
	
	//공지사항 특정 글 보기
	public BoardVO getNoticeView(int board_id);
	
	//공지사항 글 쓰기
	public void writeNotice(BoardVO boardVO);
	
	//공지사항 삭제
	public void noticeDelete(int board_id);
	
	//공지사항 삭제하기
	public void noticeImgDelete(int board_id);

	//공지사항 글 수정
	public void nodify(BoardVO boardVO);

	public List<ImageVO> getNoticeImg(int board_id);
	
	public void NoticeImgInput(ImageVO imageVO);
	
	public BoardVO getNoticeBoard_id();
	
	public BoardVO getboardInfo1(int board_id);

	public BoardVO getBoard1(int board_id);
	
	public void ImgModify(ImageVO imageVO);


	   public ImageVO getReviewImg(int board_id);
	   
		// 리뷰 리스트
		public List<BoardVO> getReviewList(BoardVO boardVO, Criteria cri);

		public void imgboardDelete(int board_id);

	

	



	

	



}
