<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE HTML>
<html ng-app="COA" ng-controller="coaCtrl">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="/WEB-INF/jsp/_meta.jsp"%>
<title>Chart Of Accounts</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 
		<fmt:message key="home" /> <span class="c-gray en">&gt;</span>
		<fmt:message key="module.account" /> <span class="c-gray en">&gt;</span> 
		<fmt:message key="module.account.generalLedger.COA" /> <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" onclick="javascript:location.reload();" title="<fmt:message key="action.reload" />"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<form class="form form-horizontal" action="saveLedgerGroup.htm" id="form-ledger-group">
			<div class="row cl">
				<label class="form-label col-xs-1">Ledger Type</label>
				<div class="formControls col-xs-3">
					<span class="select-box">
					<select class="select" datatype="*" name="ledgerType"
						ng-model="model.ledgerType" ng-options="model.ledgerType as model.ledgerType for model in glList">
						<option value=""> Select Ledger Group</option>
					</select>
					<!-- 
					<select class="select" size="1" id="ledgerType" name="ledgerType" datatype="*"
						 nullmsg="Please Select Ledger Type">
						<option value=""></option>
						<c:forEach items="${glList }" var="gl">
						<option value="${gl.ledgerType}">${gl.accountType}</option>
						</c:forEach>
					</select> -->
					</span>
				</div>
				
				<label class="form-label col-xs-1">Ledger Group</label>
				<div class="formControls col-xs-3">
					<span class="select-box">
					<select class="select" name="ledgerGroup" ng-model="model.ledgerGroup"
					 ng-options="lg.ledgerGroup for lg in lgList | filter:{ledgerType: model.ledgerType}:true">
						<option value=""> Select Ledger Group</option>
					</select>
					<!-- 
					<select class="select" size="1" id="ledgerGroup" name="ledgerGroup">
						<option value=""></option>
						<c:forEach items="${lgList }" var="lg">
						<option value="${lg.ledgerGroup}">${lg.ledgerGroup}</option>
						</c:forEach>
					</select> -->
					</span>
				</div>
				<label class="form-label col-xs-1">GST Type</label>
				<div class="formControls col-xs-1">
					<input type="text" datatype="s2-9" name="gstType" ng-model="model.gstType"
						style="width: 50px" class="input-text">
				</div>
				<label class="form-label col-xs-1">GST Rate</label>
				<div class="formControls col-xs-1">
					<input type="text" datatype="s2-9" name="gstRate" ng-model="model.gstRate"
						style="width: 50px" class="input-text">
				</div>
				
			</div>
			<div class="row cl">
				<label class="form-label col-xs-1">Description</label>
				<div class="formControls col-xs-3">
					<input type="hidden" id="id" name="id" value="0">
					<input type="text" datatype="s4-50" name="description" ng-model="model.description"
					style="width: 250px" class="input-text">
				</div>
				<label class="form-label col-xs-1">Account Code</label>
				<div class="formControls col-xs-3">
					<input type="text" datatype="n4-4" name="accountCode" ng-model="model.accountCode"
					style="width: 250px" class="input-text">
				</div>
				<label class="form-label col-xs-1"></label>
				<div class="formControls col-xs-2">
					<button class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe632;</i> <fmt:message key="action.save" />
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
						<th width="5%">SN</th>
						<th width="10%">Ledger Type</th>
						<th width="10%">Ledger Group</th>
						<th width="5%">Account Code</th>
						<th width="20%">Description</th>
						<th width="5%">GST Type</th>
						<th width="5%">GST Rate</th>
						<th width="20%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c" ng-repeat="coa in coaList">
						<td>{{$index + 1}}</td>
						<td>{{coa.ledgerType}}</td>
						<td>{{coa.ledgerGroup}}</td>
						<td>{{coa.accountCode}}</td>
						<td>{{coa.description}}</td>
						<td>{{coa.gstType}}</td>
						<td>{{coa.gstRate}}</td>
						<td class="f-14 td-manage">
						<a><i class="Hui-iconfont">&#xe6e2;</i>
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

<script>
var app = angular.module('COA', []);
app.controller('coaCtrl', function($scope, $http) {
    $http.get("chartOfAccounts.htm").then(function (response) {$scope.coaList = response.data;});
    $http.get("generalLedgerService.htm").then(function (response) {$scope.glList = response.data;});
    $http.get("ledgerGroupService.htm").then(function (response) {$scope.lgList = response.data;});
});
</script>
<script type="text/javascript">
$(function(){
	$("#form-ledger-group").Validform({
		tiptype:3,
		beforeSubmit: function(form) {
			console.log($(form).serializeJsonArray());
			return false;
			ajax_save_reload(form, 'y');
			return false;
		}
	});
	
});
</script>
</html>