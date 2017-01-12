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
<title><fmt:message key="module.inventory" /></title>
</head>

<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> <fmt:message key="home" /> <span class="c-gray en">&gt;</span>
		<fmt:message key="module.inventory" /><span class="c-gray en">&gt;</span> 
		<fmt:message key="module.inventory.listing" /> <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" onclick="javascript:location.replace(location.href);" title="Reload"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="stockFilterKeyword.htm" id="form-query">
			<span class="select-box inline"> <select name=""
				class="select">
					<option value="0">Category</option>
					<c:forEach items="${model.categoryList }" var="category">
					<option value="${category.id}">${category.name }</option>
					</c:forEach>
			</select>
			</span>
			<input type="text" name="keyword" id="keyword" placeholder=" <fmt:message key="keyword" />" value="${model.keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> <fmt:message key="search" />
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
			<a href="javascript:;" onclick="popUpWind('新建项目','newStock.htm')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> <fmt:message key="new" /></a>
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="5%"><input type="checkbox" name="" value=""></th>
						<th width="25%">项目描述</th>
						<th width="25%">项目描述1</th>
						<th width="10%">Category</th>
						<th width="5%">单位</th>
						<th width="10%">平均单价</th>
						<th width="20%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.list}" var="stock" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td> ${stock.description }</td>
							<td> ${stock.description1 }</td>
							<td> ${stock.category }</td>
							<td> ${stock.unitMs }</td>
							<td> ${stock.avgUnitPrice }</td>
							<td class="f-14 td-manage">
							<a style="text-decoration: none" class="ml-5"
								onClick="openWind('StockItemSupplier','stockItemSupplier.htm?stockId=${stock.id}')"
								href="javascript:;" title="<fmt:message key="module.inventory.supplier" />"><i class="Hui-iconfont">&#xe611;</i>
							</a>
							<a style="text-decoration: none" class="ml-5"
								onClick="popUpWind('Purchase Request','purchaseRequest.htm?stockId=${stock.id}')"
								href="javascript:;" title="<fmt:message key="module.inventory.purchase_request" />"><i class="Hui-iconfont">&#xe6b9;</i>
							</a>
							<a style="text-decoration: none" class="ml-5"
								onClick="popUpWind('Stock编辑','editStock.htm?id=${stock.id}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i>
							</a>
							<a style="text-decoration: none" class="ml-5"
								onClick="ajax_del_reload('deleteStock.htm',${stock.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i>
							</a>
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
	$('.table-sort').dataTable({
		"bSort": false, // not sorting
		"language": {
		    "decimal":        "",
		    "emptyTable":     "No data available in table",
		    "info":           "Showing _START_ to _END_ of _TOTAL_ entries",
		    "infoEmpty":      "Showing 0 to 0 of 0 entries",
		    "infoFiltered":   "(filtered from _MAX_ total entries)",
		    "infoPostFix":    "",
		    "thousands":      ",",
		    "lengthMenu":     "Show _MENU_ entries",
		    "loadingRecords": "Loading...",
		    "processing":     "Processing...",
		    "search":         "Search: ",
		    "zeroRecords":    "No matching records found",
		    "paginate": {
		        "first":      "First",
		        "last":       "Last",
		        "next":       "Next",
		        "previous":   "Previous"
		    },
		    "aria": {
		        "sortAscending":  ": activate to sort column ascending",
		        "sortDescending": ": activate to sort column descending"
		    }
		}
	});
	
</script>
</html>