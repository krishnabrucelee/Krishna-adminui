<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateAdd(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" ui-sref="configuration.home.admin-user" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.userName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Username:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="userName" data-ng-model="config.userName"   class="form-control" data-ng-class="{'error': configForm.userName.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Username" ></i>
                                    <div class="error-area" data-ng-show="configForm.userName.$invalid && formSubmitted" ><i  tooltip="Username is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.password.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Password:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="password" name="password" data-ng-model="config.password" class="form-control" data-ng-class="{'error': configForm.password.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Password" ></i>
                                    <div class="error-area" data-ng-show="configForm.password.$invalid && formSubmitted" ><i  tooltip="Password is required." class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.confirmPassword.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Confirm Password:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="password" name="confirmPassword" data-ng-model="config.confirmPassword" class="form-control" data-ng-class="{'error': configForm.confirmPassword.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Confirm Password" ></i>
                                    <div class="error-area" data-ng-show="configForm.confirmPassword.$invalid && formSubmitted" ><i  tooltip="Confirm password is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button class="btn btn-info" type="submit">Create</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div>
</form>