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
<title>New Menu</title>
</head>
<body>
	<div class="page-container">
	<form action="saveMenu.htm" method="post" class="form form-horizontal" id="form-menu">
		<div class="row cl">
			<label class="form-label col-xs-2">Menu Name：</label>
			<div class="formControls col-xs-2">
				<input type="hidden" id="id" name="id" value="0">
				<input type="text" class="input-text" placeholder="Menu Name" name="menuName" id="menuName" datatype="*3-50" nullmsg="Cannnot empty">
			</div>
			<label class="form-label col-xs-2">Menu Category：</label>
			<div class="formControls col-xs-2"> <span class="select-box">
				<select class="select" size="1" id="menuCategoryId" name="menuCategoryId" datetype="n" nullmsg="Please Select MenuCategory">
					<option value=""></option>
					<c:forEach items="${model.menuCategoryList }" var="menuCategory">
					<option value="${menuCategory.id}">${menuCategory.menuCategoryName}</option>
					</c:forEach>
				</select>
				</span>
			</div>
			<label class="form-label col-xs-1"></label>
			<div class="formControls col-xs-3">
				<div class="check-box">
					<input type="checkbox" id="onlineShow" name="onlineShow">
					<label for="checkbox-6">Show On WebSite</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">MinPax：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Minimum Pax" name="minPax" id="minPax" datatype="n">
			</div>
			<label class="form-label col-xs-2">Price：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Price Per Pax" name="price" id="price">
			</div>
			<label class="form-label col-xs-2">Multiple Delivery：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" placeholder="Multiple Delivery" name="multipleDelivery" id="multipleDelivery" datatype="n">
			</div>
		</div>
		
		<!-- 
		<div class="row cl">
			<label class="form-label col-xs-2">单选框：</label>
			<div class="formControls skin-minimal col-xs-5">
				<div class="radio-box">
					<input type="radio" id="sex-1" name="sex" datatype="*" nullmsg="请选择性别！">
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex">
					<label for="sex-2">女</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-3" name="sex">
					<label for="sex-3">保密</label>
				</div>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">爱好：</label>
			<div class="formControls skin-minimal col-xs-5">
				<div class="check-box">
					<input type="checkbox" id="checkbox-5" name="checkbox2" datatype="*" nullmsg="爱好不能为空！">
					<label for="checkbox-5">上网</label>
				</div>
				<div class="check-box">
					<input type="checkbox" id="checkbox-6" name="checkbox2">
					<label for="checkbox-6">摄影</label>
				</div>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		 -->
		
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
						<th>Menu Category</th>
						<th>Menu Name</th>
						<th>MinPax</th>
						<th>Price</th>
						<th>MultipleDelivery</th>
						<th>Show On WebSite</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.list}" var="menu" varStatus="status">
						<tr class="text-c">
							<td><input type="checkbox" value="" name=""></td>
							<td> <input type="hidden" id="menuCategoryId" value="${menu.menuCategoryId }">${menu.menuCategoryName }</td>
							<td class="menuName"> ${menu.menuName }</td>
							<td class="minPax"> ${menu.minPax }</td>
							<td class="price"> ${menu.Price }</td>
							<td class="multipleDelivery"> ${menu.multipleDelivery }</td>
							<td> <input type="hidden" id="onlineShow" value="${menu.onlineShow }">${menu.onlineShow }</td>
							<td class="f-14 td-manage"><a
								style="text-decoration: none" class="ml-5"
								onClick="menu_edit(this,${menu.id})"
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
		"aTargets" : [ 0, 1, 2, 3, 4, 5, 6, 7 ]
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
	function menu_edit(obj, id){
		var menuName = $(obj).parents("tr").find(".menuName").html();
		var menuCategoryId = $(obj).parents("tr").find("#menuCategoryId").val()
		var onlineShow = $(obj).parents("tr").find("#onlineShow").val();
		var minPax = $(obj).parents("tr").find(".minPax").html();
		var price = $(obj).parents("tr").find(".price").html();
		var multipleDelivery = $(obj).parents("tr").find(".multipleDelivery").html();
		$("#id").val(id);
		console.log($("#id").val(),id);
		$("#menuName").val(menuName);
		$("#menuCategoryId").val(menuCategoryId);
		$("#minPax").val(minPax);
		$("#price").val(price);
		$("#multipleDelivery").val(multipleDelivery);
		
		if (onlineShow == "true") {
			$("#onlineShow").attr("checked", "checked");
		} else $("#onlineShow").removeAttr("checked");
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