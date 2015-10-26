<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>
<ng-include id="menu" src="global.getViewPageUrl('common/navigation.jsp')"></ng-include>

<!-- Main Wrapper -->
<div id="wrapper">
    <div small-header class="normalheader transition ng-scope small-header">
        <div class="hpanel" tour-step order="1" title="Page header" content="Place your page title and breadcrumb. Select small or large header or give the user choice to change the size." placement="bottom">
            <div class="panel-body">
                <div id="hbreadcrumb" class="pull-right">
                    <ol class="hbreadcrumb breadcrumb">
                        <li><a ui-sref="dashboard"><fmt:message key="common.home" bundle="${msg}" /></a></li>
                        <li ng-repeat="state in $state.$current.path" ng-switch="$last || !!state.abstract" ng-class="{active: $last}">
							<span ng-if="state.data.pageTitle === 'compute.offer'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="compute.offer" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="compute.offer" bundle="${msg}" /></span>
                            </span>
                            <span ng-if="state.data.pageTitle === 'compute'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="compute" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="compute" bundle="${msg}" /></span>
                            </span>
                            <span ng-if="state.data.pageTitle === 'service'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="service" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="service" bundle="${msg}" /></span>
                            </span>
                            <span ng-if="state.data.pageTitle === 'storage.offer'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="storage.offer" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="storage.offer" bundle="${msg}" /></span>
                            </span>
							<span ng-if="state.data.pageTitle === 'storage'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="storage" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="storage" bundle="${msg}" /></span>
                            </span>
                            <span ng-if="state.data.pageTitle === 'miscellaneous'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="miscellaneous" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="storage" bundle="${msg}" /></span>
                            </span>

                             <span ng-if="state.data.pageTitle === 'configuration'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="configuration" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="configuration" bundle="${msg}" /></span>
                            </span>
                            <span ng-if="state.data.pageTitle === 'cloudStack'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="cloudStack" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="cloudStack" bundle="${msg}" /></span>
                            </span>

							<span ng-if="state.data.pageTitle === 'system.configuration'">
	                            <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}"><fmt:message key="system.configuration" bundle="${msg}" /></a>
	                            <span ng-switch-when="true"><fmt:message key="system.configuration" bundle="${msg}" /></span>
                            </span>



                        </li>
                    </ol>
                </div>
                <h2 class="font-light m-b-xs">
                    <span ng-if="$state.current.data.pageTitle === 'compute.offer'"><fmt:message key="compute.offer" bundle="${msg}" /></span>
                    <span ng-if="$state.current.data.pageTitle === 'storage.offer'"><fmt:message key="storage.offer" bundle="${msg}" /></span>
                </h2>
                <small>{{ $state.current.data.pageDesc}}</small>
            </div>
        </div>
    </div>
    <div class="content">
        <div ui-view >


        </div>
    </div>

</div>
<script>
    $(window).load(function () {
        $('.easy-tree').EasyTree({
            addable: true,
            editable: true,
            deletable: true
        });
    });

</script>