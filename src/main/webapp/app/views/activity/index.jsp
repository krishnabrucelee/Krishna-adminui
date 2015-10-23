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
                        <li><a ui-sref="dashboard">Home</a></li>
                        <li ng-repeat="state in $state.$current.path" ng-switch="$last || !!state.abstract" ng-class="{active: $last}">
                            <a ng-switch-when="false" href="#{{state.url.format($stateParams)}}">{{state.data.pageTitle}}</a>
                            <span ng-switch-when="true">{{state.data.pageTitle}}</span>
                        </li>
                    </ol>
                </div>
                <h2 class="font-light m-b-xs">
                    {{ $state.current.data.pageTitle}}
                </h2>
                <small>{{ $state.current.data.pageDesc}}</small>
            </div>
        </div>
    </div>
    <div class="content">
        <div ui-view >
            <div class="hpanel">
                <div class="hpanel">
                    <div class="row m-l-sm m-r-sm panel-body" ng-controller="activityCtrl">
                        <ul class="nav nav-tabs" >
                            <li data-ng-class="{'active' : activity.category == 'events'}"><a href="javascript:void(0)"  data-ng-click="getActivityByCategory('events')" data-toggle="tab">  <i class="fa fa-calendar"></i> Events</a></li>
                            <li data-ng-class="{'active' : activity.category == 'alerts'}"><a  data-ng-click="getActivityByCategory('alerts')" data-toggle="tab"> <i class="fa fa-warning"></i> Alerts</a></li>
                            <li data-ng-class="{'active' : activity.category == 'notifications'}"><a  data-ng-click="getActivityByCategory('notifications')" data-toggle="tab"> <i class="fa fa-bell"></i> Notifications</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane"  data-ng-class="{'active' : activity.category == 'events'}" id="events">
                                <div data-ng-include src="'views/activity/events.html'"></div>
                            </div>
                            <div class="tab-pane"  data-ng-class="{'active' : activity.category == 'alerts'}" id="alerts">
                                <div data-ng-include src="'views/activity/alerts.html'"></div>
                            </div>
                            <div class="tab-pane"  data-ng-class="{'active' : activity.category == 'notifications'}" id="notifications">
                                <div data-ng-include src="'views/activity/notifications.html'"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
