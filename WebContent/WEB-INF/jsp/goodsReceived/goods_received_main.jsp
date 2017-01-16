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
<title>Goods Received</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 
		<fmt:message key="home" /> <span class="c-gray en">&gt;</span>
		<fmt:message key="module.inventory.goodsReceived" /> <span class="c-gray en">&gt;</span> 
		<fmt:message key="module.inventory.goodsReceived.listing" /> <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" onclick="javascript:location.reload();" title="<fmt:message key="action.reload" />"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="grFilterKeyword.htm" id="form-query">
			<input type="text" name="keyword" id="keyword" placeholder=" <fmt:message key="keyword" />" value="${keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> <fmt:message key="action.search" />
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;" onclick="programming()" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i><fmt:message key="action.new" /> </a></span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="5%">SN</th>
						<th width="10%">Vendor Invoice</th>
						<th width="10%">Received Date</th>
						<th width="15%">Supplier Name</th>
						<th width="20%">Item Description</th>
						<th width="10%">Received Quantity</th>
						<th width="10%">PO Number</th>
						<th width="10%">AP Number</th>
						<th width="10%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="gr" varStatus="status">
						<tr class="text-c">
							<td>${status.count }</td>
							<td>${gr.vendorInvoice }</td>
							<td>${gr.receivedDate }</td>
							<td>${gr.supplierName}</td>
							<td>${gr.itemDescription }</td>
							<td>${gr.receivedQty } ${gr.receivedUom }</td>
							<td>${gr.poNumber }</td>
							<td>${gr.apNumber }</td>
							<td class="f-14 td-manage">
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
	
</script>
</html>