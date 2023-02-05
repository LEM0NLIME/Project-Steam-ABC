
$(function() {
	
	
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function() {
		var chk_listArr = $("input[name='RowCheck']");
		for (var i = 0; i < chk_listArr.length; i++) {
			chk_listArr[i].checked = this.checked;
		}
	});
	
	$("input[name='Rowcheck']").click(function() {
		if ($("input[name='RowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		} else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
	
	$("#orderInsertAsCart").submit(function() {
		
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr.push(list[i].value);
			}
		}
		
		if(valueArr == 0){
			alert("선택된 상품이 없습니다.");
			return false;
		}
		
	});
	
});

function deleteValue() {
	var url = "./CartSelectDetail";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		alert("선택된 상품이 없습니다.");
	} else {
		if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
					valueArr : valueArr
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("상품이 삭제 되었습니다.");
							location.reload();
						} else {
							alert("상품 삭제도중 치명적인 오류가 발생했습니다.");
						}
					}
				});
		}else{
			return false;
		}
	}
}

function AllCheckOff() {
	
	$("input:checkbox[id='allCheck']").prop("checked", false);
	
}

function CalculateValue() {
	
	var url = "./CartSelectCalculate";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}

	if (valueArr.length == 0) {

		$("#cartTotal").val(0);
		$("#cartQuantity").val(0);
		
	} else {

		$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
					valueArr : valueArr
					},
					success : function(jdata) {

							var quantity = jdata[0];
							var total = jdata[1];
	
							$("#cartTotal").val(total);
							$("#cartQuantity").val(quantity);
					}
			});
	}
}

function PnameArr() {
	
	var valueArr2 = new Array();
	var list = $("input[name='PnameCheck']");
	var list2 = $("input[name='RowCheck']");

	for (var i = 0; i < list2.length; i++) {
		if (list2[i].checked) {
			valueArr2.push(list[i].value);
		}
	}
	
	$("#pnameArr").val(valueArr2);
	
 }
