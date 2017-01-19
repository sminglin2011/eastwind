﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE HTML>
<html ng-app="ap" ng-controller="apController" ng-init="init()">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@ include file="/WEB-INF/jsp/_meta.jsp"%>
<title>Edit Account Payable</title>
</head>
<body>
	<div class="page-container">
		<form action="saveAP.htm" method="post" class="form form-horizontal responsive" id="form-ap">
		<div class="row cl">
			<label class="form-label col-xs-2">AP Number：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text disabled" ng-model="ap.apNumber">
			</div>
			<label class="form-label col-xs-2"><span class="c-red">*</span>Date：</label>
			<div class="formControls col-xs-2">
				<input type="text" class="input-text date" ng-model="ap.date" wdate-picker
				 datatype="*">
			</div>
			<label class="form-label col-xs-2"><span class="c-red">*</span>Pay Type：</label>
			<div class="formControls col-xs-2">
				<span class="select-box">
					<select class="select" ng-model="ap.payType" ng-options="pt.type as pt.type for pt in payTypes">
					</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-2"><span class="c-red">*</span>Supplier：</label>
			<div class="formControls col-xs-6">
			<span class="select-box">
				<select ng-model="ap.supplierId" class="select"
					ng-options="s.id as s.name for s in supplierList" >
                </select>
            </span>
			</div>
			<label class="form-label col-xs-2"><span class="c-red">*</span>Terms：</label>
			<div class="formControls col-xs-2">
				<span class="select-box">
					<select class="select" ng-model="ap.terms"
						ng-options="t.terms as t.terms for t in terms">
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
						<th width="25%">Description</th>
						<th width="20%">Remarks</th>
						<th width="15%">Account Code</th>
						<th width="10%">Quantity</th>
						<th width="15%">Unit Price</th>
						<th width="10%">UOM</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c" ng-repeat="i in ap.items">
						<td style="padding:0px;">{{$index+1}}</td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="*1-50" ignore="ignore" ng-model="i.description"></td>
						<td style="padding:0;"><input type="text" class="input-text" datatype="*1-200" ignore="ignore" ng-model="i.remarks"></td>
						<td style="padding:0;">
						<input type="text" list="accountCodeList{{$index+1}}" class="input-text" datatype="n4-4" ignore="ignore" ng-model="i.accountCode">
						<datalist id="accountCodeList{{$index+1}}">
						<option ng-repeat="coa in coaList" value="{{coa.accountCode}}" >{{coa.description}}</option>
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
<script type="text/javascript" src="lib/My97DatePicker/ng-WdatePicker.js"></script>
<script type="text/javascript" src="lib/select2-4.0.3/dist/js/select2.js"></script>
<script type="text/javascript">
//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
(function(){
	$('.table').dataTable( {  
		"info": false,
		"paging": false,
        "bSort": false,
        "bLengthChange": false,
        "searching": false
     } );
	var validForm = $("#form-ap").Validform({
		tiptype:0,
		beforeSubmit:function(form) { // here must return false to stop submit data by form
			return false;
		}
	});
	$(".select").select2(); //init select2

	var app = angular.module('ap', ['ng-WdatePicker']);
	app.controller('apController', function($scope, $http, $filter){
		$scope.ap = {};
		
		$scope.init = function () {
			$http.get("supplierListService.htm").then(function (response) {$scope.supplierList =  response.data;});
			$scope.terms = [{id:1, terms:'C.O.D'}, {id:2, terms:'7 DAYS'}];
			$scope.payTypes = [{id:1, type:'Cash'}, {id:2, type:'Cheque'}];
			$http.get("loadApService.htm?param="+getUrlParam("param"))
				.success(function(data){
					$scope.ap = data;
					$scope.ap.date = $filter('date')(new Date($scope.ap.date),'yyyy-MM-dd');
					var itemsLength = $scope.ap.items.length;
					if (itemsLength < 10) {
						for(var i=itemsLength; i< 10; i++){
							$scope.ap.items.push({id:0, apNumber:$scope.ap.apNumber, description:'', remarks:'', accountCode:'', quantity:'', unitPrice:'', uom:''});
						}
					}
				});
        };
        /* submit form */
		$scope.save = function() {
			if (validForm.check()) {
				console.log($scope.ap);
				$http({ // default headerType json/application
	                url:'saveAP.htm',
	                method: 'POST',            
	                data: $scope.ap
	            }).success(function(data){
	            	if (data.status == 'y') {
						layer.msg(data.msg, { icon : 1, time : 2000 });
						var index = parent.layer.getFrameIndex(window.name);
						parent.location.reload()
						parent.layer.close(index);
					} else {
						layer.msg(data.msg, { icon : 5, time : 5000 });
					}
	            }).error(function(data){
	            	layer.msg('system run ajax error,'+data, { icon : 5, time : 5000 });
	            });
			}
		}
	})
	
})(jQuery);

</script>
</html>