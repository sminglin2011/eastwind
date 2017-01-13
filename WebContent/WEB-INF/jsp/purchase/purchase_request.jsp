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
<title>Purchase Request</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>

<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-purchase-request" action="savePurchaseRequest.htm">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4">Item Description：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="hidden" class="input-text" id="stockId" name="stockId" value="${stockItem.id}">
			<p>${stockItem.description}</p>
			<p>${stockItem.description1}</p>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4">Purchase Request Quantity：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="text" class="input-text" placeholder="Purchase Request Quantity eg. 10" 
			id="requestQty" name="requestQty" datatype="/[0-9]+([.]{1}[0-9]+){0,1}$/">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4">Purchase Request UOM：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<span class="select-box" style="width:250px;">
			<select class="select" name="requestUom" size="1" datatype="/^[A-Za-z]+$/">
				<option value="">Select Unit Of Measure</option>
				<c:forEach items="${uomList}" var="uom">
					<option value="${uom.uom}">${uom.uom}</option>
				</c:forEach>
				
			</select>
			</span>
			<!-- <input type="text" class="input-text" placeholder="UOM" id="requestUom" name="requestUom" datatype="/^[A-Za-z]+$/"> -->
		</div>
	</div>
	
	<div class="row cl">
		<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
			<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe632;</i> Save</button>
		</div>
	</div>
	</form>
</article>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/message.js"></script>
<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	//方法一;
	$("#form-purchase-request").Validform({
		tiptype:3,
		beforeSubmit: function(form) {
			ajax_save_parent_reload(form);
			return false;
		}
	});
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</html>