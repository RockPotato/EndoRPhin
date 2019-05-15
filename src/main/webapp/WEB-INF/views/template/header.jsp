<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Poor+Story" rel="stylesheet">


<style>
       
#alarmCnt{
width : 20px;
height : 20px;
border-radius: 50%;
background-color: red;
position:absolute;
top:2px;
right:-2px;
color: white;
 
}       
#mailCnt{
width : 20px;
height : 20px;
border-radius: 50%;
background-color: red;
position:absolute;
top:2px;
left: 20px;
color: white;
                
}       
                                                                                                                                                                        
                        
#userName{
color : white;
font-family: "BMHANNAAir";
font-size: 1.8em;

}

            

#logo {
position:relative;top:3px;
color : white;
font-weight :1500;
font-size:1.3em;
 font-family: 'Black Han Sans', sans-serif;
	-webkit-animation: tracking-in-contract 0.8s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	        animation: tracking-in-contract 0.8s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}

@-webkit-keyframes tracking-in-contract {
  0% {
    letter-spacing: 1em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    letter-spacing: normal;
    opacity: 1;
  }
}
@keyframes tracking-in-contract {
  0% {
    letter-spacing: 1em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    letter-spacing: normal;
    opacity: 1;
  }
}


#sidebarCollapse {
	color: #fff;
	text-decoration: none;
	outline: none
}



#container div .col-md-2:hover {
	background: #4D341B;
	color: #fff !important;
	width: 70%;
}

.col-md-2:hover .dropdown-menu {
	display: block !important;
	margin-top: 0 !important;
	background-color: #CFCABA !important;
}

#container {
	color: white !important;
	font-size: 2em !important;
	background-color: #997149 !important;
	text-align: center !important;
}

#container .col-md-2 {
	cursor: pointer;
}

.dropdown-menu {
	width: 100%;
}

.cell-sys {
	display: table;
	height: 60px;
}

.divname {
	display: table-cell;
	vertical-align: middle;
	height: 100%;
}

.headermenu>div {
	display: block;
}

.header {
	cursor: pointer;
	font-size: 1.8em;
	color: #ddd;
	font-family: "BMHANNAAir";
}

#groupmenu, #erpmenu {
	border-top: 5px solid transparent;
}

#erpmenu.active {
	background: rgba(158, 103, 66, 0.5);
	border-top: 6px solid #9e6742;
	color: #997149 !important;
	
}

#erpmenu:hover a {
	color: #fff;
}

#groupmenu.active {
	background: rgba(68, 104, 221, 0.5);
	border-top: 5px solid #4468dd;
}

#groupmenu:hover a {
	color: #fff;
}

#icono-mail{

 color: white;
 transform : scale(2);

}
#mail{
cursor: pointer;

}
#alarm{

cursor: pointer;

}
.col-md-2 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 16.66667%;
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
    height: 42px;
}
.col-md-3{
}
.col-md-4{
}


.coluser{
position:relative;
}
.collogout{
position:relative;
}
</style>

<div class="container-fluid"
	style="background-color: black; text-align: center; height: 42px" >
	<div class="row headermenu">

		<div class="col-md-2" style="margin-top: auto !important; vertical-align: middle;">
			 <a class="header" href="${cp }/main">
			 <span id="logo">EnDorPhin</span>
			 <!-- <img src="${cp }/upload/erpblack.jpg" style="width: 235px; height: 70px;" /> --></a>
		</div>

		<div id="erpmenu" class="col-md-2">
			<a class="header" href="${cp }/main">E R P</a>
		</div>

		<div id="groupmenu" class="col-md-2">
			<a class="header" href="${cp }/groupwareMain">그룹웨어</a>
		</div>
		
		<div class="coluser" style="margin-left: 24%">
			<%int cnt = 0; %>
			<c:forEach items="${Document_ref}" var="document">
				<c:if test="${document.sortation == '0' || document.sortation == '참조' }">
					<% cnt += 1;%>
					</c:if>
			</c:forEach>
			<%int signCnt = 0; %>
			<c:forEach items="${Document_ref}" var="document">
				<c:if test="${document.sortation == '0' }">
					<% signCnt += 1;%>
					</c:if>
			</c:forEach>
			<%int refCnt = 0; %>
			<c:forEach items="${Document_ref}" var="document">
				<c:if test="${document.sortation == '참조' }">
					<% refCnt += 1;%>
					</c:if>
			</c:forEach>
			<img id="alarm" src="/resources/css/bell.png" style="height: 38px; line-height: 1.8">
			 <span id="alarmCnt"><%=cnt %></span>
		</div>	

		<div class="collogout" style="margin-left: 10px" >
			<input type="hidden" id="signcnt" value="<%=signCnt %>">	
			<input type="hidden" id="refcnt" value="<%=refCnt %>">	
		    <img id="mail" alt="" src="/resources/css/mail.png" style="height: 35px; margin-right: 30px;">
		    <span id="mailCnt" style="line-height: 1.7" ></span>
		    <span id="userName" style="margin-right: 25px;  line-height: 1.8;" > ${employeeVo.deptname}팀 | ${employeeVo.userNm}님</span>
		
			<a id="atag" class="header" href="${cp }/login" > 
			 Logout
			 <img id="mail" alt="" src="/resources/css/logout.png" style="height: 23px">
			</a>
		</div>

	</div>
</div>

<!--  메시지 모달  -->
	<%@ include file="../websocket/receivedMessage.jsp"%>

<script>
    




$('#mail').click(function(){
	$('#receiveBtn').click();
	$('#newHAM').click();
});



  $('#alarm').click(function(){
	  swal({
		  title: $('#signcnt').val() + "개의 결재내역과  \n"+ +$('#refcnt').val()+"개의 참조내역이 있습니다.",
		  text: "해당 페이지로 이동하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $('#messageOK').click();
		   /*  swal("Poof! Your imaginary file has been deleted!", {
		      icon: "success",
		    }); */
		  } else {
		  }
		});
	
}); 
 

</script>
<a href="${cp}/receiveDocument" ><input id="messageOK" type="button" style="display: none;"></a>
