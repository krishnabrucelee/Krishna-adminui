<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateDepartment(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">

                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.department.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Department:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="department" data-ng-model="config.department"   class="form-control" data-ng-class="{'error': configForm.department.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter department name" ></i>
                                    <div class="error-area" data-ng-show="configForm.department.$invalid && formSubmitted" ><i  tooltip="Department is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button type="button" class="btn btn-default" ng-click="cancel()" data-dismiss="modal"><fmt:message key="common.cancel" bundle="${msg}" /></button>
                                    <button class="btn btn-info  m-l-xs" type="submit"><fmt:message key="common.save" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div></form>