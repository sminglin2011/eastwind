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
<title>MenuItemGroup</title>
</head>
<body>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<form class="form form-horizontal" action="saveMenuItemGroup.htm" id="form-menuCategory">
			<div class="row cl">
			<label class="form-label col-xs-3">MenuItemGroup Name：</label>
			<div class="formControls col-xs-3">
				<input type="hidden" id="id" name="id" value="0">
				<input type="text" name="MenuItemGroupName" id="MenuItemGroupName" value="" datatype="s4-50"
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
					<tr class="text-c">
						<th width="10"><input type="checkbox" name="" value=""></th>
						<th>MenuItemGroup Name</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.list}" var="menuItemGroup" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td class="menuItemGroupName"> ${menuItemGroup.menuItemGroupName }</td>
							<td class="f-14 td-manage"><a
								style="text-decoration: none" class="ml-5"
								onClick="menuItemGroup_edit(this,'${menuItemGroup.id}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration: none" class="ml-5"
								onClick="menuItemGroup_del(this,${menuItemGroup.id})" href="javascript:;"
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
	$("#form-menuCategory").Validform({
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
		"aTargets" : [ 0, 1, 2 ]
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
	function menuItemGroup_edit(obj, id){
		var groupName = $(obj).parents("tr").find(".menuItemGroupName").html();
		
		$("#id").val(id);
		$("#MenuItemGroupName").val(groupName);
		console.log($("#id").val())
	}
	/*删除*/
	function menuItemGroup_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			location.href = "deleteMenuItemGroup.htm?id="+id;
		});
	}
</script>
</html>