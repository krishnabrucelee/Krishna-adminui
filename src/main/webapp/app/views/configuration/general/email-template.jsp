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

                        <div class="form-group" ng-class="{'text-danger':!config.eventName && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-5 control-label"><fmt:message key="select.the.event" bundle="${msg}" />:<span class="text-danger">*</span>
                                </label>
                                <div class="col-md-5 col-sm-7">
                                   <select required="true" class="form-control input-group" name="eventName" data-ng-model="config.eventName" data-ng-change="emailEventList(config.eventName)" ng-options="event.eventName for event in eventList" data-ng-class="{'error': !config.eventName && formSubmitted}" >
                                    <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
                                    </select>
                                    <i  tooltip="<fmt:message key="select.the.event" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="!config.eventName && formSubmitted" ><i  tooltip="<fmt:message key="event.is.required" bundle="${msg}" />Event is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                      <%--   <div data-ng-if="config.eventName.eventName == 'CAPACITY' || config.eventName.eventName == 'SYSTEM ERROR'">
                         <div class="form-group" ng-class="{'text-danger':!config.recipientType && formSubmitted}">
                        <div class="row">
									<label class="col-md-3 col-sm-5 control-label"><fmt:message key="recipient.type" bundle="${msg}" />:<span class="text-danger">*</span></label>
									<div class="col-md-5 col-xs-7">
										<select class="form-control input-group" name="recipientType"
											data-ng-model="config.recipientType"
											ng-options="recipientType for (id,recipientType) in formElements.recipientList" data-ng-class="{'error': !config.recipientType && formSubmitted}">
											<option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
										</select>
                                    <i  tooltip="<fmt:message key="select.the.user.type" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="!config.recipientType && formSubmitted" ><i  tooltip="<fmt:message key="recipient.type.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
									</div>
								</div>
								</div>
                             </div> --%>

                            <%-- <div data-ng-hide="config.eventName.eventName == 'CAPACITY' || config.eventName.eventName == 'SYSTEM ERROR'">
       		                <div class="form-group" ng-class="{'text-danger':!config.recipientType && formSubmitted}">
			                <div class="row">
									<label class="col-md-3 col-sm-5 control-label"><fmt:message key="recipient.type" bundle="${msg}" />:<span class="text-danger">*</span></label>
									<div class="col-md-5 col-xs-7">
										<select class="form-control input-group" multiple="multiple" name="recipientType"
											data-ng-model="config.recipientType"
											ng-options="recipientType for (id,recipientType) in formElements.recipientTypeList" data-ng-class="{'error': !config.recipientType && formSubmitted}">
											<option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
										</select>
                                    <i  tooltip="<fmt:message key="select.the.user.type" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="!config.recipientType && formSubmitted" ><i  tooltip="<fmt:message key="recipient.type.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
									</div>
								</div>
		                  </div>
		                  </div> --%>

						<div class="form-group"> <!-- ng-class="{'text-danger':file && formSubmitted}" -->
  					    <div class="row">
                                <label class="col-md-3 col-sm-5 control-label"><fmt:message key="upload.template.english" bundle="${msg}" />:<span class="text-danger">*</span>
                                </label>
                                                                <div class="col-md-5 col-sm-7">


                        <input type="file" name="file" accept=".htm,.html" class="custom-file-input" file-model="file"  data-ng-class="{'error': !file && formSubmitted}"/>
 						<span><label>{{eventsTemplateList[0].englishLanguage}}</label></span>
 						<%-- <div class="error-area" data-ng-show="file && formSubmitted">
									<i tooltip="<fmt:message key="file.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
								</div> --%>

  						</div>
  						</div>
  						</div>
                         <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-5 control-label"><fmt:message key="upload.template.chinese" bundle="${msg}" />:
                                </label>
                                <div class="col-md-5 col-sm-7">

                        <input type="file" name="file" accept=".htm,.html" class="custom-file-input" file-model="file1"/>
                        <span><label>{{eventsTemplateList[0].chineseLanguage}}</label></span>

                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': !config.subject && formSubmitted}">
						<div class="row">
							<label class="col-md-3 col-sm-5 control-label"><fmt:message key="common.subject" bundle="${msg}" /> <span class="text-danger">*</span>
							</label>
							<div class="col-md-5 col-sm-7">
								<textarea rows="4" required="true" type="text" name="subject" data-ng-model="config.subject" class="form-control" data-ng-class="{'error': !config.subject && formSubmitted}"></textarea>
								<i tooltip="<fmt:message key="email.subject" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
								<div class="error-area" data-ng-show="!config.subject && formSubmitted">
									<i tooltip="<fmt:message key="subject.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
								</div>
							</div>
						</div>
					</div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <a class="btn btn-default" href="#/configuration/general"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                                <button class="btn btn-info" type="submit"><fmt:message key="common.save" bundle="${msg}" /></button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-info col-md-4 col-sm-4" data-ng-show ="config.eventName" >
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bolt"></i>&nbsp;&nbsp;<fmt:message key="event.details" bundle="${msg}" /></h3>
                            </div>
                            <div class="panel-body no-padding">
                                <ul class="list-group">
                                    <li class="list-group-item no-padding" data-ng-repeat="event in eventsList"><code>$</code><code>{</code>{{event.eventLiterals}}<code>}</code> - {{event.description}}</li>

                                </ul>
                            </div>
                </div>
                </div>
            </div>


        </div>
    </div>
</form>