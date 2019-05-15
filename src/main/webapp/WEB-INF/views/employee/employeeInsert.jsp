<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.modal-header {
	background-color: #626867;
}

#emplinsert .row {
	border-bottom-style: inset;
	margin-bottom: 15px;
}
</style>




<!-- 신규 사원 등록 -->
<div class="modal fade" id="myLargeModalInsert">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"
				style="margin: auto; font-weight: bold; color: white;">신규 사원 등록</h4>
		</div>
		<form action="${cp}/employee/insertEmployee" method="post"
			enctype="multipart/form-data">
			<div class="modal-content" style="color: black; font-weight: bold;">
				
				
				<div class="modal-body">
				<div id="emplinsert" class="container-fluid">


					<!-- <div class="row">
						<div class="col-md-4" style="float: left; width: 40%;">
							사원번호<i style="color: red;" class="fa fa-exclamation"></i><input
								type="text" class="form-control" id="userId" name="userId"
								placeholder="사원번호를 입력하세요">
						</div>
						<div class="col-md-2" style="float: left; width: 20%;">

							<br>
							<button style="background-color: #6E6867 !important;"
								type="button" class="btn btn-primary btn" id="emplCheck"
								name="emplCheck">중복체크</button>
						</div>



						<div class="col-md-4" style="float: left; width: 40%;">
							필수입력항목(<i style="color: red;" class="fa fa-exclamation"></i>)<br>
							<span id="duplicate"></span>
						</div>
					</div> -->
					<div class="row">
						<div class="col-md-10">
							사원명 <i style="color: red;" class="fa fa-exclamation"></i> <input
								type="text" class="form-control" name="userNm"
								placeholder="사원명을 입력해주세요">
						</div>
					</div>



					<div class="row">
						<div class="col-md-3" style="float: left; width: 33%;">
							<label for="inputPassword">부서명<i style="color: red;"
								class="fa fa-exclamation"></i></label> <select id="deptCode_html"
								class="form-control" name="deptCode" class="form-control">
								<!-- <option value="100">인사</option>
									<option value="200">회계</option>
									<option value="300">물류</option> -->
							</select>
						</div>




						<div class="col-md-3" style="float: left; width: 33%;">
							<label for="inputPassword">직책명<i style="color: red;"
								class="fa fa-exclamation"></i></label> <select id="position_html"
								class="form-control" name="positionCode" class="form-control">
								<!-- <option value="60">사장</option>
									<option value="50">부사장</option>
									<option value="40">본부장</option>
									<option value="30">팀장</option>
									<option value="10">파트장</option>
									<option value="10">팀원</option> -->
							</select>
						</div>

						<div class="col-md-3" style="float: left; width: 33%;">
							<label for="inputPassword">직급명<i style="color: red;"
								class="fa fa-exclamation"></i></label> <select id="rank_html"
								class="form-control" name="rankCode" class="form-control">
								<!-- <option value="8">전무</option>
									<option value="7">상무</option>
									<option value="6">이사</option>
									<option value="5">부장</option>
									<option value="4">차장</option>
									<option value="3">과장</option>
									<option value="2">대리</option>
									<option value="1">사원</option> -->
							</select>
						</div>
					</div>


					<div class="row">
						<div class="col-md-10">

							<label for="inputMobile">비고</label> <input type="text"
								class="form-control" id="inputMobile" name="relate"
								placeholder="특이사항란">

						</div>
					</div>

					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">생년월일<i style="color: red;"
								class="fa fa-exclamation"></i></label> <input type="text"
								class="form-control" id="inputtelNO" name="BirthDate"
								placeholder="생년월일을 입력하세요 ex)19951010">

						</div>
					</div>



					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">최종학교</label> <input type="text"
								class="form-control" id="inputtelNO" name="finalSchool"
								placeholder="최종학교를 입력하세요">


						</div>
					</div>

					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">연락처</label> <input type="text"
								class="form-control" id="inputtelNO" name="phoneNumber"
								placeholder="연락처를 입력하세요 ex)01012341234">
						</div>
					</div>


					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">이메일</label> <input type="email"
								class="form-control" id="inputtelNO" name="email"
								placeholder="이메일입력">
						</div>
					</div>



					<div class="row">
						<div class="col-md-7" style="float: left; width: 70%;">

							<label for="inputtelNO">주소</label> <input type="text"
								class="form-control" id="address" name="address"
								placeholder="주소입력">
						</div>
						<div class="col-md-3"
							style="float: left; width: 30%; margin-top: 7px">
							<br>
							<button style="background-color: #6E6867 !important;"
								type="button" class="btn btn-primary btn" id="zipcodeBtn">주소찾기
							</button>
						</div>
					</div>





					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">상세 주소</label> <input type="text"
								class="form-control" id="addressDetail" name="addressDetail"
								placeholder="상세 주소 입력">
						</div>
					</div>


					<div class="row">
						<div class="col-md-10">
							<label for="inputtelNO">결혼여부</label> <select id="marryStatus"
								class="form-control" name="marryStatus" class="form-control">
								 <option value="0">미혼</option>
									<option value="1">결혼</option>
							</select>
						</div>
					</div>


					<div class="row">
						<div class="col-md-10">
							<label for="inputtelNO">사진첨부</label> <input type="file"
								class="form-control" name="fileName" />
						</div>
					</div>
					</div>
				<div class="modal-footer">
				<button type="submit" class="btn btn-default">등록</button>
					
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
				
				</div>
			</div>
		</form>
	</div>
</div>


