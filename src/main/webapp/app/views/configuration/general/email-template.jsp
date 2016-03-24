<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateEmailTemplate(configForm,config,file,file1)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/general"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body"><div class="col-md-7 col-sm-7">

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.eventName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-5 control-label">Select the event:<span class="text-danger">*</span>
                                </label>
                                <div class="col-md-5 col-sm-7">
                                   <select required="true" class="form-control input-group" name="eventName" data-ng-model="config.eventName" ng-options="event.eventName for event in eventList" data-ng-class="{'error': configForm.eventName.$invalid && formSubmitted}" >
                                    <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
                                    </select>
                                    <i  tooltip="Select the event" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="configForm.eventName.$invalid && formSubmitted" ><i  tooltip="Event is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                        <div class="row">
									<label
										class="col-md-3 col-sm-5 control-label">Recipient Type</label>
									<div class="col-md-5 col-xs-7">
										<select class="form-control input-group" name="recipientType"
											data-ng-model="config.recipientType"
											ng-options="recipientType for (id,recipientType) in formElements.recipientTypeList">
											<option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
										</select>
									</div>
								</div>
								</div>
								 <div class="form-group" ng-class="{
                                            'has-error'
                                            :configForm.uploadTemplateChinese.$invalid && formSubmitted}">
  					<div class="row">
                                <label class="col-md-3 col-sm-5 control-label">Upload the template(English):<span class="text-danger">*</span>
                                </label>
                                                                <div class="col-md-5 col-sm-7">

                        <form  name="configForm" ng-submit="">
                        <input type="file" name="file" accept=".htm,.html" class="custom-file-input" file-model="file"/>
 						<div class="error-area" data-ng-show="configForm.file.$invalid && formSubmitted">
									<i tooltip="<fmt:message key="file.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
								</div>
 						</form>
  						</div>
  						</div>
  						</div>
                         <div class="form-group" ng-class="{
                                            'has-error'
                                            :configForm.uploadTemplateChinese.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-5 control-label">Upload the template(Chinese):
                                </label>
                                <div class="col-md-5 col-sm-7">
                                <form  name="configForm" ng-submit="">
                        <input type="file" name="file" accept=".htm,.html" class="custom-file-input" file-model="file1"/>
<!--                         <input type ="text" data-ng-if = "file-model == 'file1'" data-ng-model = "config.language = 'CHINESE'">
 --> 						</form>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': configForm.description.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-3 col-sm-5 control-label"><fmt:message key="common.subject" bundle="${msg}" /> <span class="text-danger">*</span>
							</label>
							<div class="col-md-5 col-sm-7">
								<textarea rows="4" required="true" type="text" name="subject" id = "add_application_description" data-ng-model="config.subject" class="form-control" data-ng-class="{'error': configForm.subject.$invalid && formSubmitted}"></textarea>
								<i tooltip="<fmt:message key="description.of.the.application" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
								<div class="error-area" data-ng-show="configForm.subject.$invalid && formSubmitted">
									<i tooltip="<fmt:message key="application.description.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
								</div>
							</div>
						</div>
					</div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <a class="btn btn-default" href="#/configuration/general"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                                <button class="btn btn-info" type="submit">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-info col-md-3 col-sm-3">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bolt"></i>&nbsp;&nbsp;Event Details</h3>
                            </div>
                            <div class="panel-body no-padding">

                            </div>
                </div>
                </div>
            </div>


        </div>
    </div>
</form>