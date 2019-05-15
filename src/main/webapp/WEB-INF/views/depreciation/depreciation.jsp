<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	<h2><i class="fa fa-calculator"></i>감가상각비 입력</h2>
	<table class="table table-striped">
		<thead class="thead">
		</thead>
		<tr>
			<td>계정명 <input name="deptCode1" id="deptCode1" type="text" />
				&nbsp <input type="button" id="seachBtn" value="검색" /></td>
		</tr>
	</table>
		<table class="table table-hover">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck"
						onclick="allCheck();"></th>
					<th>회기</th>
					<th>상각년도</th>
					<th>상각월(시작)</th>
					<th>사각월(종료)</th>
					<th>감가상각비</th>
					<th>장부반영</th>
				</tr>
			</thead>
			<tbody id="deptListTbody">
				<c:forEach items="${assetList }" var="vo">
					<tr>
						<td><input type="checkbox" name="checkRow"
							value="${vo.assetCode }"></td>
						<td><a class="bttn-stretch bttn-warning detailView" onclick="fn_detail_tr();"
							href="#deptDetail1" data-upd_accountName="${vo.accountName }"
							data-upd_assetName="${vo.assetName }"
							data-upd_assetName="${vo.assetName }"
							data-upd_acquisitionDate="${vo.acquisitionDate }"
							data-upd_unit="${vo.unit }" data-upd_quantity="${vo.quantity }"
							data-upd_acquisitionPrice="${vo.acquisitionPrice }"
							data-toggle="modal">${vo.assetCode }</a></td>
						<td>${vo.assetName }</td>
						<td>${vo.accountName }</td>
						<td>${vo.assetName }</td>
						<td><fmt:formatDate value="${vo.acquisitionDate  }"
								pattern="yyyy-MM-dd" /></td>
						<td>${vo.acquisitionPrice }</td>
						<td><input type="button" value="장부반영" id="applybtn"
							name="applybtn" /></td>
					</tr>
					<div id="insertArea"></div>
				</c:forEach>
			</tbody>

			<tfoot align="center">
				<tr>
				</tr>
			</tfoot>
		</table>
<!--------------(삭제,등록) 버튼 ------------------->

		<button type="button" class="bttn-jelly bttn-warning" data-toggle="modal"
			data-target="#my80sizeModal3">등록</button>
	</div>
</div>

<!----------------- 등록 모달창 ---------------->
<div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog"
	aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h6>| 감가상각비 입력</h6>
				<button id="secondAddClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<th>회기(*) <input style="width: 150px;" type="text"
							class="form-control" id="number" name="number"></th>
					</tr>
					<tr>
						<th>상각기간(*) <select id="year" name="year">
								<option value="2019" selected="selected">2019년</option>
								<option value="2020">2020</option>
						</select> <select id="year" name="year">
								<option value="01" selected="selected">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
						</select>~ <select id="year" name="year">
								<option value="01" selected="selected">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
						</select></th>
					</tr>
					<tr>
						<th><button type="button" class="buttons"
								class="btn btn-default" data-dismiss="modal">닫기</button></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<script>

	
	function Enter_Check(){
	        // 엔터키의 코드는 13입니다.
	    if(event.keyCode == 13){
	    	$("#searchE_Btn").click();  // 실행할 이벤트
	    }
	}
    /*계정과목 검색  */
 	$("#searchE_Btn").on("click", function(){
 		if($("#establishNameKor").val().trim()==""){
 			alert("회사명을 입력하세요.");
 			$("establishNameKor").focus();
 			return false;
 		}
 		$.ajax({
 			url : "${pageContext.request.contextPath }/establishSearch",
 			data : "establishNameKor="+$("#establishNameKor").val(),
 			success : function(data){
 				$("#establishNameKor").val("");
 				$("#establishTbody").html(data);
 			}
  		});
 	});
 
	 function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}
	
	/* 전체선택삭제 */
	function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}

	/* 선택삭체*/
	function myclick() {
		var checkRow = '';
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
			$("#checkRow").val(checkRow);
			
		if(checkRow === ""){		
			alert("삭제할 대상을 선택하세요");
			return false;
		}
				$("#del_frm").submit();
	}
   
</script>


