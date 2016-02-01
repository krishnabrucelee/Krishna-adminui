<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view>
    <div class="hpanel">
        <div class="row m-l-sm m-r-sm panel-body" ng-controller="infrastructureCtrl">
            <ul class="nav nav-tabs" data-ng-init="templateCategory = 'ostemplate'">
                <li class="">
                    <a href="index#/templatestore/list">
                        <fmt:message key="template.ostemplate" bundle="${msg}" />
                    </a>
                </li>
                <li class="active">
                	<a href="index#/templatestore/apptemplatelist">
                        <fmt:message key="template.apptemplate" bundle="${msg}" />
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div data-ng-include src="'app/views/servicecatalog/apptemplate.jsp'" ></div>
            </div>
        </div>
    </div>
