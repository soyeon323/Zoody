package com.kh.zoody.websocket.server;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.zoody.project.controller.ProjectController;
import com.kh.zoody.project.service.ProjectService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketServer extends TextWebSocketHandler{
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	private final ProjectService ps;
	
	@Autowired
	public WebsocketServer(ProjectService ps) {
		this.ps = ps;
	};
	
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
		Gson gson = new Gson();
		HashMap<String, String> msgVo = gson.fromJson(message.getPayload(), HashMap.class);
		String nick = msgVo.get("nick");
		String msg = msgVo.get("msg");
		String time = msgVo.get("time");
		String profile = msgVo.get("profile");
		String userNo = msgVo.get("userNo");
		String projectNo = msgVo.get("projectNo");
		
		List<String> noList = ps.selectUserNo(projectNo);
		
		String jsonMsg = gson.toJson(msgVo);
		
		HashMap<String, List<String>> map = new HashMap<>();
		map.put(projectNo, noList);
		
		log.info("map : {}", map);

        for (WebSocketSession s : sessionSet) {
            s.sendMessage(new TextMessage(jsonMsg));
        }
		
	}

}
