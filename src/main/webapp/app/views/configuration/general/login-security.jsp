<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateLogin(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

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
                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.linkActiveTime.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Link Active Time(min):
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" data-ng-class="{'error': configForm.linkActiveTime.$invalid && formSubmitted}" name="linkActiveTime" data-ng-model="config.linkActiveTime" data-ng-init="config.linkActiveTime = '10'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the no of minutes to keep the verification link to be active" ></i>
                                    <div class="error-area" data-ng-show="configForm.linkActiveTime.$invalid && formSubmitted" ><i  tooltip="Link Active Time is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.unlockTime.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Unlock Time(min):
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="unlockTime" data-ng-class="{'error': configForm.unlockTime.$invalid && formSubmitted}" data-ng-model="config.unlockTime" data-ng-init="config.unlockTime = '10'" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip=" Enter time(in min) to unlock account" ></i>
                                    <div class="error-area" data-ng-show="configForm.unlockTime.$invalid && formSubmitted" ><i  tooltip="Unlock Time is required." class="fa fa-warning error-icon"></i></div>



                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.maxLogin.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Max Login Failure pre IP:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="maxLogin" data-ng-class="{'error': configForm.maxLogin.$invalid && formSubmitted}" data-ng-model="config.maxLogin" data-ng-init="config.maxLogin = '5'" class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the no of max failure attempt for an ip " ></i>
                                    <div class="error-area" data-ng-show="configForm.maxLogin.$invalid && formSubmitted" ><i  tooltip="Max Login Failure pre IP is required" class="fa fa-warning error-icon"></i></div>


                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button class="btn btn-info " type="submit">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div></form>