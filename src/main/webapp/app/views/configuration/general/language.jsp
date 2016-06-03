<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="save(configForm, generalconfiguration)" method="post" novalidate="" data-ng-controller="languageCtrl">
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
                <div class="panel-body"><div class="col-md-7 col-sm-7">

                        <div class="form-group" ng-class="{
                                            'has-error'
                                            :configForm.defaultLanguage.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label"><fmt:message key="select.default" bundle="${msg}" />:</label>
                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="defaultLanguage" data-ng-model="generalconfiguration.defaultLanguage" ng-options="language for (id, language) in formElements.LanguageList"
	                                data-ng-class="{ 'error' : configForm.defaultLanguage.$invalid && formSubmitted}">
	                                </select>
                                    <span class="help-block m-b-none" ng-show="configForm.defaultLanguage.$invalid && formSubmitted" >Language is required.</span>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="select.default" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                 <label class="col-md-4 col-sm-5 control-label">
                                 </label>
                       <div class="col-md-6 col-sm-7">
                        <button class="btn btn-info" type="submit"><fmt:message key="common.update" bundle="${msg}" /></button>
                    </div>
                            </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>