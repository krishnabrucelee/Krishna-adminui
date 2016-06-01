<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>
<ng-include id="menu" src="global.getViewPageUrl('common/navigation.jsp')"></ng-include>


<!-- Main Wrapper -->
<div id="wrapper">
<div class="content">
<div class="row text-center"><h2><fmt:message key="welcome.admin.panel" bundle="${msg}" /></h2></div>
</div>
<div class="row"><div id="footer" class="m-t-md" ng-include="'app/views/common/footer.jsp'"></div></div>
</div>
