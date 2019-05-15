<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- 사원 조회/수정 -->

<div class="modal fade" id="myLargeModalEdit">
	<div class="modal-dialog modal-lg" role="document">

		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"
				style="margin: auto; font-weight: bold; color: white;">사원 조회/수정</h4>
		</div>
		<form action="${cp}/employee/updateEmployee_POST" method="post"
			enctype="multipart/form-data">
			<div class="modal-content" style="color: black; font-weight: bold;">
				<div id="emplinsert" class="container-fluid">
					<div class="row">
						<div class="col-md-4">
							<img style="height: 150px; width: 250px; border-style: solid;"
								class="img-fluid" id="userimage"> <label
								class="btn btn-primary btn-file"
								style="background-color: #626867; margin-left: 65px">
								사진변경 <input style="display: none;" type="file" id="fileEdit"
								name="fileName">
							</label>
						</div>
						<div class="col-md-4">
							사원번호<input type="text" class="form-control" id="userIde"
								name="userId" placeholder="사원번호를 입력하세요" readonly> 사원명 <input
								type="text" class="form-control" id="userNme" name="userNm"
								placeholder="사원명을 입력해주세요">
						</div>
					</div>


					<input type="hidden" id="imagecodeE" name="imagecode">

					<div class="row">
						<div class="col-md-3" style="float: left; width: 33%;">
							<label for="inputPassword">부서명<i style="color: red;"
								class="fa fa-exclamation"></i></label> <select id="deptCode_htmlEdit"
								class="form-control" name="deptCode" class="form-control">
							</select>
						</div>




						<div class="col-md-3" style="float: left; width: 33%;">
							<label for="inputPassword">직책명<i style="color: red;"
								class="fa fa-exclamation"></i></label> <select id="position_htmlEdit"
								class="form-control" name="positionCode" class="form-control">
							</select>
						</div>

						<div class="col-md-3" style="float: left; width: 33%;">
							<label for="inputPassword">직급명<i style="color: red;"
								class="fa fa-exclamation"></i></label> <select id="rank_htmlEdit"
								class="form-control" name="rankCode" class="form-control">
							</select>
						</div>
					</div>


					<div class="row">
						<div class="col-md-10">

							<label for="inputMobile">비고</label> <input type="text"
								class="form-control" id="relateE" name="relate"
								placeholder="특이사항란">

						</div>
					</div>

					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">생년월일<i style="color: red;"
								class="fa fa-exclamation"></i></label> <input type="text"
								class="form-control" id="BirthDateE" name="BirthDate"
								placeholder="생년월일을 입력하세요 ex)19951010">

						</div>
					</div>



					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">최종학교</label> <input type="text"
								class="form-control" id="finalSchoolE" name="finalschool"
								placeholder="최종학교를 입력하세요">


						</div>
					</div>

					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">연락처</label> <input type="text"
								class="form-control" id="phoneNumberE" name="phonenumber"
								placeholder="연락처를 입력하세요 ex)01012341234">
						</div>
					</div>


					<div class="row">
						<div class="col-md-10">

							<label for="inputtelNO">이메일</label> <input type="email"
								class="form-control" id="emailE" name="email"
								placeholder="이메일입력">
						</div>
					</div>



					<div class="row">
						<div class="col-md-7" style="float: left; width: 70%;">

							<label for="inputtelNO">주소</label> <input type="text"
								class="form-control" id="addressE" name="address"
								placeholder="주소입력">
						</div>
						<div class="col-md-3"
							style="float: left; width: 30%; margin-top: 7px">
							<br>
							<button style="background-color: #6E6867 !important;"
								type="button" class="btn btn-primary btn" id="zipcodeBtnE">주소찾기
							</button>
						</div>
					</div>



					<div class="row">
						<div class="col-md-10">
							<label for="inputtelNO">상세 주소</label> <input type="text"
								class="form-control" id="addressDetailE" name="addressDetail"
								placeholder="상세 주소 입력">
						</div>
					</div>





					<div class="row">
						<div class="col-md-10">
							<label for="inputtelNO">결혼여부</label> <select id="marryStatusE"
								class="form-control" name="marryStatus" class="form-control">
								<option value="0">미혼</option>
								<option value="1">결혼</option>
							</select>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>

					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#userimage').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$("#fileEdit").change(function() {
	readURL(this);
});


 $("#zipcodeBtnE").on("click", function() {

     new daum.Postcode({
        oncomplete : function(data) {
           $("#addressE").val(data.roadAddress);
        
        }
     }).open();

  }); 
</script>

