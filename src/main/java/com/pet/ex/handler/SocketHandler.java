package com.pet.ex.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SocketHandler extends TextWebSocketHandler {

	private ChatBot chatBot = new ChatBot();

	private List<HashMap<String, Object>> roomList = new ArrayList<>();

	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		String username = (String) obj.get("username");
		String type = (String) obj.get("type");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		if(type.equals("alert")) {
			alertToAdmin(session, message);
		} else {
			if(roomList.size() > 0) {
				for(int i = 0; i < roomList.size(); i++) {
					String room = (String) roomList.get(i).get("username");
					if(room.equals(username)) {
						temp = roomList.get(i);
						break;
					}
				}
				for(String key : temp.keySet()) {
					if(key.equals("username")) {
						continue;
					}
					WebSocketSession wss = (WebSocketSession) temp.get(key);
					if(wss != null) {
						try {
							wss.sendMessage(new TextMessage(obj.toJSONString()));
							if(chatBot.isBasicQuestion((String) obj.get("msg"))) {
								obj = jsonToObjectParser(chatBot.basicAnswer((String) obj.get("msg")));
								wss.sendMessage(new TextMessage(obj.toJSONString()));
							}
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	//소켓 연결
	@SuppressWarnings("unchecked") //이클립스 컴파일러가 알려주는 노란색 경고 표시를 없애주는 역할
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		super.afterConnectionEstablished(session);
		// flag: 상태를 기록하고 처리 흐름을 제어하기 위한 boolean 변수
		boolean flag = false;
		String url = session.getUri().toString();
		String username = url.split("/chatting/")[1]; // chatting 단어를 기준으로 url을 자르고 1번째 단어를 대입 /chatting/{username}
		int idx = roomList.size();
		
		//방 체크 
		if(roomList.size() > 0) {
			for(int i = 0; i < roomList.size(); i++) {
				String room = (String) roomList.get(i).get("username");
				if(room.equals(username)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { // 방이 존재할 경우 (flag 가 true)
			HashMap<String, Object> map = roomList.get(idx);
			map.put(session.getId(), session);
		} else { // 방이 없을 경우, 해당하는 user의 방 add
			HashMap<String, Object> map = new HashMap<>();
			map.put("username", username);
			map.put(session.getId(), session);
			roomList.add(map);
		}
		
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
		
	}
	
	//소켓 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 소켓 종료
		if(roomList.size() > 0) {
			for(int i = 0; i < roomList.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("type", "alert");
				obj.put("sessionId", session.getId());
				obj.put("msg", "exit");
				obj.put("username", roomList.get(i).get("username"));
				alertToAdmin(session, new TextMessage(obj.toJSONString()));
				
				roomList.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}

	private void alertToAdmin(WebSocketSession session, TextMessage message) {
		
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		for(int i = 0; i < roomList.size(); i++) {
			String room = (String) roomList.get(i).get("username");
			if(room.equals("admin")) {
				temp = roomList.get(i);
				break;
			}
		}
			for(String key : temp.keySet()) {
				if(key.equals("username")) {						
					continue;
				}
			WebSocketSession wss = (WebSocketSession) temp.get(key);
			if(wss != null) {
				try {
					wss.sendMessage(new TextMessage(obj.toJSONString()));
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
}