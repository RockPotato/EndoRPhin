<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="modal fade" id="myModal" aria-hidden="true"
	style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<form id="attInsert" action="${cp}/attitudeRecord/attitudeRecordInsert" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">근태이력 신규등록</h4>
				</div>
				<div class="modal-body">


					<dl>
						<dt>근태항목 </dt>
						<dd>
							<select id="paidStatus1" name="attitudecode" class="form-control" onchange="acd()"></select>
						</dd>
						<dt>시작일자 </dt>
						<dd>
							<input style="color: black" type="text" id="startDateIns"
								class="search-query form-control" name="startday" />
						</dd>
						<dt>종료일자 </dt>
						<dd>
						<div id="box1" class="box1" onclick="alert('근태항목을 선택하세요');">
							<input style="color: black;" type="text" id="endDateIns"
								class="search-query form-control" name="endday"
								onchange="callIns()" />
								</div>
								
								
						</dd>
						<dt>사용일수 </dt>
						<dd>
							<input type="text" id="basedays" name="basedays"
								class="form-control" />
						</dd>

					</dl>
					
					

					<div class="container">
						<!--  사원 불러오기 -->
						<div class="row">
							<div class="col-md-5">
								<a id="attitudeRecordInsert" data-toggle="modal"
									href="#myModal2" class="btn btn-primary">사원 불러오기</a>
							</div>
						</div>

						<!--  사원 불러오기 종료-->

						<!-- 불러온 사원 목록창 -->
						<div class="row">
							<div class="col-md-12" style="width: 100%">
								<table class="table table-striped" style="text-align: center;"
									border="1">
									<thead class="thead">
										<tr>
											<th>사번</th>
											<th>사원명</th>
											<th>부서명</th>
											<th>메모</th>
											<th>잔여연차</th>
										</tr>
									</thead>

									<tbody id="recordUserList">
									</tbody>

								</table>

							</div>
						</div>
					</div>
					<!-- 불러온 사원 목록창 종료 -->




				</div>
				<div class="modal-footer">
					<button id="dateconfirm" type="button" class="btn btn-primary">저장</button>
					<a href="#" data-dismiss="modal" class="btn">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>



<script>
$('#dateconfirm').click(function(){
	
	var date = new Date().getFullYear();
	
	
	var start = $('#startDateIns').val().split('-')[0];
	var end = $('#endDateIns').val().split('-')[0];
	
	if(date != start || date != end){
		alert("해당년도 연차 기간에 맞게 지정해주세요");
	}else if(date == start && date == end){
		$('#attInsert').submit();
	}
	
	
});



var selected = "";
	function acd() {
		 selected  = $('#paidStatus1 option:selected').text();
		 $('#endDateIns').css('pointer-events', 'inherit');
		
		 
		 $('#box1').prop("onclick", null).off("click");
		
	}
	                                         
                
	 $(function() {
		$("#startDateIns")
				.datepicker(
						// inputbox 의 id 가 startDate 이겠죠.
						{
							dateFormat : 'yy-mm-dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" // 우측 달력 icon 의 이미지 패스 
							,
							buttonImageOnly : true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
							,
							changeMonth : true // 월선택 select box 표시 (기본은 false)
							,
							changeYear : true // 년선택 selectbox 표시 (기본은 false)
							,
							showButtonPanel : true
						// 하단 today, done  버튼기능 추가 표시 (기본은 false)
						});

		$("#endDateIns")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
							buttonImageOnly : true,
							changeMonth : true,
							changeYear : true,
							showButtonPanel : true
						});

		//초기값을 오늘 날짜로 설정
		$('#startDateIns').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
		$('#endDateIns').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  

	}); 
	
	var userid = '${employeeVo.userId}';
	var resi ;
	function callIns() {
		

		var sdd = document.getElementById("startDateIns").value;
		var edd = document.getElementById("endDateIns").value;


		var arr1 = sdd.split('-');
		var arr2 = edd.split('-');

		var dt1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dt2 = new Date(arr2[0], arr2[1], arr2[2]);

		var diff = dt2 - dt1;

		var day = 1000 * 60 * 60 * 24;

		 $("#basedays").val((parseInt(diff / day)) + ' 일');
		
		
		if(resi >= (parseInt(diff / day)) && selected == '연차휴가'){
		$("#residualIns").val(resi - (parseInt(diff / day)) + ' 일');
		}else if(resi < (parseInt(diff / day)) && selected != '연차휴가'){
			alert("잔여 연차가 부족합니다!");
		}
	}
	
	
	$(document).ready(function() {
		
	                   
	$.ajax({
				url : "${pageContext.request.contextPath }/attitude/getAllAttitudeAjax",
				method : "get",
				success : function(data) {
					var html = "";

						html += "<option value='0'>근태항목을 선택하세요 </option>";
					for (var i = 0; i < data.length; i++) {
						var user = data[i];
						html += "<option value='"+ user.attitudeCode+"'>"
								+ user.attitudeName
								+ "</option>";
					}
					$("#paidStatus1").html(html);
					$("#paidStatusEmpl").html(html);

				}
			});
	
	
	
	
	 if($('#paidStatus1 option:selected').text() == 0){
		   $('#endDateIns').css('pointer-events', 'none');
	   }else if($('#paidStatus1 option:selected').text() != 0){
		   $('#endDateIns').css('pointer-events', 'inherit');
		   
		   
	   }  
	
	});
	
	
	
	
	
</script>




