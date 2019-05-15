package kr.or.ddit.login;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.model.Board_TypeVo;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.employee.model.EmployeeVo;

@WebFilter("/*")
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpServletResponse hsresp = (HttpServletResponse) response;
		
		HttpSession session = hsr.getSession();
		EmployeeVo employeeVo =(EmployeeVo) session.getAttribute("employeeVo");
		
		// 2-1. ���� �α��� �����̸� --> chain.doFilter ȣ��
		if(employeeVo!=null)
			chain.doFilter(request, response);
		
		// 2-2. �α��� ���°� �ƴ϶�� --> �α��� ȭ������ �̵� (/login get)
		
		// *** ��� �������� ���� ���� �ؾ��ϳ�??
		// ������ �ʿ��� ��������, �ʿ� ���� ������ ���� �ʿ�
		// ���� ������ �ʿ���� ��û (��ټ��� ������ �ʿ���
		// ** login ������ ȭ���û(/login get) session ������ �ʿ� ����
		// ** login ��û ó��(/login post) session ������ �ʿ� ����
		// ** /js/*, /css/* ���� ���� ��� ����
		// ex) localhost/login
		else{
			String uri = hsr.getRequestURI();	// /login
			if(uri.equals("/login")|| uri.startsWith("/js")
					||uri.endsWith(".css")
					||uri.endsWith(".jpg")
					||uri.endsWith(".jpeg")
					||uri.endsWith(".gif")
					||uri.endsWith(".png")
					){
				chain.doFilter(request, response);
			}else{
				hsresp.sendRedirect("/login");
			}
		}
		
	}

	@Override
	public void destroy() {
		
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
