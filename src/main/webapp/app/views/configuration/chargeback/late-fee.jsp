<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateLogin(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/chargeback"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.minimumAmount.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Minimum amount:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="minimumAmount" data-ng-model="config.minimumAmount"  data-ng-init="config.minimumAmount ='100'"  class="form-control" data-ng-class="{'error': configForm.minimumAmount.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Late fee minimum amount" ></i>
                                    <div class="error-area" data-ng-show="configForm.minimumAmount.$invalid && formSubmitted" ><i  tooltip="Minimum amount  is Required" class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.minimumPercentage.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Minimum Percentage:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="minimumPercentage" data-ng-model="config.minimumPercentage" data-ng-init="config.minimumPercentage ='10'" class="form-control" data-ng-class="{'error': configForm.minimumPercentage.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Late fee Percentage" ></i>
                                    <div class="error-area" data-ng-show="configForm.minimumPercentage.$invalid && formSubmitted" ><i  tooltip="Minimum percentage  is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.applicableAmount.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Applicable amount:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="applicableAmount" data-ng-model="config.applicableAmount" data-ng-init="config.applicableAmount ='100'" class="form-control" data-ng-class="{'error': configForm.applicableAmount.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Late fee applicable amount " ></i>
                                    <div class="error-area" data-ng-show="configForm.applicableAmount.$invalid && formSubmitted" ><i  tooltip="Applicable amount is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                        <button class="btn btn-info" type="submit">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div></form>