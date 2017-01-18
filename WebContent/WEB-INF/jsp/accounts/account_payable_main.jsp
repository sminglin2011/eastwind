<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE HTML>
<html ng-app="ap" ng-controller="apCtrl">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="/WEB-INF/jsp/_meta.jsp"%>
<title>Account Payable</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 
		<fmt:message key="home" /> <span class="c-gray en">&gt;</span>
		<fmt:message key="module.account" /> <span class="c-gray en">&gt;</span> 
		<fmt:message key="module.account.generalLedger.ledgerGroup.COA" /> <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" onclick="javascript:location.reload();" title="<fmt:message key="action.reload" />"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form class="form form-horizontal" action="apFilterKeyword.htm" id="form-ap">
			<input type="text" name="keyword" id="keyword" placeholder=" <fmt:message key="keyword"/>" value="${keyword }"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> <fmt:message key="action.search"/>
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;" onclick="openWind('<fmt:message key="action.new"/>','newAp.htm')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> <fmt:message key="action.new"/></a></span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="5%">SN</th>
						<th width="10%">AP Number</th>
						<th width="10%">Date</th>
						<th width="10%">Supplier</th>
						<th width="15%">Pay Type</th>
						<th width="10%">Terms</th>
						<th width="10%">Amount</th>
						<th width="10%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c" ng-repeat="ap in apList">
						<td>{{$index + 1}} {{ap.id}}</td>
						<td>{{ap.apNumber}}</td>
						<td>{{ap.date}}</td>
						<td>{{ap.supplierName}}</td>
						<td>{{ap.payType}}</td>
						<td>{{ap.terms}}</td>
						<td>{{ap.amount}}</td>
						<td class="f-14 td-manage">
						<a style="text-decoration: none" class="ml-5" 
							ng-click="editAp('<fmt:message key="action.edit"/>','editAp.htm',ap.id)"><i class="Hui-iconfont">&#xe6df;</i>
						</a>
						<a style="text-decoration: none" class="ml-5"><i class="Hui-iconfont">&#xe6e2;</i>
						</a>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script type="text/javascript">
(function(){
	var app = angular.module('ap', []);
	app.controller('apCtrl', function($scope, $http) {
	    $http.get("apListService.htm").then(function (response) {$scope.apList = response.data;});
	    $scope.editAp = function(title, url, param) {
	    	openWind(title, url+"?param="+param);
	    }
	});
})();

</script>
</html>