package com.pet.ex.controller;

//jungmin3 브랜치 등록

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.MapService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;


@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/map")
public class MapController {

	private MapService service;//Mapservice 객체 생성

		// 펫츠타운 위치기반동의 페이지
		@GetMapping("/home")
		public ModelAndView map(ModelAndView mav) {
			
			log.info("map/map_home");
			
			mav.setViewName("map/map_home");
	
			return mav;
		}
		
		
		@GetMapping("/test")
		public ModelAndView test(ModelAndView mav) {
			
			log.info("test");
			mav.setViewName("map/serchmap");
	
			return mav;
		}
	
		//키워드로 지도 검색(수정중)
		@PostMapping("/searchmap")
		public ResponseEntity<String>searchmap(String searchmap) {
			
			log.info("searchmap");
			
			ResponseEntity<String> entity = null; log.info("searchmap");
			 
			  try {
			  
			  entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); 
			  
			  } catch(Exception e) {
			  e.printStackTrace();
			  entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			  
			  }
			  
			  return entity;
			  
			  }
		 
	
	
	
		//home에서 위치정보 입력(수정중)
		@PostMapping("/insert_location")
		public ResponseEntity<String>insert_location(MemberVO memberVO ,BoardVO boardVO) {
					
				  log.info("insert_location");
				  
				  ResponseEntity<String> entity = null; log.info("insert_location");
					 
					  try {
					  
					  service.insertLoc(memberVO);
				  
					  entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
					  
					  } catch(Exception e) {
						  
					  e.printStackTrace();
					  entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
					  
					  }
					  
					  return entity;
					  
					  }
	 

		// 펫츠타운 메인페이지
		@RequestMapping("/board")
		public ModelAndView board(ModelAndView mav, Criteria cri, MemberVO memberVO, 
									BoardVO boardVO, ImageVO imageVO, PlikeVO plikeVO,  Authentication authentication ) {
			
				log.info("board");
				
				String member_id = authentication.getPrincipal().toString();//authentication로 현재 접속된 아이디 구함
				String presentLocation = service.getPresetnLocation(member_id);
				memberVO.setLocation(presentLocation);//home에서 입력된 현재 위치를 set 해준다.
				//System.out.println("1. 현재 당신의 위치는?" + location);
				System.out.println("2. 현재 당신의 위치는?" + presentLocation);
				boardVO.setMemberVO(memberVO);
	
				service.insertLoc(memberVO);
				
				mav.addObject("list", service.getList(cri , presentLocation));
				int total = service.getTotal(cri);
				mav.addObject("pageMaker", new PageVO(cri, total));//페이징 처리
				mav.addObject("location", presentLocation);//현재 위치 화면에 출력
				mav.addObject("member_id", member_id);//현재 접속 아이디 
				mav.addObject("listTotal", service.getListTotal(boardVO , presentLocation));	
				mav.addObject("like_print", service.getLikeprint());// board테이블의 plike 현황 알려줌	
				mav.addObject("jsonList", JSONArray.fromObject(service.getList(cri , presentLocation)));//json형태로 list 정보 전달
				
				
				mav.setViewName("map/map_board");
				
				return mav;
			}
			
		
		//게시글 더보기 
		@PostMapping("/morelist")
		public Map<String, Object> morelocation(Criteria cri , BoardVO boardVO ,  Authentication authentication) {
			
			log.info("morelist");
			
			String member_id = authentication.getPrincipal().toString();//authentication로 현재 접속된 아이디 구함
			String presentLocation = service.getPresetnLocation(member_id);
			
			Map<String, Object> hashList = new HashMap<>();//hashList라는 해시맵 객체를 생성해준다. key값은 String, value값은 Object이다.
			List<ImageVO> morelist = service.getList(cri , presentLocation);//게시글 list 정보를 morelist라는 List<ImageVO> 객체에 담는다.
		
			hashList.put("list", morelist);//hashList에 key 값으로 "list" value값으로 morelist을 put 해준다
			hashList.put("listTotal", service.getListTotal(boardVO , presentLocation));//hashList에 key 값으로 "listTotal" value값으로 서비스 getListTotal을 put 해준다

			
			/*
			 * HashMap은 Map 인터페이스를 구현한 Map 컬렉션이다. 
			 * 인터페이스를 상속하기 때문에 Map의 특성을 그대로 사용할 수 있다.
			 * Key-Value쌍의 데이터로 저장되는 구조를 갖고 있고 이 데이터는 모두 객체이다. 값은 중복될 수 있지만 key값은 고유한 값을 가져야 한다.
			 * 만약 이미 존재하는 key값과 동일한 key값을 put하게 되면 새로운 key값으로 교체된다.
			 * 
			 * https://tosuccess.tistory.com/138
			 */

				return hashList;//hashList 값을 화면에 return 해준다. 페이징 처리가 비동기적으로 완료된다.
			
		}
		
		//카테고리별로 게시글 더보기 (수정중)
		
				@PostMapping("/cate_morelist")
				public Map<String, Object> cate_morelocation(Criteria cri , BoardVO boardVO) {
					log.info("cate_morelist");
					Map<String, Object> hashList = new HashMap<>();
					List<ImageVO> cate_morelist = service.getcateList(cri);
				
					hashList.put("list",cate_morelist);
					//hashList.put("listTotal", service.getListTotal(boardVO));

					return hashList;
		
		
				}
		
		

			// 글작성 페이지
			@GetMapping("/write_view")
			public ModelAndView write_view(String location, String member_id, ModelAndView mav, BoardVO boardVO) {
		
				log.info("write_view...");
		
				mav.addObject("location", location);
				mav.addObject("member_id", member_id);
		
				mav.setViewName("map/map_write_view");
		
				return mav;
			}

			// content_view 페이지
			@GetMapping("/board/{board_id}")
			public ModelAndView content_view(@PathVariable("board_id") int board_id, String location, ModelAndView mav, BoardVO boardVO,ImageVO imageVO, 
											MemberVO memberVO, PlikeVO plikeVO, Authentication authentication) {
				
				log.info("content_view");
				
				String member_id = authentication.getPrincipal().toString();//현재 아이디
				String present_nickname = service.getPresetnNickname(member_id);//현재 닉네임
				
				mav.addObject("location", location);
				mav.addObject("member_id", member_id);
				mav.addObject("comment", service.listComment(boardVO.getBoard_id()));//댓글리스트 불러오기
		
				service.hit(boardVO.getBoard_id());// 조회수 기능
				
				mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));// 게시물 내용 출력
		
				// 좋아요 기능 구현 -START-
		
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(member_id);
				plikeVO.getMemberVO().setNickname(present_nickname);//좋아요 리스트 조회할때 좋아요 클릭한 멤버의 닉네임을 plike에 입력
		
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
				
				mav.addObject("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));// 좋아요 수
				mav.addObject("likecheck", service.isLike(plikeVO));	// 좋아요 유무 체크
				mav.addObject("likelist", service.getLikelist(plikeVO));	// 좋아요 리스트
				
				// 좋아요 기능 구현 -END-
				
				mav.addObject("photo", service.getPhoto(board_id));//각 게시글에 입력된 사진 이름 출력
				
				mav.setViewName("map/map_content_view");
				
				return mav;
		
			}
			

			// 게시글 수정 할 수 있는 페이지 띄움
			@GetMapping("/modify_view/{board_id}")
			public ModelAndView modify_view(String location, String member_id, ModelAndView mav, BoardVO boardVO) {
		
				log.info("modify_view");
		
				mav.addObject("location", location);
		
				mav.addObject("member_id", member_id);
				mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
			
		
				mav.setViewName("map/map_modify_view");
		
				return mav;
			}

			// 메인페이지에서 게시글 작성
			@RequestMapping("/write") // 글작성 폼에서 정보입력(즉, insert)
			public ModelAndView write( ModelAndView mav, ImageVO imageVO, BoardVO boardVO,
									  MemberVO memberVO, Criteria cri, MultipartHttpServletRequest multi ,  Authentication authentication) throws Exception {
				
				log.info("write");
				
				String member_id = authentication.getPrincipal().toString();//authentication로 현재 접속된 아이디 구함
				String presentLocation = service.getPresetnLocation(member_id);
	
				MemberVO member = new MemberVO();
				boardVO.setMemberVO(member);
				boardVO.getMemberVO().setLocation(presentLocation);
				boardVO.getMemberVO().setMember_id(member_id);
	
				service.write(boardVO);
	
				
				  mav.addObject("list", service.getList(cri , presentLocation));
				  int total = service.getTotal(cri); mav.addObject("pageMaker", new PageVO(cri, total));
				  memberVO.setLocation(presentLocation); service.insertLoc(memberVO);
				  mav.addObject("location", presentLocation); mav.addObject("member_id",member_id);
				 
	
				
				//사진 업로드 -start
				BoardVO board = service.getLocationBoard_id();//최신글을 rownum으로 불러온다.
				imageVO.getBoardVO().setBoard_id(board.getBoard_id());//최신글의 board_id를 imageVO에  넣어준다.
				service.detailInput(imageVO, multi);//최신글의 board_id정보가 들어간 imageVO와 함께 MultipartHttpServletRequest 객체도 함께 보내준다. 서비스에서 구현하기 위해서!
				//사진 업로드 -end
		
				mav.setViewName("redirect:board");
			
				return mav;
	
		}

			// 게시글 수정
			@RequestMapping("/modify") // 글작성 폼에서 정보수정(즉, update)
			public ModelAndView modify(ModelAndView mav, ImageVO imageVO,BoardVO boardVO, MemberVO memberVO, Criteria cri ,  Authentication authentication){
				
				log.info("modify");
				
				String member_id = authentication.getPrincipal().toString();//authentication로 현재 접속된 아이디 구함
				String presentLocation = service.getPresetnLocation(member_id);
		
				mav.addObject("list", service.getList(cri , presentLocation));
				int total = service.getTotal(cri);
				mav.addObject("pageMaker", new PageVO(cri, total));
				memberVO.setLocation(presentLocation);
		
				service.insertLoc(memberVO);
		
				mav.addObject("location", presentLocation);
				mav.addObject("member_id", member_id);
				service.modify(boardVO);
		
				mav.setViewName("redirect:map_board");
				
				return mav;
		
			}

			// 댓글 작성
			@PostMapping("/map_view/insert")
			public BoardVO insertComment(BoardVO boardVO, String member_id){
				
				log.info("insertComment");
				
				MemberVO member = new MemberVO();
				boardVO.setMemberVO(member);
				boardVO.getMemberVO().setMember_id(member_id);
		
				service.insertComment(boardVO);	// 댓글 입력
		
				BoardVO comments = service.getComment(boardVO.getPgroup());	// 댓글 출력, boardVO 타입으로 변환
		
				return comments; //comments 객체를 return해준다(비동기 처리)
			}
		
			// 댓글 삭제 
			@DeleteMapping("/map_view/delete/{board_id}")
			public ResponseEntity<String> reply_delete(BoardVO boardVO) {
				/*
				 * ResponseEntity 객체는 HTTP 정보들을 담아서 전달해 줄 수 있다.
				 * 개발자가 직접 결과 데이터(body)와 headers, status code 들을 제어할 수 있게 되는 것이다.
				 * ResponseEntity 클래스는 개발자가 직접 HTTP body, headers, status code를 세팅하여 반환할 수 있게 해준다. ResponseEntity 객체가 반환되면 JSON 등 다른 형식으로 직렬화가 된다.
				 * REST API 개발 및 협업을 하고자 한다면 매우 유용하게 이용되는 클래스라고 할 수 있다.
				 */
				
				log.info("delete");
		
				ResponseEntity<String> entity = null;
				
				try {
					
					service.deleteComment(boardVO);//댓글삭제
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
					
				}catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
		
				return entity;
		
			}
			
			
				// 댓글 더보기
				@PostMapping("/cmorelist")
				public Map<String, Object> comments(@RequestParam("board_id") int board_id, Criteria cri) {
					
					log.info("commentsmorelist");
					
					Map<String, Object> hashList = new HashMap<>();//hashList라는 해시맵 객체 생성
					List<BoardVO> comments = service.getcommentsList(cri, board_id);//댓글리스트 서비스를 List<BoardVO>형식에 담는다.
					hashList.put("comments", comments);//key 값 "comments" value값 comments를 hashList에 put 해준다.
					hashList.put("commentTotal", service.qcount(board_id)); //key 값 "commentTotal" value 값 댓글수 구하는 서비스를  hashList에 put 해준다.
					
					return hashList;//결과를 return해준다(비동기처리)
					
				}
		
			// content_view 에서 게시글 삭제
			@RequestMapping("/delete")
			public ModelAndView delete(int board_id, String location, String member_id, ModelAndView mav, BoardVO boardVO, MemberVO memberVO){
		
				log.info("delete");
				
				service.depeteimage(board_id);//이미지 삭제
				service.delete_content_plike(board_id);//좋아요 삭제
				service.delete_pgroup(board_id);//댓글삭제
				service.inputDelete(board_id);//글삭제, 위의 것들을 다 삭제해줘야지 무결성제약조건에 위배되지 않는다.
				
				memberVO.setLocation(location);
		
				service.insertLoc(memberVO);
		
				mav.addObject("location", location);
				mav.addObject("member_id", member_id);
		
				mav.setViewName("redirect:board");
		
				return mav;
			}
		
			// 해시태그 별로 게시글 조회
			@GetMapping("/location/tag")
			public List<ImageVO> tag(String hashtag, Criteria cri, BoardVO boardVO , ImageVO imageVO , Model model , Authentication authentication) {
		
				log.info("hashtag");
				
				String member_id = authentication.getPrincipal().toString();//authentication로 현재 접속된 아이디 구함
				String presentLocation = service.getPresetnLocation(member_id);
				
				List<ImageVO> list = new ArrayList<ImageVO>();
		
				if (hashtag == null) {//만약 hashtag가 null이면 그냥 일반 list를 출력한다.
		
					list = service.getList(cri , presentLocation);
					
				}else{//그렇지 않으면 hashtag, location 파라미터 값이 포함된 list를 출력한다.
					
					MemberVO member = new MemberVO();
					imageVO.getBoardVO().setMemberVO(member);
					imageVO.getBoardVO().setMemberVO(member);
					imageVO.getBoardVO().getMemberVO().setLocation(presentLocation);
					imageVO.getBoardVO().setHashtag(hashtag);
				
					list = service.getHashtag(boardVO);
				}
		
				System.out.println("hashtag : " + hashtag);
				System.out.println("location : " + presentLocation);
				
				return list;
			}
		
			// 좋아요 기능 -START-
		
			// 좋아요 입력
			@PostMapping("/like/{board_id}")
			public Map<String, Object> like(PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO, Authentication authentication) {
				
				log.info("like");
		
				String member_id = authentication.getPrincipal().toString();
				String present_nickname = service.getPresetnNickname(member_id);//현재 닉네임
			
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(member_id);
				plikeVO.getMemberVO().setNickname(present_nickname);
			
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
		
				
				Map<String, Object> likeMap = new HashMap<>();//likeMap이라는 해시맵 객체 생성
				try {
					service.like(plikeVO);//plikeVO에 회원의 nickname insert
					
					likeMap.put("SUCCESS", HttpStatus.OK);
					likeMap.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));//key 값 "like_amount" , value 값 좋아요수를 구하는 서비스를 likeMap에 put
		
					List<PlikeVO> likelist = service.getLikelist(plikeVO);
					likeMap.put("likelist", likelist);//key 값으로 "likelist" vlaue값으로 좋아요를 누른 사람의 정보가 담긴 List<PlikeVO>타입의 likelist 객체를 likeMap에 put해준다.
		
					service.insertplike(boardVO);	// board테이블의 plike 숫자 증가
		
				} catch (Exception e) {
					
					e.printStackTrace();
					likeMap.put("SUCCESS", HttpStatus.BAD_REQUEST);
				}
				return likeMap;//해시맵 결과를 화면에 출력(비동기 처리)
			}
		
			// 좋아요 취소
			@DeleteMapping("/likecancel/{board_id}")
			public Map<String, Object> likecancel(PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO, Authentication authentication) {
				
				log.info("likecancel");
				
				String member_id = authentication.getPrincipal().toString();
				String present_nickname = service.getPresetnNickname(member_id);//현재 닉네임
		
			
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(member_id);
				plikeVO.getMemberVO().setNickname(present_nickname);
		
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
		
		
				Map<String, Object> likeCancelMap = new HashMap<>();
				try {
					service.likecancel(plikeVO);//plikeVO에 회원 delete
					likeCancelMap.put("SUCCESS", HttpStatus.OK);
					likeCancelMap.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
		
					List<PlikeVO> likelist = service.getLikelist(plikeVO);
					likeCancelMap.put("likelist", likelist);
		
					service.deleteplike(boardVO);// board테이블의 plike 숫자 감소
					
				} catch (Exception e) {
					e.printStackTrace();
					likeCancelMap.put("SUCCESS", HttpStatus.BAD_REQUEST);
				}
				return likeCancelMap;
			}
		
			// 좋아요 기능 -END-
		
		}
