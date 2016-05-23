<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="hpanel">
<div class="row m-l-sm m-r-sm panel-body" >

    <ul class="nav nav-tabs" data-ng-init="templateCategory = 'report'">
        <li class="active"><a href="javascript:void(0)" data-ng-click="templateCategory = 'report'" data-toggle="tab">  <i class="fa fa-list-alt "></i> Billable Item Report</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'chart'" data-toggle="tab"><i class="fa fa-bar-chart-o"></i> Billable Item  Chart Report</a></li>

    </ul>

    <div class="tab-content">

        <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'report'}" id="step1-dashboard">
        <div data-ng-include src="'views/reports/billable-item-report.html'"></div>

        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'chart'}" id="step1-config">
            <div data-ng-include src="'views/reports/billable-item-chart.html'"></div>
        </div>

    </div>


</div>
</div>