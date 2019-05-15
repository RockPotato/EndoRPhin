<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">

<input type="hidden" id="failCheck" name="failCheck"
	value="${failCheck }" />


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-9">
		<h2>
			<i class="fa fa-calculator"></i> 거래처 관리
		</h2>
		<table>
			<tr>
				<td><strong>거래처코드 :</strong> </td>
				<td><input name="client_code" id="client_code" class="search-query form-control" type="text" /></td>
				<td><strong>거래처명 :</strong></td>
				<td> <input name="client_name" id="client_name" class="search-query form-control" type="text" /></td>
				<td> <input
					type="button" class="bttn-fill bttn-md bttn-warning" id="seachBtn"
					value="검색" onclick="seachClientBtn()" /> 
					<input type="button"
					class="bttn-fill bttn-md bttn-warning" value="전체조회"
					onclick="location.href='${pageContext.request.contextPath }/clientview'" /></td>
			</tr>
		</table>
	</div>
</div>
<div class="row">

	<div class="col-md-1"></div>
	<div class="col-md-9">
		<table class="table table-hover">
			<thead class="thead">
				<tr>
					<th>거래처코드</th>
					<th>거래처명</th>
					<th>대표자명</th>
					<th>사업자유형</th>
					<th>전화번호</th>
					<th>팩스번호</th>
					<th>상태</th>
				</tr>
			</thead>
			<c:forEach items="${clientList }" var="client">
				<tbody>
					<tr class="clientTr" data-client_code="${client.clientCode }"
						data-client_name="${client.clientName }"
						data-client_salesnumber="${client.salesNumber }"
						data-client_manager="${client.manager }"
						data-client_telephone="${client.telephone }"
						data-client_faxnumber="${client.faxNumber }"
						data-client_manageremail="${client.managerEmail }"
						data-client_business="${client.business }"
						data-client_place="${client.place }"
						data-client_relate="${client.relate }"
						data-client_businesstype="${client.businessType }"
						data-client_bankname="${client.bankName }"
						data-client_accountnumber="${client.accountNumber }"
						data-client_usestatus="${client.useStatus }">

						<td><a class="bttn-stretch bttn-md bttn-warning"
							href="${pageContext.request.contextPath }/viewDetailClient?clientCode=${client.clientCode }">${client.clientCode }</a></td>
						<td>${client.clientName }</td>
						<td>${client.manager }</td>
						<td>${client.businessType }</td>
						<td>${client.telephone }</td>
						<td>${client.faxNumber }</td>
						<c:choose>
							<c:when test="${client.useStatus == 1 }">
								<td><font color="blue">거래가능</font></td>
							</c:when>

							<c:otherwise>
								<td><font color="red">거래불가</font></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<br /> <input type="hidden" id="ccCode" /> <input type="hidden"
			id="ccName" /> <input type="hidden" id="cSalesNumber" /> <input
			type="hidden" id="cManager" /> <input type="hidden" id="cTelephone" />
		<input type="hidden" id="cFaxNumber" /> <input type="hidden"
			id="cManagerEmail" /> <input type="hidden" id="cBusiness" /> <input
			type="hidden" id="cPlace" /> <input type="hidden" id="cRelate" /> <input
			type="hidden" id="cBusinessType" /> <input type="hidden"
			id="cBankname" /> <input type="hidden" id="cAccountNumber" /> <input
			type="hidden" id="cUseStatus" />
	<button type="button" id="insertB" class="bttn-simple bttn-warning"
		data-toggle="modal" data-target="#my80sizeCenterModal">등록</button>
	</div>
</div>





<!-- =============================================== -->



<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="my80sizeCenterModal"
	tabindex="3" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">거래처 등록</h4>
				<span id="head"></span>
			</div>

			<!-- 여기부터 로직작성 -->
			<div class="modal-body">
				<div class="form-group">
					<!-- 여기부터 로직작성 -->
					<label for="inputName">거래처코드</label> <input type="text" id="clCode"
						placeholder="코드를 입력하세요"> <input type="button" class="btn btn-default"
						id="duplCheck" name="duplCheck" value="중복체크" /> <br /> <span
						id="duplicate"></span>
				</div>

				<div class="form-group">
					<label for="InputEmail">상 &nbsp;&nbsp;호 &nbsp;&nbsp;명</label> <input
						type="text" id="clName" placeholder="거래처명을 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">사업자번호</label> <input type="text"
						id="clSalesNumber" placeholder="-을 빼고 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">대 &nbsp;&nbsp;표 &nbsp;&nbsp;자</label> <input
						type="text" id="clManager" placeholder="대표자를 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">전 화 번 호&nbsp;</label> <input type="text"
						id="clTelephone" placeholder="-을 빼고 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">이 &nbsp;&nbsp;메 &nbsp;&nbsp;일</label> <input
						type="text" id="clManagerEmail" placeholder="이메일을 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">팩 스 번 호&nbsp;</label> <input type="text"
						id="clFaxNumber" placeholder="-을 빼고 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">사업자유형</label> <input type="radio"
						name="clBusinessType" value="과세" checked="checked" /> 과세 <input
						type="radio" name="clBusinessType" value="면세" /> 면세 <input
						type="button" value="면세업종" data-toggle="modal" class="btn btn-default"
						data-target="#my90sizeCenterModal" />
				</div>

				<div class="form-group">
					<label for="InputEmail">소 &nbsp;&nbsp;재 &nbsp;&nbsp;지</label> <input
						style="width: 100px;" type="text" name="zipcode" id="zipcode"
						placeholder="우편번호" /> <input type="button" id="zipcodeBtn" class="btn btn-default"
						value="우편번호 검색" />
				</div>

				<div class="form-group">
					<label for="InputEmail">주
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label> <input
						type="text" style="width: 388px;" name="clPlace1" id="clPlace1"
						placeholder="도로명주소" />
				</div>
				<div class="form-group">
					<label for="InputEmail">상 세 주 소</label> <input
						style="width: 388px;" type="text" name="clPlace2" id="clPlace2"
						placeholder="상세주소">
				</div>

				<div class="form-group">
					<label for="InputEmail">업 종/업 태</label> <input
						style="width: 388px;" type="text" name="clBusiness"
						id="clBusiness" placeholder="업종/업태">
				</div>

				<div class="form-group">
					<label for="InputEmail">은 &nbsp;&nbsp;행 &nbsp;&nbsp;명</label> <input
						type="text" id="clBankname" placeholder="은행명을 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">계 좌 번 호</label> <input type="text"
						id="clAccountNumber" placeholder="-을 빼고 입력하세요">
				</div>

				<div class="form-group">
					<label for="InputEmail">메
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 모&nbsp;</label> <input
						style="width: 388px" type="text" id="clRelate" placeholder="메모">
				</div>

			</div>
			<!-- 여기까지 -->
			<div class="modal-footer">
				<button type="button" id="insertBtn" class="btn btn-default"
					data-dismiss="modal">등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>




<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="my90sizeCenterModal"
	tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<button type="button" class="close " data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">면세업종</h4>
			</div>

			<!-- 여기부터 로직작성 -->
			<div class="modal-body">
				<table border="1">
					<thead>
						<tr>
							<th>구분</th>
							<th>면세 종류</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>기초생활 필수품 재화</td>
							<td>미가공식료품, 연탄과 무연탄, 주택임대용역
							<td>
						</tr>

						<tr>
							<td rowspan="4">국민후생용역</td>
							<td>의료보건용역(병의원)과 혈액
							<td>
						</tr>
						<tr>
							<td>교육 용역(정부의 허가받은 학원)
							<td>
						</tr>
						<tr>
							<td>여객운송용역(고석버스,항공기,고속전철 등 제외)
							<td>
						</tr>
						<tr>
							<td>국민주택 공급과 당해 주택의 건설용역
							<td>
						</tr>

						<tr>
							<td>문화 관련 재화/용역</td>
							<td>도서, 신문, 잡지, 방송(광고 제외)
							<td>
						</tr>

						<tr>
							<td>부가가치 구성 요소</td>
							<td>토지 공급, 인적용역, 금융 및 보험용역
							<td>
						</tr>

						<tr>
							<td>기타</td>
							<td>공중전화, 복권 등
							<td>
						</tr>

					</tbody>
				</table>
			</div>
			<!-- 여기까지 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- ==================================== -->

<form id="insertFrm"
	action="${pageContext.request.contextPath }/insertClient" method="get">
	<input type="hidden" id="frmClCode" name="frmClCode" /> <input
		type="hidden" id="frmClName" name="frmClName" /> <input type="hidden"
		id="frmClSalesNumber" name="frmClSalesNumber" /> <input type="hidden"
		id="frmClManager" name="frmClManager" /> <input type="hidden"
		id="frmClTelephone" name="frmClTelephone" /> <input type="hidden"
		id="frmClFaxNumber" name="frmClFaxNumber" /> <input type="hidden"
		id="frmClManagerEmail" name="frmClManagerEmail" /> <input
		type="hidden" id="frmClBusinessType" name="frmClBusinessType" /> <input
		type="hidden" id="frmClPlace" name="frmClPlace" /> <input
		type="hidden" id="frmClBusiness" name="frmClBusiness" /> <input
		type="hidden" id="frmClBankname" name="frmClBankname" /> <input
		type="hidden" id="frmClAccountNumber" name="frmClAccountNumber" /> <input
		type="hidden" id="frmClRelate" name="frmClRelate" /> <input
		type="hidden" id="" name="" />
</form>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	var insertFlag = "0";

	$("#zipcodeBtn").on("click", function() {
		new daum.Postcode({
			oncomplete : function(data) {

				// 새 우편번호 : data.zonecode
				$("#zipcode").val(data.zonecode);

				// 기본주소(도로주소) : data.roadAddress
				$("#clPlace1").val(data.roadAddress);

				//상세주소 input focus
				$("#clPlaca2").focus();
			}
		}).open();
	});

	$("#insertBtn").on(
			"click",
			function() {

				if (insertFlag == 1) {

					var clientCode = $("#clCode").val();
					var clientName = $("#clName").val();
					var salesNumber = $("#clSalesNumber").val();
					var manager = $("#clManager").val();
					var telephone = $("#clTelephone").val();
					var faxNumber = $("#clFaxNumber").val();
					var managerEmail = $("#clManagerEmail").val();
					var businessType = $(
							":input:radio[name=clBusinessType]:checked").val();
					var zipcode = $("#zipcode").val() + "_";
					var place1 = $("#clPlace1").val() + "_";
					var place2 = $("#clPlace2").val();
					var place = zipcode + place1 + place2;
					var business = $("#clBusiness").val();
					var bankName = $("#clBankname").val();
					var accountNumber = $("#clAccountNumber").val();
					var relate = $("#clRelate").val();

					$("#frmClCode").val(clientCode);
					$("#frmClName").val(clientName);
					$("#frmClSalesNumber").val(salesNumber);
					$("#frmClManager").val(manager);
					$("#frmClTelephone").val(telephone);
					$("#frmClFaxNumber").val(faxNumber);
					$("#frmClManagerEmail").val(managerEmail);
					$("#frmClBusinessType").val(businessType);
					$("#frmClPlace").val(place);
					$("#frmClBusiness").val(business);
					$("#frmClBankname").val(bankName);
					$("#frmClAccountNumber").val(accountNumber);
					$("#frmClRelate").val(relate);

					$("#insertFrm").submit();

				} else if (insertFlag == 0) {
					$("#head").html(
							"<font color='red'>거래처 코드를 입력하지 않았습니다. </font>");
					$("#insertB").trigger("click");

				}

			});

	/*Duplication Check*/
	$("#duplCheck").on("click", function() {

		$.ajax({
			url : "${pageContext.request.contextPath }/clientDupl",
			method : "post",
			data : "clientCode=" + $("#clCode").val(),
			success : function(duplicateCode) {
				transDupl(duplicateCode);

			}
		});
	});

	function transDupl(duplicateCode) {
		if (duplicateCode == 1) {
			insertFlag = "1";
			duplicateCode = "<b><font color='blue'>사용가능한 거래처코드 입니다. </font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (duplicateCode == 0) {
			duplicateCode = "<b><font color='red'>중복된 거래처 코드가 있습니다.</font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (duplicateCode == "WS") {
			duplicateCode = "<b><font color='red'>거래처 코드를 입력하세요.</font></b>";
			$("#duplicate").html(duplicateCode);
		}

	}

	//-----------------------------------------------------

	$(document).ready(function() {
		$("#client_code").focus();

	});

	$("#client_code").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#seachBtn").click();
		}

	});

	$("#client_name").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#seachBtn").click();

		}

	});

	function seachClientBtn() {
		var client_code = $("#client_code").val();
		var client_name = $("#client_name").val();

		/*Validation*/
		if (client_code === "" && client_name === "") {
			alert("거래처코드 또는 거래처이름을 입력하세요.");
			$("#client_code").focus();

		} else if (client_code !== "" && client_name === "") {
			$("#cCode").val(client_code);

			$("#frm1").submit();
		} else if (client_name !== "" && client_code === "") {
			$("#cName").val(client_name);

			$("#frm2").submit();
		} else if (client_code !== "" && client_name !== "") {
			$("#BothName").val(client_name);
			$("#BothCode").val(client_code);

			$("#frm3").submit();

		}
	}
</script>


<form id="frm1"
	action="${pageContext.request.contextPath }/seachCodeClient"
	method="get">
	<input type="hidden" name="cCode" id="cCode" />
</form>

<form id="frm2"
	action="${pageContext.request.contextPath }/seachNameClient"
	method="get">
	<input type="hidden" name="cName" id="cName" />
</form>

<form id="frm3"
	action="${pageContext.request.contextPath }/seachBothClient"
	method="get">
	<input type="hidden" name="BothCode" id="BothCode" /> <input
		type="hidden" name="BothName" id="BothName" />
</form>


