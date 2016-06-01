<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row">
    <div class="col-md-12 col-sm-12">
    <div ng-controller="cloudStackCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <span class="pull-left">
                            <a class="btn btn-info" href="#/configuration/cloudstack" title="<fmt:message key="common.back" bundle="${msg}" />" ><span class="fa fa-arrow-circle-left fa-lg "></span><fmt:message key="common.back" bundle="${msg}" /> </a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">
          <label><fmt:message key="template.zone" bundle="${msg}" />:</label>
            <li data-ng-repeat="zone in zoneList">{{zone.name}}</li>
           </div>
        </div>
        </div>
    </div>
</div>

