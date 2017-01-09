<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/WEB-INF/jsp/_meta.jsp"%>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		系统设置 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
	<form action="saveSysSetting.htm" method="post" class="form form-horizontal responsive" id="sysForm">
		<table class="table table-bg table-border table-bordered table-striped">
				<thead>
				    <tr><th width="25%"></th><th></th></tr>
				</thead>
				<tbody>
					<tr>
						<th class="text-r" scope="row">网站域名</th>
						<td colspan="4"><input type="text" id="doMain" name="doMain" placeholder="默认尺寸" class="input-text radius size-M" value="${model.sys.doMain}"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">网站网址</th>
						<td colspan="4"><input type="text" id="website" name="website" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">网站名称</th>
						<td colspan="4"><input type="text" id="websiteName" name="websiteName" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">主网站LOGO</th>
						<td colspan="4"><input type="text" id="websiteLogo" name="websiteLogo" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">用户中心LOGO:</th>
						<td colspan="4"><input type="text" id="websiteSLogo" name="websiteSLogo" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">ICP证书号</th>
						<td colspan="4"><input type="text" id="icp" name="icp" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">网站统计代码</th>
						<td colspan="4"><input type="text" id="sumCode" name="sumCode" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">网站首页SEO标题</th>
						<td colspan="4"><input type="text" id="seoTitle" name="seoTitle" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">页面SEO关键词 meta_keywords</th>
						<td colspan="4"><input type="text" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">页面SEO关键词 meta_keywords</th>
						<td colspan="4"><input type="text" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					<tr>
						<th class="text-r" scope="row">页面SEO描述 meta_description</th>
						<td colspan="4"><input type="text" placeholder="默认尺寸" class="input-text radius size-M"></td>
					</tr>
					
					<tr>
						<th class="text-r" scope="row"><input class="btn btn-primary radius" type="submit" value="提交保存"></th>
						<td colspan="4"></td>
					</tr>
				</tbody>
			</table>
	</form>
	</div>
	<%@ include file="/WEB-INF/jsp/_footer.jsp"%>

</body>
</html>