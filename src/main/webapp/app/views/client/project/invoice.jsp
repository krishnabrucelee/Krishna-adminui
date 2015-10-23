<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ng-controller="invoiceCtrl">
    <div data-ng-show="showDetails" data-ng-include src="'views/client/project/invoice-details.html'"></div>
    <div data-ng-hide="showDetails" data-ng-include src="'views/client/project/invoice-list.html'"></div>
</div>
