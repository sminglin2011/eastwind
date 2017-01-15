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
<title><fmt:message key="module.inventory.purchaseOrder"/></title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>

<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-batch-purchasing" action="savePurchase.htm">
	<div class="row cl">
		<table
				class="table table-border table-bordered table-bg table-hover">
				<thead>
					<tr class="text-c">
						<th width="40%">Item Description</th>
						<th width="15%">Received Quantity</th>
						<th width="15%">Purchase Quantity</th>
						<th width="15%">Purchase UOM</th>
						<th width="10%">Unit Price</th>
						<th width="15%">Total</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${po.poItemList}" var="poItem" varStatus="status">
						<tr class="text-c">
							<td>
								<input type="hidden" id="id" name="id" value="${poItem.id }">
								<input type="hidden" id="prId" name="prId" value="${poItem.prid }"> 
								<input type="hidden" id="stockId" name="stockId" value="${poItem.stockId }"> 
								<input type="hidden" id="itemDescription" name="itemDescription" value="${poItem.itemDescription }">
								${poItem.itemDescription}
							</td>
							<td>
								${poItem._receivedQty }
							</td>
							<td> <input type="text" class="input-text" placeholder="" id="purchaseQty" name="purchaseQty"
								value="${poItem.purchaseQty }">
								<input type="hidden" id="requestQty" name="requestQty" value="${poItem.requestQty }">
								Request Quantity:${poItem.requestQty }
							</td>
							<td>
								<span class="select-box" style="width:100px;">
								<select class="select" name="purchaseUom" size="1" >
									<option value="${poItem.purchaseUom }">${poItem.purchaseUom }</option>
									<option value="pc">pc</option>
								</select>
								</span>
								<input type="hidden" id="requestUom" name="requestUom" value="${poItem.requestUom }">
								Request UOM: ${poItem.requestUom }
							</td>
							<td>
								${poItem.price }
								<input type="hidden" id="price" name="price" value="${poItem.price }">
							</td>
							<td>
								${poItem.price * poItem.purchaseQty}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	<div class="row cl">
		<div class="col-xs-12 col-sm-12 text-c">
			<c:choose>
				<c:when test="${po.status.equals('open') || po.status.equals('reject')}">
				<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe632;</i> Save</button>
				<a  class="btn btn-success"><i class="Hui-iconfont">&#xe632;</i> Approve</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	</form>
</article>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	//方法一;
	$("#form-batch-purchasing").Validform({
		tiptype:3,
		beforeSubmit:function(form) {
			console.log("a2",JSON.stringify($(form).serializeArray()));
			console.log("a1",JSON.stringify($(form).serializeJsonArray()));
			$.ajax({
				type : 'post',
				url : $(form).attr("action"),
				data : $(form).serializeJsonArray(), //JSON.stringify serializeArray
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
			return false;
		}
	});
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</html>