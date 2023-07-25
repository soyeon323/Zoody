package com.kh.zoody.websocket.server;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketServer extends TextWebSocketHandler{
	
	//연결 되고 난 이후에 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("afterConnectionEstablished 호출됨");
	}

	//연결이 끊기고 등작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("afterConnectionClosed 호출됨");
	}
	
	//메세지 받았을 때 동작
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("handleTextMessage 호출됨");
		log.info("전달받은 메세지 : {}", message.getPayload());
	}

}
