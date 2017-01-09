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
<title>产品分类</title>
</head>
<body>
	<nav class="breadcrumb">
		<a href="javascript:;"
			onclick="openWind('Menu Category','menuCategoryMain.htm')"
			class="btn btn-success radius"> Menu Category</a> <a
			href="javascript:;" onclick="openWind('Menu','menuList.htm')"
			class="btn btn-success radius"> Menu </a> <a
			href="javascript:;" onclick="openWind('MenuItem Group','menuItemGroupMain.htm')"
			class="btn btn-success radius"> MenuItem Group </a> <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<table class="table">
		<tr>
			<td width="100" class="va-t">
				<ul class="menu radius box-shadow">
					<c:forEach items="${model.menuCategoryList }" var="menuCategory">
						<li>
						<a href="#" class="dropDown_A">${menuCategory.menuCategoryName}<i class="arrow Hui-iconfont">&#xe6d7;</i></a> 
							<ul class="menu">
							<c:forEach
								items="${model.menuList}" var="menu">
								
								<c:if test="${menu.menuCategoryId == menuCategory.id }">
										<li><a href="javascript:;">${menu.menuName}</a></li>
								</c:if>
							</c:forEach>
							</ul>
						</li>
					</c:forEach>

				</ul>
			</td>
			<td class="va-t"><IFRAME ID="testIframe" Name="testIframe"
					FRAMEBORDER=0 SCROLLING=AUTO width=100% height=500px
					SRC="menuItemMain.htm"></IFRAME></td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
	<script type="text/javascript">
		function openWind(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
	</script>
</body>
</html>