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
<title><fmt:message key="module.userManager"/></title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-new-user" action="saveNewUser.htm">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">
		<span class="c-red">*</span><fmt:message key="module.userManager.label.username"/>：
		</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="hidden" id="id" name="id" value="0">
			<input type="text" class="input-text" placeholder="<fmt:message key="module.userManager.label.username"/>" 
				id="username" name="username" datatype="/^[\w\u4E00-\u9FA5\uF900-\uFA2D]*$/" nullmsg="Not Empty">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">
		<span class="c-red">*</span><fmt:message key="module.userManager.label.password"/>：
		</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="password" class="input-text" autocomplete="off" placeholder="<fmt:message key="module.userManager.label.password"/>" 
				id="password" name="password">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">
		<span class="c-red">*</span><fmt:message key="module.userManager.label.confirmPassword"/>：
		</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="password" class="input-text" autocomplete="off"  placeholder="<fmt:message key="module.userManager.label.confirmPassword"/>" 
				id="password2" name="password2" recheck="password" errormsg="您两次输入的账号密码不一致！">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">
		<span class="c-red">*</span><fmt:message key="module.userManager.label.email"/>：
		</label>
		<div class="formControls col-xs-8 col-sm-6">
			<input type="text" class="input-text" placeholder="@" name="email" id="email">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-success radius" type="submit" value="<fmt:message key="action.save" />">
		</div>
	</div>
	</form>
</article>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp" %>
<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	$("#form-new-user").Validform({
		tiptype:3,
		beforeSubmit: function(form) {
			ajax_save_reload(form);
			return false;
		}
	});
	
});
/**
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-new-user").validate({
		rules:{
			username:{
				required:true,
				minlength:4,
				maxlength:20
			},
			password:{
				required:true,
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
			email:{
				required:true,
				email:true,
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
*/
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</html>