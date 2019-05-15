<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Site-Enter" content="RevealTrans(Duration=4,Transition=23)">

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>login </title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="/css/login.css">

</head>

<body>
    <%-- 파라미터 전송을 위해 신경쓸 부분
                     1. 어디로 보내는지 ?? : form action 속성
                     --> 로그인 처리 요청 : LoginServlet doPost
                    2. 어떻게 보낼지 ?? : form method 속성
                    --> post : 사용자 비밀번호같이 보안 이슈가 발생할 수 있는 상황이므로 get 방식으로 보내지 않는다.
                    3. 뭘 보낼지 ?? : input, select, textarea의 name 속성
                    --> userId, password --%>
    <div class="container">

        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>비밀번호 찾기</h3>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form class="form-signin" action="/findPassSave" method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input name="userId" id="userId" type="text" class="form-control" placeholder="아이디" required autofocus>

                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="far fa-envelope-open"></i></span>
                            </div>
                            <input name="email" id="email" type="text" class="form-control" placeholder="이메일">
                        </div>
                        <div class="row align-items-center remember">
                        </div>
                        <div class="form-group">
                            <button data-transition="pop" class="btn btn-lg btn-primary btn-block" type="button" id="findPass">Find PassWord</button>
                            <button data-transition="pop" onclick="history.go(-1);" class="btn btn-lg btn-primary btn-block" type="button" id="findId">Cancel</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer">
				<div class="d-flex justify-content-center">
					<a href="/login">go to loginPage</a>
				</div>
<!--                 <div class="card-footer"> -->
<!--                     <div class="d-flex justify-content-center"> -->
<!--                         <a href="#">Forgot your password?</a> -->
<!--                     </div> -->
<!--                     <div class="d-flex justify-content-center"> -->
<!--                         <a href="#">Forgot your id?</a> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${cp}/js/cookieUtil.js"></script>
<script src="${cp}/js/js.cookie.js"></script>
<script>
	
    $(document).ready(function() {

        $("#email").keydown(function(key) {
            if (key.keyCode == 13)
                findInfo();
        });

        // findId button 클릭 이벤트 핸들러
        $("#findPass").click(function(){
	    	 <c:if test="${msg != null}">
	    	 	alert("${msg}");
	    	 </c:if>
        	findInfo();
        });
    });

    function findInfo() {
    	if ($("#userId").val().trim() == "") {
    	     alert("아이디를 입력해주세요.");
    	     $("#userNm").focus();
    	     return false;
    	 }
    	 
    	 if ($("#email").val().trim() == "") {
    	     alert("이메일을 입력해주세요.");
    	     $("#BirthDate").focus();
    	     return false;
    	 }
        $("form").submit();
    }

</script>
<style>
    .container {
        animation: fadein 2s;
        -webkit-animation: fadein 2s;
    }

    @keyframes fadein {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    @-webkit-keyframes fadein {

        /* Safari and Chrome */
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

</style>

</html>
