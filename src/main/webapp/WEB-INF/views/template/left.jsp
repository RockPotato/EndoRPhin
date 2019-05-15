 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- <link rel="stylesheet" href="icono.min.css"> -->

<style>

#emplList{
color : white;
font-family: 'BMHANNAAir', sans-serif;
font-family: 'BMHANNAAir', cursive;
font-size: 1.4em;

}

.wrapper {
    display: flex;
    align-items: stretch;
    perspective: 1500px; 
}


                    
#sidebar {
    min-width: 320px;
    max-width: 320px;
    background: #626867;
    color: #fff;
    transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665);
    transform-origin: center left; 
}

#sidebar.active {
    margin-left: -308px;
    transform: rotateY(100deg); 
}

                    

                    
 #icon i{
	color: white;
	transform : scale(2);
} 

 #icon div:hover{
cursor: pointer;    
transform : scale(1.2);
   }





#emplList tr:hover{
background-color: #CEF6F5 !important;
cursor: pointer;  

}

 #test::-webkit-scrollbar { 
    display: none !important;
  }

</style>
            

<div class="wrapper">
	<!-- Sidebar  -->
	<nav id="sidebar" class="active" >
		<div class="sidebar-header">
			<div id="icon" class="row" style="margin-top: 30px">
			<div class="col-md-3">
				</div>
				<div class="col-md-3" style="margin-top: 8px">
					<i id="icono-user" class="icono-user"></i>
				</div>
				<div class="col-md-1">
				</div>
				<div class="col-md-3">
					<i id="icono-disqus" class="icono-disqus" style="margin-bottom: 10px"></i>
				</div>
				
			</div>
			
			
			

			<div id="userLisrMessage" class="row" style="margin-top: 20px;display: none;">
				<div class="col-md-1"></div>
				<div id="test" class="col-md-10" style="overflow: scroll; height: 700px; ">
					<table id="emplList" class="table table-hover">
					
					
					</table>
				</div>
			</div>
			        
			<div id="chattingDIV" class="row"  style="margin-top: 20px; padding : 20px;  display: none;" >
				<%@ include file="../websocket/websocket.jsp"%>
			</div>

		</div>
	</nav>
</div>

 <!--  메시지 모달  -->
	<%@ include file="../websocket/message.jsp"%>
	<%@ include file="../websocket/msgDetail.jsp"%>

<script>


$('#icono-user').click(function(){
	$('#chattingDIV').css('display', 'none');
	$('#userLisrMessage').css('display', 'block');
	$('#sidebar').css('background','#626867');

	$.ajax({
		url : "${pageContext.request.contextPath }/emplView",
		method : "get",
		success : function(data) {
			
			var html = "";
			
			for (var i = 0; i < data.length; i++) {
				var user = data[i];
				
				html +=  "<tr class='noteBoardTr' data-userid="+user.userId+" data-usernm= "+user.userNm+">";
				html +=  "<td><i class='icono-user'></i></td>";
				html +=  "<td>"+user.deptname+'팀'+"</td>";
				html +=  "<td><strong>"+user.userNm+"</strong></td>";
				html +=  "</tr>";
			}
			
			$("#emplList").html(html);
			
			dbClick();

		}
	});
	
	
});


$('#icono-disqus').click(function(){
	$('#chattingDIV').css('display', 'block');
	$('#userLisrMessage').css('display', 'none');
	$('#sidebar').css('background','#B2C7D9');
	
});

function dbClick(){
	$('.noteBoardTr').dblclick(function(){
		  var userid  = $(this).data().userid;
		  var usernm  = $(this).data().usernm;
		
			$("#userSend").html(userid);
			$("#nameSend").html(usernm);
			$("#receiveid").val(userid);
	 	$('#myBtn').click(); 
		
		
		  
	});

}

</script>

