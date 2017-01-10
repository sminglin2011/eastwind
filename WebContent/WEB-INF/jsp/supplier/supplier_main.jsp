﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Supplier Manager</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span>
		Supplier Manager <span class="c-gray en">&gt;</span> Supplier Listing <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" onclick="javascript:location.replace(location.href);" title="Refresh"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="supplierFilterKeyword.htm" id="form-query">
			<input type="text" name="keyword" id="keyword" placeholder="keyword" value="${keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> Search
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;" onclick="openWind('New Supplier','newSupplier.htm')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> New Supplier</a></span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="5%">SN</th>
						<th width="50%">Supplier Name</th>
						<th width="10%">Terms</th>
						<th width="10%">Account Code</th>
						<th width="25%">ACTION</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="supplier" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td>${status.count }</td>
							<td><a href="javascript:;" class="btn btn-link radius" 
								onclick="loadPage('customerContactMaster.htm?customerId=${supplier.id}')">${supplier.name }</a></td>
							<td>${supplier.terms }</td>
							<td>${supplier.accountCode }</td>
							<td class="f-14 td-manage">
								<a style="text-decoration: none" class="ml-5"
								onClick="supplier_del(this,${supplier.id})" href="javascript:;"
								title="Delete"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
		//"aaSorting" : [ [ 1, "desc" ] ],
		//默认第几个排序
		"bStateSave" : false,//状态保存
		"aoColumnDefs" : [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [ 0, 1, 2, 3 ]
		} // 不参与排序的列
		]
	});
	/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
	*/
	function openWind(title, url) {
		var index = layer.open({
			type : 2,
			title : title,
			content : url
		});
		layer.full(index);
	}
	
	function loadPage(url){
		location.replace(url)
	}
	
	function customer_del(obj, id) {
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				  method: "POST",
				  url: "deleteCustomer.htm",
				  data: { id: id },
				  success: function(data) {
					  if(data == 'y') {
						  layer.msg('删除成功!');
						  location.replace(location.href);
					  } else {
						  layer.msg('ERROR!! There are contact details');
					  }
				  }, error: function(data) {
					  layer.msg('system error, please contact administrator')
				  }
				});
		});
	}
</script>
</html>