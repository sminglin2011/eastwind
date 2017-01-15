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
<title><fmt:message key="module.userManager" /></title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> <fmt:message key="home" /> 
		<span class="c-gray en">&gt;</span> <fmt:message key="module.userManager" />
		<span class="c-gray en">&gt;</span> <fmt:message key="module.userManager.listing" /> 
		<a class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" 
			onclick="replaceHref(location.href);" title="<fmt:message key="action.reload" />">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="userFilterKeyword.htm" id="form-query">
			<input type="text" name="keyword" id="keyword" placeholder=" <fmt:message key="keyword" />" value="${model.keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> <fmt:message key="action.search" />
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> 
			<a href="javascript:;" onclick="popUpWind('<fmt:message key="action.new" />','newUser.htm')" 
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> <fmt:message key="action.new" />
			</a>
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="100">SN</th>
						<th><fmt:message key="module.userManager.label.username" /></th>
						<th><fmt:message key="module.userManager.label.email" /></th>
						<th width="120"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="user" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td>${status.count }</td>
							<td>${user.username }</td>
							<td>${user.email }</td>
							<td class="f-14 td-manage">
								<a style="text-decoration: none" class="ml-5"
									onClick="popUpWind('<fmt:message key="action.edit" />', 'editUser.htm?id=${user.id}')"
									href="javascript:;" title="<fmt:message key="action.edit" />"><i class="Hui-iconfont">&#xe6df;</i>
								</a>
								<a style="text-decoration: none" class="ml-5"
								onClick="ajax_prompt_reload('deleteUser.htm', ${user.id}, 'Are you sure delete?')" href="javascript:;"
								title="<fmt:message key="action.delete" />"><i class="Hui-iconfont">&#xe6e2;</i>
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
	
	/*
	$('.table-sort').dataTable({
		"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
		"bStateSave" : true,//状态保存
		"aoColumnDefs" : [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [ 0, 4 ]
		} // 不参与排序的列
		]
	});
	*/
	/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
	*/
	/*用户-增加
	function user_add(title,url,w,h){
		layer_show(title,url,w,h);
	}*/
	/*用户-删除
	function user_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				  method: "POST",
				  url: "deleteUser.htm",
				  data: { id: id }
				}).done(function( msg ) {
				    //alert( "Data Saved: " + msg );
				    //$(obj).parents("tr").remove();
				    layer.msg('删除成功!');
				    location.replace(location.href);
				}).fail(function() {
				    //alert( "error" );
					layer.msg('删除出错!');
				 });
			
		});
	}*/
	
	/*用户-编辑
	function user_edit(title,url,w,h){
		layer_show(title,url,w,h);
	}
	
	function reloadPage(){
		console.log("reload!!!!!!!!!");
		location.replace(location.href)
	}*/
</script>
</html>