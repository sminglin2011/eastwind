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
<title>New Account Payable</title>
</head>
<body>
	<div class="page-container">
		<form action="saveAP.htm" method="post" class="form form-horizontal responsive" id="form-ap">
		<div class="row cl">
			<label class="form-label col-xs-2">AP Number：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text disabled" ng-model="ap.apNumber" >
			</div>
			<label class="form-label col-xs-2">Date：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" id="ap.date" ng-model="ap.date" 
				onfocus="WdatePicker()" datatype="*">
			</div>
			<label class="form-label col-xs-2">Pay Type：</label>
			<div class="formControls col-xs-2">
				<span class="select-box">
					<select class="select" datatype="*"
						ng-model="ap.payType" ng-options="pt.type as pt.type for pt in payTypes">
						<option value=""> Select Terms</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Supplier：</label>
			<div class="formControls col-xs-6">
				<input list="supplierList" type="text" class="input-text" ng-model="ap.supplierName" 
				datatype="*3-50" nullmsg="Supplier cannot empry" >
				<datalist id="supplierList">
				<option ng-repeat="s in supplierList" value="{{s.name}}">{{s.name}}</option>
				</datalist>
			</div>
			<label class="form-label col-xs-2">Terms：</label>
			<div class="formControls col-xs-2">
				<span class="select-box">
					<select class="select" datatype="*"
						ng-model="ap.terms" ng-options="t.terms as t.terms for t in terms">
						<option value=""> Select Terms</option>
					</select>
				</span>
			</div>
		</div>
		<p/>
		<div class="line"></div>
		<h4>Account Payable Items</h4>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover">
				<thead>
					<tr class="text-c">
						<th width="5%">SN</th>
						<th width="30%">Description</th>
						<th width="25%">Remarks</th>
						<th width="15%">Account Code</th>
						<th width="10%">Quantity</th>
						<th width="15%">Unit Price</th>
						<th width="10%">UOM</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c" ng-repeat="i in itemList">
						<td style="padding:0px;">{{$index+1}}</td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="*1-50" ignore="ignore" ng-model="i.description"></td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="*1-200" ignore="ignore" ng-model="i.remarks"></td>
						<td style="padding:0;">
						<input type="text" list="accountCodeList{{$index+1}}" class="input-text" datatype="n4-4" ignore="ignore" ng-model="i.accountCode">
						<datalist id="accountCodeList{{$index+1}}">
						<option ng-repeat="coa in coaList" value="{{coa.accountCode}}">{{coa.description}}</option>
						</datalist>
						</td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="/[0-9]+([.]{1}[0-9]+){0,1}$/" ignore="ignore" ng-model="i.quantity"></td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="/[0-9]+([.]{1}[0-9]+){0,1}$/" ignore="ignore" ng-model="i.unitPrice"></td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="s1-6" ignore="ignore" ng-model="i.uom"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-xs-offset-2">
				<button name="" id="" class="btn btn-success" type="submit" ng-click="save()">
					<i class="Hui-iconfont">&#xe632;</i> <fmt:message key="action.save" />
				</button>
			</div>
		</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
var validForm = false;
$(function(){
	$('.table').dataTable( {  
		"info": false,
		"paging": false,
        "bSort": false,
        "bLengthChange": false,
        "searching": false
     } );
	/* below test function
	$('.table-sort tbody').on( 'dblclick', 'td', function () {
		console.log(table.cell(this), "what is it ?");
		var rowNumber = table.cell( this ).index().row;
		console.log(rowNumber, "what is it ?");
	    console.log( data );
		console.log($(this).html());
	} );
	*/
	validForm = $("#form-ap").Validform({
		tiptype:7,
		beforeSubmit:function(form) { // here must return false to stop submit data by form
			return false;
		}
	});
	
});
var app = angular.module('ap', []);
app.controller('apCtrl', function($scope, $http) {
	$scope.ap = {};
	$scope.ap.apNumber = new Date().getTime(); //base on current time general AP number
	
	var apItem = {id:0, apNumber:$scope.ap.apNumber, description:'', remarks:'', accountCode:'', quantity:'', unitPrice:'', uom:''};
	$scope.itemList = [];
	if ($scope.itemList.length==0) { //init items table 
		for (var int = 0; int < 10; int++) {
			$scope.itemList.push({id:0, apNumber:$scope.ap.apNumber, description:'', remarks:'', accountCode:'', quantity:'', unitPrice:'', uom:''});
		}
	}
	
	
	$scope.terms = [{id:1, terms:'C.O.D'}, {id:2, terms:'7 DAYS'}]
	$scope.payTypes = [{id:1, type:'Cash'}, {id:2, type:'Cheque'}]
	
    $http.get("supplierListService.htm").then(function (response) {$scope.supplierList =  response.data;});
    $http.get("chartOfAccounts.htm").then(function (response) {$scope.coaList = response.data;});
    
	/* submit form */
	$scope.save = function() {
		if (validForm.check()) {
			$scope.ap.items = $scope.itemList;
			console.log("ap", $scope.ap);
			console.log("itemList", $scope.itemList);
			$http({ // default headerType json/application
                url:'saveAP.htm',
                method: 'POST',            
                data: $scope.ap
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
	}
    
});
</script>
</html>