package com.kh.zoody.websocket.server;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.zoody.user.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketServer extends TextWebSocketHandler{
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	//연결 되고 난 이후에 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionSet.add(session);
	}

	//연결이 끊기고 등작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionSet.remove(session);
	}
	
	//메세지 받았을 때 동작
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		UserVo loginMember = (UserVo) session.getAttributes().get("loginMember");
		String nick = loginMember.getName();
		
		log.info("내용 : {}", message.getPayload());
		log.info("닉네임 : {}", nick);
		
		Gson gson = new Gson();
		HashMap<String, String> msgVo = new HashMap<String, String>();
		msgVo.put("nick", nick);
		msgVo.put("msg", message.getPayload());
		msgVo.put("time", System.currentTimeMillis()+"");
		
		String jsonMsg = gson.toJson(msgVo);
		
		for(WebSocketSession s : sessionSet) {
			s.sendMessage(new TextMessage(jsonMsg));
		}
	}

}
