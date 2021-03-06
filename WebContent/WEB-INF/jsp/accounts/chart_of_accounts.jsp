﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<fmt:message key="module.account.generalLedger.ledgerGroup.COA" /> <a
			class="btn btn-success radius r btn-refresh"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:;" onclick="javascript:location.reload();" title="<fmt:message key="action.reload" />"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<form class="form form-horizontal" action="saveCOA.htm" id="form-ledger-group">
			<div class="row cl">
				<input type="hidden" ng-model="model.id">
				<label class="form-label col-xs-1">Ledger Type</label>
				<div class="formControls col-xs-3">
					<span class="select-box">
					<select class="select" datatype="*" name="ledgerType"
						ng-model="model.ledgerType" ng-options="model.ledgerType as model.ledgerType for model in glList">
						<option value=""> Select Ledger Group</option>
					</select>
					</span>
				</div>
				
				<label class="form-label col-xs-1">Ledger Group</label>
				<div class="formControls col-xs-3">
					<span class="select-box">
					<select class="select" name="ledgerGroup" ng-model="model.ledgerGroup"
					 ng-options="model.ledgerGroup as model.ledgerGroup for model in lgList | filter:{ledgerType: model.ledgerType}:true">
						<option value=""> Select Ledger Group</option>
					</select>
					</span>
				</div>
				<label class="form-label col-xs-1">GST Type</label>
				<div class="formControls col-xs-1">
					<input type="text" datatype="s2-9" name="gstType" ng-model="model.gstType"
						style="width: 50px" class="input-text">
				</div>
				<label class="form-label col-xs-1">GST Rate</label>
				<div class="formControls col-xs-1">
					<input type="text" datatype="n1-3" name="gstRate" ng-model="model.gstRate"
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
					<button class="btn btn-success" type="submit" ng-click="processForm()">
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
						<th width="10%">Account Code</th>
						<th width="15%">Description</th>
						<th width="10%">GST Type</th>
						<th width="10%">GST Rate</th>
						<th width="10%"><fmt:message key="action" /></th>
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
						<a style="text-decoration: none" class="ml-5" ng-click="editCOA(coa.id)"><i class="Hui-iconfont">&#xe6df;</i>
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
var validForm;
$(function(){
	$('.table-sort tbody').on( 'dblclick', 'td', function () {
		console.log($(this).html());
	} );
	
	validForm = $("#form-ledger-group").Validform({
		tiptype:7,
		beforeSubmit: function(form) {
			//ajax_save_reload(form, 'y');
			console.log("aaaaa");
			return false;
		}
	});
	
});
var app = angular.module('COA', []);
app.controller('coaCtrl', function($scope, $http) {
	$scope.coaList= {};
    $http.get("chartOfAccounts.htm").then(function (response) {$scope.coaList = response.data; console.log("data fromat", $scope.coaList);});
    $http.get("generalLedgerService.htm").then(function (response) {$scope.glList = response.data;});
    $http.get("ledgerGroupService.htm").then(function (response) {$scope.lgList = response.data;});
   
    $scope.editCOA = function(id) {
    	$scope.models = $scope.coaList.filter(function(coa){ //forEach
    		if(coa.id == id){
    			console.log("what is it coa= " , coa);
    			return coa;
    		}
    	});
    	$scope.model = $scope.models[0];
    	console.log($scope.model,"edit..........", id );
    };
    // process the form
    $scope.processForm = function() {
    	console.log($scope.model,"111111111111111111===="+validForm.check());
    	if(validForm.check()) {
    		console.log(JSON.stringify($scope.model));
    		$http({ // default headerType json/application
                url:'saveCOA.htm',
                method: 'POST',            
                data: $scope.model      
            }).success(function(data){
            	if (data.status == 'y') {
					layer.msg(data.msg, { icon : 1, time : 2000 });
					location.reload();//replace(location.href)
				} else {
					layer.msg(data.msg, { icon : 5, time : 2000 });
				}
            }).error(function(){
            	layer.msg('system run ajax error', { icon : 5, time : 2000 });
            });
    	}
    };
});
</script>
</html>