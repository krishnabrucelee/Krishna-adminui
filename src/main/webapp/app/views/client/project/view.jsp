<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="hpanel">
<div class="row m-l-sm m-r-sm panel-body" ng-controller="projectViewCtrl">
    <div data-ng-include src="'views/client/project/project-information.html'"></div>
    <ul class="nav nav-tabs" data-ng-init="project.category = 'billingSummary'">
        <li data-ng-class="project.category == 'billingSummary' ? 'active' : ''"><a  data-ng-click="project.category = 'billingSummary'" data-toggle="tab"> <i class="fa fa-money"></i> Billing Summary</a></li>
        <li data-ng-class="project.category == 'infraLimitSummary' ? 'active' : ''"><a  data-ng-click="project.category = 'infraLimitSummary'" data-toggle="tab"><i class="fa fa-database"></i> Infra Limit Summary</a></li>
        <li data-ng-class="project.category == 'infraStructure' ? 'active' : ''"><a  data-ng-click="project.category = 'infraStructure'" data-toggle="tab"> <i class="fa fa-building"></i> Infrastructure</a></li>
        <li data-ng-class="project.category == 'invoice' ? 'active' : ''"><a data-ng-click="project.category = 'invoice'" data-toggle="tab"> <i class="fa fa-calculator"></i> Invoice</a></li>
        <li data-ng-class="project.category == 'payments' ? 'active' : ''"><a data-ng-click="project.category = 'payments'" data-toggle="tab"> <i class="fa fa-credit-card"></i> Payments</a></li>
        <li data-ng-class="project.category == 'recurringItems' ? 'active' : ''"><a data-ng-click="project.category = 'recurringItems'" data-toggle="tab"> <i class="fa fa-repeat"></i> Recurring Items</a></li>
        <li data-ng-class="project.category == 'infraLimits' ? 'active' : ''"><a data-ng-click="project.category = 'infraLimits'" data-toggle="tab"> <i class="fa fa-arrows-v"></i> Infra Limit</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'billingSummary'}" id="step1-config">
            <div data-ng-include src="'views/client/project/billing-summary.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'infraLimitSummary'}" id="step1-storage">
            <div data-ng-include src="'views/client/project/infralimit-summary.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'infraStructure'}" id="step1-network">
        <div data-ng-include src="'views/client/project/infrastructure.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'invoice'}" id="step1-monitor">
            <div data-ng-include src="'views/client/project/invoice.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'payments'}" id="step1-monitor">
            <div data-ng-include src="'views/client/project/payments.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'recurringItems'}" id="step1-monitor">
            <!--<div data-ng-include src="'views/client/project/recurring-items.html'"></div>-->
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : project.category == 'infraLimits'}" id="step1-monitor">
            <div data-ng-include src="'views/client/project/infralimit.html'"></div>
        </div>
    </div>


</div>
</div>
