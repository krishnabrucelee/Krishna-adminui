<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="hpanel">
<div ui-view >


    <div class="row panel-body" data-ng-controller="tierviewCtrl" >

        <div class="col-md-12 col-sm-12" >

        <ul class="nav nav-tabs" data-ng-init="templateCategory = 'details'">
            <li class="active"><a href="javascript:void(0)" data-ng-click="templateCategory = 'details'" data-toggle="tab">  <i class="fa fa-list"></i> Details</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'instance'" data-toggle="tab"><i class="fa fa-cloud"></i> Instance</a></li>
            <li class=""><a data-ng-click="templateCategory = 'nat'" data-toggle="tab"> <i class="custom-icon custom-icon-network"></i> Static NAT</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'port'" data-toggle="tab"> <i class="fa fa-mail-forward"></i> Port Forwarding</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'LB'" data-toggle="tab"> <i class="custom-icon custom-icon-ip"></i> Public LB IP</a></li>

        </ul>

        <div class="tab-content">

            <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'details'}" id="step1-dashboard">
                <div data-ng-include src="'views/cloud/tier/details.html'"></div>

            </div>
            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'instance'}" id="step1-config">
                <div data-ng-include src="'views/cloud/tier/instances.html'"></div>
            </div>

            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'nat'}" id="step1-storage">
                <div data-ng-include src="'views/cloud/tier/source-nat.html'"></div>
            </div>

            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'port'}" id="step1-network">
                <div data-ng-include src="'views/cloud/tier/port-forward.html'"></div>
            </div>
            <!--
            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'vpn'}" id="step1-network">
            <div data-ng-include src="'views/cloud/vpc/vpn.html'"></div>
            </div>
            -->
            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'LB'}" id="step1-monitor">
                <div data-ng-include src="'views/cloud/tier/public-lb-ip.html'"></div>
            </div>
        </div>


    </div>
</div>

</div>
</div>