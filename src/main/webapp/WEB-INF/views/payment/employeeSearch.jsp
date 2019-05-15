<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="myModal3" tabindex="-1" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div style="margin-left: 75px;">
					<input type="text" id="modalSearchUserName" placeholder="사원명 입력"/>
					<button id="modalSearchUserBtn" 
						style="background-color: #6E6867;" class="btn btn-info">검색</button>
				</div>
			</div>
			<div class="modal-body">
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table style="border-spacing: 6px; border-collapse: separate;" class="table table-hover">
						<thead>
							<tr>
								<th>사원번호</th>
								<th>사원명</th>
							</tr>
						</thead>
						<tbody id="modalUserTbody">
							<c:forEach items="${employeeList }" var="vo">
								<tr class="modalUserIdTr">
									<td>${vo.userId}</td>
									<td>${vo.userNm}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
<!-- 				<a href="#" class="btn">신규 등록</a>  -->
				<a href="" data-dismiss="modal" class="btn" aria-hidden="true">Close</a>
			</div>
		</div>
	</div>
</div>