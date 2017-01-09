<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="/WEB-INF/jsp/_meta.jsp" %>
<title>Stock 编辑</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-new-stock" action="saveNewStock.htm">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>项目描述：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="hidden" id="id" name="id" value="${model.stock.id}">
			<input type="text" class="input-text" placeholder="" id="description" name="description" value="${model.stock.description}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">项目描述1：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="text" class="input-text" placeholder="项目描述" id="description1" name="description1" value="${model.stock.description1}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">单位：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="text" class="input-text" placeholder="单位" id="unitMs" name="unitMs" value="${model.stock.unitMs}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>Category：</label>
		<div class="formControls col-xs-8 col-sm-6">
			<c:forEach items="${model.categoryList }" var="category" varStatus="i">
			<div class="radio-box">
				<input name="categoryId" type="radio" id="category-${i.count}" value="${category.id}"
				<c:if test="${category.id == model.stock.categoryId}"> checked</c:if> >
				<label for="category-${i.count}">${category.name}</label>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-new-stock").validate({
		rules:{
			description:{
				required:true,
				minlength:4,
				maxlength:50
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			console.log("ajax submit");
			var result  = $(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.location.replace(parent.location.href)
			parent.layer.close(index);
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp" %>
</html>