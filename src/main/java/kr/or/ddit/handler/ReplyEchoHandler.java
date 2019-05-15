package kr.or.ddit.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.employee.model.EmployeeVo;

public class ReplyEchoHandler extends TextWebSocketHandler{
	private Logger logger = LoggerFactory.getLogger(ReplyEchoHandler.class);

	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	// 클라이언트와 연결 이후에 실행되는 메서드
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			sessionList.add(session);
			Map<String, Object> attributes = session.getAttributes();
			logger.debug("확인:{}",(EmployeeVo)attributes.get("employeeVo"));
			logger.info("{} 연결됨", session.getId());
			
			
		}

		// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			logger.info("{}로 부터 메세지 {} 도착", info(session),message.getPayload());
			String[] split = message.getPayload().split("erpCheck=");
			if(split[1].equals("msg")){
				for (WebSocketSession sess : sessionList) {
					sess.sendMessage(new TextMessage(message.getPayload()));
				}
			}else{
				for (WebSocketSession sess : sessionList) {
					Map<String, Object> attributes = sess.getAttributes();
					EmployeeVo vo = (EmployeeVo)attributes.get("employeeVo");
					if(vo.getUserId().equals(split[0])){
						sess.sendMessage(new TextMessage(info(session)+ " 님으로부터 쪽지"));
					}
				}
			}
		}

		private String info(WebSocketSession session) {
			
			Map<String, Object> attributes = session.getAttributes();
			EmployeeVo vo = (EmployeeVo) attributes.get("employeeVo");
			
			if(vo!=null){
				return vo.getUserNm();
			}
			else{
				return "";
			}
		}

		// 클라이언트와 연결을 끊었을 때 실행되는 메소드
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			sessionList.remove(session);
			logger.info("{} 연결 끊김", session.getId());
		}
	

}
