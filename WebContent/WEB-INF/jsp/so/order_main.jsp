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
<title>销售订单管理</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		销售订单管理 <span class="c-gray en">&gt;</span> 订单管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<span class="select-box inline"> <select name=""
				class="select">
					<option value="0">全部分类</option>
					<option value="1">分类一</option>
					<option value="2">分类二</option>
			</select>
			</span> 日期范围： <input type="text"
				onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})"
				id="logmin" class="input-text Wdate" style="width: 120px;">
			- <input type="text"
				onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})"
				id="logmax" class="input-text Wdate" style="width: 120px;">
			<input type="text" name="" id="" placeholder=" 资讯名称"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> 搜资讯
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
			<a href="javascript:;" onclick="user_add('新建订单','new_order.htm','800','550')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新建订单</a>
			</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="5"><input type="checkbox" name="" value=""></th>
						<th width="20">状态</th>
						<th width="20">财务状态</th>
						<th>订单号码</th>
						<th width="100">客户名称</th>
						<th width="100">开单日期</th>
						<th width="100">活动日期</th>
						<th width="20">人数</th>
						<th width="100">联系人</th>
						<th width="100">电话／手机</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="so" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td><span class="label label-success radius">${so.postStatus }</span></td>
							<td class="text-l"><span class="label label-success radius">${so.billStatus }</span></td>
							<td>${so.soNumber }</td>
							<td>${so.custName }</td>
							<td> <fmt:formatDate value="${so.soDate}" pattern="yyyy-MM-dd"/> </td>
							<td><fmt:formatDate value="${so.eventDate }" pattern="yyyy-MM-dd"/></td>
							<td class="td-status">${so.noPax }</td>
							<td class="td-status">${so.custAttention }</td>
							<td class="td-status">${so.custTelephone } </td>
							
							<td class="f-14 td-manage"><a style="text-decoration: none"
								onClick="article_stop(this,'10001')" href="javascript:;"
								title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a
								style="text-decoration: none" class="ml-5"
								onClick="article_edit('资讯编辑','article-add.html','10001')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration: none" class="ml-5"
								onClick="article_del(this,'10001')" href="javascript:;"
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
		"aaSorting" : [ [ 3, "desc" ] ],//默认第几个排序
		"bStateSave" : true,//状态保存
		"aoColumnDefs" : [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [ 0, 10]
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
	/*管理员-增加*/
	function user_add(title,url,w,h){
		layer_show(title,url,w,h);
	}
</script>
</html>