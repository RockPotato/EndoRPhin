<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
#spanMsgSwal{
color : black;
font-family: 'Black Han Sans', sans-serif;
font-family: 'Poor Story', cursive;
font-size: 2em;
}
#sendBtn{
color : black;
font-family: 'Black Han Sans', sans-serif;
font-family: 'Poor Story', cursive;
font-size: 2em;
text-align: center;
background-color: #FFFFFF!important; 
border-radius: 5px;
margin-left: 20px;
margin-top: 200px;
}
#message{
color : black;
font-family: 'Black Han Sans', sans-serif;
font-family: 'Poor Story', cursive;
font-size: 2em;
text-align: center;
background-color: #FFFFFF!important; 
border-radius: 5px;
width: 225px !important;
height: 50px;
margin-top: 200px;
}

#data{
color : white;
font-family: 'BMHANNAAir', sans-serif;
font-family: 'BMHANNAAir', cursive;
font-size: 1.93em;
}
                 
   #test123::-webkit-scrollbar { 
    display: none !important;
  } 
  #messageSpan{
  
  padding : 10px;
  border-radius :5px;
  background-color: #FFFFFF;
  color: black;
  
  margin-left: 70px;
  position: relative; bottom: 30px;
  
  display: inline-block;
  width: 200px;
  word-wrap: break-word;
 
  }
  #nameSpan{
  color : black;
  position: relative; bottom: 10px;
  
  } 
  #timeSpan{
  font-size : 0.7em;
  color : black;
  position: relative; left: 0px;
  position: relative; bottom: 50px;
     
  
  } 

</style>

		<div id="test123" style="overflow: scroll; height: 500px;">
        <div id="data"></div>
		</div>
		<div style="float: left; width: 70%;">
			<input type="text" class="form-control" id="message" />
		</div>
		<div style="float: left; width: 30%;">
			<button type="button" class="btn btn-primary" id="sendBtn">전송</button>
		</div>
                                               
              
              
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script>

        $(document).ready(function() {

               $("#sendBtn").click(function() {

                       sendMessage();

                       $('#message').val('')

               });



               $("#message").keydown(function(key) {

                       if (key.keyCode == 13) {// 엔터
							
                              sendMessage();

                              $('#message').val('')

                       }

               });

        });

        // 웹소켓을 지정한 url로 연결한다.

        let sock = new SockJS("<c:url value="/echo"/>");

        sock.onmessage = onMessage;

        sock.onclose = onClose;

        
        // 메시지 전송

        function sendMessage() {
        	
        	var userId = '${employeeVo.userId}';
        	var userNm = '${employeeVo.userNm}';
        	var deptname = '${employeeVo.deptname}';

            sock.send(deptname+"팀"  + "&nbsp;" + userNm + "   " +$("#message").val()+ "   " +userId+"erpCheck=msg");
        }
        // 서버로부터 메시지를 받았을 때
        function onMessage(msg) {
        		var userid = '${employeeVo.userId}';
        		var d = new Date();
        		var data = new Array();
               data = msg.data.split('   ');
               if(data[1]!=null){
            	   var userid=data[2].split("erpCheck=msg");
	               $("#data").append(
			    		"<img style='height: 70px; width: 60px; border-radius:15px;'src='${cp}/employee/profileImg?userId="
			    		+userid[0]+"'><span id='nameSpan'>"
			    		+data[0]+" </span><br/><span id='messageSpan'>"
			    		+data[1]+"</span><br/><span id='timeSpan'>"
			    		+d.getHours() + "시 " 
			    		+ d.getMinutes() + "분 "+" </span><br/>");                                                          
	               
	               $('#test123').scrollTop(999999);
               }else{
            	   swal(msg.data+"가 왔습니다", "");
               }
        }


        // 서버와 연결을 끊었을 때

        function onClose(evt) {
               $("#data").append("연결 끊김");
        }

</script>