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
<title>General Ledger</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> <fmt:message key="home" /> <span class="c-gray en">&gt;</span>
		<fmt:message key="module.account" /> <span class="c-gray en">&gt;</span> <fmt:message key="module.account.generalLedger" /> <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" onclick="javascript:location.reload();" title="<fmt:message key="action.reload" />"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="10%">SN</th>
						<th width="20%">Ledger Type</th>
						<th width="20%">Account Type</th>
						<th width="30%">Account Code</th>
						<th width="20%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="gl" varStatus="status">
						<tr class="text-c">
							<td>${status.count }</td>
							<td>${gl.ledgerType }</td>
							<td>${gl.accountType }</td>
							<td>${gl.accountCode } - ${gl.endCode }</td>
							<td class="f-14 td-manage">
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript">
	
</script>
</html>