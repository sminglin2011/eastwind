<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="/WEB-INF/jsp/_meta.jsp" %>
<title>Goods Received</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>

<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-goods-received" >
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2">Vendor Invoice：</label>
		<div class="formControls col-xs-8 col-sm-4">
			<input type="text" class="input-text" placeholder="" id="vendorInvoice" name="vendorInvoice"
				datatype="*">
		</div>
		<label class="form-label col-xs-4 col-sm-2">Received Date：</label>
		<div class="formControls col-xs-8 col-sm-4">
			<input type="text" class="input-text" placeholder="" id="receivedDate" name="receivedDate"
				datatype="*" >
		</div>
	</div>
	<div class="row cl">
		<div class="check-box">
			<input type="checkbox" id="postAccount" name="postAccount" value="true">
			<label for="postAccount">Auto Post Account</label>
		</div>
	</div>
	</form>
	<form class="form form-horizontal" id="form-goods-received-item" action="poConvertToGR.htm">
	<div class="row cl">
		<table
				class="table table-border table-bordered table-bg table-hover">
				<thead>
					<tr class="text-c">
						<th width="30%">Item Description</th>
						<th width="15%">Received Quantity</th>
						<th width="20%">Quantity In</th>
						<th width="10%">Received UOM</th>
						<th width="10%">Purchase Quantity</th>
						<th width="10%">Purchase UOM</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${poItems}" var="poItem">
						<tr class="text-c">
							<td>
								<input type="hidden" id="poNumber" name="poNumber" value="${poItem.poNumber }"> 
								<input type="hidden" id="supplierId" name="supplierId" value="${poItem.supplierId }">
								<input type="hidden" id="stockId" name="stockId" value="${poItem.stockId }"> 
								${poItem.itemDescription}
							</td>
							<td>
							${poItem._receivedQty }
							<input type="hidden" id="_laterReceivedQty" name="_laterReceivedQty" value="${poItem._receivedQty }">
							</td>
							<td> <input type="text" class="input-text" placeholder="" id="receivedQty" name="receivedQty"
								value="${poItem._balanceQty }">
							</td>
							<td>
								<span class="select-box" style="width:100px;">
								<select class="select" name="receivedUom" size="1" >
									<option value="${poItem.purchaseUom }">${poItem.purchaseUom }</option>
								</select>
								</span>
							</td>
							<td>
							${poItem.purchaseQty }
							<input type="hidden" id="_purchaseQty" name="_purchaseQty" value="${poItem.purchaseQty }"> 
							</td>
							<td>
							${poItem.purchaseUom }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	<div class="row cl">
		<div class="col-xs-12 col-sm-12 text-c">
			<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe632;</i> Save</button>
		</div>
	</div>
	</form>
</article>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	var GRForm = $("#form-goods-received").Validform({
		tiptype:3,
	});
	//数组jsonArray
	$("#form-goods-received-item").Validform({
		tiptype:3,
		beforeSubmit:function(form) {
			console.log(JSON.parse($(form).serializeJsonArray()));
			var paramsJsonArray = JSON.parse($(form).serializeJsonArray());
			$.each(paramsJsonArray, function(k, v) {
				console.log(k + ' ' + v +", a");
				v.vendorInvoice = $("#vendorInvoice").val();;
				v.receivedDate = $("#receivedDate").val();
				v.postAccount = $("#postAccount").prop("checked")
				$.each(v, function(k1, v1) {
					console.log(k1 + ' ' + v1);
				});
			});
			console.log(paramsJsonArray, "what is it?");
			if(GRForm.check()){
				$.ajax({
					type : 'post',
					url : $(form).attr("action"),
					data : JSON.stringify(paramsJsonArray), 
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					success : function(data) {
						if (data.status == 'y') {
							layer.msg("Sent Successful", { icon : 6, time : 1000 });
							setTimeout(function() {
								var index = parent.layer.getFrameIndex(window.name);
								parent.location.reload();
								parent.layer.close(index);
							}, 1000);
						} else {
							layer.msg(data.errorMsg, { icon : 5, time : 5000 });
						}
					},
					error : function(data) {
						console.log("error,log", data);
						layer.msg("system run ajax error", { icon : 5, time : 5000 });
					}
				}); 
			}
			
			return false;
		}
	});
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</html>