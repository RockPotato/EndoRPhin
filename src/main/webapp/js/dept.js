    /* 등록  */
		$("#insertBtn").on("click", function(){
			
			var deptCode 		= $("#deptCode").val();
			var deptName  	    = $("#deptName").val();
			var companyCode		= $("#companyCode").val();
			
			$("#frmdeptCode").val(deptCode);
			$("#frmdeptName").val(deptName);
			$("#frmcompanyCode").val(companyCode);
			
			if($("#deptName").val().trim()==""){
				alert("부서명을 입력하세요");
				$("#deptName").focus();
				return false;
			}
		 	if($("#companyCode").val().trim()==""){
				alert("회사코드를 선택하세요");
				$("#companyCode").focus();
				return false;
			} 
			$("#insertFrm").submit();
		
	});
		 /* 수정 */
		$("document").ready(function() {

			$("#deptListTbody").on("click", ".detailView", function(){
				$("#upd_deptcode").val($(this).data().upd_deptcode);
			});
			
			$("#modalUpdateBtn").on("click", function(){
				
				
				var deptName  	    = $("#upd_deptName").val();
				var companyCode		= $("#upd_companyCode").val();
				var deptCode		= $("#upd_deptCode").val();
				
				$("#frmdeptCode1").val(deptCode);
				$("#frmdeptName1").val(deptName);
				$("#frmcompanyCode1").val(companyCode);
				
				if($("#upd_deptName").val().trim()==""){
					alert("부서명을 입력하세요");
					$("#upd_deptName").focus();
					return false;
				}
			 	
				if($("#upd_companyCode").val().trim()==""){
					alert("회사코드를 선택하세요");
					$("#upd_companyCode").focus();
					return false;
			} 
		 	
			$("#updateFrm").submit();
	    });
	});   
	
	    
    /* 카드코드 중복체크 ajax */
	    $("#duplCheckbtn").on("click", function(){
    	
    	$.ajax({
    		url 	: "${pageContext.request.contextPath }/DupleDept",
    		method  : "post",
    		data 	: "deptCode="+$("#deptCode").val(),
    		success : function(dupleCode){
    			transDupl(dupleCode);
    		}
    	});
    }); 
	
		var dupleCode ="";
		
	    function transDupl(dupleCode){
	    	if(dupleCode == "0"){
	    		dupleCode ="<b><font color='blue'>사용가능한 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>중복된 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>부서 코드를 입력하세요.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}
	    }  
	    
	    /* 검색  */
		function seachBtn(){
			var cardNumber = $("#cardNumber1").val();
			var cardName   = $("#cardName1").val();
			
			$("#card_num").val(cardNumber);
			$("#card_name").val(cardName);
			
			if(cardNumber === "" && cardName === ""){
				alert("카드번호와 카드명을 입력하세요.");
				$("card_num1").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#cardNumber1").val(cardNumber);
				$("#cardName1").val(cardName);

				$("#frm1").submit();		
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

	