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

<form id="formSave" action="${cp}/employee/emplEditViewSave"
	method="post" enctype="multipart/form-data">

	<div id="emplinsert" class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<h2>
					<strong><i class="fas fa-pen-alt"></i>회원 정보 수정</strong>
				</h2>
				<img style="height: 150px; width: 250px; border-style: solid;"
					class="img-fluid" id="userimage"> <label
					class="btn btn-primary btn-file"
					style="background-color: #626867; margin-left: 65px"> 사진변경
					<input style="display: none;" type="file" id="fileEdit"
					name="fileName">
				</label>
			</div>
			<div class="col-md-4">
				사원번호<input type="text" class="form-control" id="userIde"
					name="userId" placeholder="사원번호를 입력하세요" readonly> 사원명 <input
					type="text" class="form-control" id="userNme" name="userNm"
					placeholder="사원명을 입력해주세요"> 비밀번호<input type="password"
					class="form-control" id="password" name="password">
			</div>
		</div>

		<input type="hidden" id="imagecodeE" name="imagecode">

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<label for="inputMobile">비고</label> <input type="text"
					class="form-control" id="relateE" name="relate" placeholder="특이사항란">

			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">

				<label for="inputtelNO">생년월일<i style="color: red;"
					class="fa fa-exclamation"></i></label> <input type="text"
					class="form-control" id="BirthDateE" name="BirthDate"
					placeholder="생년월일을 입력하세요 ex)19951010">

			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<label for="inputtelNO">최종학교</label> <input type="text"
					class="form-control" id="finalSchoolE" name="finalschool"
					placeholder="최종학교를 입력하세요">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">

				<label for="inputtelNO">연락처</label> <input type="text"
					class="form-control" id="phoneNumberE" name="phonenumber"
					placeholder="연락처를 입력하세요 ex)01012341234">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">

				<label for="inputtelNO">이메일</label> <input type="email"
					class="form-control" id="emailE" name="email" placeholder="이메일입력">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-7" style="float: left; width: 70%;">

				<label for="inputtelNO">주소</label> <input type="text"
					class="form-control" id="addressE" name="address"
					placeholder="주소입력">
			</div>
			<div class="col-md-3"
				style="float: left; width: 30%; margin-top: 7px">
				<br>
				<button style="background-color: #6E6867 !important;" type="button"
					class="btn btn-primary btn" id="zipcodeBtnE">주소찾기</button>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<label for="inputtelNO">상세 주소</label> <input type="text"
					class="form-control" id="addressDetailE" name="addressDetail"
					placeholder="상세 주소 입력">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<label for="inputtelNO">결혼여부</label> <select id="marryStatusE"
					class="form-control" name="marryStatus" class="form-control">
					<option value="0">미혼</option>
					<option value="1">결혼</option>
				</select>
				<div align="right">
					<button type="button" onclick="fn_formSubmit()"
						class="bttn-unite bttn-warning bttn-sm">등록</button>
					<button type="button" onclick="history.back(-1)"
						class="bttn-unite bttn-warning bttn-sm">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
</form>


<script>
/*사원정보 수정하기*/

$(document).ready(function() {

    var deptCode_htmlEdit = "";
    var position_htmlEdit = "";
    var rank_htmlEdit = "";

    var userid = '${employeeVo.userId}';

    $.ajax({
        url: "${pageContext.request.contextPath }/employee/updateEmployee",
        method: "get",
        data: {
            userId: userid
        },
        success: function(userIdCode) {
            $("#userIde").val(userIdCode.userId);
            $("#userNme").val(userIdCode.userNm);
            $("#deptCode_htmlEdit").val(userIdCode.deptCode);
            $("#position_htmlEdit").val(userIdCode.positionCode);
            $("#rank_htmlEdit").val(userIdCode.rankCode);
            $("#password").val(userIdCode.password);

            $("#relateE").val(userIdCode.relate);
            $("#BirthDateE").val(userIdCode.birthDate);
            $("#finalSchoolE").val(userIdCode.finalschool);
            $("#phoneNumberE").val(userIdCode.phonenumber);
            $("#emailE").val(userIdCode.email);

            var addrtemp = Array();
            addrtemp = userIdCode.address.split(',');

            $("#addressE").val(addrtemp[0]);
            $("#addressDetailE").val(addrtemp[1]);
            $("#marryStatusE").val(userIdCode.marryStatus);
            $("#imagecodeE").val(userIdCode.imagecode);

            $("#userimage").attr('src', '${cp}/employee/profileImg?userId=' + userIdCode.userId);

        }
    });
    $.ajax({
        url: "${pageContext.request.contextPath }/employee/getSelectBox",
        method: "get",
        //data      : "userId="+$(this).data().userid,
        success: function(data) {
            editUserList(data);


        }
    });

    function editUserList(data) {

        var deptCode_html = "";
        var position_html = "";
        var rank_html = "";

        for (var i = 0; i < data.allDept.length; i++) {
            var dept = data.allDept[i];

            deptCode_html += "<option value='" + dept.deptCode + "'> " + dept.deptName + "</option>";

        }

        $("#deptCode_htmlEdit").html(deptCode_html);



        for (var i = 0; i < data.allPosition.length; i++) {

            if (data.allPosition[i].positionStatus == "직책") {
                var position = data.allPosition[i];
                position_html += "<option value='" + position.positionCode + "'> " + position.positionName + "</option>";

            } else if (data.allPosition[i].positionStatus == "직급") {

                var rank = data.allPosition[i];
                rank_html += "<option value='" + rank.positionCode + "'> " + rank.positionName + "</option>";
            }

        }

        $("#position_htmlEdit").html(position_html);
        $("#rank_htmlEdit").html(rank_html);


    }
});

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
        oncomplete: function(data) {
            $("#addressE").val(data.roadAddress);

        }
    }).open();

});
function fn_formSubmit(){
	if(confirm("저장하시겠습니까?")) {
			$("#formSave").submit();
		}
}
</script>
