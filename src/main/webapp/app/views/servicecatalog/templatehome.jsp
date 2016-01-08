<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view>

    <div class="hpanel">
        <div class="row m-l-sm m-r-sm panel-body" ng-controller="infrastructureCtrl">

            <ul class="nav nav-tabs" data-ng-init="templateCategory = 'ostemplate'">
                <li class="active"><a href="javascript:void(0)" data-ng-click="templateCategory = 'ostemplate'" data-toggle="tab"><!--</div><i class="fa fa-cloud"></i>-->
                        <fmt:message key="template.ostemplate" bundle="${msg}" /></a></li>
                <li class=""><a  data-ng-click="templateCategory = 'apptemplate'" data-toggle="tab">    <!--<i class="fa fa-database"></i>--> <fmt:message key="template.apptemplate" bundle="${msg}" /></a></li>
            </ul>

            <div class="tab-content">

                <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'ostemplate'}" id="step1-dashboard">
                    <div data-ng-include src="'app/views/servicecatalog/templatestore.jsp'"></div>

                </div>
                <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'apptemplate'}" id="step1-config">
                    <div data-ng-include src="'app/views/servicecatalog/apptemplate.jsp'" ></div>
                </div>
            </div>
        </div>
    </div>
