$("#myModal3In").click(function(){
		$("#myModal3").modal("show");
	});
	
function modalTrEvent(){
	$(".modalUserIdTr").off('click');
	$(".modalUserIdTr").on('click',function(){
		$("#searchUserIdInput").val($(this).find('td').eq(1).html());
		$("#myModal3").modal("hide");
	});
}
$("#modalSearchUserBtn").click(function(){
	$.ajax({
		method : "get",
		url : "/searchUserNmToPayment",
		data : "usernm=" + $("#modalSearchUserName").val(),
		success : function(data) {
			$(".modalUserIdTr").each(function(){$(this).remove()});
			for (var i = 0; i < data.length; i++) {
				$("#modalUserTbody").append('<tr class=\'modalUserIdTr\'><td>'+
											data[i].userId+'</td><td>'+
											data[i].userNm+'</td></tr>');
			}
			modalTrEvent();
		}
	});
})