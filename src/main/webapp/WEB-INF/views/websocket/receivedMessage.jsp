 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.overtext{
display:inline-block;
 overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width: 200px;
  height: 50px;
}
#receivedModal { 
    position: fixed; 
    top: 0; 
    right: 0; 
    bottom: 0; 
    left: 0; 
    z-index: 1050; 
    display: none; 
    overflow: hidden; 
    -webkit-overflow-scrolling: touch; 
    outline: 0; 
} 

#receiveBtn{

display: none;

}


#reciveHeader{
color : black;
font-family: 'BMHANNAAir', sans-serif;
font-family: 'BMHANNAAir', cursive;
font-size: 2em;
cursor: pointer;
}
#receiveMessageHAM{
color : black;
font-family: 'BMHANNAAir', sans-serif;
font-family: 'BMHANNAAir', cursive;
font-size: 2em;
cursor: pointer;


}

#receiveMessageHAM tr:hover{
background-color: #CEF6F5 !important;
cursor: pointer;  

}

 #receiveScroll::-webkit-scrollbar { 
    display: none !important;
  }


</style>
                          
                                    
<button id="receiveBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#receivedModal">
</button>


<div class="modal fade receive" id="receivedModal"
aria-hidden="true" aria-labelledby="myLargeModalLabel" style="cursor: move; z-index: 1060;">
  <div class="modal-dialog modal-lg receive" role="document">
    <div id="receiveScroll" class="modal-content" style="height: 800px;overflow: scroll;">
      <div class="modal-header modalSketchedHeader">
      	<div id="reciveHeader" class="container-fluid">
				<div class="row" style="text-align: center;" >
					<div class="col-md-4" id="receiveHAM">
					<span style="color: #fff">받은 쪽지함</span>
					</div>
					<div class="col-md-4" id="newHAM">
					<span style="color: #fff">새로온 쪽지함</span>
					</div>
					<div class="col-md-4" id="sendHAM">
					<span style="color: #fff">보낸 쪽지함</span>
					</div>
				</div>
			</div>
      </div>
      <div class="modal-body" >
                         
     				 <table id="receiveMessageHAM" class="table table-hover" >
					
					</table>
      
      
      </div>
      <div class="modal-footer" >
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>





<script>

$(function() {
	$( "#receivedModal" ).draggable();
});


        


$('#sendHAM').click(function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/sendHAM",
		method : "get",
		success : function(data) {
			
				var html = "";
			
			for (var i = 0; i < data.length; i++) {
				var user = data[i];
				
				html +=  "<tr class='boardTr' data-sendid="+user.sendid+" data-usernm= "+user.usernm+" data-noteno= "+user.noteno+" data-content= \'"+user.content+"\'>";
				html +=  "<td>보낸사람 :<strong>"+user.usernm+"</strong></td>";
				 html +=  "<td>내용 :</td>";
				html +=  "<td class='overtext'><strong>"+user.content+"</strong></td>"; 
				html +=  "<td>보낸시간 :</td>";
				html +=  "<td class='overtext'><strong>"+user.senddate+"</strong></td>";
				html +=  "</tr>";
			}
			
			$("#receiveMessageHAM").html(html);
			
			sendMsgClick();
		}
		
	}); 
	
});
var messageLength = "";







$(document).ready(function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/newHAM",
		method : "get",
		success : function(data) {
			 messageLength = data.length;
			$("#mailCnt").html(messageLength);
		}
	}); 
});




$('#newHAM').click(function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/newHAM",
		method : "get",
		success : function(data) {
			
			 messageLength = data.length;
			$("#mailCnt").html(messageLength);
				var html = "";
			
			for (var i = 0; i < data.length; i++) {
				var user = data[i];
				
				html +=  "<tr class='boardTr' data-sendid="+user.sendid+" data-usernm= "+user.usernm+" data-noteno= "+user.noteno+" data-content= \'"+user.content+"\'>";
				html +=  "<td>보낸사람 :<strong>"+user.usernm+"</strong></td>";
				 html +=  "<td>내용 :</td>";
				html +=  "<td class='overtext'><strong>"+user.content+"</strong></td>"; 
				html +=  "<td>보낸시간 :</td>";
				html +=  "<td class='overtext'><strong>"+user.senddate+"</strong></td>";
				html +=  "</tr>";
			}
			
			$("#receiveMessageHAM").html(html);
			
			dbReceiveClick();
		}
		
	}); 
	
});


$('#receiveHAM').click(function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/receiveHAM",
		method : "get",
		success : function(data) {
			
				var html = "";
			
			for (var i = 0; i < data.length; i++) {
				var user = data[i];
				
				html +=  "<tr class='boardTr' data-sendid="+user.sendid+" data-usernm= "+user.usernm+" data-noteno= "+user.noteno+" data-content= \'"+user.content+"\'>";
				html +=  "<td>보낸사람 :<strong>"+user.usernm+"</strong></td>";
				 html +=  "<td>내용 :</td>";
				html +=  "<td class='overtext'><strong>"+user.content+"</strong></td>"; 
				html +=  "<td>보낸시간 :</td>";
				html +=  "<td class='overtext'><strong>"+user.senddate+"</strong></td>";
				html +=  "</tr>";
			}
			
			$("#receiveMessageHAM").html(html);
			
			dbReceiveClick();
		}
		
	}); 
	
});



var userid = '${employeeVo.userId}';

function dbReceiveClick() {
	$('.boardTr').dblclick(function(){
		  var sendid  = $(this).data().sendid;
		  var usernm  = $(this).data().usernm;
		  var noteno  = $(this).data().noteno;
		  var content  = $(this).data().content;
		  
		  $.ajax({
				url : "${pageContext.request.contextPath }/receivedateUpdate",
				method : "get",
				data : {"noteno" : noteno}
			});
		
		  
			$("#deleteNo").val(noteno);
			$("#userDetail").html(sendid);
			$("#nameDetail").html(usernm);
			$("#textMessageDetatil").val(content);
			$("#receiveidDetail").val(sendid); 
			 $('#msgDetailBtn').click();  
			 
			 $('#dapjangBtn').css('display','inline');
		                        
		  
	});
	
}
function sendMsgClick() {
	$('.boardTr').dblclick(function(){
		  var sendid  = $(this).data().sendid;
		  var usernm  = $(this).data().usernm;
		  var noteno  = $(this).data().noteno;
		  var content  = $(this).data().content;
		  
			$("#deleteNo").val(noteno);
			$("#userDetail").html(sendid);
			$("#nameDetail").html(usernm);
			$("#textMessageDetatil").val(content);
			$("#receiveidDetail").val(sendid); 
			 $('#msgDetailBtn').click();  
			 
			 $('#dapjangBtn').css('display','none');
			 
		  
	});
	
}



</script>












