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
<title>New Supplier</title>
</head>

<body>
	<div class="page-container">
		<form action="saveSupplier.htm" method="post" class="form form-horizontal responsive" id="form-supplier">
		<div class="row cl">
			<label class="form-label col-xs-2">Supplier Name：</label>
			<div class="formControls col-xs-4">
				<input type="hidden" name="id" id="id" value="${supplier.id}">
				<input type="text" class="input-text" placeholder="Supplier Name" name="name" id="name" 
				datatype="*3-50" nullmsg="Customer is not empty" ajaxurl="checkDuplicateSupplierName.htm"
				 value="${supplier.name}">
			</div>
		</div>
		<h4>Account Information</h4>
		<div class="line"></div>
		<p/>
		<div class="row cl">
			<label class="form-label col-xs-2">Terms：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="eg. C.O.D. " name="terms" 
				id="billAttention" datatype="*3-6" ignore="ignore" value="${supplier.terms}">
			</div>
			<label class="form-label col-xs-2">Account Code：</label>
			<div class="formControls col-xs-4">
				<input type="text" class="input-text" placeholder="Account Code" name="accountCode" 
				id="accountCode" datatype="n5-5" ignore="ignore" value="${supplier.accountCode}">
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
<script type="text/javascript" src="lib/Validform/5.3.2/message.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-supplier").Validform({
		tiptype:3,
		beforeSubmit: function(form) {
			$.sndPostAjax(form);
			return false;
		}
	});
});

</script>
</html>