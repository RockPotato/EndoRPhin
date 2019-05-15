<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<style>
 #content-wrapper {
	animation: fadein 1.5s;
	-webkit-animation: fadein 1.5s;
	@font-face {
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
	 font-weight: 700;
	 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
	 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
	}
} 
 .modalSketchedHeader{
 	background-color: #6C757D;
 	color: #ffffff;
 }
@
keyframes fadein {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;
	
}

to {
	opacity: 1;
}
}
.col-md-10 > a:hover{
	color: #333;
}
</style>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EndoRPhin</title>

<!-- 버튼 css 삽입 -->
<link type="text/css" href="${pageContext.request.contextPath }/css/bttn.css" rel="stylesheet">

<!-- footer css -->
<link rel="stylesheet" href="/css/Footer-with-button-logo.css">
<link rel="stylesheet" href="/css/Footer-white.css">


<!-- 차트 js 삽입 -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/Chart.LlineBar.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/Chart.min.js"    ></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/Chart.StackedBar.js" type="text/javascript"></script> --%>
<!-- 차트 js 종료 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 달력API 시작 -->

<!-- html2Canvas -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<!-- 인쇄  -->
<script src="/js/print.min.js"></script>

<link href='/resources/packages/core/main.css' rel='stylesheet' />
<link href='/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='/resources/packages/timegrid/main.css' rel='stylesheet' />
<link href='/resources/packages/list/main.css' rel='stylesheet' />


<script src='/resources/packages/core/main.js'></script>
<script src='/resources/packages/interaction/main.js'></script>
<script src='/resources/packages/daygrid/main.js'></script>
<script src='/resources/packages/timegrid/main.js'></script>
<script src='/resources/packages/list/main.js'></script>
<script src='/resources/js/bootbox.all.min.js'></script>

 <!-- 나눔 고딕 테스트  --> 
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet"> 
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">

<!-- 달력API 종료 -->


<link href="${pageContext.request.contextPath}/css/dashboard.css"
	rel="stylesheet">
		<!-- 다음 주소찾기 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- Acoount Part Basic Style -->
<link type="text/css"
	href="${pageContext.request.contextPath }/css/accountBasic.css"
	rel="stylesheet">

<!-- dialog style -->
<link href="${pageContext.request.contextPath}/css/dialog.css"
	rel="stylesheet">
	
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css"
	rel="stylesheet">

<!-- font-awesome CSS -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- summernote CSS -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

<!-- menu CSS -->
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<script type="text/javascript" src="/js/function.js"></script>

<!-- left CSS -->
<link rel="stylesheet" type="text/css" href="/css/left.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />

<!-- newsTicker css -->
<link href="/css/tickit.css" rel="stylesheet" type="text/css" />


<!--달력css  -->
<!--  <link id="attitude" href="/css/bootstrap2.css" rel="stylesheet">  -->
<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script src="/SE2/js/HuskyEZCreator.js"></script>


<style>
.cont {
	background-color: #F5F4F0;
}
 #content-wrapper::-webkit-scrollbar { 
    display: none !important;
  }
</style>

</head>


<body id="page-top">
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="menu" />
	<div id="wrapper">
		<tiles:insertAttribute name="left" />

		<div id="content-wrapper" class="cont" style="height: 100%;overflow: scroll;min-height: 1200px;">
			<!-- <div class="container-fluid" > -->

			<!-- Contents Source -->
			<tiles:insertAttribute name="content" />
			<tiles:insertAttribute name="footer" />
		</div>
		<!-- /.container-fluid -->

	</div>
	
	<!-- /.content-wrapper -->
	<!-- /#wrapper -->


	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script src="/resources/vendor/datatables/jquery.dataTables.js"></script>
	<script src="/resources/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin.min.js"></script>
	
	<!-- news ticker css,js 삽입 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-advanced-news-ticker/1.0.1/js/newsTicker.js" type="text/javascript"></script>

	

	<!-- Demo scripts for this page-->
	<script src="/resources/js/demo/datatables-demo.js"></script>

	<!-- DATE API -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!-- javascript -->
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
		<!-- 다음 주소찾기 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- summernote js -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d85962867a0aa1c395c9034d7221b7e7&libraries=services,clusterer,drawing"></script>
	
</body>
<!-- ERP/그룹웨어 나누기 -->
<script>  
   
 if($('#erp_menu_container').length > 0){
   $('#groupmenu').removeClass('active');
   $('#erpmenu').removeClass('active');
   $('#erpmenu').addClass('active');
}else if($('#group_menu_container').length > 0){
   $('#erpmenu').removeClass('active');
   $('#groupmenu').removeClass('active');
   $('#groupmenu').addClass('active'); 
}
                          
 $(document).ready(function () {
     $('#sidebarCollapse').on('click', function () {
           $('#sidebar').toggleClass('active');
       });
 });
</script>
</html>