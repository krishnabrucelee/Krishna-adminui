<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view>

<div class="hpanel">
    <div class="hpanel">
        <div class="row m-l-sm m-r-sm panel-body" ng-controller="configurationCtrl">

            <ul class="nav nav-tabs" >
                <li data-ng-class="{'active' : configElements.category == 'general'}"><a href="#/configuration/general">  <i class="fa fa-calendar"></i> General</a></li>
                <li data-ng-class="{'active' : configElements.category == 'chargeback'}"><a href="#/configuration/chargeback"  > <i class="fa fa-credit-card"></i> Chargeback</a></li>
                <li data-ng-class="{'active' : configElements.category == 'cloudstack'}"><a href="#/configuration/cloudstack"><i class="fa fa-cloud"></i> Cloud Stack</a></li>
            </ul>

            <div class="tab-content">


                <div class="tab-pane"  data-ng-class="{'active' : configElements.category == 'general'}" id="general">
                    <div data-ng-include src="'app/views/configuration/general/general.jsp'"></div>
                </div>
                <div class="tab-pane"  data-ng-class="{'active' : configElements.category == 'chargeback'}" id="chargeback">
                    <div data-ng-include src="'app/views/configuration/chargeback/chargeback.jsp'"></div>
                </div>
                <div class="tab-pane"  data-ng-class="{'active' : configElements.category == 'cloudstack'}" id="cloudstack">
                    <div data-ng-include src="'app/views/configuration/cloudStack/cloudStack.jsp'"></div>
                </div>
            </div>


        </div>
    </div>

</div>
</div>

