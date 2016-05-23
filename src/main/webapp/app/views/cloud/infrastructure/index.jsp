<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="hpanel">
<div class="row panel-body" ng-controller="infrastructureCtrl">

    <ul class="nav nav-tabs" data-ng-init="templateCategory = 'instance'">
        <li class="active"><a href="javascript:void(0)" data-ng-click="templateCategory = 'instance'" data-toggle="tab">  <i class="fa fa-cloud"></i> Instance</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'storage'" data-toggle="tab"><i class="fa fa-database"></i> STORAGE</a></li>
        <li class=""><a data-ng-click="templateCategory = 'snapshot'" data-toggle="tab"> <i class="fa fa-camera-retro"></i> Snapshot</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'bandwidth'" data-toggle="tab"> <i class="fa fa-dashboard"></i> Bandwidth</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'ip'" data-toggle="tab"> <i class="custom-icon custom-icon-ip"></i> IP Static</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'network'" data-toggle="tab"> <!--<i class="fa fa-sitemap"></i>--><i class="custom-icon custom-icon-network"></i> NETWORK</a></li>

    </ul>

    <div class="tab-content">

        <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'instance'}" id="step1-dashboard">
        <div data-ng-include src="'views/cloud/infrastructure/instance.html'"></div>

        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'storage'}" id="step1-config">
            <div data-ng-include src="'views/cloud/infrastructure/storage.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'snapshot'}" id="step1-storage">
            <div data-ng-include src="'views/cloud/infrastructure/snapshot.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'bandwidth'}" id="step1-network">
        <div data-ng-include src="'views/cloud/infrastructure/bandwidth.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'ip'}" id="step1-network">
        <div data-ng-include src="'views/cloud/infrastructure/ip-config.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'network'}" id="step1-monitor">
            <div data-ng-include src="'views/cloud/infrastructure/network.html'"></div>
        </div>
    </div>


</div>
</div>
