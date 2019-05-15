 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mark, #send, #send2{
color : black;
font-family: 'BMHANNAAir', sans-serif;
font-family: 'BMHANNAAir', cursive;
font-size: 2em;
text-align: center;

}


/* The Modal (background) */
.message {
  /*   display: none; /* Hidden by default */ */
    position: fixed; /* Stay in place */
    z-index: 1070; /* Sit on top */
    left: 0;
    top: 0;
    width: 600px; /* Full width */
    height: 400px; /* Full height */
   /*  overflow: auto; */ /* Enable scroll if needed */
   /*  background-color: rgb(0,0,0); /* Fallback color */ 
    /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ 
    margin-left: 300px;
    margin-top: 150px;
}

/* Modal Content/Box */
.message-content{
    border: 1px solid #888;
    background-color: #fefefe;
   /*  margin: 15% auto;  *//* 15% from the top and centered */
    width: 600px; /* Could be more or less, depending on screen size */
    height: 400px;                          
}





/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 15px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}




</style>
</head>
<body>
 <button id="myBtn" style="display: none;" >Open Modal</button>
 <form id="messagesendForm" onsubmit="return false;">
	<div id="messageModal" class="modal message" style="cursor: move; z-index: 2000">
		<div class="modal-content message-content" style="padding: 20px">

				<h1 id="mark" style="margin-top: 30px;  border-bottom-style:ridge;" >쪽지 보내기</h1>
				<div id="send" class="row" style="margin-top: 10px">
				<div style=" float: left; width: 30%;">받는사람</div>
				<div style="float: left; text-align:left; width: 70%;">아이디 : <span id="userSend"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				이름 : <span id="nameSend"></span>
				
				</div>
				</div>
				<textarea id="textMessage" style="margin-top: 10px;height: 200px;  background-color: #e9ecef;" class="form-control" rows="5" placeholder="내용을 입력하세요"
				name="content"  ></textarea>
				
				<div id="send2" class="row" style="margin-top: 20px">
				<div style=" float: left; text-align:right; width: 80%;">
				<button id="sendMessageBtn" type="button"class="btn btn-outline-secondary" >전송</button>
				</div>
				<div style="float: left; width: 20%;">
				<button id="closebtn1" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button id="closebtn2" type="button" class="close" style="display: none;">닫기</button>
				</div>
				</div>
				
		</div>
	</div>
	
		<input id="sendid" name="sendid" type="hidden" value="${employeeVo.userId}">
		<input id="receiveid" name="receiveid" type="hidden">
	
  </form>


<script type="text/javascript">


//Get the modal
var modal = document.getElementById('messageModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

 // Get the <span> element that closes the modal
 var span = document.getElementsByClassName("close")[0];                                    

// When the user clicks on the button, open the modal 
 btn.onclick = function() {
	 messageModal.style.display = "block";
}  

 // When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
} 

// When the user clicks anywhere outside of the modal, close it
 window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
} 





 $(function() {
	$( "#messageModal" ).draggable();
});
 
 
 
 
  $('#closebtn1').click(function(){
	  $('#textMessage').val('');
	  $('#messageModal').css('display','none');
 }); 
                          
  
  
  $('#sendMessageBtn').click(function(){
  	 var messageParam = $('#messagesendForm').serialize(); 
  	 console.log(messageParam);
  	
   $.ajax({
  		url : "${pageContext.request.contextPath }/messageSending",
  		method : "get",
  		data :messageParam, 
  		async:false,
  		success : function(data){
  			var str = $(this).prop('url').split('receiveid=');
  			sock.send(str[1]+"erpCheck=note");
  		}
  	}); 
   
   
   $('#textMessage').val('');
   $('#messageModal').css('display','none');
  	
   
  });



</script>
</body>
</html> 