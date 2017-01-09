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
<title>User Manager</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		客户管理 <span class="c-gray en">&gt;</span> 客户列表 <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" onclick="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="customerFilterKeyword.htm" id="form-query">
			<input type="text" name="keyword" id="keyword" placeholder=" 关键字" value="${model.keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> 查询
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;" onclick="openWind('新建客户','customerDetails.htm')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新建客户</a></span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="100">SN</th>
						<th>客户名</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.list}" var="customer" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td>${status.count }</td>
							<td><a href="javascript:;" class="btn btn-link radius" 
								onclick="loadPage('customerContactMaster.htm?customerId=${customer.id}')">${customer.name }</a></td>
							<td class="f-14 td-manage"><a style="text-decoration: none" class="ml-5"
								onClick="user_edit('用户编辑','editUser.htm?id=${customer.id}','800','520')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration: none" class="ml-5"
								onClick="user_del(this,${customer.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
</script>
</html>