<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  -->
<link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture|Black+Han+Sans|Kirang+Haerang|Nanum+Brush+Script|Stylish|Sunflower:300|Yeon+Sung" rel="stylesheet">
<style>
.disabled{pointer-events:none;}
                                

#emplheader {
font-family: 'Stylish', sans-serif;
}
                                                                                                       
                                                                                                                     
                                    
</style>
                                                                                    
                                              
<body>                                          
                                                                                                        
	<div class="container-fluid">
		<div class="row" id="emplheader">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<img id="mail" alt="" src="/resources/css/empl.ico"
					style="height: 50px; color: #6E6867 !important">
					<span
					style="font-size: 3em !important; vertical-align: bottom;">사원관리</span>
					
					
					<form action="${cp}/employee/SearchEmployee">
					<button style="float: right;" class="btn btn-info" type="submit"
						id="searchBtn">검색</button>
					<input style="width: 500px; float: right; width: 30%" type="text"
						class="search-query form-control" id="searchPay" name="searchName"
						placeholder="사원명을 검색하시오" />
					</form>	
			</div>
		</div>
		

		<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<table class="table table-bordered">
						<thead class="thead">
							<tr>
								<th>선택</th>
								<th>사원번호</th>
								<th>사원명</th>
								<th>부서명</th>
								<th>직책명</th>
								<th>직급명</th>
								<th>근속년수</th>
								<th>비고</th>
								<th>입사일</th>
								<th>생년월일</th>
							</tr>
						</thead>
                
						<tbody id="mytbody">
							<c:forEach items="${allEmployee}" var="allEmployee">
								<tr>
									<td><input type="checkbox" name="check"
										value="${allEmployee.userId}"
										style="width: 30px; height: 30px;"></td>

									<td class="boardTr" data-userid="${allEmployee.userId}"><button
											type="button" class="btn btn-default" data-toggle="modal"
											data-target="#myLargeModalEdit">
											<u>${allEmployee.userId }</u>
										</button></td>

									<td>${allEmployee.userNm }</td>
									<td>${allEmployee.deptname }</td>
									<td>${allEmployee.positionname }</td>
									<td>${allEmployee.rankname }</td>
									<td>${allEmployee.continuousYear }</td>
									<td>${allEmployee.relate }</td>
									<td>${allEmployee.joinCompany }</td>
									<td>${allEmployee.birthDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- 버튼 -->
					<div class="form-group">
						<form action="${cp}/employee/SearchEmployee" id="searchFrm">
							<table>
								<tr>
									<td>
										<button style="background-color: #6E6867 !important;"
											type="button" class="btn btn-primary btn-lg" id="cancleBtn">삭
											제</button>
										<button style="background-color: #6E6867 !important;"
											type="button" class="btn btn-primary btn-lg"
											data-toggle="modal" data-target="#myLargeModalInsert"
											id="employeeInsert">신규등록</button>
									</td>
									<td>
							                                                                          		
									
			<c:set var="lastPage"
				value="${Integer(Math.ceil(emplCnt / pageSize))}" />
			<nav style="position: relative;left: 500px">
				<ul id="pagination" class="pagination">
					<li
						<c:if test="${page=='1'}">
							class="disabled"
							</c:if>><a class="bttn-minimal bttn-md bttn-warning"
							href="${pageContext.servletContext.contextPath}/employee/emplPagingList"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>

					</a></li>
					<c:forEach var="i" begin="1" end="${lastPage }">
						<li
							<c:if test="${i == page}">
								class="active"
							</c:if>><a class="bttn-minimal bttn-md bttn-warning"
							href="${pageContext.servletContext.contextPath}/employee/emplPagingList?page=${i}">${i}</a></li>
					</c:forEach>
					<li
						<c:if test="${page==lastPage}">
								class="disabled"
							</c:if>><a class="bttn-minimal bttn-md bttn-warning"
						href="${pageContext.servletContext.contextPath}/employee/emplPagingList?page=${lastPage}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav></td>
									
								</tr>
							</table>
						</form>
					</div>
					<!-- 버튼 -->
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>



	<%--  --%>

           



<!--  페이징처리 -->
		<%-- 	 --%>
	


	
	<!--  사원 등록 모달창 불러오기  -->
	<%@ include file="employeeInsert.jsp"%>

	<!--  사원 등록 모달창 불러오기  -->
	<%@ include file="employeemodify.jsp"%>
	<script>
	
	  /*사원정보 수정하기*/
	   $("#mytbody").on("click", ".boardTr", function(){
		   
		   var deptCode_htmlEdit = "";
		   var position_htmlEdit = "";
		   var rank_htmlEdit = "";
		                     
	         
	      
	      $.ajax({
	         url         : "${pageContext.request.contextPath }/employee/updateEmployee" ,
	         method      : "get",
	         data      : "userId="+$(this).data().userid,
	         success      : function(userIdCode) {
	             $("#userIde").val(userIdCode.userId); 
	             $("#userNme").val(userIdCode.userNm);
	             $("#deptCode_htmlEdit").val(userIdCode.deptCode); 
	             $("#position_htmlEdit").val(userIdCode.positionCode);
	             $("#rank_htmlEdit").val(userIdCode.rankCode);
	             
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
	             
	             $("#userimage").attr('src','${cp}/employee/profileImg?userId=' + userIdCode.userId);
	             
	         } 
	      });
	   });
	  
	
   
   //사원 신규등록 클릭시 정보가져오기
   $("#employeeInsert").on("click", function(){
      
      
      $.ajax({
         url         : "${pageContext.request.contextPath }/employee/getSelectBox" ,
         method      : "get",
         //data      : "userId="+$(this).data().userid,
         success      : function(data) {
            makeUserList(data);
             
            
         } 
      });
      
   });
   
   
   
   
   
   function makeUserList(data) {
      
      var deptCode_html = "";
      var position_html = "";
      var rank_html = "";
      
      for(var i = 0; i < data.allDept.length; i++){
         var dept = data.allDept[i];
         
         deptCode_html += "<option value='" +dept.deptCode+"'> "+dept.deptName +"</option>";
         
      }
                             
      $("#deptCode_html").html(deptCode_html);
      
      
      
      for(var i = 0; i < data.allPosition.length; i++){
         
         if(data.allPosition[i].positionStatus == "직책"){
            var position = data.allPosition[i];
            position_html += "<option value='" + position.positionCode +"'> "+position.positionName +"</option>";
            
         }else if(data.allPosition[i].positionStatus == "직급"){
            
            var rank = data.allPosition[i];
            rank_html += "<option value='" + rank.positionCode +"'> "+rank.positionName +"</option>";
         }
         
      
      }          
             
      $("#position_html").html(position_html);
      $("#rank_html").html(rank_html);
      
      
      
      
   }
   
   
   
 
   /*Duplication Check*/
   $("#emplCheck").on("click", function(){
      $.ajax({
         url         : "${pageContext.request.contextPath }/employee/emplIdAjax" ,
         method      : "post",
         data      : "userId="+$("#userId").val(),
         success      : function(userIdCode) {
            transDupl(userIdCode);
            
         }
      });
   });
   
   
   var duplicateCode = "";
   
   function transDupl(userIdCode){
      if(userIdCode == 1){
         insertFlag = "1";
         duplicateCode = "<b><font color='blue'>사용가능한 사원번호 입니다. </font></b>";
         $("#duplicate").html(duplicateCode);
      } else if (userIdCode == 0){
         duplicateCode = "<b><font color='red'>중복된 사원번호 가 있습니다.</font></b>";
         $("#duplicate").html(duplicateCode);
      } else if (userIdCode == "WS"){
         duplicateCode = "<b><font color='red'>사원번호를 입력하세요.</font></b>";
         $("#duplicate").html(duplicateCode);
      }
      
   }
   
   

      $(document).ready(function() {
         
         $("#frmTap").trigger('click');
         
         
       //수정창 부서,직급 정보가져오기
   		  
   		   $.ajax({
   		         url         : "${pageContext.request.contextPath }/employee/getSelectBox" ,
   		         method      : "get",
   		         //data      : "userId="+$(this).data().userid,
   		         success      : function(data) {
   		            editUserList(data);
   		             
   		            
   		         } 
   		      });
   	  
   	  function editUserList(data) {
   	      
   	      var deptCode_html = "";
   	      var position_html = "";
   	      var rank_html = "";
   	      
   	      for(var i = 0; i < data.allDept.length; i++){
   	         var dept = data.allDept[i];
   	         
   	         deptCode_html += "<option value='" + dept.deptCode +"'> "+dept.deptName +"</option>";
   	         
   	      }
   	                             
   	      $("#deptCode_htmlEdit").html(deptCode_html);
   	      
   	      
   	      
   	      for(var i = 0; i < data.allPosition.length; i++){
   	         
   	         if(data.allPosition[i].positionStatus == "직책"){
   	            var position = data.allPosition[i];
   	            position_html += "<option value='" + position.positionCode +"'> "+position.positionName +"</option>";
   	            
   	         }else if(data.allPosition[i].positionStatus == "직급"){
   	            
   	            var rank = data.allPosition[i];
   	            rank_html += "<option value='" + rank.positionCode +"'> "+rank.positionName +"</option>";
   	         }
   	         
   	      
   	      }          
   	             
   	      $("#position_htmlEdit").html(position_html);
   	      $("#rank_htmlEdit").html(rank_html);
   	      
   	      
   	   } 
      
         
          //server side 에서 비교
         <c:if test="${msg != null}">
         alert("${msg}");
         </c:if> 
         
         
          //사용자 tr 태그 클릭시 이벤트 핸들러
         $("#cancleBtn").click(function() {
            var implArray = new Array();

            $('input:checkbox[name="check"]:checked').each(function() {
               implArray.push($(this).val());
   
            $("#delete_no").val(implArray);
            $("#frm1").submit();
            
            });

         }); 
      });
      
       $("#zipcodeBtn").on("click", function() {

         new daum.Postcode({
            oncomplete : function(data) {
               $("#address").val(data.roadAddress);
            }
         }).open();

      }); 
       
       
       
       $(window).on("load resize ", function() {
    	   var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
    	   $('.tbl-header').css({'padding-right':scrollWidth});
    	 }).resize();
   </script>

	<form id="frm1" action="${cp}/employee/deleteEmployee" method="get">
		<input type="hidden" id="delete_no" name="delete_no" />
	</form>

	<form id="frm2" action="${cp}/employee/detailEmployee" method="get">
		<input type="hidden" id="userId" name="userId" />
	</form>
</body>