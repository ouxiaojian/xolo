$(function(){//刷新页面记住当前页
	var url = window.location.hash.replace('#', '');
	if(url != ''){
		$("#mainFrame").attr("src", url);
		// 导航菜单展开
		$(".sidebar-menu li").removeClass("active");
		$("#pagehead2").text($("a[href='#" + url + "']").closest(".treeview-menu").prev().text());
		$("#pagehead3").text($("a[href='#" + url + "']").text());
		$("#currentpage").text($("a[href='#" + url + "']").text());
		$("a[href='#" + url + "']").parents("li").addClass("active");
	}
});


$(".sidebar-menu li a").click(function(){//菜单点击跳转
	var url = $(this).attr("href").replace('#', '');
	console.log(url);
	if($(this).attr("class") != "menu1"){//当一级菜单的时候不进行跳转
		$("#mainFrame").attr("src", url);
		$("#pagehead2").text($("a[href='#" + url + "']").closest(".treeview-menu").prev().text());
//		$("#pagehead2").text($("a[href='#" + url + "']").closest(".treeview").find(".menu1").text());
		$("#pagehead3").text($("a[href='#" + url + "']").text());
		$("#currentpage").text($("a[href='#" + url + "']").text());
	}
	// 导航菜单展开
	$(".sidebar-menu li").removeClass("active");
	$("a[href='#" + url + "']").parents("li").addClass("active");
});



// iframe自适应
$(window).on('resize', function() {
	var $content = $('.content');
	$content.height($(this).height() - 175);
	$content.find('iframe').each(function() {
		$(this).height($content.height());
	});
}).resize();


function routerList(router, menuList) {
	for ( var key in menuList) {
		var menu = menuList[key];
		if (menu.type == 0) {
			routerList(router, menu.list);
		} else if (menu.type == 1) {
			router.add('#' + menu.url, function() {
				var url = window.location.hash;

				// 替换iframe的url
				vm.main = url.replace('#', '');

				// 导航菜单展开
				$(".treeview-menu li").removeClass("active");
				$("a[href='" + url + "']").parents("li").addClass("active");

				vm.navTitle = $("a[href='" + url + "']").text();
			});
		}
	}
}

//菜单滚动条自适应
function setScroll(){
    $("#sidebar-menu").slimScroll({
        height: $(this).height() - 50,
        alwaysVisible: false,
    });
    $(window).on("resize", function() {
    	$("#sidebar-menu").slimScroll({
            height: $(this).height() - 50,
            alwaysVisible: false,
        });
    });
}

function removeScroll() {
	$('.sidebar').append($('#sidebar-menu'));
	$('#sidebar-menu').removeAttr('style');
	$('.slimScrollDiv').remove();
}