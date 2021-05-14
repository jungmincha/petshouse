package com.pet.ex.controller;

//jungmin3 브랜치 등록
import java.io.File; 
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.security.handlers.MyAuthentication;
import com.pet.ex.service.CommunityService;
import com.pet.ex.service.MapService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.GoodsVO;
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
			
			log.info("map/home");
			mav.setViewName("map/home");
	
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
				  
			  
			 System.out.println(searchmap);
			  
			  entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); } catch
			  (Exception e) { e.printStackTrace();
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
					  
					  service.insertLoc(memberVO); // 홍제 2동 삽입된
					  System.out.println(memberVO.getLocation());
					  
					  entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); } catch
					  (Exception e) { e.printStackTrace();
					  
					  entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
					  }
					  
					  return entity;
					  
					  }
	 
	
	
	

		// 펫츠타운 메인페이지
		@RequestMapping("/board")
		public ModelAndView board( String location, ModelAndView mav, Criteria cri, MemberVO memberVO, 
									BoardVO boardVO, ImageVO imageVO, PlikeVO plikeVO,  Authentication authentication ) {
			
			log.info("board");
			
			String member_id = authentication.getPrincipal().toString();//authentication로 현재 접속된 아이디 구함
		
			memberVO.setLocation(location);//home에서 입력된 현재 위치를 set 해준다.
			System.out.println("현재 당신의 위치는?" + location);
			boardVO.setMemberVO(memberVO);

			service.insertLoc(memberVO);
			
			mav.addObject("list", service.getList(cri));
			int total = service.getTotal(cri);
			mav.addObject("pageMaker", new PageVO(cri, total));//페이징 처리
			mav.addObject("location", location);//현재 위치 화면에 출력
			mav.addObject("member_id", member_id);//현재 접속 아이디 
			mav.addObject("listTotal", service.getListTotal(boardVO));	
			mav.addObject("like_print", service.getLikeprint());// board테이블의 plike 현황 알려줌	
			mav.addObject("jsonList", JSONArray.fromObject(service.getList(cri)));//json형태로 list 정보 전달
			
			
			mav.setViewName("map/board");
			
			return mav;
		}
		
		
		//게시글 더보기 
		@PostMapping("/morelist")
		public Map<String, Object> morelocation(Criteria cri , BoardVO boardVO) {
			log.info("morelist");
			
			Map<String, Object> hashList = new HashMap<>();//hashList라는 해시맵 객체를 생성해준다. key값은 String, value값은 Object이다.
			List<ImageVO> morelist = service.getList(cri);//게시글 list 정보를 morelist라는 List<ImageVO> 객체에 담는다.
		
			hashList.put("list", morelist);//hashList에 key 값으로 list value값으로 morelist을 put 해준다
			hashList.put("listTotal", service.getListTotal(boardVO));//hashList에 key 값으로 listTotal value값으로 서비스 getListTotal을 put 해준다

			
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
					hashList.put("listTotal", service.getListTotal(boardVO));

					return hashList;
		
		
				}
		
		

			// 글작성 페이지
			@GetMapping("/write_view")
			public ModelAndView write_view(String location, String member_id, ModelAndView mav, BoardVO boardVO) {
		
				log.info("write_view...");
		
				mav.addObject("location", location);
				mav.addObject("member_id", member_id);
		
				mav.setViewName("map/write_view");
		
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
				
				mav.setViewName("map/content_view");
				
				return mav;
		
			}
			

			// 게시글 수정 할 수 있는 페이지 띄움
			@GetMapping("/modify_view/{board_id}")
			public ModelAndView modify_view(String location, String member_id, ModelAndView mav, BoardVO boardVO) {
		
				log.info("modify_view");
		
				mav.addObject("location", location);
		
				mav.addObject("member_id", member_id);
				mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
			
		
				mav.setViewName("map/modify_view");
		
				return mav;
			}

			// 메인페이지에서 게시글 작성
			@RequestMapping("/write") // 글작성 폼에서 정보입력(즉, insert)
			public ModelAndView write(String location, String member_id, ModelAndView mav, ImageVO imageVO, BoardVO boardVO,
									  MemberVO memberVO, Criteria cri, MultipartHttpServletRequest multi) throws Exception {
				
				log.info("write");
	
				MemberVO member = new MemberVO();
				boardVO.setMemberVO(member);
				boardVO.getMemberVO().setLocation(location);
				boardVO.getMemberVO().setMember_id(member_id);
	
				service.write(boardVO);
	
				mav.addObject("list", service.getList(cri));
				int total = service.getTotal(cri);
				mav.addObject("pageMaker", new PageVO(cri, total));
				memberVO.setLocation(location);
				service.insertLoc(memberVO);
				mav.addObject("location", location);
				mav.addObject("member_id", member_id);
	
				
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
			public ModelAndView modify(String location, String member_id, ModelAndView mav, ImageVO imageVO,BoardVO boardVO, MemberVO memberVO, Criteria cri){
				
				log.info("modify");
		
				mav.addObject("list", service.getList(cri));
				int total = service.getTotal(cri);
				mav.addObject("pageMaker", new PageVO(cri, total));
				memberVO.setLocation(location);
		
				service.insertLoc(memberVO);
		
				mav.addObject("location", location);
				mav.addObject("member_id", member_id);
				service.modify(boardVO);
		
				mav.setViewName("redirect:board");
				
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
		
					service.deleteComment(boardVO);
		
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
					
				} catch (Exception e) {
					
					e.printStackTrace();
					entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
		
				return entity;
		
			}
			
			
			// 댓글 더보기
				@PostMapping("/cmorelist")
				public Map<String, Object> comments(@RequestParam("board_id") int board_id, Criteria cri) {
					log.info("commentsmorelist");
					Map<String, Object> list = new HashMap<>();
					List<BoardVO> comments = service.getcommentsList(cri, board_id);
					list.put("comments", comments);
					list.put("commentTotal", service.qcount(board_id));
					return list;
				}
		
			// content_view 에서 게시글 삭제
			@RequestMapping("/delete")
			public ModelAndView delete(int board_id, String location, String member_id, ModelAndView mav, BoardVO boardVO,
					MemberVO memberVO) throws Exception {
		
				log.info("delete");
				
				service.depeteimage(board_id);
				service.delete_content_plike(board_id);
				service.delete_pgroup(board_id);
				service.inputDelete(board_id);
				
				memberVO.setLocation(location);
		
				service.insertLoc(memberVO);
		
				mav.addObject("location", location);
		
				mav.addObject("member_id", member_id);
		
		
				mav.setViewName("redirect:board");
		
				return mav;
			}
		
			// 해시태그 (수정중)
			@GetMapping("/location/tag")
			public List<ImageVO> tag(String hashtag, String location, Criteria cri, BoardVO boardVO , ImageVO imageVO , Model model) throws Exception {
		
				List<ImageVO> list = new ArrayList<ImageVO>();
		
				if (hashtag == null) {
		
					list = service.getList(cri);
				}else{
					MemberVO member = new MemberVO();
					imageVO.getBoardVO().setMemberVO(member);
					imageVO.getBoardVO().setMemberVO(member);
					imageVO.getBoardVO().getMemberVO().setLocation(location);
					imageVO.getBoardVO().setHashtag(hashtag);
				
					
					list = service.getHashtag(boardVO);
				}
		
				System.out.println("===확인====" + hashtag);
				System.out.println("===확인====" + location);
				log.info("hashtag...");
				return list;
			}
		
			// 좋아요 기능 -START-
		
			// 좋아요 입력
			@PostMapping("/like/{board_id}")
			public Map<String, Object> like(PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO,
					Authentication authentication) {
				log.info("LIKE");
		
				String member_id = authentication.getPrincipal().toString();
				System.out.println(member_id);
				String present_nickname = service.getPresetnNickname(member_id);//현재 닉네임
				
				System.out.println("---------------===========================--------------888888888888888888888888888");
				System.out.println(present_nickname);
		
				// resultmap에 vo 담아주는 거
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(member_id);
				plikeVO.getMemberVO().setNickname(present_nickname);
			
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
		
				// plikeVO.setMember_id(member_id);
		
				Map<String, Object> map = new HashMap<>();
				try {
					service.like(plikeVO);
					map.put("SUCCESS", HttpStatus.OK);
					map.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
		
					List<PlikeVO> likelist = service.getLikelist(plikeVO);
					map.put("likelist", likelist);
		
					// BOARD테이블의 plike 숫자 증가
					service.insertplike(boardVO);
		
					System.out
							.println("=====================ssss==============================================================");
		
				} catch (Exception e) {
					e.printStackTrace();
					map.put("SUCCESS", HttpStatus.BAD_REQUEST);
				}
				return map;
			}
		
			// 좋아요 취소
			@DeleteMapping("/likecancel/{board_id}")
			public Map<String, Object> likecancel(PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO,
					Authentication authentication) {
				log.info("likecancel");
				
				String member_id = authentication.getPrincipal().toString();
				System.out.println(member_id);
				String present_nickname = service.getPresetnNickname(member_id);//현재 닉네임
		
				// resultmap에 vo 담아주는 거
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(member_id);
				plikeVO.getMemberVO().setNickname(present_nickname);
		
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
		
				// plikeVO.setMember_id(member_id);
		
				Map<String, Object> map = new HashMap<>();
				try {
					service.likecancel(plikeVO);
					map.put("SUCCESS", HttpStatus.OK);
					map.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
		
					List<PlikeVO> likelist = service.getLikelist(plikeVO);
					map.put("likelist", likelist);
					// BOARD테이블의 plike 숫자 감소
					service.deleteplike(boardVO);
				} catch (Exception e) {
					e.printStackTrace();
					map.put("SUCCESS", HttpStatus.BAD_REQUEST);
				}
				return map;
			}
		
			// 좋아요 기능 -END-
		
		}
