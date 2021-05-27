package com.pet.ex.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	//현재 위치를 통해 게시글 출력
	@Override
	public List<ImageVO>getList(Criteria cri , String presentLocation) {
	log.info("getList...");
	System.out.println("presentLocation : " + presentLocation);
	cri.setAmount(5);
		return mapper.getList(cri , presentLocation);
	}

	
	//페이징 처리를 위한 전체 게시글 수 조회
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal...");
		
		return  mapper.getTotal(cri);
	}


	//글작성
	@Override
	public void write(BoardVO boardVO) {
		log.info("write...");
			
	mapper.write(boardVO);
		
	}


	//게시글 내용
	@Override
	public BoardVO content_view(int board_id) {
		log.info("content_view...");
		
		return mapper.content_view(board_id);
	}


	//글삭제
	@Override
	public void inputDelete(int board_id) {
		log.info("inputDelete...");
		
		mapper.inputDelete(board_id);
		
	}


	//geolocation 으로 얻은 현재 위치 memberVO에 입력
	@Override
	public void insertLoc(MemberVO memberVO) {
		log.info("insertLoc...");
		
		mapper.insertLoc(memberVO);
		
	}



	@Override
	public List<MemberVO> getMemberList(String getMember_id) {
		log.info("getMemberList...");
		
		return mapper.getMemberList(getMember_id);
	}


	//검색
	@Override
	public List<BoardVO> getSerchList(Criteria cri) {
		log.info("getSerchList...");
		
		return mapper.getSerchList(cri);
	}


	//댓글출력
	@Override
	public List<BoardVO> listComment(int board_id) {
		log.info("listComment...");
		
		return mapper.listComment(board_id);
	}


	//댓글작성
	@Override
	public void insertComment(BoardVO boardVO) {
		log.info("insertComment...");
		
		mapper.insertComment(boardVO);
		
	}



	@Override
	public BoardVO getComment(int Board_id) {
		log.info("getComment...");
		
		return mapper.getComment(Board_id);
	}


	//카테고리별 비동기 페이지 조회
	@Override
	public List<ImageVO> getHashtag(BoardVO boardVO ) {
		log.info("getHashtag...");
	
		return mapper.getHashtag(boardVO);
	}

	//사진 입력
	@Override
	public void detailInput(ImageVO imageVO , MultipartHttpServletRequest multi) throws Exception {
		log.info("detailInput...");
		
				String path = multi.getSession().getServletContext().getRealPath("/static/img/location");//절대경로 상대경로로 바꿔주기

				path = path.replace("webapp", "resources");

				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdir();
				}

				List<MultipartFile> mf = multi.getFiles("btnAtt");

				for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

					UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

					String originalfileName = mf.get(i).getOriginalFilename();
					String ext = FilenameUtils.getExtension(originalfileName); // 저장 될 파일명
					String imgname = uuid + "." + ext;

					String savePath = path + "\\" + imgname; // 저장 될 파일 경로

					mf.get(i).transferTo(new File(savePath)); // 파일 저장
					imageVO.setImgname(imgname);
					
					mapper.detailInput(imageVO);
					

				}
		
	
	}


	//글수정
	@Override
	public void modify(BoardVO boardVO) {
		log.info("modify...");

		mapper.modify(boardVO);
		
	}


	//댓글 삭제
	@Override
	public void deleteComment(BoardVO boardVO) {
		log.info("deleteComment...");
		
		mapper.deleteComment(boardVO);
		
	}


	//조회수
	@Override
	public void hit(int board_id) {
		log.info("hit...");
		
		mapper.hit(board_id);
		
	}


	//board테이블에 plike +1
	@Override
	public void insertplike(BoardVO boardVO) {
		log.info("insertplike...");
	
		mapper.insertplike(boardVO);
		
	}


	//board테이블에 plike -1
	@Override
	public void deleteplike(BoardVO boardVO) {
		log.info("deleteplike...");
		
		mapper.deleteplike(boardVO);
		
	}



	@Override
	public List<ImageVO> imageupload(ImageVO imageVO) {
		log.info("imageupload...");
	
		return mapper.imageupload(imageVO);
	}


	//좋아요수 조회
	@Override
	public int getLiketotal(int board_id) {
		log.info("getLiketotal...");
		
		return mapper.getLiketotal(board_id);
	}


	//좋아요 유무 체크
	@Override
	public int isLike(PlikeVO plikeVO) {
		log.info("isLike...");
	
		return mapper.isLike(plikeVO);
	}


	//좋아요 리스트 조회
	@Override
	public List<PlikeVO> getLikelist(PlikeVO plikeVO) {
		log.info("getLikelist...");
	
		return mapper.getLikelist(plikeVO);
	}


	//좋아요
	@Override
	public void like(PlikeVO plikeVO) {
		log.info("like...");
		
		mapper.like(plikeVO);
		
	}


	//좋아요 취소
	@Override
	public void likecancel(PlikeVO plikeVO) {
		log.info("likecancel...");
		
		mapper.likecancel(plikeVO);
		
	}


	//회원정보 조회
	@Override
	public MemberVO getMemberinfo() {
		log.info("getMemberinfo...");
		
		return mapper.getMemberinfo();
	}


	//좋아요 수 전체 출력
	@Override
	public List<PlikeVO> getLikeprint() {
		log.info("getLikeprint...");
		
		return mapper.getLikeprint();
	}


	//현재 닉네임 얻는것
	@Override
	public String getPresetnNickname(String member_id) {
		log.info("getPresetnNickname...");
		
		return mapper.getPresetnNickname(member_id);
	}


	//최신글 1개 출력(rownum 이용해서)
	@Override
	public BoardVO getLocationBoard_id() {
		log.info("getLocationBoard_id...");
		
		return mapper.getLocationBoard_id();
	}


	//게시글 삭제하면서 동시에 사진 삭제
	@Override
	public void depeteimage(int board_id) {
		log.info("depeteimage...");
	
		mapper.depeteimage(board_id);
		
	}


	//content_view 안에서 사진 출력
	@Override
	public List<ImageVO> getPhoto(int board_id) {
		log.info("getPhoto...");
		
		return mapper.getPhoto(board_id);
	}


	//전체 좋아요 출력
	@Override
	public List<PlikeVO> getAllLikelist(PlikeVO plikeVO) {
		log.info("getAllLikelist...");
		
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
	public int getListTotal(BoardVO boardVO ,String presentLocation) {
		log.info("getListTotal...");
		System.out.println("presentLocation  : " + presentLocation);
		return mapper.getListTotal(boardVO , presentLocation);
	}


	//글 삭제시 좋아요 삭제
	@Override
	public void delete_content_plike(int board_id) {
		log.info("delete_content_plike...");
		mapper.delete_content_plike(board_id);

		
	}


	//글 삭제시 댓글 삭제
	@Override
	public void delete_pgroup(int pgroup) {
		log.info("delete_pgroup...");
		mapper.delete_pgroup(pgroup);
		
	}


	//카테고리별 더보기(수정중)
	@Override
	public List<ImageVO> getcateList(Criteria cri) {
		log.info("getcateList...");
		cri.setAmount(5);
		return mapper.getcateList(cri);
	}





	



	

	



	

}
