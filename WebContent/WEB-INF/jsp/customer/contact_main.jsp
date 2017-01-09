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
<title>Menu Category</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		客户管理 <span class="c-gray en">&gt;</span> Customer Contact <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" onclick="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<form class="form form-horizontal" action="" id="form-customer">
			<div class="row cl">
			<label class="form-label col-xs-2">Customer Name：</label>
			<div class="formControls col-xs-2">
				<input type="hidden" id="id" name="id" value="${model.customer.id }">
				<input type="text" name="name" id="name" datatype="s4-50" value="${model.customer.name }"
				style="width: 250px" class="input-text">
			</div>
			
			<label class="form-label col-xs-1"></label>
			<div class="formControls col-xs-2">
				<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe632;</i> 保存
			</button>
			</div>
			</div>
			</form>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr>
						<th scope="col" colspan="8">Bill Contact
						<a href="javascript:;" onclick="new_wind('New Bill Address','newCustomerBillContact.htm?customerId=${model.customer.id}')" class="btn btn-success radius"><i class="Hui-iconfont">&#xe600;</i> New Bill Address</a>
						</th>
					</tr>
					<tr class="text-c">
						<th width="10"><input type="checkbox" name="" value=""></th>
						<th>Bill Attention</th>
						<th>Bill Mobile</th>
						<th>Bill Telephone</th>
						<th>Bill Email</th>
						<th>Bill Address</th>
						<th>Bill PostCode</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.billContactList}" var="billContact" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td class=""> ${billContact.billAttention }</td>
							<td class=""> ${billContact.billMobile }</td>
							<td class=""> ${billContact.billTelephone }</td>
							<td class=""> ${billContact.billEmail }</td>
							<td class=""> ${billContact.billAddress1 }</td>
							<td class=""> ${billContact.billPostcode }</td>
							<td class="f-14 td-manage"><a
								style="text-decoration: none" class="ml-5"
								onClick="menuCategory_edit(this,'${menuCategory.id}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<!-- 
								<a style="text-decoration: none" class="ml-5"
								onClick="stock_del(this,${menuCategory.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								 -->
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr>
						<th scope="col" colspan="8">Delivery Contact
						<a href="javascript:;" onclick="new_wind('New Delivery Address','newCustomerDeliveryContact.htm?customerId=${model.customer.id}')" class="btn btn-success radius"><i class="Hui-iconfont">&#xe600;</i> New Delivery Address</a>
						</th>
					</tr>
					<tr class="text-c">
						<th width="10"><input type="checkbox" name="" value=""></th>
						<th>Delivery Attention</th>
						<th>Delivery Mobile</th>
						<th>Delivery Telephone</th>
						<th>Delivery Email</th>
						<th>Delivery Address</th>
						<th>Delivery PostCode</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.deliveryContactList}" var="deliveryContact" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td class=""> ${deliveryContact.deliveryAttention }</td>
							<td class=""> ${deliveryContact.deliveryMobile }</td>
							<td class=""> ${deliveryContact.deliveryTelephone }</td>
							<td class=""> ${deliveryContact.deliveryEmail }</td>
							<td class=""> ${deliveryContact.deliveryAddress1 }</td>
							<td class=""> ${deliveryContact.deliveryPostcode }</td>
							<td class="f-14 td-manage"><a
								style="text-decoration: none" class="ml-5"
								onClick="menuCategory_edit(this,'${menuCategory.id}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<!-- 
								<a style="text-decoration: none" class="ml-5"
								onClick="stock_del(this,${menuCategory.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								 -->
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-menuCategory").Validform({
		tiptype:3,
		callback:function(form){
			form[0].submit();
		}
	});
});
$('.table-sort').dataTable({
	"paging" : false,
	"searching" : false,
    "ordering" :  false
});
	/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
	*/
	function new_wind(title,url){
		layer_show(title,url,"800","520");
	}
	/*删除*/
	function stock_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				  method: "POST",
				  url: "deleteStock.htm",
				  data: { id: id }
				}).done(function( msg ) {
				    layer.msg('删除成功!');
				    location.replace(location.href);
				}).fail(function() {
					layer.msg('删除出错!');
				 });
			
		});
	}
</script>
</html>