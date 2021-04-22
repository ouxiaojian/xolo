<%@ tag language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/module/include/common.jsp"%>
<%@ attribute name="title" type="java.lang.String" required="true"
	description="页面标题"%>
<%@ attribute name="extLibs" type="java.lang.String" required="false"
	description="扩展库（laydate、laypage、form、cookie、combo）"%>
<c:set var="extLibs" value=",${extLibs}," />
<c:if test="${!fn:contains(extLibs, ',notHeader,')}">
	<title>${title}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
		name="viewport">
</c:if>
<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctxStatic}/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/ionicons.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/AdminLTE.min.css">

<script type="text/javascript">var baseUrl = "${ctxPath}";</script>

<%--layui 动态加载组件 --%>
<c:if test="${fn:contains(extLibs, 'element')}">
	<script type="text/javascript">
		//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function(){
		  var element = layui.element();
		  //…
		});
	</script>
</c:if>

<%-- JS全局变量/常量定义 --%>
<script type="text/javascript">var ctxPath = '${ctxPath}';</script>
<!-- 此功能 为了防止后台页面不刷新导致的间歇性 异常情况 不会影响其他静态请求 -->
<%response.setHeader("Cache-Control", "No-store");%>


<script src="${ctxStatic}/js/jquery.min.js?t=${version}"></script>
<script src="${ctxStatic}/js/bootstrap.min.js?t=${version}"></script>
<script src="${ctxStatic}/plugins/layer/layer.js?t=${version}"></script>
<script src="${ctxStatic}/js/common.js?t=${version}"></script>
<script src="${ctxStatic}/js/form.js?t=${version}"></script>
