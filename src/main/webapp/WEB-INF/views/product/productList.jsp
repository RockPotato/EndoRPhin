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
		<h3><i class="fa fa-calculator"></i>상품 등록</h3>
		<form action="/product/productInput" id="searchFrm" method="get">
			<table>
				<tr>
					<td>상품명 검색 :</td>
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
		<form action="/product/deleteProduct" id="deleteFrm" method="post">
			<input type="hidden" name="deprostatus" value="2" />
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>규격</th>
							<th>개요</th>
							<th>사용구분</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allProductList}" var="vo">
							<tr class="productTr" data-pdcd="${vo.productCode}">
								<td><input type="checkbox" class="check" /><input
									type="hidden" class="valProd"></td>
								<td><a href="#detailLayer"
									class="bttn-stretch bttn-md bttn-warning productDetail">${vo.productCode }</a></td>
								<td>${vo.productName}</td>
								<td>${vo.standard}</td>
								<td>${vo.outLine}</td>
								<td>${vo.usestatus}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="선택 삭제">
				<button type="button" class="bttn-jelly bttn-md bttn-warning productDetail"
					data-toggle="modal" style="margin-left: 20px"
					data-target="#detailLayer">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<form action="/product/deleteProduct" id="dialogFrm" method="post" enctype="multipart/form-data">
	<div class="dialog">
		 <span class="dialog__close">&#x2715;</span> <label for="inputName">상품 정보</label>
		 <input type="hidden" name="productCode" id="dialog_productCode"/>
			<table id="dialogTable">
				<tr>
					<td>
						<label for="InputEmail">상품명(*)</label>
						<input type="text" id="dialog_ProductName" name="productName" class="form-control needs"
							placeholder="공제명을 입력해주세요">
					</td>
					<td>
						<label for="inputPassword">규격명(*)</label>
						<input type="text" class="form-control needs" name="standard"
							id="dialog_standard" /> 
					</td>
					<td><label for="inputPassword">기본 가격(*)</label>
						<input type="text" class="form-control needs" name="basePrice"
							id="dialog_basePrice" /> </td>
					<td rowspan="2">
						<input id="modalFileInput" type="file" class="form-control" name="fileName">
						<img src="" style="width:200px; height: 180px;" id="modalImg">
					</td>
				</tr>
				<tr>
					<td><span><label for="inputPassword">개요</label><br/>
						<input type="text" class="form-control" name="outLine"
							id="dialog_outLine" /></span>
					</td>
					<td><label for="inputPassword">사용여부</label>
						<select name="usestatus" class="form-control" id="dialog_useStatus">
							<option value="1">예</option>
							<option value="2">아니오</option>
						</select>
					</td>
				</tr>
			</table>
		
		<input type="button" id="dialog_updBtn" class="btn btn-default modalUpd" value="수정" />
		<button id="dialog_delBtn" class="btn btn-default dialog__action modalUpd">삭제</button>
		<input type="button" id="dialog_insBtn" class="btn btn-default modalIns" value="등록" />
	</div>
</form>

<script>
	$("#searchBtn").on("click", function() {
		if ($("#searchPay").val() != "") {
			$("#searchFrm").submit();
		} else
			alert("문자를 입력하세요!")
	})
	$(document).ready(function() {
		dialog();
		$("#dialog_insBtn,#dialog_updBtn").click(function(){
			var check = true;
			$("#dialogFrm").attr('action','/product/insOrUpdProduct');
			$('.needs').each(function(){
				if($(this).val()==''){
					alert("필수항목을 입력하세요.");
					check=false;
					return false;
				}
			});
			if(check){
				$("#dialogFrm").submit();
			}
		});
		$("#dialog_delBtn").click(function(){$("#dialogFrm").attr('action','/product/deleteProduct');});
	});
	
function dialog() {
		$('#modalImg').attr('src','');
	
		var dialogBox = $('.dialog'), 
		productDetail = $('.productDetail'), 
		dialogChild = $('.dialog *'), 
		dialogClose = $('.dialog__close');

		// Open the dialog
		productDetail.on('click', function(e) {
			$("#dialog_productCode").val('');
			$("#modalImg").attr('src','');
			dialogBox.toggleClass('dialog--active');
			if($(this).text()!='신규등록'){
				$(".modalIns").hide();
				$('.modalUpd').show();
				$.ajax({
					method : "post",
					url : "/product/findProductCode",
					data : "productCode=" + $(this).parents(".productTr").data("pdcd"),
					success : function(data) {
						$("#dialog_productCode").val(data.productCode);
						$("#dialog_ProductName").val(data.productName);
						$("#dialog_basePrice").val(data.basePrice);
						$("#dialog_standard").val(data.standard);
						$("#dialog_useStatus").val(data.usestatus);
						$("#dialog_outLine").html(data.outLine);
						$("#modalImg").attr('src','/images/getImage?imageName='+encodeURI(data.imageName));
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

		// Close the dialog - press escape key // key#27
		$(document).keyup(function(e) {
			if (e.keyCode === 27) {
				dialogBox.removeClass('dialog--active');
			}
		});

		// Close dialog - click outside
		$(document).on(
				"click",
				function(e) {
					if ($(e.target).is(dialogBox) === false 
							&& $(e.target).is(dialogChild) === false) {
						dialogBox.removeClass("dialog--active");
					}
				});
		function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                $('#modalImg').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }

	    $("#modalFileInput").change(function() {
	        readURL(this);
	    });

	};
	
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
	$("#delProdBtn").on(
			"click",
			function() {
				if($("input[class=check]:checked").length==0){
					alert("선택 하지 않으셨습니다.");
					return false;
				}
				
				$("input[class=check]:checked").each(
						function() {
							$(this).siblings(".valProd").attr("value",
									$(this).parents('.productTr').data('pdcd'));
							$(this).siblings('.valProd').attr("name",
									"productCode");
						});
				$("#deleteFrm").submit();
	});
</script>
