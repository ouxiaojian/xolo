/**
 * 场景一 如果后台以一个Map参数 @RequestBody Map<String, Object> params 传输  JSON.stringify(options.param) 
 * 场景二 如果后台以多个参数 String username, String password 直接调用即可 手动设置 json : true
 */
$.SaveForm = function(options) {
	var defaults = {
		url : "",
		param : {},
		type : "post",
		dataType : "json",
		contentType : 'application/json',
		jsonType:'application/x-www-form-urlencoded; charset=UTF-8',
		success : null,
		close : true,
		json : false
	};
	var options = $.extend(defaults, options);
	dialogLoading(true);
	window.setTimeout(function() {
		$.ajax({
			url : options.url,
			data : options.json?options.param:JSON.stringify(options.param),
			type : options.type,
			dataType : options.dataType,
			contentType : options.json?options.jsonType:options.contentType,
			async:false,
			success : function(data) {
				if (data.code == '500') {
					dialogAlert(data.msg, 'error');
				} else {
					options.success(data);
					if(data.msg!=undefined){//没有提示信息 不弹出提示
						if(data.code != '0'){
							dialogMsg(data.msg, 'error');
						}else{
							dialogMsg(data.msg, 'success');
						}
					}
					if (options.close == true) {
						dialogClose();
					}
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				dialogLoading(false);
                if(textStatus=="parsererror"){
                    top.layer.open({
                        title: '系统提示',
                        area: '338px',
                        icon: 3,
                        move: false,
                        anim: -1,
                        isOutAnim: false,
                        content: '注：请求失败,返回首页.',
                        btnAlign: 'c',
                        btn: ['返回首页'],
                        yes: function(){
                        	dialogClose();
                            toUrl('view/index/introduce.jsp');
                        }
                    });
//                    setTimeout(function(){
//                        toUrl("view/index/introduce.jsp");
//                    }, 2000);
                } else if(textStatus=="error"){
                    dialogMsg("请求超时，请稍候重试...", "error");
                } else {
                    dialogMsg(errorThrown, 'error');
				}
			},
			beforeSend : function() {
				dialogLoading(true);
			},
			complete : function() {
				dialogLoading(false);
			}
		});
	}, 500);
}
/**
 * 删除
 */
$.RemoveForm = function(options) {
	var defaults = {
		msg : "注：您确定要删除吗？该操作将无法恢复",
	};
	var options = $.extend(defaults, options);
	dialogConfirm(options.msg, function() {
		$.SaveForm(options);
	});
}

$.SetForm = function(options) {
	var defaults = {
		url : "",
		param : {},
		type : "post",
		dataType : "json",
		contentType : 'application/json',
		jsonType:'application/x-www-form-urlencoded; charset=UTF-8',
		success : null,
		close : true,
		json : false
	};
	var options = $.extend(defaults, options);
	$.ajax({
		url : options.url,
		data : options.json?options.param:JSON.stringify(options.param),
		type : options.type,
		dataType : options.dataType,
		contentType : options.json?options.jsonType:options.contentType,
		success : function(data) {
			if (data.code == '500') {
				dialogAlert(data.msg, 'error');
			} else {
				options.success(data.rows);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
            dialogLoading(false);
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
                    	dialogClose();
                        toUrl('view/index/introduce.jsp');
                    }
                });
//                setTimeout(function(){
//                    toUrl("view/index/introduce.jsp");
//                }, 2000);
            } else if(textStatus=="error"){
                dialogMsg("请求超时，请稍候重试...", "error");
            } else {
                dialogMsg(errorThrown, 'error');
            }
		},
		beforeSend : function() {
			dialogLoading(true);
		},
		complete : function() {
			dialogLoading(false);
		}
	});
}
/**
 * 确认
 */
$.ConfirmForm = function(options) {
	var defaults = {
		msg : "您确定要保存当前数据项修改操作吗？",
	};
	var options = $.extend(defaults, options);
	dialogConfirm(options.msg, function() {
		$.SaveForm(options);
	});
}

$.ConfirmAjax = function(options) {
	var defaults = {
		msg : "您确定要保存当前操作结果吗？",
	};
	var options = $.extend(defaults, options);
	dialogConfirm(options.msg, function() {
		$.SaveForm(options);
	});
}
