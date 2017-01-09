<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/_meta.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Staff</title>
</head>

<body>
	<form action="" method="post" class="form form-horizontal responsive" id="demoform">
		<div class="row cl">
			<label class="form-label col-xs-2">邮箱：</label>
			<div class="formControls col-xs-5">
				<input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">用户名：</label>
			<div class="formControls col-xs-5">
				<input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="username" id="username" datatype="*4-16" nullmsg="用户名不能为空">
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">账户：</label>
			<div class="formControls col-xs-5">
				<input type="text" class="input-text" autocomplete="off" placeholder="手机/邮箱" name="username" id="username" datatype="m|e" nullmsg="账户不能为空">
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">密码：</label>
			<div class="formControls col-xs-5">
				<input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password" id="password" datatype="*6-18" nullmsg="请输入密码！" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">密码验证：</label>
			<div class="formControls col-xs-5">
				<input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password2" id="password2" recheck="password" datatype="*6-18" nullmsg="请再输入一次密码！" errormsg="您两次输入的密码不一致！" >
			</div>
			<div class="col-xs-5"> </div>
		</div>
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
		<div class="row cl">
			<label class="form-label col-xs-2">附件：</label>
			<div class="formControls col-xs-5"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly  datatype="*" nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" multiple name="file-2" class="input-file">
				</span> </div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">所在城市：</label>
			<div class="formControls col-xs-5"> <span class="select-box">
				<select class="select" size="1" name="demo1" datatype="*" nullmsg="请选择所在城市！">
					<option value="" selected>请选择城市</option>
					<option value="1">北京</option>
					<option value="2">上海</option>
					<option value="3">广州</option>
				</select>
				</span> </div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">网址：</label>
			<div class="formControls col-xs-5">
				<input type="text" class="input-text" placeholder="http://" name="username" id="username" datatype="url" nullmsg="网址不能为空">
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">备注：</label>
			<div class="formControls col-xs-5">
				<textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-500" nullmsg="备注不能为空！" onKeyUp="textarealength(this,500)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p>
			</div>
			<div class="col-xs-5"> </div>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-xs-offset-2">
				<input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp" %>
</html>