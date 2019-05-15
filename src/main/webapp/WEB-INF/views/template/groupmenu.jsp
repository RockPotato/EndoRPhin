<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="container" class="container-fluid"
	style="background-color: #4981F2 !important; max-height: 50px;">
	<div id="group_menu_container" class="row row-sys">

		<div class="col-md-2" style="background-color: #3266CC;">
			<button onchange="Lmenu()" type="button" id="sidebarCollapse"
				class="btn btn-link">
				<h4>
					<i class="fas fa-list">&nbsp;Menu</i>
				</h4>
			</button>
		</div>
		<ul id="main-menu">
			<li class="parent"><a href="#"><i class="fas fa-clipboard-list"></i> 전자결제</a>
				<ul class="sub-menu">
					<li><a href="#"><i class="icon-wrench"></i> 기안함</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/document">기안 상신함</a></li>
							<li><a href="${pageContext.request.contextPath }/temporarily">임시 보관함</a></li>
							<li><a href="${pageContext.request.contextPath }/complete">기안 완료함</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-wrench"></i> 결재함</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/undecided">미결함</a></li>
							<li><a href="${pageContext.request.contextPath }/returnDocument">반려함</a></li>
							</ul></li>
					<li><a href="${pageContext.request.contextPath }/receiveDocument">수신함</a></li>
				</ul></li>
			<li class="parent"><a href="#"><i class="fas fa-comment-dots"></i> 게시판</a>
				<ul class="sub-menu">
					<li><a href="${pageContext.request.contextPath }/boardList?boardTypeCode=7">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath }/boardList?boardTypeCode=5">자유 게시판</a></li>
					<li><a href="${pageContext.request.contextPath }/boardList?boardTypeCode=8">Q&A 게시판</a></li>
				</ul></li>
			<li><a href="/schedule/view"><i class="fas fa-calendar"></i> 일정 관리</a></li>
			<li><a href="${cp }/employee/emplEditView"><span id="emplEditForm"><i class="fas fa-cog"></i> 정보수정</span></a></li>
		</ul>
	</div>
</div>