<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />
<!-- This is content container for nested view in UI-Router-->
<!-- You can put here any constant element in app content for example: Page title or breadcrum -->

<!-- Header -->
<div id="header" ng-include="'app/views/common/header.jsp'"></div>

<!-- Navigation -->
<aside id="menu" ng-include="'app/views/common/navigation.jsp'"></aside>

<!-- Main Wrapper -->
<div id="wrapper">
    <div small-header class="normalheader transition ng-scope small-header">
        <div class="hpanel" tour-step order="1" content="Place your page title and breadcrumb. Select small or large header or give the user choice to change the size." placement="bottom">
            <div class="panel-body">
                <div id="hbreadcrumb" class="pull-left">
                    <ol class="hbreadcrumb breadcrumb">
                        <li><a ui-sref="dashboard"><fmt:message key="common.home" bundle="${msg}" /></a></li>
                        <li ng-repeat="state in $state.$current.path" ng-switch="$last || !!state.abstract" ng-class="{active: $last}">
                            <a ng-switch-when="false" href="{{state.url.format($stateParams)}}">{{state.data.pageTitle}}</a>
                            <span ng-switch-when="true"><fmt:message key="common.activity" bundle="${msg}" /></span>
                        </li>
                    </ol>
                </div>
                <%-- <h2 class="font-light m-b-xs">
                    <fmt:message key="common.activity" bundle="${msg}" />
                </h2>
                <small>{{ $state.current.data.pageDesc}}</small> --%>
            </div>
        </div>
    </div>
    <div class="content">
        <div ui-view >
            <div class="hpanel">
                <div class="hpanel">
                    <div class="row m-l-sm m-r-sm panel-body" ng-controller="activityCtrl">
                    <form data-ng-submit="searchList(quickSearchText)">
                    	<div class="quick-search pull-right">
							<div class="input-group">
								<input data-ng-model="quickSearchText" id="network_list_search" type="text" valid-characters class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
							   	<span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
							</div>
						</div></form>
						<div class="pull-right m-r-xs">
                    		<a data-ng-if =" activity.category == 'events'" class="btn btn-info" data-ng-click="getActivityByCategory('events',1)" title="<fmt:message key="common.refresh" bundle="${msg}" />" ><span class="fa fa-refresh fa-lg "></span></a>
                    	   <a data-ng-if =" activity.category == 'alerts'" class="btn btn-info" data-ng-click="getActivityByCategory('alerts',1)" title="<fmt:message key="common.refresh" bundle="${msg}" />" ><span class="fa fa-refresh fa-lg "></span></a>
						   <a  data-ng-if =" activity.category == 'notifications'" class="btn btn-info" title="Refresh" ><span class="fa fa-refresh fa-lg "></span></a>

                    	</div>
                        <ul class="nav nav-tabs" >
                            <li data-ng-class="{'active' : activity.category == 'events'}"><a   data-ng-click="getActivityByCategory('events', 1)" data-toggle="tab">  <i class="fa fa-calendar"></i> <fmt:message key="activity.events" bundle="${msg}" /></a></li>
                            <li data-ng-class="{'active' : activity.category == 'alerts'}"><a   data-ng-click="getActivityByCategory('alerts', 1)" data-toggle="tab"> <i class="fa fa-warning"></i> <fmt:message key="activity.alerts" bundle="${msg}" /></a></li>
                            <li data-ng-class="{'active' : activity.category == 'notifications'}"><a data-ng-click="getActivityByCategory('notifications', 1)" data-toggle="tab"> <i class="fa fa-bell"></i> <fmt:message key="activity.notifications" bundle="${msg}" /></a></li>
               			</ul>
                      <div class="tab-content">
                      <div data-ng-show="showLoader" style="margin: 1%">
							<get-loader-image data-ng-show="showLoader"></get-loader-image>
						</div>
                            <div data-ng-hide="showLoader" class="tab-pane"  data-ng-class="{'active' : activity.category == 'events'}" id="events">
                                <div data-ng-include src="'app/views/activity/events.jsp'"></div>
                            </div>
                            <div data-ng-hide="showLoader" class="tab-pane"  data-ng-class="{'active' : activity.category == 'alerts'}" id="alerts">
                                <div data-ng-include src="'app/views/activity/alerts.jsp'"></div>
                            </div>
                            <div data-ng-hide="showLoader" class="tab-pane"  data-ng-class="{'active' : activity.category == 'notifications'}" id="notifications">
                                <div data-ng-include src="'app/views/activity/notifications.jsp'"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
