<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="emailConfigForm" data-ng-controller="emailConfigCtrl" method="POST" data-ng-submit="save(emailConfigForm, email)" novalidate>
<div class="row" >
    <div class="col-md-12 col-sm-12">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <span class="pull-left">
                            <a class="btn btn-info" ui-sref="configuration.home({category:'general'})"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body">
                <div class="col-md-6 col-sm-6 border-right">
                    <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.applicationURL.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Application URL:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true" type="url" name="applicationURL" data-ng-model="email.applicationUrl" class="form-control" data-ng-class="{ 'error' : emailConfigForm.applicationURL.$invalid && formSubmitted}" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The URL of this panel" ></i>
                                <div class="error-area" data-ng-show="emailConfigForm.applicationURL.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.applicationURL.errorMessage || '<fmt:message key="emailConfigForm.applicationURL.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>

                        </div>
                    </div>

                    <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.userName.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Username:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true" type="text" name="userName" data-ng-model="email.userName" class="form-control" data-ng-class="{ 'error' : emailConfigForm.userName.$invalid && formSubmitted}" >
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Username" ></i>
                                <div class="error-area" data-ng-show="emailConfigForm.userName.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.userName.errorMessage || '<fmt:message key="emailConfigForm.userName.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>

                        </div>
                    </div>

                    <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.port.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Port:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true"  type="text" name="port" data-ng-model="email.port" class="form-control" data-ng-class="{ 'error' : emailConfigForm.port.$invalid && formSubmitted}">
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Port no of the email server" ></i>
                                <div class="error-area" data-ng-show="emailConfigForm.port.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.port.errorMessage || '<fmt:message key="emailConfigForm.port.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>

                        </div>
                    </div>

                    <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.from.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">From:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true" type="email" valid-email name="from" data-ng-model="email.emailFrom" class="form-control" data-ng-class="{ 'error' : emailConfigForm.from.$invalid && formSubmitted}" >
                                 <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The from address of the email server" ></i>
								<div class="error-area" data-ng-show="emailConfigForm.from.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.from.errorMessage || '<fmt:message key="emailConfigForm.from.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.host.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Host:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true" type="text" name="host" data-ng-model="email.host" class="form-control" data-ng-class="{ 'error' : emailConfigForm.host.$invalid && formSubmitted}" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Host of the email server" ></i>
								<div class="error-area" data-ng-show="emailConfigForm.host.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.host.errorMessage || '<fmt:message key="emailConfigForm.host.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>

                            </div>

                        </div>
                    </div>
                <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.password.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Password:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true" type="password" name="password" data-ng-model="email.password" class="form-control" data-ng-class="{ 'error' : emailConfigForm.password.$invalid && formSubmitted}">
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Password" ></i>
								<div class="error-area" data-ng-show="emailConfigForm.password.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.password.errorMessage || '<fmt:message key="emailConfigForm.password.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>

                        </div>
                    </div>
                     <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.ssl.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">SSL:
                            </label>

                            <div class="col-md-7 col-sm-7">

                                <input icheck  data-ng-model="email.ssl" name="ssl" type="checkbox" class="form-control" data-ng-class="{ 'error' : emailConfigForm.ssl.$invalid && formSubmitted}"/>

                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="SSL is enabled or not" ></i>
								<div class="error-area" data-ng-show="emailConfigForm.ssl.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.ssl.errorMessage || '<fmt:message key="emailConfigForm.ssl.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>

                        </div>
                    </div>
                     <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.senderName.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Sender Name:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input required="true" type="text" name="senderName" data-ng-model="email.senderName" class="form-control" data-ng-class="{ 'error' : emailConfigForm.senderName.$invalid && formSubmitted}" >
								<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Sender name" ></i>
								<div class="error-area" data-ng-show="emailConfigForm.senderName.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ emailConfigForm.senderName.errorMessage || '<fmt:message key="emailConfigForm.senderName.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group" data-ng-class="{ 'text-danger' : emailConfigForm.emailLanguage.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Select Default Language:
                                <span class="text-danger">*</span>
                            </label>
                            <div class="col-md-7 col-sm-7">
                                <select required="true" class="form-control input-group" name="emailLanguage" data-ng-model="email.emailLanguage" ng-options="language for (id, language) in formElements.LanguageList"
                                data-ng-class="{ 'error' : emailConfigForm.emailLanguage.$invalid && formSubmitted}">
                                    <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
                                </select>
								<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Choose the default language" ></i>
								<div class="error-area" data-ng-show="emailConfigForm.emailLanguage.$invalid && formSubmitted" >
                                <i  tooltip="<fmt:message key="email.language.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
							</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         <div class="form-group">
        <div class="row p-sm">
            <span class="pull-right">
                <a class="btn btn-default btn-outline" id="cancel_button" data-ng-hide="showLoader" ui-sref="configuration.home({category:'general'})"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                <button data-ng-if="email.id == null" class="btn btn-info" data-ng-hide="showLoader" type="submit"><fmt:message key="common.add" bundle="${msg}" /></button>
                <button data-ng-if="email.id != null" class="btn btn-info" data-ng-hide="showLoader" type="submit"><fmt:message key="common.update" bundle="${msg}" /></button>

            </span>
        </div>
    </div>
        </div>


    </div>
</div>
</form>