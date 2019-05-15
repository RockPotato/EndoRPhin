<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	
	<form id="deletefrm" action="${pageContext.request.contextPath }/deleteClient" method="get">
		<input type="hidden" id="deleteCode" name="deleteCode" value="${vo.get(0).clientCode}" />	
	</form>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i> 거래처 상세정보</h2>
	<div style="width: 30%; float:left;">
		<div class="table-responsive">
	         <table class="table table-striped">
					<tr> 
						<td><label class="detail_name">거래처코드 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).clientCode}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">대 &nbsp;&nbsp;표 &nbsp;&nbsp;자 :</label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).manager}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">이 &nbsp;&nbsp;메 &nbsp;&nbsp;일 :</label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).managerEmail}" readonly /></td>
					</tr>
					
			</table>
		</div>
	</div>
	
	
	<div style="width: 30%; float: left;">
		<div class="table-responsive">
	         <table class="table table-striped">
					<tr> 
						<td><label class="detail_name">거래처이름 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).clientName}" readonly /></td>
					</tr>
						
					<tr>
						<td><label class="detail_name">전 화 번 호 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).telephone}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">업종 / 업태 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).business}" readonly /></td>
					</tr>
			</table>
		</div>
	</div>
	
	
	<div style="width: 30%; float: left;">
		<div class="table-responsive">
	         <table class="table table-striped">
					<tr> 
						<td><label class="detail_name">사업자번호 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).salesNumber}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">팩 스 번 호 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).faxNumber}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">과 세 유 형 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).businessType}" readonly /></td>
					</tr>
			</table>
		</div>
	</div>
	
	
	
	<br /> <br /> <br /> <br />
	<br /> <br /> <hr>
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">소 &nbsp;&nbsp;재 &nbsp;&nbsp;지 :</label></td>
				<td><input id="place" style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).place}" readonly /></td>
			</tr>
		</table>
	</div>
	
	
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">메 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 모&nbsp; : </label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).relate}" readonly /></td>
			</tr>
		</table>
	</div>
	
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">은 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 행&nbsp; : </label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).bankName}" readonly /></td>
			</tr>
		</table>
	</div>
	
	
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">계 좌 번 호 :</label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).accountNumber}" readonly /></td>
			</tr>	
		</table>
	</div>
	
		<button type="button" class="bttn-simple bttn-warning" onclick="history.back(-1);">뒤로가기</button>
		<button type="button" id="updateBtn_client" class="bttn-simple bttn-warning" data-toggle="modal" data-target="#my70sizeCenterModal">수정</button>
		<button type="button" id="deleteBtn_client" class="bttn-simple bttn-warning">삭제</button>
	</div>
	</div>
	
	
	<script>
		
	$("#updateBtn_client").on("click", function(){
		
		
		var split_zipcode = $("#place").val().split('_');
		
		$("#zipcode").val(split_zipcode[0]);
		$("#clPlace1").val(split_zipcode[1]);
		$("#clPlace2").val(split_zipcode[2]);
		
	});
	
	
	
	$("#deleteBtn_client").on("click", function(){
		$("#deletefrm").submit();
	});

	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
<div class="container">
		
	</div>


	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my70sizeCenterModal"
		tabindex="3" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
		<div class="modal-dialog modal-80size modal-center" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">거래처 수정</h4>
					<span id="head"></span>
				</div>
				
				<!-- 여기부터 로직작성 -->
				<div class="modal-body">
					<div class="form-group">
					<!-- 여기부터 로직작성 -->
						<label for="inputName">거래처코드</label> 
						<input type="text" id="clientCode" value="${vo.get(0).clientCode}" readonly> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">상 &nbsp;&nbsp;호 &nbsp;&nbsp;명</label> 
						<input type="text" id="clientName" value="${vo.get(0).clientName}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">사업자번호</label> 
						<input type="text" id="salesNumber" value="${vo.get(0).salesNumber}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">대 &nbsp;&nbsp;표 &nbsp;&nbsp;자</label> 
						<input type="text" id="manager" value="${vo.get(0).manager}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">전 화 번 호</label> 
						<input type="text" id="telephone" value="${vo.get(0).telephone}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">이 &nbsp;&nbsp;메 &nbsp;&nbsp;일</label> 
						<input type="text" id="managerEmail" value="${vo.get(0).managerEmail}">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">팩 스 번 호</label> 
						<input type="text" id="faxNumber" value="${vo.get(0).faxNumber}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">사업자유형</label>
						<input type="radio" name="businessType" value="과세" checked="checked" /> 과세
						<input type="radio" name="businessType" value="면세"/> 면세
						<input type="button" value="면세업종" data-toggle="modal" data-target="#my90sizeCenterModal"/> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">소 &nbsp;&nbsp;재 &nbsp;&nbsp;지</label> 
						<input style="width: 100px;" type="text" name="zipcode" id="zipcode"/>
						<input type="button" id="zipcodeBtn" value="우편번호 검색" />
					</div>
					
					<div class="form-group">
						<label for="InputEmail">주 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label> 
						<input type="text" style="width: 388px;" name="clPlace1" id="clPlace1" placeholder="도로명주소" />
					</div>
					<div class="form-group">
						<label for="InputEmail">상 세 주 소</label> 
						<input style="width: 388px;" type="text" name="clPlace2" id="clPlace2" placeholder="상세주소"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">업 종/업 태</label> 
						<input style="width: 388px;" type="text" id="business" value="${vo.get(0).business}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">은 &nbsp;&nbsp;행 &nbsp;&nbsp;명</label> 
						<input type="text" id="bankName" value="${vo.get(0).bankName}">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">계 좌 번 호</label> 
						<input type="text" id="accountNumber" value="${vo.get(0).accountNumber}"> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">메 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 모&nbsp;</label> 
						<input style="width: 388px" type="text" id="relate" value="${vo.get(0).relate}">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">거 래 상 태</label>
						<input type="radio" name="useStatus" value="1" checked="checked" /> 거래가능
						<input type="radio" name="useStatus" value="0"/> 거래불가
					</div>
					
				</div>
				<!-- 여기까지 -->
				<div class="modal-footer">
					<button type="button" id="AceeptDBupdateBtn" class="btn btn-default" data-dismiss="modal">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal modal-center fade" id="my90sizeCenterModal"
		tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
		<div class="modal-dialog modal-80size modal-center" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
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
									<th>면세 종류 </th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>기초생활 필수품 재화</td>
									<td>미가공식료품, 연탄과 무연탄, 주택임대용역<td>
								</tr>
								
								<tr>
									<td rowspan="4">국민후생용역</td>
									<td>의료보건용역(병의원)과 혈액<td>
								</tr>
								<tr>
									<td>교육 용역(정부의 허가받은 학원)<td>
								</tr>
								<tr>
									<td>여객운송용역(고석버스,항공기,고속전철 등 제외)<td>
								</tr>
								<tr>
									<td>국민주택 공급과 당해 주택의 건설용역<td>
								</tr>
								
								<tr>
									<td>문화 관련 재화/용역</td>
									<td>도서, 신문, 잡지, 방송(광고 제외)<td>
								</tr>
								
								<tr>
									<td>부가가치 구성 요소</td>
									<td>토지 공급, 인적용역, 금융 및 보험용역<td>
								</tr>
								
								<tr>
									<td>기타</td>
									<td>공중전화, 복권 등<td>
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
	
	
	
	
	
	<form id="updateClientFrm" action="${pageContext.request.contextPath }/clientUpdate" method="post">
		  <input type="hidden" id="frmclientCode" name="frmclientCode" />
		  <input type="hidden" id="frmclientName" name="frmclientName" />
		  <input type="hidden" id="frmsalesNumber" name="frmsalesNumber" />
		  <input type="hidden" id="frmmanager" name="frmmanager" />
		  <input type="hidden" id="frmtelephone" name="frmtelephone" />
		  <input type="hidden" id="frmfaxNumber" name="frmfaxNumber" />
		  <input type="hidden" id="frmmanagerEmail" name="frmmanagerEmail" />
		  <input type="hidden" id="frmbusiness" name="frmbusiness" />
		  <input type="hidden" id="frmplace" name="frmplace" />
		  <input type="hidden" id="frmrelate" name="frmrelate" />
		  <input type="hidden" id="frmbusinessType" name="frmbusinessType" />
		  <input type="hidden" id="frmbankName" name="frmbankName" />
		  <input type="hidden" id="frmaccountNumber" name="frmaccountNumber" />
		  <input type="hidden" id="frmuseStatus" name="frmuseStatus" /> 
	</form>                       		
		
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		 
		  
		  
		  
	 <script>
	
	 	$(document).ready(function(){
			$("#AceeptDBupdateBtn").on("click", function(){
				
				var clientCode 		= $("#clientCode").val();
				var clientName 		= $("#clientName").val();
				var salesNumber 	= $("#salesNumber").val();
				var manager 		= $("#manager").val();
				var telephone 		= $("#telephone").val();
				var faxNumber 		= $("#faxNumber").val();
				var managerEmail 	= $("#managerEmail").val();
				var business 		= $("#business").val();
				var zipcode			= $("#zipcode").val() +"_";
				var place1 			= $("#clPlace1").val() +"_";
				var place2			= $("#clPlace2").val();
				var place 			= zipcode + place1 + place2;
				var relate 			= $("#relate").val();
				var businessType 	= $(":input:radio[name=businessType]:checked").val();
				var bankName 		= $("#bankName").val();
				var accountNumber 	= $("#accountNumber").val();	 
				var useStatus 		= $(":input:radio[name=useStatus]:checked").val();
				
				
				$("#frmclientCode").val(clientCode);
				$("#frmclientName").val(clientName);
				$("#frmsalesNumber").val(salesNumber);
				$("#frmmanager").val(manager);
				$("#frmtelephone").val(telephone);
				$("#frmfaxNumber").val(faxNumber);
				$("#frmmanagerEmail").val(managerEmail);
				$("#frmbusiness").val(business);
				$("#frmplace").val(place);
				$("#frmrelate").val(relate);
				$("#frmbusinessType").val(businessType);
				$("#frmbankName").val(bankName);
				$("#frmaccountNumber").val(accountNumber);
				$("#frmuseStatus").val(useStatus);
				
				
				$("#updateClientFrm").submit();
			});
			
			
			
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
			
			
			
			
	 	});
	
	</script>