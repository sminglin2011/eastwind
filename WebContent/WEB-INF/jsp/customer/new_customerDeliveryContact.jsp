<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="/WEB-INF/jsp/_meta.jsp"%>
<title></title>
</head>
<body>
	<div class="page-container">
		<form action="saveCustomerDeliveryContact.htm" method="post" class="form form-horizontal responsive" id="form-deliveryContact">
		<div class="row cl">
			<label class="form-label col-xs-6">Customer Name：${customer.name}</label>
			<div class="formControls col-xs-1">
				
				<input type="hidden" id="id" name="id" value="${deliveryContact.id}">
				<input type="hidden" id="customerId" name="customerId" value="${customer.id}">
			</div>
		</div>
		<h4>Delivery Information</h4>
		<div class="line"></div>
		<p/>
		<div class="row cl">
			<label class="form-label col-xs-3">Delivery Attention：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Delivery Attention" name="deliveryAttention" 
				id="deliveryAttention" datatype="*3-50" ignore="ignore" value="${deliveryContact.deliveryAttention}">
			</div>
			<label class="form-label col-xs-3">Delivery Email：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Delivery Email" name="deliveryEmail" 
				id="deliveryEmail" datatype="e" ignore="ignore" value="${deliveryContact.deliveryEmail}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3">Delivery Mobile：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Delivery Mobile" name="deliveryMobile" 
				id="deliveryMobile" datatype="n" ignore="ignore" value="${deliveryContact.deliveryMobile}">
			</div>
			<label class="form-label col-xs-3">Delivery Telephone：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Delivery Telephone" name="deliveryTelephone" 
				id="deliveryTelephone" datatype="n" ignore="ignore" value="${deliveryContact.deliveryTelephone}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3">Delivery PostCode：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Delivery PostCode" name="deliveryPostcode" 
				id="deliveryPostcode" datatype="n6-6" ignore="ignore" value="${deliveryContact.deliveryPostcode}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3">Delivery Address：</label>
			<div class="formControls col-xs-6">
				<input type="text" class="input-text" placeholder="Delivery Address1" name="deliveryAddress1" 
				id="deliveryAddress1" datatype="*3-50" ignore="ignore" value="${deliveryContact.deliveryAddress1}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3"></label>
			<div class="formControls col-xs-6">
				<input type="text" class="input-text" placeholder="Delivery Address2" name="deliveryAddress2" 
				id="deliveryAddress2" value="${deliveryContact.deliveryAddress2}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3"></label>
			<div class="formControls col-xs-6">
				<input type="text" class="input-text" placeholder="Delivery Address3" name="deliveryAddress3" 
				id="deliveryAddress3" value="${deliveryContact.deliveryAddress3}">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-xs-offset-2">
				<button name="" id="" class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe632;</i> 保存
				</button>
			</div>
		</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-deliveryContact").Validform({
		tiptype:3,
		beforeSubmit: function(form) {
			$.sndPostAjax(form);
			return false;
		}
	});
});


</script>
</html>