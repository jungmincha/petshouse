package com.pet.ex.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.security.handlers.MyAuthentication;
 

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class WebSocketController {
	
	private Set<String> roomList = new HashSet<String>();
	
	@GetMapping("/chat")
	public ModelAndView chatUser(ModelAndView mov) {
		
		mov.setViewName("/chat/chat_user");
		
		return mov;
	}
	
	@GetMapping("/chat/{nickname}")
	public ModelAndView chat(ModelAndView mov, @PathVariable("nickname") String nickname) {
		log.info("==========chat start! : " + nickname + "님 채팅방 입장 ==============");
		
		mov.addObject("username", nickname);
		mov.setViewName("/chat/chat_admin");
		
		return mov;
	}
	
	@GetMapping("/room")
	public ModelAndView room (ModelAndView mov) {
		log.info("==========현재 채팅방의 수 : " + String.valueOf(roomList.size())+ "==============");
		
		mov.addObject("roomList", roomList);
		mov.setViewName("/chat/room");
		
		return mov;
	}
	
	@GetMapping("/room/list")
	public Set<String> getRoomList () {

		return roomList;
	}
	
	@PostMapping("/room")
	public Set<String> creatRomm(@AuthenticationPrincipal MyAuthentication myAuthentication) {
		String username = myAuthentication.getUsername();
		roomList.add(username);
		
		return roomList;
	}
}