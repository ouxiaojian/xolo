<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--自定义tag标签 --%>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags" %>

<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${ctxPath}/statics"/>
<c:set var="ctxView" value="${ctxPath}/view"/>
<c:set var="version" value="201803141"/>
