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
<title>Customer Details</title>
</head>
<body>
	<div class="page-container">
		<form action="saveCustomer.htm" method="post" class="form form-horizontal responsive" id="form-customer">
		<div class="row cl">
			<label class="form-label col-xs-2">Customer Name：</label>
			<div class="formControls col-xs-4">
				<input type="text" class="input-text" placeholder="Customer Name" name="name" id="CustomerName" datatype="*3-50" nullmsg="Customer is not empty" ajaxurl="checkDuplicateName.htm">
			</div>
		</div>
		<h4>Billing Information</h4>
		<div class="line"></div>
		<p/>
		<div class="row cl">
			<label class="form-label col-xs-2">Billing Attention：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Billing Attention" name="billContact.billAttention" id="billAttention" datatype="*3-50" ignore="ignore">
			</div>
			<label class="form-label col-xs-2">Billing Email：</label>
			<div class="formControls col-xs-4">
				<input type="text" class="input-text" placeholder="Billing Email" name="billContact.billEmail" id="billEmail" datatype="e" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Billing Mobile：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Billing Mobile" name="billContact.billMobile" id="billMobile" datatype="n" ignore="ignore">
			</div>
			<label class="form-label col-xs-2">Billing Telephone：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Billing Telephone" name="billContact.billTelephone" id="billTelephone" datatype="n" ignore="ignore">
			</div>
			<label class="form-label col-xs-2">Billing Fax：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Billing Fax" name="billContact.billFax" id="billFax" datatype="n" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Billing PostCode：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Billing PostCode" name="billContact.billPostcode" id="billPostcode" datatype="n6-6" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Billing Address：</label>
			<div class="formControls col-xs-8">
				<input type="text" class="input-text" placeholder="Billing Address1" name="billContact.billAddress1" id="billAddress1" datatype="*3-50" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2"></label>
			<div class="formControls col-xs-8">
				<input type="text" class="input-text" placeholder="Billing Address2" name="billContact.billAddress2" id="billAddress2">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2"></label>
			<div class="formControls col-xs-8">
				<input type="text" class="input-text" placeholder="Billing Address" name="billContact.billAddress3" id="billAddress3">
			</div>
		</div>
		<span><input type="checkbox" id="sameas">same as bill information</span>
		<h4>Delivery Information</h4>
		<div class="line"></div>
		<p/>
		<div class="row cl">
			<label class="form-label col-xs-2">Delivery Attention：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Delivery Attention" name="deliveryContact.deliveryAttention" id="deliveryAttention" datatype="*3-50" ignore="ignore">
			</div>
			<label class="form-label col-xs-2">Delivery Email：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Delivery Email" name="deliveryContact.deliveryEmail" id="deliveryEmail" datatype="e" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Delivery Mobile：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Delivery Mobile" name="deliveryContact.deliveryMobile" id="deliveryMobile" datatype="n" ignore="ignore">
			</div>
			<label class="form-label col-xs-2">Delivery Telephone：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Delivery Telephone" name="deliveryContact.deliveryTelephone" id="deliveryTelephone" datatype="n" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Delivery PostCode：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Delivery PostCode" name="deliveryContact.deliveryPostcode" id="deliveryPostcode" datatype="n6-6" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Delivery Address：</label>
			<div class="formControls col-xs-8">
				<input type="text" class="input-text" placeholder="Delivery Address1" name="deliveryContact.deliveryAddress1" id="deliveryAddress1" datatype="*3-50" ignore="ignore">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2"></label>
			<div class="formControls col-xs-8">
				<input type="text" class="input-text" placeholder="Delivery Address2" name="deliveryContact.deliveryAddress2" id="deliveryAddress2">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2"></label>
			<div class="formControls col-xs-8">
				<input type="text" class="input-text" placeholder="Delivery Address3" name="deliveryContact.deliveryAddress3" id="deliveryAddress3">
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
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-customer").Validform({
		tiptype:3,
		ajaxPost:true,
		callback:function(data){
			//form[0].submit(); 直接提交表单
			//ajaxPost(flag,sync,url); flag = true 跳过验证直接提交表单， sync = true 同步提交
			layer.msg(data.status);
			/* var index = parent.layer.getFrameIndex(window.name);
			parent.location.replace(parent.location.href)
			parent.layer.close(index); */
		}
	});
	
	$("#sameas").click(function(){
		console.log("same as click", $(this).prop("checked"));
		if ($(this).prop("checked")) {
			$("#deliveryAttention").val($("#billAttention").val());
			$("#deliveryEmail").val($("#billEmail").val());
			$("#deliveryMobile").val($("#billMobile").val());
			$("#deliveryTelephone").val($("#billTelephone").val());
			$("#deliveryPostcode").val($("#billPostcode").val());
			$("#deliveryAddress1").val($("#billAddress1").val());
			$("#deliveryAddress2").val($("#billAddress2").val());
			$("#deliveryAddress3").val($("#billAddress3").val());
		}
	})
});

</script>
</html>