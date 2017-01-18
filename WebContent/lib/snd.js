//jquery扩展一个方法来通过jquery获取url参数
//(function ($) {
//                $.getUrlParam = function (name) {
//                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
//                    var r = window.location.search.substr(1).match(reg);
//                    if (r != null) return unescape(r[2]); return null;
//                }
//})(jQuery)
//将表单序列化成json格式的数据
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
// 将表单序列化成json格式的数据(但不适用于含有控件的表单，例如复选框、多选的select)
(function($) {
	$.fn.serializeJsonArray = function() {
		var jsonData1 = {};
		var serializeArray = this.serializeArray();
		// 先转换成{"id": ["12","14"], "name": ["aaa","bbb"],
		// "pwd":["pwd1","pwd2"]}这种形式
		$(serializeArray).each(
				function() {
					if (jsonData1[this.name]) {
						if ($.isArray(jsonData1[this.name])) {
							jsonData1[this.name].push(this.value);
						} else {
							jsonData1[this.name] = [ jsonData1[this.name],
									this.value ];
						}
					} else {
						jsonData1[this.name] = this.value;
					}
				});
		// 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name":
		// "bb", "pwd":"pwd2"}]的形式
		var vCount = 0;
		// 计算json内部的数组最大长度
		for ( var item in jsonData1) {
			var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length : 1;
			vCount = (tmp > vCount) ? tmp : vCount;
		}

		if (vCount > 1) {
			var jsonData2 = new Array();
			for (var i = 0; i < vCount; i++) {
				var jsonObj = {};
				for ( var item in jsonData1) {
					jsonObj[item] = jsonData1[item][i];
				}
				jsonData2.push(jsonObj);
			}
			return JSON.stringify(jsonData2);
		} else {
			return "[" + JSON.stringify(jsonData1) + "]";
		}
	};
})(jQuery);

function programming(){
	layer.msg("still on programming ",{icon: 5, time: 5000})
}
/** * open full window ** */
function openWind(title, url) {
	var index = layer.open({
		type : 2,
		title : title,
		content : url
	});
	layer.full(index);
}
/** ******** prom window ********** */
function popUpWind(title, url) {
	layer_show(title, url, 800, 520);
}

/** ***** replace current location href ******** */
function replaceHref(url) {
	location.replace(url);
}
/** *********** ajax delete by id, then reload page ************** will be replace, not use */
function ajax_del_reload(url, id) {
	layer.confirm('Are You Sure Delete ?', function(index) {
		ajax_post_reload(url, id);
	});
}
function ajax_prompt_reload(url, id, promMsg) {
	layer.confirm(promMsg, function(index) {
		ajax_post_reload(url, id);
	});
}
/** 
 *  Ajax post param then reload location
 *  param: url
 *  paramValue
 */
function ajax_post_reload(url, paramValue) {
	$.ajax({
		method : "POST",
		url : url,
		data : {
			param : paramValue
		},
		dataType : "json",
		success : function(data) {
			if (data.status == 'y') {
				layer.msg(data.msg, { icon : 1, time : 2000 });
				location.reload();//replace(location.href)
			} else {
				layer.msg("返回错误", { icon : 5, time : 2000 });
			}
		},
		error : function(data) {
			layer.msg('system run ajax error', { icon : 5, time : 2000 });
		}
	});
}

/**
 * submit form by Ajax then reload location
 * param: form --> Must
 * isCurrent (y) for reload location document
 */
function ajax_save_reload(form, isCurrentPage) {
	$.ajax({
		type : 'post',
		url : $(form).attr("action"),
		data : JSON.stringify($(form).serializeJson()), // JSON.stringify serializeArray
		dataType : "json",
		contentType : "application/json;charset=UTF-8",
		success : function(data) {
			if (data.status == 'y') {
				layer.msg("Sent Successful", { icon : 6, time : 1000 });
				setTimeout(function() {
					if (isCurrentPage !== 'y') { //undefined
						var index = parent.layer.getFrameIndex(window.name);
						parent.location.replace(parent.location.href);
						parent.layer.close(index);
					} else { location.reload();}
				}, 1000);
			} else {
				layer.msg(data.errorMsg, { icon : 5, time :5000 });
			}
		},
		error : function(data) {
			console.log("error,log", data);
			layer.msg("system run ajax error", { icon : 5, time : 5000 });
		}
	});
}
/** **** submit form by ajax reload location ***** will be replace, not use */
function ajax_save1_reload(form) {
	$.ajax({
		type : 'post',
		url : $(form).attr("action"),
		data : JSON.stringify($(form).serializeJson()), // JSON.stringify serializeArray
		dataType : "json",
		contentType : "application/json;charset=UTF-8",
		success : function(data) {
			if (data.status == 'y') {
				layer.msg("Sent Successful", {
					icon : 6,
					time : 1000
				});
				setTimeout(function() {
					// $.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes
					// here.");
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
			// layer.msg('已发布!',{icon: 6,time:1000});
		}
	});
}
/** 获取表格选中行 id 集合 ** */
function getSelectIds(checkBoxName) {
	/*
	 * var nTrs = table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
	 * console.log("come in 11111111111!!!!!", nTrs.length); for(var i = 0; i <
	 * nTrs.length; i++){ if($(nTrs[i]).find()){ console.log('[获取数据]' +
	 * table.fnGetData(nTrs[i]));//fnGetData获取一行的数据 } }
	 */
	var selectId = "";
	$("input[name='" + checkBoxName + "']:checked").each(function() {
		selectId += this.value + ",";
	});
	selectId = selectId.substring(0, selectId.length - 1);
	// layer.msg(selectId);
	return selectId;
}