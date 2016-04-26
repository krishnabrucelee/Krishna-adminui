<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div id="navigation">
    <ul side-navigation class="nav" id="side-menu">
        <li class="" ng-class="{active: $state.includes('home')}">
            <a ui-sref="dashboard" id="home_navigation_button">
                <span class="pe-7s-home pe-2x nav-menu-icons"></span>
                <span class="nav-label"><fmt:message key="common.home" bundle="${msg}" /></span>
            </a>
        </li>
        <li ng-class="{active: $state.includes('client')}">
            <a href="#" id="clients_navigation_button"><span class="pe-7s-users pe-2x nav-menu-icons"></span> <span class="nav-label"><fmt:message key="common.clients" bundle="${msg}" /></span><span class="fa arrow"></span> </a>
            <ul class="nav nav-second-level" ng-class="{in: $state.includes('client')}">
                <li ui-sref-active="active"><a ui-sref="client.client" id="company_navigation_button"><fmt:message key="common.company" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="client.application" id="applications_navigation_button"><fmt:message key="common.applications" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="client.project" id="projects_navigation_button"><fmt:message key="common.projects" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="client.user" id="users_navigation_button"><fmt:message key="common.users" bundle="${msg}" /></a></li>
            </ul>
        </li>

        <li ng-class="{active: $state.includes('cloud')}">
            <a href="#" id="cloud_navigation_button"><span class="pe-7s-cloud pe-2x nav-menu-icons"></span> <span class="nav-label"><fmt:message key="common.cloud" bundle="${msg}" /></span><span class="fa arrow"></span> </a>
            <ul class="nav nav-second-level" ng-class="{in: $state.includes('cloud')}">
                <li ui-sref-active="active"><a ui-sref="cloud.infra-structure" id="infrastructure_navigation_button"><fmt:message key="common.infrastructure" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="cloud.resource" id="resource_usage_navigation_button"><fmt:message key="common.resourceusage" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="cloud.vpc" id="vpc_navigation_button"><fmt:message key="common.vpc" bundle="${msg}" /></a></li>
            </ul>
        </li>



        <li ng-class="{active: $state.includes('configuration')}">
            <a ui-sref="configuration.home({category:'general'})" id="configuration_navigation_button">
                <span class="pe-7s-graph2 pe-2x nav-menu-icons"></span>
                <span class="nav-label"><fmt:message key="common.configuration" bundle="${msg}" /></span> </a>
        </li>

         <li ng-class="{active: $state.includes('servicecatalog')}">
             <a href="#"><img src="images/icon-services.png" border="0" class="sidemenu-icons"/><span class="nav-label"><fmt:message key="common.services" bundle="${msg}" /></span><span class="fa arrow"></span> </a>
            <ul class="nav nav-second-level" ng-class="{in: $state.includes('servicecatalog')}">
                <li ui-sref-active="active"><a ui-sref="servicecatalog.list-compute" id="compute_navigation_button"><fmt:message key="common.compute" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="servicecatalog.list-storage" id="storage_navigation_button"><fmt:message key="common.storage" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="servicecatalog.list-miscellaneous" id="miscellaneous_navigation_button"><fmt:message key="common.miscellaneous" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="servicecatalog.list-templatestore" id="template_store_navigation_button"><fmt:message key="common.templatestore" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="servicecatalog.list-network" id="network_navigation_button"><fmt:message key="common.network" bundle="${msg}" /></a></li>

            </ul>
        </li>
         <li ng-class="{active: $state.includes('reports')}">
             <a href="#"><span class="pe-7s-file pe-2x nav-menu-icons"></span><span class="nav-label"><fmt:message key="common.reports" bundle="${msg}" /></span><span class="fa arrow"></span> </a>
            <ul class="nav nav-second-level" ng-class="{in: $state.includes('reports')}">
                <li ui-sref-active="active"><a ui-sref="reports.invoicelist-report"><fmt:message key="common.invoicelistreport" bundle="${msg}" /></a></li>
                <%-- <li ui-sref-active="active"><a ui-sref="reports.signup"><fmt:message key="common.signupreport" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="reports.billable-items"><fmt:message key="common.billableitemreport" bundle="${msg}" /></a></li> --%>
                <li ui-sref-active="active"><a ui-sref="reports.payment-report"><fmt:message key="common.paymentreport" bundle="${msg}" /></a></li>
                <li ui-sref-active="active"><a ui-sref="reports.usage-report"><fmt:message key="common.usagereport" bundle="${msg}" /></a></li>
          <%--  <li ui-sref-active="active"><a ui-sref="reports.payment-due"><fmt:message key="common.paymentduereport" bundle="${msg}" /></a></li>--%>
                  <li ui-sref-active="active"><a ui-sref="reports.client-usage"><fmt:message key="common.clientusage" bundle="${msg}" /></a></li> 
            </ul>
        </li>
    </ul>
</div>


