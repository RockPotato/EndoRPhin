package kr.or.ddit.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.employee.model.PositionVo;
import kr.or.ddit.employee.service.IPositionService;

public class PositionInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(PositionInterceptor.class);
	
	@Resource(name = "positionService")
	private IPositionService positionService;
	
	/**
	* Method : preHandle
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param request
	* @param response
	* @param handler
	* @return
	* @throws Exception
	* Method 설명 : controller method 실행전
	*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 List<PositionVo> allPosition = positionService.getAllPosition();
		
		request.setAttribute("allPosition", allPosition);
		return true;
	}

	
	
	

}
