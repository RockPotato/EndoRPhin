<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.inputCla {
	width: 100px;
}
</style>

<div class="modal fade" id="annualInsert" aria-hidden="true"
	style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">연차이력 신규등록</h4>
			</div>
			<div class="container"></div>
			<div class="modal-body">

				<form action="${cp}/annual/annualInsert" method="post">
					<div class="row-0">
						<div class="col-0-0">
							<ul style="border-spacing: 5 px;">
								<li>적용년도 <select id="paidStatus" name="continuousYear">
										<%
											Calendar cal = Calendar.getInstance();
											cal.get(cal.YEAR);
										%>
										<option value="<%=cal.get(cal.YEAR)%>"><%=cal.get(cal.YEAR)%></option>
										<option value="<%=cal.get(cal.YEAR) - 1%>"><%=cal.get(cal.YEAR) - 1%></option>
										<option value="<%=cal.get(cal.YEAR) - 2%>"><%=cal.get(cal.YEAR) - 2%></option>
										<option value="<%=cal.get(cal.YEAR) - 3%>"><%=cal.get(cal.YEAR) - 3%></option>
										<option value="<%=cal.get(cal.YEAR) - 4%>"><%=cal.get(cal.YEAR) - 4%></option>
								</select> <!--  사원 불러오기 --> <a id="attitudeRecordInsert"
									data-toggle="modal" href="#myModal2" class="btn btn-primary">사원
										불러오기</a> <!--  사원 불러오기 종료-->

								</li>
							</ul>
						</div>
					</div>

					<!-- 불러온 사원 목록창 -->
					<div class="row-2" style="margin-top: 50px">
						<div class="col-2-0">


							<table class="table table-striped" style="text-align: center;"
								border="1">
								<thead class="thead">
									<tr>
										<th>사번</th>
										<th>사원명</th>
										<th>부서명</th>
										<th>근속년수</th>
										<th>연차발생일</th>
										<th>사용일수</th>
									</tr>
								</thead>

								<tbody id="annualUserList">
								</tbody>

							</table>
						</div>
					</div>
					<!-- 불러온 사원 목록창 종료 -->
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">저장</button>
				</form>
				<a href="#" data-dismiss="modal" class="btn">취소</a>
			</div>
		</div>
	</div>
</div>


<script>
$('#attitudeRecordInsert').click(function(){
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
                                    
             $("#deptcodeselect").html(deptCode_html);
        } 
     });
	                   
	 $.ajax({
			url			: "${pageContext.request.contextPath }/employee/getAllEmployeeAjax" ,
			method		: "get",
			success		: function(data) {
				
				makeUserList(data);
			
			} 
		});
	 
	
});
</script>



