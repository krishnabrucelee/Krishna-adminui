<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="eventConfigForm" data-ng-submit="save(eventConfigForm)" method="post" novalidate="" data-ng-controller="eventConfigCtrl">
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
                    <div class="col-md-7 col-sm-7">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :eventConfigForm.noOfMessages.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="number.of.messages" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" valid-integer type="text" name="noOfMessages" valid-number data-ng-class="{'error': eventConfigForm.noOfMessages.$invalid && formSubmitted}" data-ng-model="eventConfig.noOfMessages" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="enter.the.maximum.active.messages" bundle="${msg}" />"></i>
                                    <div class="error-area" data-ng-show="eventConfigForm.noOfMessages.$invalid && formSubmitted" ><i  tooltip="Active messages should be a valid integer" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : eventConfigForm.archivalDays.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="archival.days" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" valid-integer type="text" name="archivalDays" valid-number data-ng-class="{'error': eventConfigForm.archivalDays.$invalid && formSubmitted}" data-ng-model="eventConfig.archivalDays" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="enter.the.archival.days" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="eventConfigForm.archivalDays.$invalid && formSubmitted" ><i  tooltip="Archival days should be a valid integer" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : eventConfigForm.expiryDays.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="archival.deletion.period" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" valid-integer type="text" name="expiryDays" valid-number data-ng-class="{'error': eventConfigForm.expiryDays.$invalid && formSubmitted}" data-ng-model="eventConfig.expiryDays" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip=" <fmt:message key="enter.the.expiry.days" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="eventConfigForm.expiryDays.$invalid && formSubmitted" ><i  tooltip="Expiry days should be a valid integer" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                <a href="#/configuration/general" class="btn btn-default">Cancel</a>
                                    <button class="btn btn-info " type="submit"><fmt:message key="common.save" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
