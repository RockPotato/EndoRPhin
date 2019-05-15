<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
	display: table;
	height: 80px;
	position: relative;
}

.table td {
	display: table-cell;
	vertical-align: middle !important;
}
</style>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3>
			<i class="fa fa-calculator"></i>창고 관리
		</h3>
		<form action="/product/productInput" id="searchFrm" method="get">
			<table>
				<tr>
					<td>창고명 검색 :</td>
					<td><input type="text" class="search-query form-control"
						id="searchPay" name="productName" placeholder="Search" /></td>
					<td>
						<button class="bttn-fill bttn-md bttn-warning" type="button"
							id="searchBtn">
							<span class=" glyphicon glyphicon-search">검색</span>
						</button>
					</td>
				</tr>
			</table>
		</form>
		<form action="/wareHouse/deleteWareHouse" id="deleteFrm" method="post">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>창고번호</th>
							<th>창고명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allWareHouse}" var="vo">
							<tr class="wareTr" data-whcd="${vo.wareHouseCode}">
								<td><input type="checkbox" class="check" /><input
									type="hidden" class="wareCheck"></td>
								<td><a href="#detailLayer"
									class="bttn-stretch bttn-md bttn-warning wareDetail">${vo.wareHouseCode }</a></td>
								<td>${vo.wareHouseName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="선택 삭제">
				<button type="button"
					class="bttn-jelly bttn-md bttn-warning wareDetail"
					data-toggle="modal" style="margin-left: 20px"
					data-target="#detailLayer">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<form action="/wareHouse/insOrUpdWareHouse" id="dialogFrm" method="post">
<div class="dialog">
	<span class="dialog__close">&#x2715;</span> <label for="inputName">상품
		정보</label>
	<table id="dialogTable">
		<tr>
			<td><label for="InputEmail">창고번호(*)</label> <input type="text"
				id="dialog_wareCode" name="wareHouseCode"
				class="form-control needs" placeholder="자동 입력됩니다." readonly></td>
			<td><label for="inputPassword">창고명(*)</label> <input type="text"
				class="form-control needs" name="wareHouseName" id="dialog_wareName" placeholder="창고명을 입력해주세요" />
			</td>
			<td><label for="inputPassword">위치(*)</label> <input type="text"
				class="form-control needs" name="wareHouselocal" id="dialog_wareLoc" readonly />
			</td>
			<td>
				<br><button type="button" id="showMap" class="btn btn-default">
					지도 보기
				</button>
				<button type="button" id="updMap" class="btn btn-default">
					위치 수정
				</button>
			</td>
		</tr>
	</table>

	<input type="button" id="dialog_updBtn"
		class="btn btn-default modalUpd" value="수정" />
	<button id="dialog_delBtn"
		class="btn btn-default dialog__action modalUpd">삭제</button>
	<input type="button" id="dialog_insBtn"
		class="btn btn-default modalIns" value="등록" />
</div>
</form>
<!-- 지도 모달 창 -->
<div class="modal" id="myModal4" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="secondModalTitle"></h4>
				<button id="secondAddClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="container"></div>
			<div class="modal-body" id="mapModalBody">
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
			</div>
		</div>
	</div>
</div>

<script>
$("#dialog_updBtn,#dialog_insBtn").click(function(){
	$("#dialogFrm").submit();
})
$("#dialog_delBtn").click(function(){
	$("#dialogFrm").attr('action','/wareHouse/deleteWareHouse');
	$("#dialogFrm").submit();
})
function dialog() {
	$('#modalImg').attr('src','');

	var dialogBox = $('.dialog'), 
	wareDetail = $('.wareDetail'), 
	dialogChild = $('.dialog *'), 
	dialogClose = $('.dialog__close');
	secondModal = $("#myModal4");
	secondModalChild = $("#myModal4 *");

	// Open the dialog
	wareDetail.on('click', function(e) {
		dialogBox.toggleClass('dialog--active');
		if($(this).text()!='신규등록'){
			$(".modalIns").hide();
			$('.modalUpd').show();
			$.ajax({
				method : "post",
				url : "/wareHouse/findWareHouseCode",
				data : "wareHouseCode=" + $(this).parents(".wareTr").data("whcd"),
				success : function(data) {
					$('#dialog_wareCode').val(data.wareHouseCode);
					$('#dialog_wareName').val(data.wareHouseName);
					$('#dialog_wareLoc').val(data.wareHouselocal);
				}
			});
		}
		else{
			$('input[type=text]').val('');
			$(".modalIns").show();
			$('.modalUpd').hide();
		}
		e.stopPropagation()
	});

	// Close the dialog - click close button
	dialogClose.on('click', function() {
		dialogBox.removeClass('dialog--active');
	});

};
$(document).ready(function(){
	dialog();
});

$("#updMap").click(function(){
	 new daum.Postcode({
         oncomplete : function(data) {
            var addr = data.roadAddress+" "+data.buildingName;
            $("#dialog_wareLoc").val(addr);
         }
      }).open();
});

$("#showMap").click(function(){
	$('#mapModalBody').html('');
	$('#mapModalBody').append('<div id=\'map\' style=\'width:450px;height:400px;\'></div>');
	$("#myModal4").modal('show');
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($("#dialog_wareLoc").val(), function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("#dialog_wareLoc").val()+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
	map.relayout();
})
$("#checkAll").on("click", function() {
		if (this.checked == false) {
			$("input[class=check]").each(function() {
				this.checked = false;
			});
		} else {
			$("input[class=check]").each(function() {
				this.checked = true;
			});
		}
	});
$("#delProdBtn").click(function(){
	$("input[class=check]:checked").each(function(){
		$("#deleteFrm").append("<input type=\'hidden\' name=\'wareHouseCode\' value=\'"+
				$(this).closest('tr').data("whcd")+"\'/>");
	});
	$("#deleteFrm").submit();
});
</script>