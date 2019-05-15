<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<style>

.form-horizontal{
width : 100%;

}
.thead{
color : white;
background-color: #6E6867;
}

.tbody{
color : black;
}

.form-group{

width: auto;
}


a:hover,a:focus{
    text-decoration: none;
    outline: none;
}
.tab .nav-tabs{
    border: none;
    border-bottom: 2px solid #079fc9;
    margin: 0;
}

.tab .nav-tabs li a{
	
    padding: 10px 20px;
    font-size: 17px;
    font-weight: 600;
    color: #293241;
    text-transform: uppercase;
    border: 2px solid #e6e5e1;
    border-bottom: none;
    border-radius: 5px 5px 0 0;
    z-index: 1;
    position: relative;
    transition: all 0.3s ease 0s;
}

.tab .nav-tabs li a:hover,
.tab .nav-tabs li.active a{
    background: #fff;
    color: #079fc9;
    border: 2px solid #079fc9;
    border-bottom-color: transparent;
}
.tab .nav-tabs li a:before{
    content: "";
    display: block;
    height: 2px;
    background: #fff;
    position: absolute;
    bottom: -2px;
    left: 0;
    right: 0;
    transform: scaleX(0);
    transition: all 0.3s ease-in-out 0s;
}
.tab .nav-tabs li.active a:before,
.tab .nav-tabs li a:hover:before{ transform: scaleX(1); }
@media only screen and (max-width: 479px){
    .tab .nav-tabs{ border: none; }
    .tab .nav-tabs li{
        width: 100%;
        text-align: center;
        margin-bottom: 15px;
    }
    .tab .nav-tabs li a{
        margin: 0;
        border-bottom: 2px solid transparent;
    }
    .tab .nav-tabs li a:before{
        content: "";
        width: 100%;
        height: 2px;
        background: #079fc9;
        position: absolute;
        bottom: -2px;
        left: 0;
    }
}

 .table {
 border-width : 3px;
  border-style : inset;
  border-color : black;
 
 }
 
 .btnform{
 
 size : 5em;
 color : white;
background-color: #6E6867;
 border-width : 3px;
  border-style : inset;
  border-color : black;
 }
 

</style>
</head>
<div class="row">
        <div class="col-md-1" style="width: 100%">
        </div>
        <div class="col-md-10" style="width: 100%">
            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a id="frmTap" href="#Section1"  aria-controls="home" role="tab" data-toggle="tab">직급/직책</a></li>
                    <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab"> 직  급 </a></li>
                    <li role="presentation"><a href="#Section3" aria-controls="messages" role="tab" data-toggle="tab"> 직  책 </a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content tabs">
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                        <p>
                        <form class="form-horizontal">
						<div class="form-group">
							<table class="table table-striped">
								<thead class="thead">
				<tr>
					<th>선택</th>
					<th>직급/직책코드</th>
					<th>직급/직책코드명</th>
					<th>순위</th>
					<th>사용여부</th>
					<th>비고</th>
					<th>직급/직책 분류</th>
				</tr>
			</thead>
			 
			<tbody class="tbody" id="mytbody">
				<c:forEach items="${allPosition}" var="allPosition">
					<tr class="boardTr" data-userId="${allPosition.positionCode}">
						<td><input type="checkbox" name="check"
							value="${allPosition.positionCode}" style="width: 30px; height: 30px;"></td>
							
            			<td><button type="button" class="btn btn-default" data-toggle="modal"
            			 data-target="#my80sizeModal2"><u>${allPosition.positionCode}</u></button></td>
 
						<td>${allPosition.positionName }</td>
						<td>${allPosition.rank }</td>
						<td>${allPosition.useStatus }</td>
						<td>${allPosition.relate }</td>
						<td>${allPosition.positionStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</form>




<div class="form-group">
	<button type="button" class="btnform" id="cancleBtn"> 삭 제 </button>
	<button type="button" class="btnform" data-toggle="modal" data-target="#my80sizeModal">
  신규등록
</button>
</div>


<!-- 직급 입력하기 -->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel" style="z-index: 1050">
  <div class="modal-dialog modal-80size" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header"><h2>직급/직책 등록</h2>
      </div>
      <div class="modal-body">
        <div class="form-group">
						<form action="${cp}/emplPosition/insertemplPosition" method="post">
							<label for="inputName">직급/직책 코드</label> <input type="text"
								class="form-control" id="positionCode" name="positionCode" placeholder="직급/직책 번호를 입력해 주세요">
								<input type="button" id="emplCheck" name="emplCheck" value="중복체크"/> 
								<span id="duplicate"></span>
								
					</div>
					<div class="form-group">
						<label for="InputEmail">직급/직책명</label> <input type="text"
							class="form-control" name="positionName" placeholder="직급/직책명을 입력해주세요">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">순위</label> <input type="text"
							class="form-control" name="rank" placeholder="순위를 입력해주세요">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">비고</label> <input type="text"
							class="form-control" name="relate" placeholder="비고란을 입력해주세요">
					</div>
					
					<div class="form-group">
						<table>
							<tr>
								<td><label for="inputPassword">직급/직책 분류</label></td>
								<td><select name="positionStatus" class="form-control">
										<option value="직급">직급</option>
										<option value="직책">직책</option>
								</select></td>
							</tr>
							</table>
						</div>
					
					
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-default">등록</button>
					</form>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 직급 입력하기 끝 -->

<!-- 직급 모달창 수정하기  -->
<div class="modal fade" id="my80sizeModal2" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel" style="color: black; z-index: 1050">
  <div class="modal-dialog modal-80size" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header"><h2>직급/직책 수정</h2>
      </div>
      <div class="modal-body">
        <div class="form-group">
						<form action="${cp}/emplPosition/updatePosition" method="post">
							<label for="inputName">직급/직책 코드</label> <input type="text" readonly
								class="form-control" id="positionCodee" name="positionCode" placeholder="직급/직책 번호를 입력해 주세요">
								
					</div>
					<div class="form-group">
						<label for="InputEmail">직급/직책명</label> <input type="text"
							class="form-control" id="positionNamee" name="positionName" placeholder="직급/직책명을 입력해주세요">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">순위</label> <input type="text"
							class="form-control" id="ranke" name="rank" placeholder="순위를 입력해주세요">
					</div>
					
					<div class="form-group">
						<label for="InputEmail">비고</label> <input type="text"
							class="form-control" id="relate" name="relate" placeholder="비고란을 입력해주세요">
					</div>
					
					<div class="form-group">
						<table>
							<tr>
								<td><label for="inputPassword">직급/직책 분류</label></td>
								<td><select id="positionStatuse" name="positionStatus" class="form-control">
										<option value="직급">직급</option>
										<option value="직책">직책</option>
								</select></td>
								
								<td><label for="inputPassword">사용 여부</label></td>
								<td><select id="useStatuse" name="useStatus" class="form-control">
										<option value="사용">사용</option>
										<option value="미사용">미사용</option>
								</select></td>
							
							</tr>
							</table>
						</div>
					
					
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-default">수정</button>
					</form>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>




<!-- 직급 모달창 수정하기 끝  -->
                        
                        
                        </p>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Section2">
                        <p> <!-- 직급시작 -->
                        
                        <form class="form-horizontal">
							<div class="form-group">
							</div>

						<div class="form-group">
							<table class="table table-striped">
								<thead class="thead">
				<tr>
					<th>직급/직책코드</th>
					<th>직급/직책코드명</th>
					<th>순위</th>
					<th>사용여부</th>
					<th>비고</th>
					<th>직급/직책 분류</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${allPosition}" var="allPosition">
				<c:if test="${allPosition.positionStatus == '직급' }">
					<tr class="boardTr" data-userId="${allPosition.positionCode}">
            			<td><button type="button" class="btn btn-default" data-toggle="modal"
            			 data-target="#my80sizeModal2"><u>${allPosition.positionCode}</u></button></td>
						<td>${allPosition.positionName }</td>
						<td>${allPosition.rank }</td>
						<td>${allPosition.useStatus }</td>
						<td>${allPosition.relate }</td>
						<td>${allPosition.positionStatus }</td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>

</form>
                        </p>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Section3">
                        <p> <!-- 직책시작 -->
                        
                        <form class="form-horizontal">
							<div class="form-group">
							</div>

						<div class="form-group">
							<table class="table table-striped">
								<thead class="thead">
				<tr>
					<th>직급/직책코드</th>
					<th>직급/직책코드명</th>
					<th>순위</th>
					<th>사용여부</th>
					<th>비고</th>
					<th>직급/직책 분류</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${allPosition}" var="allPosition">
				<c:if test="${allPosition.positionStatus == '직책' }">
					<tr class="boardTr" data-userId="${allPosition.positionCode}">
            			<td><button type="button" class="btn btn-default" data-toggle="modal"
            			 data-target="#my80sizeModal2"><u>${allPosition.positionCode}</u></button></td>
 
						<td>${allPosition.positionName }</td>
						<td>${allPosition.rank }</td>
						<td>${allPosition.useStatus }</td>
						<td>${allPosition.relate }</td>
						<td>${allPosition.positionStatus }</td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>

</form>
                        </p>
                    </div>
                </div>
            </div>
        </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>


	/*직급정보 수정하기*/
	$("#mytbody").on("click", ".boardTr", function(){
			
		$.ajax({
			url			: "${pageContext.request.contextPath }/emplPosition/updatePosition" ,
			method		: "get",
			data		: "userId="+$(this).data().userid,
			success		: function(userIdCode) {
				 $("#positionCodee").val(userIdCode.positionCode); 
				 $("#positionNamee").val(userIdCode.positionName);
		         $("#ranke").val(userIdCode.rank);
				 $("#relate").val(userIdCode.useStatus);
				 $("#positionStatuse").val(userIdCode.relate);
				 $("#positionStatuse").val(userIdCode.positionStatus);
				 $("#useStatuse").val(userIdCode.useStatus);
				 
			} 
		});
	});
	
	/*Duplication Check*/
	$("#emplCheck").on("click", function(){
		$.ajax({
			url			: "${pageContext.request.contextPath }/emplPosition/emplIdAjax" ,
			method		: "post",
			data		: "userId="+$("#positionCode").val(),
			success		: function(userIdCode) {
				transDupl(userIdCode);
				
			}
		});
	});
	var duplicateCode = "";
	
	function transDupl(userIdCode){
		if(userIdCode == 1){
			insertFlag = "1";
			duplicateCode = "<b><font color='blue'>사용가능한 직책/직급 코드 입니다. </font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (userIdCode == 0){
			duplicateCode = "<b><font color='red'>중복된 직책/직급 코드 가 있습니다.</font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (userIdCode == "WS"){
			duplicateCode = "<b><font color='red'>직책/직급 코드를 입력하세요.</font></b>";
			$("#duplicate").html(duplicateCode);
		}
		
	}

		$(document).ready(function() {
			
			$("#frmTap").trigger('click');
			
			 //server side 에서 비교
			<c:if test="${msg != null}">
			alert("${msg}");
			</c:if> 
			
			
			 //사용자 tr 태그 클릭시 이벤트 핸들러
			$("#cancleBtn").click(function() {
				
				var positionArray = new Array();
				
				
				
				$('input:checkbox[name="check"]:checked').each(function() {

					positionArray.push($(this).val());
					
					
				$("#delete_no").val(positionArray);
				$("#frm1").submit();
				
				});

			}); 
			
			
			

		});
	</script>
	

	<form id="frm1" action="${cp}/emplPosition/delteEmplPosition" method="get">
		<input type="hidden" id="delete_no" name="delete_no" />
	</form>

	<form id="frm2" action="${cp}/employee/detailEmployee" method="get">
		<input type="hidden" id="userId" name="userId" />
	</form> 
