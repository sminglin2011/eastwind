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
<title>Menu Category</title>
</head>

<body>
	<div class="page-container">
		<form class="form form-horizontal" action="addStockItemSupplier.htm" id="form-addStockItemSupplierForm">
		<div class="text-l"> Stock Description：
		${stockItem.description}
		<input type="hidden" id="stockId" name="stockId" value="${stockItem.id}">
		<input list="supplierList" name="supplierName" class="input-text" style="width: 300px">
		<datalist id="supplierList">
		  		<c:forEach items="${supplierList}" var="supplier" varStatus="status">
				<option value="${supplier.name}">
				</c:forEach>
		</datalist>
		<input type="text" class="input-text" placeholder="price eg.:100.10" id="price" name="price" style="width: 100px" datatype="/[0-9]+([.]{1}[0-9]+){0,1}$/"><!-- 只能输入整数或小数 -->
		<input type="text" class="input-text" placeholder="Unit Of Measur" id="uom" name="uom" style="width: 100px" datatype="/^[A-Za-z]+$/" >
		<label class=""><input type="checkbox" class="input-text" id="isdefault" name="isdefault" value=true style="width: 30px">is default</label>
		<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe600;</i> Add Supplier</button>
		</div>
		</form>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr>
						<th scope="col" colspan="8"><fmt:message key="module.supplier" />
						</th>
					</tr>
					<tr class="text-c">
						<th width="5%">SN</th>
						<th width="45%">Supplier</th>
						<th width="10%">Price</th>
						<th width="10%">IsDefault</th>
						<th width="25%"><fmt:message key="action" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stockItemSupplierList}" var="stockItemSupplier" varStatus="status">
						<tr class="text-c">
							<td>${status.count }</td>
							<td class=""> ${stockItemSupplier.name }</td>
							<td class=""> ${stockItemSupplier.price }</td>
							<td class=""> ${stockItemSupplier.isdefault }</td>
							<td class="f-14 td-manage">
								<c:choose>
								    <c:when test="${stockItemSupplier.isdefault}">
								       <i class="Hui-iconfont">&#xe6a8;</i>
								    </c:when>
								    <c:otherwise>
								       <a style="text-decoration:none" onClick="default_supplier(this,${stockItemSupplier.id })" href="javascript:;" title="Default Supplier">
								       <i class="Hui-iconfont">&#xe608;</i>
								       </a>
								    </c:otherwise>
								</c:choose>
								<a style="text-decoration: none" class="ml-5"
								onClick="removeSupplier(this,${stockItemSupplier.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-addStockItemSupplierForm").Validform({
		tiptype:3,
		datatype:{
			"f":/[0-9]+([.]{1}[0-9]+){0,1}$/, //只能输入整数或小数
		},
		beforeSubmit: function(form) {
			console.log($(form).serializeObject());
			console.log("serializeArray",$(form).serializeArray());
			$.ajax({ 
		        type: 'post', 
		        url: $(form).attr("action"), 
		        data: JSON.stringify($(form).serializeObject()), //JSON.stringify serializeArray
		        dataType:"json",
		        contentType:"application/json;charset=UTF-8",
		        success: function (data) { 
		            if(data.status == 'y'){
		            	layer.msg("Success");
		            	location.replace(location.href);
		            } else {
		            	layer.msg(data.errorMsg);
		            }
		        },
		        error: function(data){
		        	console.log("error,log", data);
		        	layer.msg("system run ajax error");
		        }
		    });
			return false;
		}
	});
});
$('.table-sort').dataTable({
	"paging" : false,
	"searching" : false,
    "ordering" :  false
});
	/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
	*/
	/* default suppllier */
	function default_supplier(obj,id){
		$.ajax({ 
	        type: 'post', 
	        url: "defaultSupplier.htm", 
	        data: {id:id}, //JSON.stringify serializeArray
	        dataType:"json",
	        //contentType:"application/json;charset=UTF-8", // 不用这个头部，后台就可以获取参数通过@RequestParam
	        success: function (data) { 
	            if(data.status == 'y'){
	            	layer.msg("Success");
	            	location.replace(location.href);
	            } else {
	            	layer.msg(data.errorMsg);
	            }
	        },
	        error: function(data){
	        	console.log("error,log", data);
	        	layer.msg("system run ajax error");
	        }
	    });
	}
	/** remove supplier */
	function removeSupplier(obj,id){
		$.ajax({ 
	        type: 'post', 
	        url: "removeSupplier.htm", 
	        data: {id:id}, //JSON.stringify serializeArray
	        dataType:"json",
	        success: function (data) { 
	            if(data.status == 'y'){
	            	layer.msg("Success");
	            	location.replace(location.href);
	            } else {
	            	layer.msg(data.errorMsg);
	            }
	        },
	        error: function(data){
	        	console.log("error,log", data);
	        	layer.msg("system run ajax error");
	        }
	    });
	}
	
</script>
</html>