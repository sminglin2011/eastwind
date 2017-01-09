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
<title>MenuItem List</title>
</head>
<body>
	<div class="page-container">
	<form action="saveMenuItem.htm" method="post" class="form form-horizontal" id="form-menu">
		<div class="row cl">
			<label class="form-label col-xs-2">Menu：</label>
			<div class="formControls col-xs-4">
				<input type="hidden" id="id" name="id" value="0"><span class="select-box">
				<select class="select" size="1" id="menuId" name="menuId" datatype="n" nullmsg="Please Select Menu">
					<option value="">Select Menu</option>
					<c:forEach items="${model.menuList }" var="menu">
					<option value="${menu.id}">${menu.menuName}</option>
					</c:forEach>
				</select>
				</span>
			</div>
			<label class="form-label col-xs-2">MenuItemGroup：</label>
			<div class="formControls col-xs-4"> <span class="select-box">
				<select class="select" size="1" id="menuItemGroupId" name="menuItemGroupId" datatype="n" nullmsg="Please Select MenuItemGroup">
					<option value="">Select MenuItemGroup</option>
					<c:forEach items="${model.menuItemGroupList }" var="menuItemGroup">
					<option value="${menuItemGroup.id}">${menuItemGroup.menuItemGroupName}</option>
					</c:forEach>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">FoodItem：</label>
			<div class="formControls col-xs-4"> <span class="select-box">
				<select class="select" size="1" id="foodItemId" name="stockId" datatype="n" nullmsg="Please Select FoodItem">
					<option value="">Select FoodItem</option>
					<c:forEach items="${model.foodItemList }" var="stock">
					<option value="${stock.id}">${stock.description}</option>
					</c:forEach>
				</select>
				</span>
			</div>
			<label class="form-label col-xs-2">Online Name：</label>
			<div class="formControls col-xs-4">
				<input type="text" name="onlineName" id="onlineName" datatype="s4-100"
				style="width: 250px" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-xs-offset-2">
				<button name="" id="" class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe632;</i> 保存
				</button>
			</div>
		</div>
	</form>
	<h4></h4>
	<div class="line"></div>
	<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="10"><input type="checkbox" name="" value=""></th>
						<th>MenuItem Name</th>
						<th>Menu</th>
						<th>MenuItem Group</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.list}" var="menuItem" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td> <input type="hidden" value="${menuItem.stockId }" class="foodItemId"><span class="onlineName">${menuItem.onlineName }</span></td>
							<td> <input type="hidden" value="${menuItem.menuId }" class="menuId">${menuItem.menuName }</td>
							<td> <input type="hidden" value="${menuItem.menuItemGroupId }" class="menuItemGroupId">${menuItem.menuItemGroupName }</td>
							<td class="f-14 td-manage"><a
								style="text-decoration: none" class="ml-5"
								onClick="menuItem_edit(this,'${menuItem.id}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration: none" class="ml-5"
								onClick="menuItem_del(this,${menuItem.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-menu").Validform({
		tiptype:3,
		callback:function(form){
			form[0].submit();
		}
	});
});
$('.table-sort').dataTable({
	//"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
	"bStateSave" : false,//状态保存
	"aoColumnDefs" : [
	{
		"orderable" : false,
		"aTargets" : [ 0, 1, 2, 3, 4 ]
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
	/*编辑*/
	function menuItem_edit(obj, id){
		var menuId = $(obj).parents("tr").find(".menuId").val();
		var menuItemGroupId = $(obj).parents("tr").find(".menuItemGroupId").val();
		var foodItemId = $(obj).parents("tr").find(".foodItemId").val()
		var onlineName= $(obj).parents("tr").find(".onlineName").html()
		
		$("#menuId").val(menuId);
		$("#menuItemGroupId").val(menuItemGroupId);
		$("#foodItemId").val(foodItemId);
		$("#onlineName").val(onlineName);
		
		console.log(menuId, menuItemGroupId, onlineName)
	}
	/*删除*/
	function menuItem_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			location.href = "deleteMenuItem.htm?id="+id
		});
	}
</script>
</html>