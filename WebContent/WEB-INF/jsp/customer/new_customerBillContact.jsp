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
<title></title>
</head>
<body>
	<div class="page-container">
	<form action="saveCustomerBillContact.htm" method="post" class="form form-horizontal responsive" id="form-billContact">
		<div class="row cl">
			<label class="form-label col-xs-6">Customer Name：${model.customer.name}</label>
			<div class="formControls col-xs-1">
				<input type="hidden" id="id" name="id" value="0">
				<input type="hidden" id="customerId" name="customerId" value="${model.customer.id}">
				<input type="hidden" id="billFax" name="billFax" >
			</div>
		</div>
		<h4>Bill Information</h4>
		<div class="line"></div>
		<p/>
		<div class="row cl">
			<label class="form-label col-xs-3">Bill Attention：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Bill Attention" name="billAttention" id="billAttention" 
					datatype="*3-18" nullmsg="Not Empty!" errormsg="3 to 18 Characters!" sucmsg="Success">
			</div>
			<label class="form-label col-xs-3">Bill Email：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Bill Email" name="billEmail" id="billEmail" 
				datatype="e" ignore="ignore" errormsg="Email Address Incorect!" sucmsg="Success">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3">Bill Mobile：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Bill Mobile" name="billMobile" id="billMobile" 
					datatype="n8-8" ignore="ignore" errormsg="eg.66668888" sucmsg="Success">
			</div>
			<label class="form-label col-xs-3">Bill Telephone：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Bill Telephone" name="billTelephone" id="billTelephone" 
					datatype="n8-8" ignore="ignore" errormsg="eg.66668888" sucmsg="Success">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3">Bill PostCode：</label>
			<div class="formControls col-xs-3">
				<input type="text" class="input-text" placeholder="Bill PostCode" name="billPostcode" id="billPostcode" 
					datatype="n6-6" ignore="ignore" value="${model.billContact.billPostcode}" nullmsg="Not Empty!" errormsg="eg.600116" sucmsg="Success">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3">Bill Address：</label>
			<div class="formControls col-xs-6">
				<input type="text" class="input-text" placeholder="Bill Address1" name="billAddress1" id="billAddress1" 
					datatype="*3-50" ignore="ignore" errormsg="3 to 50 Characters!" sucmsg="Success">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3"></label>
			<div class="formControls col-xs-6">
				<input type="text" class="input-text" placeholder="Bill Address2" name="billAddress2" id="billAddress2">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3"></label>
			<div class="formControls col-xs-6">
				<input type="text" class="input-text" placeholder="Bill Address3" name="billAddress3" id="billAddress3">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-10 col-xs-offset-2">
				<button name="" id="" class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe632;</i> 保存
				</button>
			</div>
		</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/jsp/_footer.jsp"%>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/message.js"></script>
<script type="text/javascript">
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
$(function(){
	
	//方法一;
	$("#form-billContact").Validform({
		tiptype:3,
		beforeSubmit: function(form) {
			$.ajax({ 
		        type: 'post', 
		        url: $(form).attr("action"), 
		        data: (form.serializeArray()), //JSON.stringify serializeArray
		        dataType:"json",
		        success: function (data) { 
		            console.log(data.status == 'y', "success log");
		        },
		        error: function(data){
		        	console.log("error,log", data);
		        }
		    });
			return false;
		}
	});
	
});
$.Tipmsg={//默认提示文字;
		tit:"MESSAGE",
		w:{
		    "*":"NOT EMPTY!",
		    "*6-16":"Please fill in any characters from 6 to 16 digits!",
		    "n":"Please fill in the numbers!",
		    "n6-16":"Please enter number 6 to 16 digits!",
		    "s":"You can not enter special characters!",
		    "s6-18":"Please enter characters 6 to 18 characters!",
		    "p":"Please fill in the postal code!",
		    "m":"please fill in cell phone number!",
		    "e":"The mailbox address is not in the correct format!",
		    "url":"Please fill in the URL!"
		},
		def:"Please fill in the correct information!",
		undef:"datatype undefined!",
		reck:"The content entered twice is inconsistent!",
		r:"Through information validation!",
		c:"Detecting information......",
		s:"Please {FILLIN|SELECT}{0|INFORMATION}!",
		v:"The information has not been verified, please wait ...",
		p:"Submitting data ..."
};
</script>
</html>