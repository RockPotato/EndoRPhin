var modalAddCheck = false;

	$(document).ready(function() {
		dialog();
	});

	$("#updDeduct").click(function(){
		$("#dialogFrm").attr("action","/updDeduct");
	})
	
	$("#dialogSearchBtn, #estBtn").click(function(){
		window.open("/searchEstablish", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	})
	
	function dialog() {
		
		var dialogBox = $('.dialog'), 
		deductDetail = $('.deductDetail'), 
		dialogClose = $('.dialog__close'), 
		dialog_deductCode = $('.dialog_deductCode'), 
		dialog_deductName = $('#dialog_deductName'), 
		establishCode = $('#dialogEstablishCode'), 
		dialogSearchBtn = $('#dialogSearchBtn'), 
		dialog_useStatus = $('#dialog_useStatus');

		// Open the dialog
		deductDetail.on('click', function(e) {
			dialogBox.toggleClass('dialog--active');

			$.ajax({
				method : "post",
				url : "/findDeductCode",
				data : "deductCode=" + $(this).parents(".payTr").data("decd"),
				success : function(data) {
					$("#dialog_deductCode").val(data.deductCode);
					$(".dialog_deductCode").html(data.deductCode);
					$("#dialog_deductName").val(data.deductName);
					$("#dialogEstablishCode").val(data.establishcode);
					$("#dialog_useStatus").val(data.useStatus);
				}
			});
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
							&& $(e.target).is(dialog_deductCode) === false
							&& $(e.target).is(dialog_deductName) === false
							&& $(e.target).is(establishCode) === false
							&& $(e.target).is(dialogSearchBtn) === false
							&& $(e.target).is(dialog_useStatus) === false) {
						dialogBox.removeClass("dialog--active");
					}
				});

	};

	$("#addModalCheckBtn").on("click", function() {
		if($("input[name=deductCode]").val()==""){
			alert('값을 입력하세요');
		}
		$.ajax({
			type : "get",
			url : "/findDeductCode",
			data : {
				deductCode : $("input[name=deductCode]").val()
			},
			success : function(data) {
				if (data == 1) {
					modalAddCheck = true;
					alert("사용가능한 공제코드입니다.");
				} else {
					modalAddCheck = false;
					alert("사용 불가능한 공제코드입니다.");
				}
			}
		});
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
	$("#modalAddBtn").on("click", function() {
		if ($("input[name=deductCode]").val() == "") {
			alert("공제코드를 입력해주세요.");
		} else if ($("input[name=deductName]").val() == "") {
			alert("공제명를 입력해주세요.");
		} else if (modalAddCheck == false) {
			alert("중복검사를 하지 않으셨습니다.");
		} else {
			$("#modalAddFrm").submit();
		}
	});
	$("#searchBtn").on("click", function() {
		if ($("#searchPay").val() != "") {
			$("#searchFrm").submit();
		} else
			alert("문자를 입력하세요!")
	})
	$("#delPayBtn").on(
			"click",
			function() {
				$("input[class=check]:checked").each(
						function() {
							$(this).siblings(".valPay").attr("value",
									$(this).parents('.payTr').data('decd'));
							$(this).siblings('.valPay').attr("name",
									"deductCode");
						});
				$("#deleteFrm").submit();
			})