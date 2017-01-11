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
	<div class="page-container">
		<form class="form form-horizontal" action="addStockItemSupplier.htm" id="form-addStockItemSupplierForm">
		<div class="text-l"> Stock Description：
		${stockItem.description}
		<input type="hidden" id="stockId" name="stockId" value="${stockItem.id}">
		<input list="supplierList" name="supplierName" class="input-text" style="width: 400px">
		<datalist id="supplierList">
		  		<c:forEach items="${supplierList}" var="supplier" varStatus="status">
				<option value="${supplier.name}">
				</c:forEach>
		</datalist>
		<input type="text" class="input-text" placeholder="price" id="price" name="price" style="width: 100px" datatype="/[0-9]+([.]{1}[0-9]+){0,1}$/"><!-- 只能输入整数或小数 -->
		<input type="text" class="input-text" placeholder="Unit Of Measur" id="uom" name="uom" style="width: 100px" datatype="/^[A-Za-z]+$/" >
		<span><input type="checkbox" class="input-checkbox" id="isdefault">is default</span>
		<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe600;</i> Add Supplier</button>
		</div>
		</form>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr>
						<th scope="col" colspan="8"><fmt:message key="module.supplier" />
						</th>
					</tr>
					<tr class="text-c">
						<th width="5%">SN</th>
						<th width="45%">Supplier</th>
						<th width="10%">Price</th>
						<th width="10%">IsDefault</th>
						<th width="25%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stockItemSupplierList}" var="stockItemSupplier" varStatus="status">
						<tr class="text-c">
							<td>${status.count }</td>
							<td class=""> ${stockItemSupplier.name }</td>
							<td class=""> ${stockItemSupplier.price }</td>
							<td class=""> ${stockItemSupplier.isdefault }</td>
							<td class="f-14 td-manage">
							<a style="text-decoration:none" onClick="admin_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-addStockItemSupplierForm").Validform({
		tiptype:3,
		datatype:{
			"f":/[0-9]+([.]{1}[0-9]+){0,1}$/, //只能输入整数或小数
		},
		beforeSubmit: function(form) {
			$.sndPostAjax(form);
			return false;
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
	function contact_del(obj,url,id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				  method: "POST",
				  url: url,
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