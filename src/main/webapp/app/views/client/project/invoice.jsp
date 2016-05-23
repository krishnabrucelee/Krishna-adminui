<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ng-controller="invoiceCtrl">
    <div data-ng-show="showDetails" data-ng-include src="'views/client/project/invoice-details.html'"></div>
    <div data-ng-hide="showDetails" data-ng-include src="'views/client/project/invoice-list.html'"></div>
</div>
