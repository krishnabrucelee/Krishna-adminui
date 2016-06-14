<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="save(configForm,generalconfiguration)" method="post" novalidate="" data-ng-controller="loginSecurityCtrl">
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
                                            :configForm.maxLogin.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="max.login.failure" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="maxLogin" valid-number data-ng-class="{'error': configForm.maxLogin.$invalid && formSubmitted}" data-ng-model="generalconfiguration.maxLogin" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="max.attempt" bundle="${msg}" />"></i>
                                    <div class="error-area" data-ng-show="configForm.maxLogin.$invalid && formSubmitted" ><i  tooltip="Max Login Failure pre IP is required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.unlockTime.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="unlock.time" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="unlockTime" valid-number data-ng-class="{'error': configForm.unlockTime.$invalid && formSubmitted}" data-ng-model="generalconfiguration.unlockTime" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="unlock.time" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.unlockTime.$invalid && formSubmitted" ><i  tooltip="Unlock Time is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.rememberMeExpiredDays.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="remember.me.expiry" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="rememberMeExpiredDays" valid-number data-ng-class="{'error': configForm.rememberMeExpiredDays.$invalid && formSubmitted}" data-ng-model="generalconfiguration.rememberMeExpiredDays" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip=" <fmt:message key="remember.me.expiry" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.rememberMeExpiredDays.$invalid && formSubmitted" ><i  tooltip="Remember me expired days is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.sessionTime.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="session.timeout" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="sessionTime" valid-number data-ng-class="{'error': configForm.sessionTime.$invalid && formSubmitted}" data-ng-model="generalconfiguration.sessionTime" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="time.session.minute" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.sessionTime.$invalid && formSubmitted" ><i  tooltip="Unlock Time is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.sessionTime.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"> <fmt:message key="generalconfiguration.enableCaptcha" bundle="${msg}" />:
                                
                                </label>
                                <div class="col-md-6 col-sm-7">
										<input icheck type="checkbox" ng-model="generalconfiguration.enableCaptcha">                                    
                                </div>
                            </div>
                        </div>
                                            <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button class="btn btn-info " type="submit"><fmt:message key="common.update" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
