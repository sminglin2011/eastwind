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
<title>Batch Purchasing</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>

<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-batch-purchasing" action="batchPurchase.htm">
	<div class="row cl">
		<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="50%">Item Description</th>
						<th width="20%">Purchase Quantity</th>
						<th width="20%">Purchase UOM</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="purchaseRequest" varStatus="status">
						<tr class="text-c">
							<td>
								<input type="hidden" id="id" name="pr[id]" value="${purchaseRequest.id }"> 
								${purchaseRequest._itemDescription}</td>
							<td> <input type="text" class="input-text" placeholder="" id="requestQty" name="pr[requestQty]"
								value="${purchaseRequest.requestQty }">
							</td>
							<td>
								<span class="select-box" style="width:250px;">
								<select class="select" name="pr[requestUom]" size="1" >
									<option value="${purchaseRequest.requestUom }">${purchaseRequest.requestUom }</option>
									<c:forEach items="${purchaseRequest._uomList }" var="uom">
										<option value="${uom}">${uom}</option>
									</c:forEach>
								</select>
								</span>
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
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/message.js"></script>
<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	//方法一;
	$("#form-batch-purchasing").Validform({
		tiptype:3,
		beforeSubmit:function(form) {
			console.log("a2",JSON.stringify($(form).serializeArray()));
			console.log("a1",JSON.stringify($(form).serializeJson()));
			return false;
		}
	});
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</html>