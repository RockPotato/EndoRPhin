<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3><i class="fa fa-calculator" style="margin-top: 20px"></i>�̽��� ��ǥ</h3>
		<table>
			<tr>
				<td><strong >��ǥ����</strong></td>
				<td colspan="2"><input class="search-query form-control"
					name="before_slipDate" id="before_slipDate" type="text" /></td>
				<td><h4><strong>-</strong></h4></td>
				<td><input class="search-query form-control" name="after_slipDate" id="after_slipDate" type="text" /></td>
				<td><input type="button" class="bttn-fill bttn-md bttn-warning"	id="serachBtn" value="�˻�" /></td>
				
			</tr>
		</table><br><br>
		<table class="table table-hover">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck"
						onclick="allCheck();"></th>
					<th>��ǥ��ȣ</th>
					<th>��ǥ����</th>
					<th>����</th>
					<th>��ǥ�ݾ�</th>
					<th>���μ�</th>
				</tr>
			</thead>
			<tbody id="deptListTbody">
			</tbody>
		</table>

		<c:set var="lastPage"
			value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

		<nav style="text-align: center;">
			<ul id="pagination" class="pagination">
			</ul>
		</nav>

		<!--------------(����,���) ��ư ------------------->

		<div class="modal-footer">
			<button name="upd_btn" class="bttn-jelly bttn-md bttn-warning"
				id="upd_btn" type="button" value="0" onclick="myclick()">����</button>
		</div>
	</div>
</div>

<!-----------------�󼼺���  ���â ---------------->

<div class="modal fade" id="deptDetail" role="deptDetail"aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modalSketchedHeader" style="height: 52px">
				<h5>��ǥ��ȸ</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<form action="/deleteSlip">
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-text">��ǥ��ȣ</span> 
						<input type="text" class="form-control" id="slipnumber" name="slipnumber" style="background: #fff"  readonly>
						<span class="input-group-text">��ǥ����</span> 
						<input type="text" class="form-control"name="slipdate" id="slipdate"  style="background: #fff"  readonly>	 
					</div>
					<div class="input-group">
						<span class="input-group-text">��ǥ�ݾ�</span>
						<input type="text"  style="background: #fff"  readonly class="form-control" name="total" id="total">
					</div>
					<div class="input-group">
						<span class="input-group-text">��ǥ����</span>
						 <input type="text"	class="form-control" name="departmentname" id="departmentname" style="background: #fff" readonly />
					</div>
					<div class="input-group">
						<span class="input-group-text" style="width: 90px"> ���� </span>
						<input type="text" class="form-control" id="jukyo" name="jukyo"  style="background: #fff"  readonly />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-secondary" id="delSlip">����</button>
						<button type="button" class="btn btn-secondary"  data-dismiss="modal">�ݱ�</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<!------------------------����---------------------->

<form id="update_frm"
	action="${pageContext.request.contextPath }/updateSlip_paaprovuar">
	<input type="hidden" id="checkRow" name="checkRow">
</form>

<form id="useFrm" action="${pageConext.request.contextPath }/useDept">
	<input type="hidden" id="frm_usestatus" name="frm_usestatus"> <input
		type="hidden" id="frm_deptCode" name="frm_deptCode">
</form>

<!---------------------------------------------->


<script>
$("document").ready(function() {
    paaprovuarPageList(1);
    /* �󼼺���  */
    $("#deptListTbody").on("click", ".detailView", function() {

        $("#slipnumber").val($(this).data().slipnumber);
        $("#slipdate").val($(this).data().slipdate);
        $("#jukyo").val($(this).data().jukyo);
        $("#total").val($(this).data().total);
        $("#departmentname").val($(this).data().departmentname);

    });
    //input�� datepicker�� ����
    $("#before_slipDate,#after_slipDate").datepicker({
        dateFormat: 'yy/mm/dd' //Input Display Format ����
            ,
        showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
            ,
        showMonthAfterYear: true //�⵵ ���� ������, �ڿ� �� ǥ��
            ,
        changeYear: true //�޺��ڽ����� �� ���� ����
            ,
        changeMonth: true //�޺��ڽ����� �� ���� ����                
            ,
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
            ,
        buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
            ,
        buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
            ,
        yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
            ,
        monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //�޷��� �� �κ� �ؽ�Ʈ
            ,
        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
            ,
        dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'] //�޷��� ���� �κ� �ؽ�Ʈ
            ,
        dayNames: ['�Ͽ���', '������', 'ȭ����', '������', '�����', '�ݿ���', '�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
            ,
        minDate: "-1M" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
            ,
        maxDate: "+1M" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
    });

    //�ʱⰪ�� ���� ��¥�� ����
    $('#before_slipDate,#after_slipDate').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)	
});

/* ��¥ �˻� */
$("#serachBtn").on("click", function() {

    $.ajax({
        url: "${pageContext.request.contextPath }/searchAjax_p",
        data: "before_slipDate=" + $("#before_slipDate").val() + "&" + "after_slipDate=" + $("#after_slipDate").val(),
        success: function(data) {
            
            var htmlArr = data.split("================seperator================");
            $("#deptListTbody").html("");
            $("#deptListTbody").html(htmlArr[0]);
            $("#pagination").html("");
            $("#pagination").html(htmlArr[1]);

        }
    });
});

function paaprovuarPageList(page) {

    $.ajax({
        url: "${pageContext.request.contextPath }/paaprovuarPageList",
        data: "page=" + page,
        success: function(data) {
            var htmlArr = data.split("================seperator================");

            $("#deptListTbody").html(htmlArr[0]);
            $("#pagination").html(htmlArr[1]);
        }
    });
}


/* ��ü���� ���� */
function allCheck() {
    if ($("#th_allCheck").is(':checked')) {
        $("input[name=checkRow]").prop("checked", true);
    } else {
        $("input[name=checkRow]").prop("checked", false);
    }
}

/* ���� */
function myclick() {
    var checkRow = '';
    $("input[name=checkRow]:checked").each(function() {
        checkRow += $(this).val() + ",";
    });
    checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //�ǳ� �޸� �����  
    $("#checkRow").val(checkRow);

    if (checkRow === "") {
        alert("üũ�ڽ��� �����ϼ���");
        return false;
    }


    $("#update_frm").submit();
}
$("#delSlip").click(function() {
	
})
</script>

