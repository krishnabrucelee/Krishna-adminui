<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateReset(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl" >

    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header page-icon="" hide-zone="true" page-title="Reset Password"></panda-modal-header>

        </div>

        <div class="modal-body">
            <div class="row"  >
                <div class="col-md-12">
                    <div class="form-group" ng-class="{'text-danger': configForm.password.$invalid && formSubmitted}">
                        <div class="row" >
                            <label class="col-md-3 col-sm-3 control-label" >Password
                                <span class="text-danger">*</span>
                            </label>
                            <div class="col-md-5 col-sm-5">
                                <input required="true" type="password" data-ng-class="{'error': configForm.password.$invalid && formSubmitted}" name="password" data-ng-model="config.password" class="form-control" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter Password(min 8 characters)" ></i>
                                <div class="error-area" data-ng-show="configForm.password.$invalid && formSubmitted" ><i  tooltip="Password is required." class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group" ng-class="{'text-danger': configForm.confirmPassword.$invalid && formSubmitted}">
                        <div class="row" >
                            <label class="col-md-3 col-sm-3 control-label" >Confirm Password
                                <span class="text-danger">*</span>
                            </label>
                            <div class="col-md-5 col-sm-5">
                                <input required="true" type="password" data-ng-class="{'error': configForm.confirmPassword.$invalid && formSubmitted}" name="confirmPassword" data-ng-model="config.configPassword" class="form-control" >
                                <div class="error-area" data-ng-show="configForm.confirmPassword.$invalid && formSubmitted" ><i  tooltip="Confirm Password is required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal-footer">
            <button type="button" class="btn btn-default " ng-click="cancel()" data-dismiss="modal">Cancel</button>
            <button class="btn btn-info" type="submit">Reset</button>
        </div>
    </div>
</form>




