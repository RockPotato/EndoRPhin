<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-9">
		<h2><i class="fa fa-calculator"></i>감가상각비</h2>
		<table class="table table-hover">
			<tr>
				<td>연도/년도 <select class="chosen-select" id="acquisitionDate">
								<option selected="selected"></option>
							</select>
				</td>
				<td>계정과목명 <input id="accountName" name="accountName" type="text"id="year" type="text" /> &nbsp
						   <input type="button" class="bttn-fill bttn-warning" id="seachBtn" value="검색"onclick="myClick();" />
				</td>
			</tr>
		</table>
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th>자산명</th>
					<th>자산코드</th>
					<th>취득일</th>
					<th>취득가액</th>
					<th>감가 상각비</th>
					<th>감가상각 누계액</th>
					<th>잔존가치</th>
					<th>내용연수</th>
					<th>장부반영</th>
				</tr>
			</thead>
			<tbody id="assetTbody">

				<c:forEach items="${depreciationList }" var="vo">
					<tr>
						<td>${vo.assetName }</td>
						<td>${vo.assetCode }</td>
						<td><fmt:formatDate value="${vo.acquisitionDate  }"	pattern="yyyy-MM-dd" /></td>
						<td>${vo.acquisitionPrice }</td>
						<td>${vo.depreciation }</td>
						<td>${vo.accumulated }</td>
						<td>${vo.residualvalue }</td>
						<td>${vo.serviceLife }</td>

						<!-- 데이트타입 스트링으로 변경 -->
						<c:set var="dates">
							<fmt:formatDate value="${vo.acquisitionDate  }"	pattern="yyyy/MM/dd" />
						</c:set>
						<td><c:if test="${vo.slipNumber == null }">
						<a class="bttn-stretch bttn-warning detailView"
																data-assetcode="${vo.assetCode }"
																data-acquisitiondate="${dates }"
																data-purchasecode="${vo.purchaseCode }"
																data-sanggakway="${vo.sanggakWay }"
																data-acquisitionprice="${vo.acquisitionPrice }"
																data-accountname="${vo.accountName }"
																data-clientname="${vo.clientName }"
																data-assetname="${vo.assetName }"
																data-residualvalue="${vo.residualvalue }"
																data-jukyo="${vo.jukyo }" data-sanggakcode="${vo.sanggakCode }"
																data-depreciation="${vo.depreciation }"
																data-accumulated="${vo.accumulated }">장부반영</a>
						</c:if></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</div>

<script>
	function Enter_Check() {
		// 엔터키의 코드는 13입니다.
		if (event.keyCode == 13) {
			$("#searchE_Btn").click(); // 실행할 이벤트
		}
	}
	/*계정과목 검색  */
	function myClick() {
		if ($("#accountName").val().trim() == "") {
			alert("계정과목명을 입력하세요.");
			$("accountName").focus();
			return false;
		}
		$.ajax({
			url : "${pageContext.request.contextPath }/assetDateSearch",
			data : "accountName=" + $("#accountName").val() + "&"	+ "acquisitionDate=" + $("#acquisitionDate").val(),
			success : function(data) {
				$("#accountName").val("");
				$("#assetTbody").html(data);
			}
		});
	}
	// 동적으로 날짜 년도 append
	function appendYear($select) {

		var date = new Date();
		var year = date.getFullYear();
		var idx = 0;
		for (var i = year - 10; i <= year; i++) {
			$select.prepend("<option value='"+i+"'>" + i + "년" + "</option>");
			idx++;
		}
		$select.find("option:eq(0)").prop("selected", true); // 현재년도 선택

	}

	appendYear($("#acquisitionDate"));

	/*장부반영 */
	$(".detailView").on("click",function() {
	
			$.ajax({
				url : "${pageContext.request.contextPath }/insertslipApply",
				data : "acquisitionDate="+ $(this).data().acquisitiondate
						+ "&" + "clientName="+ $(this).data().clientname + "&"
						+ "sanggakCode="+ $(this).data().sanggakcode + "&"
						+ "assetCode="+ $(this).data().assetcode + "&"
						+ "depreciation="+ $(this).data().depreciation,
				success : function(data) {

					alert("장부반영이 완료되었습니다.");
					location.reload();
					return false;

				}
			});
		});
</script>


