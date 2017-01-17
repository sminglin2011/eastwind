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
		<form action="saveCustomer.htm" method="post" class="form form-horizontal responsive" id="form-ap">
		<div class="row cl">
			<label class="form-label col-xs-2">AP Number：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text disabled" ng-model="ap.apNumber" 
				datatype="*3-50" nullmsg="AP Number cannot empty" ajaxurl="checkDuplicateName.htm">
			</div>
			<label class="form-label col-xs-2">Date：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text" ng-model="ap.date" 
				datatype="*3-50">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2">Supplier：</label>
			<div class="formControls col-xs-2">
				<input list="supplierList" type="text" class="input-text" ng-model="ap.supplier" 
				datatype="*3-50" nullmsg="Supplier cannot empry" >
				<datalist id="supplierList">
				<option ng-repeat="s in supplierList" value="{{s.id}}" ng-show="s.name">{{s.name}}</option>
				</datalist>
			</div>
			<label class="form-label col-xs-2">Pay Type：</label>
			<div class="formControls col-xs-2">
				<span class="select-box">
					<select class="select" datatype="*"
						ng-model="ap.payType" ng-options="pt.payType as pt.payType for pt in payTypes">
						<option value=""> Select Terms</option>
					</select>
				</span>
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
						<th width="10%">Ledger Type</th>
						<th width="10%">Ledger Group</th>
						<th width="10%">Account Code</th>
						<th width="15%">Description</th>
						<th width="10%">GST Type</th>
						<th width="10%">GST Rate</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c" ng-repeat="item in defaultItemList">
						<td style="padding:0px;">{{$index+1}}</td>
						<td style="padding:0;"><input type="text" class="input-text"></td>
						<td style="padding:0;"><input type="text" class="input-text"></td>
						<td style="padding:0;"><input type="text" class="input-text"></td>
						<td style="padding:0;"><input type="text" class="input-text"></td>
						<td style="padding:0;"><input type="text" class="input-text"></td>
						<td style="padding:0;"><input type="text" class="input-text"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-xs-offset-2">
				<button name="" id="" class="btn btn-success" type="submit">
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
	$("#form-customer").Validform({
		tiptype:3,
		beforeSubmit:function(form) { // here must return false to stop submit data by form
			return false;
		}
	});
	
});
var app = angular.module('ap', []);
app.controller('apCtrl', function($scope, $http) {
	$scope.ap = {};
	$scope.terms = [{id:1, terms:'C.O.D'}, {id:2, terms:'7 DAYS'}]
	$scope.payTypes = [{id:1, type:'Cash'}, {id:2, type:'Cheque'}]
	
	$scope.ap.apNumber = new Date().getTime(); //base on current time general AP number
	$scope.defaultItemList = [0,1,2,3,4,5,6,7,8,9]
    $http.get("supplierListService.htm").then(function (response) {$scope.supplierList =  response.data;});
    
    
});
</script>
</html>