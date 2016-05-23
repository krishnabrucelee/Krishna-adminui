<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="hpanel">
<div ui-view >



    <div class="row panel-body " ng-controller="vpcviewCtrl">

        <ul class="nav nav-tabs" data-ng-init="templateCategory = 'details'">
            <li class="active"><a href="javascript:void(0)" data-ng-click="templateCategory = 'details'" data-toggle="tab">  <i class="fa fa-list"></i> Details</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'tier'" data-toggle="tab"><i class="fa fa-cubes"></i> Tier</a></li>
            <li class=""><a data-ng-click="templateCategory = 'ipaddress'" data-toggle="tab"> <i class="tab-icon tab-icon-ip"></i> IP Address</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'ssvpn'" data-toggle="tab"> <i class="tab-icon tab-icon-s-s-vpn-gateway"></i> Site-to-Site VPN Gateway</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'vpn'" data-toggle="tab"> <i class="tab-icon tab-icon-vpn"></i> VPN Connection</a></li>
            <li class=""><a  data-ng-click="templateCategory = 'gateway'" data-toggle="tab"> <!--<i class="fa fa-sitemap"></i>--><i class="tab-icon tab-icon-gateway"></i> Private Gateway</a></li>

        </ul>

        <div class="tab-content">

            <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'details'}" id="step1-dashboard">
                <div data-ng-include src="'views/cloud/vpc/details.html'"></div>

            </div>
            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'tier'}" id="step1-config">
                <div data-ng-include src="'views/cloud/vpc/tier.html'"></div>
            </div>

            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'ipaddress'}" id="step1-storage">
                <div data-ng-include src="'views/cloud/vpc/ip-address.html'"></div>
            </div>

            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'ssvpn'}" id="step1-network">
                <div data-ng-include src="'views/cloud/vpc/ss-vpn.html'"></div>
            </div>
            <!--
            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'vpn'}" id="step1-network">
            <div data-ng-include src="'views/cloud/vpc/vpn.html'"></div>
            </div>
            -->
            <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'gateway'}" id="step1-monitor">
                <div data-ng-include src="'views/cloud/vpc/private-gateway.html'"></div>
            </div>
        </div>


    </div>
</div>
</div>
