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
<title><fmt:message key="module.inventory.purchaseOrder" /></title>
</head>

<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> <fmt:message key="home" /> <span class="c-gray en">&gt;</span>
		<fmt:message key="module.inventory" /><span class="c-gray en">&gt;</span> 
		<fmt:message key="module.inventory.purchaseOrder.listing" /> <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" onclick="javascript:location.replace(location.href);" title="Reload"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="poFilterKeyword.htm" id="form-query">
			<input type="text" name="keyword" id="keyword" placeholder=" <fmt:message key="keyword" />" value="${model.keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> <fmt:message key="action.search" />
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
			<a href="javascript:;" onclick="batchPurchase()" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> <fmt:message key="action.new" />
			</a>
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="10%">Status</th>
						<th width="5%">SN</th>
						<th width="10%">PO Number</th>
						<th width="15%">Date</th>
						<th width="30%">Supplier Name</th>
						<th width="10%">Amount</th>
						<th width="20%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="po" varStatus="status">
						<tr class="text-c">
							<td>${po.status }</td>
							<td>${status.count }</td>
							<td> <a class="btn btn-link" onclick="popUpWind('Edit Purchase Order', 'editPurchaseOrder.htm?id=${po.id}')">${po.poNumber}</a></td>
							<td> ${po.date }</td>
							<td> ${po._supplierName }</td>
							<td> ${po.total }</td>
							<td class="f-14 td-manage">
							<c:choose>
							<c:when test="${po.status.equals('approve')}">
							<!-- 审批后可以看到收获按钮 -->
							<a style="text-decoration: none" class="btn btn-success"
								onClick="popUpWind('Goods Receipt', 'goToPoConvertToGR.htm?poNumber=${po.poNumber}')"
								href="javascript:;" title="<fmt:message key="action.goodsReceived" />">
								<i class="Hui-iconfont">&#xe640;</i>Goods Received
							</a>
							</c:when>
							<c:when test="${po.status.equals('open')}">
							<a style="text-decoration: none" class="ml-5"
								onClick="popUpWind('Edit Purchase Order', 'editPurchaseOrder.htm?id=${po.id}')"
								href="javascript:;" title="<fmt:message key="action.edit" />">
								<i class="Hui-iconfont">&#xe6df;</i>
							</a>
							<a style="text-decoration: none" class="ml-5"
								onClick="approveProcess('approvePurchaseOrder.htm', '{id:${po.id}, approve:&quot;approve&quot;}', 'Are you sure')"
								href="javascript:;" title="<fmt:message key="action.approve" />">
								<i class="Hui-iconfont">&#xe6e1;</i>
							</a>
							<a style="text-decoration: none" class="ml-5"
								onClick="approveProcess('approvePurchaseOrder.htm', '{id:${po.id}, approve:&quot;reject&quot;}', 'Are you sure')"
								href="javascript:;" title="<fmt:message key="action.reject" />">
								<i class="Hui-iconfont">&#xe6dd;</i>
							</a>
							</c:when>
							<c:when test="${po.status.equals('reject')}">
							<a style="text-decoration: none" class="ml-5"
								onClick="popUpWind('Edit Purchase Order', 'editPurchaseOrder.htm?id=${po.id}')"
								href="javascript:;" title="<fmt:message key="action.edit" />">
								<i class="Hui-iconfont">&#xe6df;</i>
							</a>
							</c:when>
							<c:otherwise>
							</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript">
//String Convert To Object function
//字符串强制转换成对象类型
//string转换成object类型
//参数json为json格式的字符串，需要经过转换后才能正确处理json数据
var stringToObject = function(json) {
  return eval("(" + json + ")"); 
}
	function approveProcess(url, params, promMsg) {
		var jsonObj = stringToObject(params);
		layer.confirm(promMsg, function(index) {
			$.ajax({
				method : "POST",
				url : url,
				data : jsonObj,
				dataType : "json",
				success : function(data) {
					if (data.status == 'y') {
						layer.msg(data.msg, { icon : 1, time : 2000 });
						location.reload();
					} else {
						layer.msg("返回错误", { icon : 5, time : 2000 });
					}
				},
				error : function(data) {
					layer.msg('system run ajax error', { icon : 5, time : 2000 });
				}
			});
		})
	}
	
</script>
</html>