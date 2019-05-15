<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


			 <div class="modal fade" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
       <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">사원 불러오기</h4>
            </div><div class="container"></div>
            <div class="modal-body">



				<div class="row-0">
					<div class="col-0-0">
						부서명 <select id="paidStatusEmpl" name="paidStatus" onchange="seleEmpl()">
						</select>
					</div>
				</div>



				<!-- 불러온 사원 목록창 -->
				<div class="row-1" style="margin-top: 50px">
					<div class="col-1-0">

						<table class="table table-striped" style="text-align: center;"
							border="1">
							<thead class="thead">
								<tr>
									<th>check</th>
									<th>사번</th>
									<th>사원명</th>
									<th>부서명</th>
								</tr>
							</thead>

							<tbody id="userListTbody">
							</tbody>

						</table>

					</div>
				</div>




				<!-- 불러온 사원 목록창 종료 -->



            </div>
            <div class="modal-footer">
             <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">취소</button>
              <button type="button"  id="emplLoadingCheck" 
							class="btn btn-secondary btn-lg" data-dismiss="modal">선택</button>
            </div>
          </div>
        </div>
    </div>
			
			
			
			
			
			
			
			
			
			
<script>
function seleEmpl() {
	var deptcodeselect  = $('#paidStatusEmpl option:selected').val();
	
	$.ajax({
		url			: "${pageContext.request.contextPath }/employee/SearchEmployeeAjax" ,
		method		: "get",
		data		: {"deptcodeselect":deptcodeselect},
		success		: function(data) {
			
			makeUserList(data);
		
		} 
	});
	
}
	
	
	
	


$("#attitudeRecordInsert").on("click", function(){
	
	
	 $.ajax({
         url         : "${pageContext.request.contextPath }/employee/getSelectBox" ,
         method      : "get",
         //data      : "userId="+$(this).data().userid,
         success      : function(data) {
        	 var deptCode_html = "";
        	 for(var i = 0; i < data.allDept.length; i++){
                 var dept = data.allDept[i];
                 
                 deptCode_html += "<option value='" +dept.deptCode+"'> "+dept.deptName +"</option>";
                 
              }
                                     
              $("#paidStatusEmpl").html(deptCode_html);
        	 
            
         } 
      });
	
	
	 
	 
	

	

	//사원 전체 불러오기
	$.ajax({
		url			: "${pageContext.request.contextPath }/employee/getAllEmployeeAjax" ,
		method		: "get",
		//data		: "userId="+$(this).data().userid,
		success		: function(data) {
			
			makeUserList(data);
		
		} 
	});
	
	});
	
function makeUserList(allEmployee) {
	var html = "";
	
	for(var i = 0; i < allEmployee.length; i++){
		var user = allEmployee[i];
		html += "<tr class='userTr' data-userid='"+ user.userId+ "'>";
		html += "<td> <input type='checkbox' name='check'  value=' "+ user.userId+"' /></td>";
		
		html += "	<td >"+ user.userId +"</td>";
		html += "	<td>"+ user.userNm +"</td>";
		html += "	<td>"+user.deptname+"</td>";
		html += "</tr>";
	}
	$("#userListTbody").html(html);
	
}

function recordUserList(allAttitude_recordInsert) {
	var html = "";
	
	
		for (var i = 0; i < allAttitude_recordInsert.length; i++) {
				
		var user = allAttitude_recordInsert[i];
		html += "<tr>";
		html += "	<td>"+ user.userId +"</td>";
		html += "	<td>"+ user.userNm +"</td>";
		html += "	<input type='hidden' name='userid' value='" + user.userId + "'>";
		html += "	<td>"+user.deptname+"</td>";
		html += "	<td><input type='text' name='attitudememo'/></td>";
		html += "	<td>"+user.residual+" 일" +"</td>";
		html += "</tr>";
	}
	$("#recordUserList").html(html);
	
}

//사용자 tr 태그 클릭시 이벤트 핸들러
$("#emplLoadingCheck").click(function() {
	
	
	
	
	var checked = new Array();
	
	 $('input:checkbox[name="check"]:checked').each(function() {
		 
		 checked.push($(this).val());
		 
	}); 
	 
	 
	 $.ajax({
			url			: "${cp}/attitudeRecord/attitudeRecordInsert" ,
			method		: "get",
			traditional : true,
			data		: "userId="+checked,
			success		: function(data) {
				
				
				
				recordUserList(data);
			} 
		}); 
	 
	
	});
	
$(document).on('hidden.bs.modal', function (event) {

	if ($('.modal:visible').length) {

		$('body').addClass('modal-open');

	}

});

</script>
