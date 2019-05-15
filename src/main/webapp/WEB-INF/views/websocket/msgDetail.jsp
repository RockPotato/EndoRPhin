 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#markDetail, #sendDetail,#textMessageDetatil{
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
 <button id="msgDetailBtn" style="display: none;" >Open Modal</button>
 <form id="messagesendForm" onsubmit="return false;">
	<div id="messageDetailModal" class="modal message" style="cursor: move; z-index: 2000;">
		<div class="modal-content message-content" style="padding: 20px;">

				<h1 id="markDetail" style="margin-top: 30px; border-bottom-style:ridge; ">쪽지 상세내용</h1>
				<div id="sendDetail" class="row" style="margin-top: 10px;text-align: center;">
				<div style=" float: left; width: 30%;">보낸사람</div>
				<div style="float: left; text-align:left; width: 70%;">아이디 : <span id="userDetail"></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				이름 : <span id="nameDetail"></span>
				                                                    
				</div>
				</div>
				<textarea id="textMessageDetatil" style="margin-top: 10px;height: 200px;text-align: left;" class="form-control" rows="5" placeholder="내용을 입력하세요"
				name="content" readonly></textarea>
				
				<input id="deleteNo" type="hidden"/>
				
				<div id="send2" class="row" style="margin-top: 20px">
				<div style=" float: left; text-align:right; width: 60%;">
				                                                           
				</div>
				<div style="float: left; width: 40%;">
				<button id="dapjangBtn" type="button" style="background-color: #6E6867;"
				class="btn btn-info" >답장</button>
				<button id="deleteBtn" type="button" style="background-color: #6E6867;"
				class="btn btn-info" >삭제</button>
				<button id="closebtnDetail1" style="background-color: #6E6867;"
				class="btn btn-info" data-dismiss="modal">닫기</button>
				<button id="closebtnDetail2" type="button" class="close" style="display: none;">닫기</button>
				</div>
				</div>
		</div>
	</div>
		
		<input id="sendidDetail" name="sendid" type="hidden" value="${employeeVo.userId}">
		<input id="receiveidDetail" name="receiveid" type="hidden">
	
  </form>


<script type="text/javascript">



//Get the modal
var modal = document.getElementById('messageDetailModal');

// Get the button that opens the modal
var btn = document.getElementById("msgDetailBtn");

 // Get the <span> element that closes the modal
 var span = document.getElementsByClassName("close")[0];                                    

// When the user clicks on the button, open the modal 
 btn.onclick = function() {
	 messageDetailModal.style.display = "block";
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




 $('#dapjangBtn').click(function(){
	 var userDetail = $('#userDetail').html();
	 var nameDetail = $('#nameDetail').html();
	 
	 $('#userSend').html(userDetail);
	 $('#nameSend').html(nameDetail);
	 $('#receiveid').val(userDetail);
	 $('#messageDetailModal').css('display','none');
	 $('#myBtn').click();
 });


$('#deleteBtn').click(function(){
	
	var deleteNo = $('#deleteNo').val();
	
	$.ajax({
  		url : "${pageContext.request.contextPath }/deleteNoteNo",
  		method : "get",
  		data :{deleteNo : deleteNo}, 
  		success : function(data){
  			swal("정상 삭제 되었습니다!");
  			 $('#messageDetailModal').css('display','none');
  			$('#receiveHAM').click();
  			
  		}
  	}); 
	
});


 $(function() {
	$( "#messageModal" ).draggable();
});
 
 
  $('#closebtnDetail1').click(function(){
	  console.log('클릭');
	  $('#textMessage').val('');
	  $('#messageDetailModal').css('display','none');
 }); 
                          


</script>
