<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/jquery.form.min.js"></script>
<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>  
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>

<script src="lib/handlebars.js"></script>
<!--引入CSS-->
<link rel="stylesheet" type="text/css" href="lib/webuploader/0.1.5/webuploader.css">

<!--引入JS-->
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript">
/*** open full window ***/
function openWind(title, url) {
	var index = layer.open({
		type : 2,
		title : title,
		content : url
	});
	layer.full(index);
}
/********** prom window  ***********/
function popUpWind(title,url){
	layer_show(title,url,800,520);
}

/************* ajax delete by id, then reload page ***************/
function ajax_del_reload(url, id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			  method: "POST",
			  url: url,
			  data: { id: id }
			}).done(function( msg ) {
			    layer.msg('删除成功!');
			    location.replace(location.href);
			}).fail(function() {
				layer.msg('删除出错!');
			 });
		
	});
}
</script> 
<!--/_footer /作为公共模版分离出去--> 
