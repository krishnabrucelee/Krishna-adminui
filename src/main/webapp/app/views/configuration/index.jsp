<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view>

<div class="hpanel">
    <div class="hpanel">
        <div class="row m-l-sm m-r-sm panel-body" ng-controller="configurationCtrl">

            <ul class="nav nav-tabs" >
                <li data-ng-class="{'active' : configElements.category == 'general'}"><a href="#/configuration/general">  <i class="fa fa-calendar"></i> General</a></li>
                <li data-ng-class="{'active' : configElements.category == 'chargeback'}"><a href="#/configuration/chargeback"  > <i class="fa fa-warning"></i> Chargeback</a></li>
                <li data-ng-class="{'active' : configElements.category == 'cloudstack'}"><a href="#/configuration/cloudstack"><i class="fa fa-money"></i> Cloud Stack</a></li>
            </ul>

            <div class="tab-content">


                <div class="tab-pane"  data-ng-class="{'active' : configElements.category == 'general'}" id="general">
                    <div data-ng-include src="'views/configuration/general/general.html'"></div>
                </div>
                <div class="tab-pane"  data-ng-class="{'active' : configElements.category == 'chargeback'}" id="chargeback">
                    <div data-ng-include src="'views/configuration/chargeback/chargeback.html'"></div>
                </div>
                <div class="tab-pane"  data-ng-class="{'active' : configElements.category == 'cloudstack'}" id="cloudstack">
                    <div data-ng-include src="'views/configuration/cloudStack/cloudStack.html'"></div>
                </div>
            </div>


        </div>
    </div>

</div>
</div>

