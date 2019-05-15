<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row">
	<div class="col-md-10" id="printDiv">


	<h3>${startDate } ~ ${endDate }</h3>
		<c:if test="${map51.size()==0}">
			<h3>내역이 없습니다.</h3>
		</c:if>
		<c:if test="${map51.size()>0 }">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<td colspan="4">구분</td>
					<td>금액</td>
					<td>세액</td>
				</tr>
			</thead>
			 
			<tbody>
				<tr>
					<td rowspan="9">매출</td>
					<td rowspan="4">과세</td>
					<td>세금계산서발급분</td>
					<td>1</td>
					<!-- 금액/ 세액 -->
					<c:if test="${map51.size()>0&&map51.get(1)!=null}">
						<td><fmt:formatNumber value="${map51.get(1).get('SUPPLYVALUE') }" pattern="#,###" /></td>
						<td class="sell"><fmt:formatNumber value="${map51.get(1).get('SURTAX') }" pattern="#,###" /></td>
					</c:if>
					<c:if test="${map51.size()>0&&map51.get(1)==null}">
						<td><fmt:formatNumber value="0" pattern="#,###" /></td>
						<td class="sell"><fmt:formatNumber value="0" pattern="#,###" /></td>
					</c:if>
					
				</tr>

				<tr>
					<td>매입자발행세금계산서</td>
					<td>2</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="sell"></td>
				</tr>

				<tr>
					<td>신용카드/현금영수증발행분</td>
					<td>3</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="sell"></td>
				</tr>

				<tr>
					<td>기타(정규영수증외매출분)</td>
					<td>4</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="sell"></td>
				</tr>

				<tr>
					<td rowspan="2">영세</td>
					<td>세금계산서발급분</td>
					<td>5</td>
					<!-- 금액/ 세액 -->
					<c:if test="${map51.size()>3&&map51.get(3)!=null}">
						<td><fmt:formatNumber value="${map51.get(3).get('SUPPLYVALUE') }" pattern="#,###" /></td>
						<td class="sell"><fmt:formatNumber value="${map51.get(3).get('SURTAX') }" pattern="#,###" /></td>
					</c:if>
					<c:if test="${map51.size()<3}">
						<td><fmt:formatNumber value="0" pattern="#,###" /></td>
						<td class="sell"><fmt:formatNumber value="0" pattern="#,###" /></td>
					</c:if>
				</tr>

				<tr>
					<td>기타</td>
					<td>6</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="sell"></td>
				</tr>

				<tr>
					<td colspan="2">예정신고누락분</td>
					<td>7</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="sell"></td>
				</tr>

				<tr>
					<td colspan="2">대손세액가감</td>
					<td>8</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="sell"></td>
				</tr>

				<tr>
					<td colspan="2">합계</td>
					<td>9</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td style="font-weight: bold; font-size: medium;" id="sellSum"></td>
				</tr>




				<tr>
					<td rowspan="10">매입</td>
					<td rowspan="3">세금계산서수취분</td>
					<td>일반매입</td>
					<td rowspan="2">10</td>
					<!-- 금액/ 세액 -->
					<c:if test="${map51.size()>0&&map51.get(0)!=null}">
						<td><fmt:formatNumber value="${map51.get(0).get('SUPPLYVALUE') }" pattern="#,###" /></td>
						<td  class="purchase"><fmt:formatNumber value="${map51.get(0).get('SURTAX') }" pattern="#,###" /></td>
					</c:if>
					<c:if test="${map51.size()==0}">
						<td><fmt:formatNumber value="0" pattern="#,###" /></td>
						<td  class="purchase"><fmt:formatNumber value="0" pattern="#,###" /></td>
					</c:if>
				</tr>

				<tr>
					<td>수출기업수입분납유예</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="purchase"></td>
				</tr>

				<tr>
					<td>고정자산매입</td>
					<td>11</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="2">예정신고누락분</td>
					<td>12</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="purchase"></td>
				</tr>

				<tr>
					<td colspan="2">매입자발행세금계산서</td>
					<td>13</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="purchase"></td>
				</tr>

				<tr>
					<td colspan="2">그밖의공제매입세액</td>
					<td>14</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td class="purchase"></td>
				</tr>

				<tr>
					<td colspan="2">합계</td>
					<td>15</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="2">공제받지못할매입세액</td>
					<td>16</td>
					<!-- 금액/ 세액 -->
					<c:if test="${map51.size()>2&&map51.get(2)!=null}">
						<td><fmt:formatNumber value="${map51.get(2).get('SUPPLYVALUE') }" pattern="#,###" /></td>
						<td id="subPurchase"><fmt:formatNumber value="${map51.get(2).get('SURTAX') }" pattern="#,###" /></td>
					</c:if>
					<c:if test="${map51.size()<=2}">
						<td><fmt:formatNumber value="0" pattern="#,###" /></td>
						<td id="subPurchase"><fmt:formatNumber value="0" pattern="#,###" /></td>
					</c:if>
				</tr>

				<tr>
					<td colspan="2">차감계</td>
					<td>17</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td style="font-weight: bold; font-size: medium;" id="purchaseSum"></td>
				</tr>

				<tr>
					<td colspan="4">납부(환급)세액(매출세액-매입세액)</td>
					<!-- 세액 -->
					<td style="font-weight: bold; font-size: medium;" id="resultTax"></td>
				</tr>


				<tr>
					<td rowspan="3">경감공제세액</td>
					<td colspan="2">그밖의경감공제새액</td>
					<td>18</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td id="etc1"></td>
				</tr>

				<tr>
					<td colspan="2">신용카드매출전표등발행공제</td>
					<td>19</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td id="etc2"></td>
					
				</tr>

				<tr>
					<td colspan="2">합계</td>
					<td>20</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td id="resultTax2"></td>
				</tr>

				<tr>
					<td colspan="3">예정신고미홥금세액</td>
					<td>21</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3">예정고지세액</td>
					<td>22</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3">사업양수자의대리납부기납부세액</td>
					<td>23</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3">매입자납부특례기납부세액</td>
					<td>24</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3">신용카드업자의대리납부기납부세액</td>
					<td>25</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3">가산세액계</td>
					<td>26</td>
					<!-- 금액/ 세액 -->
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="5">차감,가감하여납부할세액(환급받을세액)</td>
					<!-- 세액 -->
					<td></td>
				</tr>

				<tr>
					<td colspan="5">총괄납부사업자가납부할세액(환급받을세액)</td>
					<!-- 세액 -->
					<td id="resultTax3"></td>
				</tr>
			</tbody>
		</table>
		</c:if>

	</div>
	<div class="col-md-1">
		<button type="button" id="printTax" class="bttn-slant bttn-sm bttn-warning">Print</button>
	</div>
</div>


<script>
	$("#printTax").click(function(){
		if(${map51.size()!=0})
			printJS({ printable: 'printDiv', type: 'html',  targetStyles: ['*'], header: '부가세 신고서' });
		else
			alert("내역이 없습니다.");
	});

	var sumValue = 0;
	var sumValue2 = 0;
	
	$("ducument").ready(function(){
		
		
		// 매출 합계 출력
		$(".sell").each(function(){
			
			var value = $(this).text().replace(/[^\d]+/g, '');
				if(value == ""){
					
				}		
				else {	
					sumValue += parseInt(value);
				}
			
		});
		sumValue = numberWithCommas(sumValue+"");
		$("#sellSum").text(sumValue);
		

	
		// 매입 합계 출력	
		$(".purchase").each(function(){
			
			var value = $(this).text().replace(/[^\d]+/g, '');
				if(value == ""){
					
				}		
				else {	
					sumValue2 += parseInt(value);
				}
			
		});
	
	var sub = $("#subPurchase").text().replace(/[^\d]+/g, '');
	sumValue2 = sumValue2 - sub;
	
	sumValue2 = numberWithCommas(sumValue2+"");
	$("#purchaseSum").text(sumValue2);
	
	
		//차감계 출력
		var sell = parseInt($("#sellSum").text().replace(/[^\d]+/g, ''));
		var pur = parseInt($("#purchaseSum").text().replace(/[^\d]+/g, ''));
		
		var result = sell - pur;
		result = numberWithCommas(result + "");
		
		$("#resultTax").text(result);
		
		//경감공제세액을 포함한 합계 출력
		

		$("#resultTax2").text(result);
		$("#resultTax3").text(result);
	});
	
	
	
	

	// function 
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	
	
</script>






