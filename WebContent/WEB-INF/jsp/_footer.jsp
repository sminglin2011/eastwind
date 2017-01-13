<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/jquery.form.min.js"></script>
<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript"
	src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript"
	src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>

<script src="lib/handlebars.js"></script>
<!--引入CSS-->
<link rel="stylesheet" type="text/css"
	href="lib/webuploader/0.1.5/webuploader.css">

<!--引入JS-->
<script type="text/javascript"
	src="lib/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript">
	(function($) {
		$.fn.serializeJson = function() {
			var serializeObj = {};
			var array = this.serializeArray();
			var str = this.serialize();
			$(array).each(
					function() {
						if (serializeObj[this.name]) {
							if ($.isArray(serializeObj[this.name])) {
								serializeObj[this.name].push(this.value);
							} else {
								serializeObj[this.name] = [
										serializeObj[this.name], this.value ];
							}
						} else {
							serializeObj[this.name] = this.value;
						}
					});
			return serializeObj;
		};
	})(jQuery);
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
	function popUpWind(title, url) {
		layer_show(title, url, 800, 520);
	}

	/******* replace current location href *********/
	function replaceHref(url) {
		location.replace(url);
	}
	/************* ajax delete by id, then reload page ***************/
	function ajax_del_reload(url, id) {
		layer.confirm('确认要删除吗？', function(index) {
			$.ajax({
				method : "POST",
				url : url,
				data : {
					id : id
				}
			}).done(function(msg) {
				layer.msg('删除成功!');
				location.replace(location.href);
			}).fail(function() {
				layer.msg('删除出错!');
			});

		});
	}
	/***************** ajax post param then reload location  *******************/
	function ajax_post_reload(url, paramValue, promMsg) {
		layer.confirm(promMsg, function(index) {
			$.ajax({
				method : "POST",
				url : url,
				data : {
					param : paramValue
				},
				dataType : "json",
				success : function(data) {
					if (data.status == 'y') {
						layer.msg(data.msg, {
							icon : 5,
							time : 2000
						});
						location.replace(location.href);
					} else {
						layer.msg("返回错误");
					}
				},
				error : function(data) {
					layer.msg('system run ajax error', {
						icon : 6,
						time : 2000
					});
				}
			});

		});
	}

	/****** submit form by ajax reload parent location ******/
	function ajax_save_parent_reload(form) {
		$.ajax({
			type : 'post',
			url : $(form).attr("action"),
			data : JSON.stringify($(form).serializeJson()), //JSON.stringify serializeArray
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : function(data) {
				if (data.status == 'y') {
					layer.msg("Sent Successful", {
						icon : 6,
						time : 1000
					});
					setTimeout(function() {
						//$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}, 1000);
				} else {
					layer.msg(data.errorMsg, {
						icon : 1,
						time : 1000
					});
				}
			},
			error : function(data) {
				console.log("error,log", data);
				layer.msg("system run ajax error", {
					icon : 1,
					time : 1000
				});
			}
		});
	}
	/****** submit form by ajax reload location ******/
	function ajax_save_reload(form) {
		$.ajax({
			type : 'post',
			url : $(form).attr("action"),
			data : JSON.stringify($(form).serializeObject()), //JSON.stringify serializeArray
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : function(data) {
				if (data.status == 'y') {
					layer.msg("Sent Successful", {
						icon : 6,
						time : 1000
					});
					setTimeout(function() {
						//$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
						location.replace(location.href);
					}, 1000);
				} else {
					layer.msg(data.errorMsg);
				}
			},
			error : function(data) {
				console.log("error,log", data);
				layer.msg("system run ajax error", {
					icon : 1,
					time : 1000
				});
				//layer.msg('已发布!',{icon: 6,time:1000});
			}
		});
	}
	/** 获取表格选中行 id 集合 ***/
	function getSelectIds(checkBoxName) {
		/* var nTrs = table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
		console.log("come in 11111111111!!!!!", nTrs.length);
		for(var i = 0; i < nTrs.length; i++){ 
			if($(nTrs[i]).find()){ 
				console.log('[获取数据]' + table.fnGetData(nTrs[i]));//fnGetData获取一行的数据 
			}
		}   */
		var selectId = "";
		$("input[name='" + checkBoxName + "']:checked").each(function() {
			selectId += this.value + ",";
		});
		selectId = selectId.substring(0, selectId.length - 1);
		//layer.msg(selectId);
		return selectId;
	}
</script>

<!--/_footer /作为公共模版分离出去-->
