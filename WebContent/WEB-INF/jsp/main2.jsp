<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/_meta.jsp" %>
<title>Food Solution</title>
</head>
<body>
	<header class="navbar-wrapper">
	<div class="navbar navbar-black">
		<div class="container-fluid cl">
			<a class="logo navbar-logo hidden-xs" href="/aboutHui.shtml">Logo</a>
			<a class="logo navbar-logo-m visible-xs" href="/aboutHui.shtml">H-ui</a>
			<span class="logo navbar-slogan hidden-xs">Description</span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;"></a>
			<nav id="Hui-nav" class="nav navbar-nav">
			<ul class="cl">
				<li id="Huinav_1"><a href="/index.shtml">Home</a></li>
				<li id="Huinav_2"><a href="/Hui-overview.shtml">home1</a></li>
				<li id="Huinav_3"><a href="/lib/jquery.cookie.js.shtml">home</a>
				</li>
				<li id="Huinav_4"><a href="/ext/list.shtml">home</a></li>
				<li id="Huinav_5"><a href="/cases/index.shtml">home</a></li>
			</ul>
			</nav>
			<nav class="navbar-userbar f-r hidden-xs hidden-sm"> <a
				href="javascript:void(0);" onclick="addFavoritepage();return !1;"
				class="btn btn-primary radius" title="收藏">button</a> <a
				class="btn btn-success radius" target="_blank"
				href="/shareCode.shtml">Password</a> <a
				class="btn btn-success radius juanzeng" target="_blank"
				href="juanzeng.shtml">Logout</a> </nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62c;</i> <fmt:message key="module.userManager"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="userMain.htm" data-title="<fmt:message key="module.userManager.listing"/>" href="javascript:void(0)"><fmt:message key="module.userManager.listing"/></a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe627;</i> <fmt:message key="module.salesOrder"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="order_main.htm" data-title="<fmt:message key="module.salesOrder.listing"/>" href="javascript:void(0)"><fmt:message key="module.salesOrder.listing"/></a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe67f;</i> <fmt:message key="module.inventory"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="stockMain.htm" data-title="<fmt:message key="module.inventory.listing"/>" href="javascript:void(0)"><fmt:message key="module.inventory.listing"/></a></li>
					<li><a _href="product-category.html" data-title="库存分类管理" href="javascript:void(0)">库存分类管理</a></li>
					<li><a _href="menuMain.htm" data-title="菜单管理" href="javascript:void(0)">菜单管理</a></li>
					<li><a _href="purchaseRequestMain.htm" data-title="<fmt:message key="module.inventory.purchaseRequest"/>" href="javascript:void(0)"><fmt:message key="module.inventory.purchaseRequest"/></a></li>
					<li><a _href="menuMain.htm" data-title="<fmt:message key="module.inventory.purchaseOrder"/>" href="javascript:void(0)"><fmt:message key="module.inventory.purchaseOrder"/></a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe62b;</i> <fmt:message key="module.customer"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="customerMain.htm" data-title="<fmt:message key="module.customer.listing"/>" href="javascript:;"><fmt:message key="module.customer.listing"/></a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe611;</i> <fmt:message key="module.supplier"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="supplierMain.htm" data-title="<fmt:message key="module.supplier.listing"/>" href="javascript:;"><fmt:message key="module.supplier.listing"/></a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-tongji">
			<dt><i class="Hui-iconfont">&#xe61a;</i> <fmt:message key="module.report"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="charts-1.html" data-title="折线图" href="javascript:void(0)">折线图</a></li>
					<li><a data-href="charts-2.html" data-title="时间轴折线图" href="javascript:void(0)">时间轴折线图</a></li>
					<li><a data-href="charts-3.html" data-title="区域图" href="javascript:void(0)">区域图</a></li>
					<li><a data-href="charts-4.html" data-title="柱状图" href="javascript:void(0)">柱状图</a></li>
					<li><a data-href="charts-5.html" data-title="饼状图" href="javascript:void(0)">饼状图</a></li>
					<li><a data-href="charts-6.html" data-title="3D柱状图" href="javascript:void(0)">3D柱状图</a></li>
					<li><a data-href="charts-7.html" data-title="3D饼状图" href="javascript:void(0)">3D饼状图</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> <fmt:message key="module.system"/><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="system-base.html" data-title="系统设置" href="javascript:void(0)">系统设置</a></li>
					<li><a data-href="system-category.html" data-title="栏目管理" href="javascript:void(0)">栏目管理</a></li>
					<li><a data-href="system-data.html" data-title="数据字典" href="javascript:void(0)">数据字典</a></li>
					<li><a data-href="system-shielding.html" data-title="屏蔽词" href="javascript:void(0)">屏蔽词</a></li>
					<li><a data-href="system-log.html" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="<fmt:message key="desktop"/>" data-href="welcome.html"><fmt:message key="desktop"/></span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src=""></iframe>
		</div>
	</div>
</section>
	
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp" %>
</html>