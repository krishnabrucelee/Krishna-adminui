<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <span class="pull-left">
                            <a class="btn btn-info" href="#/configuration/general"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body">
                <ul class="nav nav-tabs" data-ng-init="templateCategory = 'department'">
        <li class="active"><a  data-ng-click="templateCategory = 'department'" data-toggle="tab"> DEPARTMENT</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'predefined'" data-toggle="tab"> PRE DEFINED REPLY</a></li>

    </ul>

                <div class="tab-content">

        <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'department'}" id="step1-dashboard">
        <div data-ng-include src="'app/views/configuration/general/department.jsp'"></div>

        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'predefined'}" id="step1-config">
            <div data-ng-include src="'app/views/configuration/general/predefined-reply.jsp'"></div>
        </div>

    </div>

             </div>
            </div>
        </div>


</div>