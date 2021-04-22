/**
 * Layui 模块化加载-AMD规范
 */
//layui.config({
//  base: '/static/layui/lay/modules/' //你的模块目录
//}).use('layer'); //加载入口

/**
 * Layui预加载 layer,laypage,laydate模块;
 */
//layui.use(['layer', 'laypage','laydate'], function(){  //如果只加载一个模块，可以不填数组。如：layui.use('form')
//	var layer = layui.layer, //获取layer模块
//	laypage = layui.laypage,
//	laydate = layui.laydate; 
//});

//获取请求参数
//使用示例
//location.href = http://localhost:8080/index.html?id=123
//url('id') --> 123;
var getUrlParam = function(name) {
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return  unescape(r[2]); return null;
}

//全局配置
$.ajaxSetup({
	dataType: "json",
	cache: false,
	complete:function(XMLHttpRequest,textStatus){
		if(textStatus=="parsererror"){
         top.layer.open({
			  title: '系统提示',
			  area: '338px',
			  icon: 3,
			  move: false,
			  anim: -1,
			  isOutAnim: false,
			  content: '注：请求失败,返回首页.',
			  btn: ['返回首页'],
			  btnAlign: 'c',
			  yes: function(){
				  toUrl('/index.jsp');
			  }
			});
			setTimeout(function(){
				toUrl("/index.jsp");
			}, 2000);
     } else if(textStatus=="error"){
        dialogMsg("请求超时，请稍候重试...", "error");
     }
	}
})

//权限判断
function hasPermission(permission) {
 if(!notNull(window.parent.perms)) {
 	return false;
 }
	if (window.parent.perms.indexOf(permission) > -1) {
     return true;
 } else {
     return false;
 }
}

toUrl = function(href) {
	window.location.href = href;
}

$.fn.bootstrapTableEx = function(opt){
	var defaults = {
		url: '',
		dataField: "rows",
		method: 'post',
		dataType: 'json',
		selectItemName: 'id',
		clickToSelect: true,
		pagination: true,
		smartDisplay: false,
		pageSize: 10,
		pageList: [10, 20, 30, 40, 50],
		paginationPreText: '上一页',
		paginationNextText: '下一页',
		sidePagination: 'server',
		queryParamsType : null,
		columns: []
	}
	var option = $.extend({}, defaults, opt);
	$(this).bootstrapTable(option);
}

formatDate = function (v, format) {
 if (!v) return "";
 var d = v;
 if (typeof v === 'string') {
     if (v.indexOf("/Date(") > -1)
         d = new Date(parseInt(v.replace("/Date(", "").replace(")/", ""), 10));
     else
         d = new Date(Date.parse(v.replace(/-/g, "/").replace("T", " ").split(".")[0]));//.split(".")[0] 用来处理出现毫秒的情况，截取掉.xxx，否则会出错
 }
 var o = {
     "M+": d.getMonth() + 1,
     "d+": d.getDate(),
     "h+": d.getHours(),
     "m+": d.getMinutes(),
     "s+": d.getSeconds(),
     "q+": Math.floor((d.getMonth() + 3) / 3),
     "S": d.getMilliseconds()
 };
 if (/(y+)/.test(format)) {
     format = format.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length));
 }
 for (var k in o) {
     if (new RegExp("(" + k + ")").test(format)) {
         format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
     }
 }
 return format;
}



reload = function () {
 location.reload();
 return false;
}

dialogOpen = function(opt){
	var defaults = {
		id : 'layerForm',
		title : '',
		width: '',
		height: '',
		url : null,
		scroll : false,
		data : {},
		btn: ['确定', '取消'],
		success: function(){},
		yes: function(){}
	}
	var option = $.extend({}, defaults, opt), content = null;
	if(option.scroll){
		content = [option.url]
	}else{
		content = [option.url, 'no']
	}
	top.layer.open({
	  	type : 2,
	  	id : option.id,
		title : option.title,
		closeBtn : 1,
		anim: -1,
		isOutAnim: false,
		shadeClose : false,
		shade : 0.3,
		area : [option.width, option.height],
		content : content,
		btn: option.btn,
		success: function(){
			option.success(option.id);
		},
		yes: function(){
			option.yes(option.id);
		}
 });
}

dialogContent = function(opt){
	var defaults = {
		title : '系统窗口',
		width: '',
		height: '',
		content : null,
		data : {},
		btn: ['确定', '取消'],
		success: null,
		yes: null
	}
	var option = $.extend({}, defaults, opt);
	return top.layer.open({
	  	type : 1,
		title : option.title,
		closeBtn : 1,
		anim: -1,
		isOutAnim: false,
		shadeClose : false,
		shade : 0.3,
		area : [option.width, option.height],
		shift : 5,
		content : option.content,
		btn: option.btn,
		success: option.success,
		yes: option.yes
 });
}

dialogAjax = function(opt){
	var defaults = {
		title : '系统窗口',
		width: '',
		height: '',
		url : null,
		data : {},
		btn: ['确定', '取消'],
		success: null,
		yes: null
	}
	var option = $.extend({}, defaults, opt);
	$.post(option.url, null, function(content){
		layer.open({
		  	type : 1,
			title : option.title,
			closeBtn : 1,
			anim: -1,
			isOutAnim: false,
			shadeClose : false,
			shade : 0.3,
			area : [option.width, option.height],
			shift : 5,
			content : content,
			btn: option.btn,
			success: option.success,
			yes: option.yes
	    });
	});
}

dialogAlert = function (content, type) {
	var msgType = {
		success:1,
		error:2,
		warn:3,
		info:7
	};
	if(!notNull(type)){
		type='info';
	}
	top.layer.alert(content, {
     icon: msgType[type],
     title: "系统提示",
     anim: -1,
     btnAlign: 'c',
		isOutAnim: false
 });
}

dialogConfirm = function (content, callBack) {
	top.layer.confirm(content, {
		area: '338px',
		icon: 7,
     anim: -1,
		isOutAnim: false,
     title: "系统提示",
     btn: ['确认', '取消'],
     btnAlign: 'c',
 	yes: callBack
 });
}

dialogMsg = function(msg, type) {
	var msgType = {
		success:1,
		error:2,
		warn:3,
		info:7
	};
	if(!notNull(type)){
		type='info';
	}
	top.layer.msg(msg, {
		icon: msgType[type],
		time: 2000
	}); 
}

dialogClose = function() {
	var index = top.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	top.layer.close(index); //再执行关闭 
}

dialogLoading = function(flag) {
	if(flag){
		top.layer.load(0, {
			shade: [0.1,'#fff'],
			time: 2000
		});
	}else{
		top.layer.closeAll('loading');
	}
}
/**
* layer 弹出效果(手机端)
*/
pop = {};
/**
* 普通信息
*/
pop.info =  function(message){
	layer.open({
	    content: message,
	    skin: 'msg',
	    shadeClose:true,
	    time: 2
	});
}
/**
* 成功信息
*/
pop.success =  function(message){
	
}
/**
* 错误信息
*/
pop.error =  function(message){
	
}
/**
* 确认框
*/
pop.confirm =  function(message){
	layer.open({
	    content: message,
	    shadeClose:false,
	    btn: ['OK']
	});
}
/**
* loading层
*/
pop.loading=function(message){
	if(!notNull(message)){
		message="加载中...";
	}
 layer.open({
 	type: 2,
 	content: message
 });
}



$.fn.GetWebControls = function (keyValue) {
 var reVal = "";
 $(this).find('input,select,textarea').each(function (r) {
     var id = $(this).attr('id');
     var type = $(this).attr('type');
     switch (type) {
         case "checkbox":
             if ($("#" + id).is(":checked")) {
                 reVal += '"' + id + '"' + ':' + '"1",'
             } else {
                 reVal += '"' + id + '"' + ':' + '"0",'
             }
             break;
         default:
             var value = $("#" + id).val();
             if (value == "") {
                 value = "&nbsp;";
             }
             reVal += '"' + id + '"' + ':' + '"' + $.trim(value) + '",'
             break;
     }
 });
 reVal = reVal.substr(0, reVal.length - 1);
 if (!keyValue) {
     reVal = reVal.replace(/&nbsp;/g, '');
 }
 reVal = reVal.replace(/\\/g, '\\\\');
 reVal = reVal.replace(/\n/g, '\\n');
 var postdata = jQuery.parseJSON('{' + reVal + '}');
 return postdata;
};

$.fn.SetWebControls = function (data) {
 var $id = $(this)
 for (var key in data) {
     var id = $id.find('#' + key);
     if (id.attr('id')) {
         var type = id.attr('type');
         var value = $.trim(data[key]).replace(/&nbsp;/g, '');
         switch (type) {
             case "checkbox":
                 if (value == 1) {
                     id.attr("checked", 'checked');
                 } else {
                     id.removeAttr("checked");
                 }
                 break;
             default:
                 id.val(value);
                 break;
         }
     }
 }
}

tabiframeId = function () {
 var iframeId = top.$(".DP_iframe:visible").attr("id");
 return iframeId;
}

$.currentIframe = function () {
 var tabId = tabiframeId();
	if(!notNull(tabId)) {//单页iframe嵌套
		return $(window.parent.document).contents().find('#main')[0].contentWindow;
 }
 return $(window.parent.document).contents().find('#'+tabiframeId())[0].contentWindow;//多层tab页嵌套
}

/**
* 阿拉伯数字转换为简写汉字
*/
Arabia_To_SimplifiedChinese=function(Num) {
 for (i = Num.length - 1; i >= 0; i--) {
     Num = Num.replace(",", "")//替换Num中的“,”
     Num = Num.replace(" ", "")//替换Num中的空格
 }    
 if (isNaN(Num)) { //验证输入的字符是否为数字
     return;
 }
 //字符处理完毕后开始转换，采用前后两部分分别转换
 part = String(Num).split(".");
 newchar = "";
 //小数点前进行转化
 for (i = part[0].length - 1; i >= 0; i--) {
     if (part[0].length > 10) {
         //alert("位数过大，无法计算");
         return "";
     }//若数量超过拾亿单位，提示
     tmpnewchar = ""
     perchar = part[0].charAt(i);
     switch (perchar) {
         case "0":  tmpnewchar = "零" + tmpnewchar;break;
         case "1": tmpnewchar = "一" + tmpnewchar; break;
         case "2": tmpnewchar = "二" + tmpnewchar; break;
         case "3": tmpnewchar = "三" + tmpnewchar; break;
         case "4": tmpnewchar = "四" + tmpnewchar; break;
         case "5": tmpnewchar = "五" + tmpnewchar; break;
         case "6": tmpnewchar = "六" + tmpnewchar; break;
         case "7": tmpnewchar = "七" + tmpnewchar; break;
         case "8": tmpnewchar = "八" + tmpnewchar; break;
         case "9": tmpnewchar = "九" + tmpnewchar; break;
     }
     switch (part[0].length - i - 1) {
         case 0: tmpnewchar = tmpnewchar; break;
         case 1: if (perchar != 0) tmpnewchar = tmpnewchar + "十"; break;
         case 2: if (perchar != 0) tmpnewchar = tmpnewchar + "百"; break;
         case 3: if (perchar != 0) tmpnewchar = tmpnewchar + "千"; break;
         case 4: tmpnewchar = tmpnewchar + "万"; break;
         case 5: if (perchar != 0) tmpnewchar = tmpnewchar + "十"; break;
         case 6: if (perchar != 0) tmpnewchar = tmpnewchar + "百"; break;
         case 7: if (perchar != 0) tmpnewchar = tmpnewchar + "千"; break;
         case 8: tmpnewchar = tmpnewchar + "亿"; break;
         case 9: tmpnewchar = tmpnewchar + "十"; break;
     }
     newchar = tmpnewchar + newchar;
 }   
 return newchar;
}


/**
* 判断某对象不为空..返回true 否则 false
*/
function notNull(obj) {
	if (obj === null) {
		return false;
	}else if (obj === "null") {
		return false;
	} else if (obj === undefined) {
		return false;
	} else if (obj === "undefined") {
		return false;
	} else if (obj === "") {
		return false;
	} else if (obj === "[]") {
		return false;
	} else if (obj === "{}") {
		return false;
	} else {
		return true;
	}
}

/**
* 判断某对象不为空..返回obj 否则 ""
*/
function notEmpty(obj) {
	if (obj === null) {
		return "";
	} else if (obj === "null") {
		return "";
	} else if (obj === undefined) {
		return "";
	} else if (obj === "undefined") {
		return "";
	} else if (obj === "") {
		return "";
	} else if (obj === "[]") {
		return "";
	} else if (obj === "{}") {
		return "";
	} else {
		return obj;
	}
}

//给手机号码加密：将中间四位数字替换成*
function changeMobile(mobile){
	var value = mobile.replace(/(\d{3})\d{4}(\d{4})/,'$1****$2'); 
	return value; 
}
