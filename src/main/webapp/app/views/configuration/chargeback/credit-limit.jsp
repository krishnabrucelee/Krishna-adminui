<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateInvoice(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">

                <div class="panel-body">
                    <div class="col-md-8 col-sm-8">

                           <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.level1.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-2 col-sm-3 control-label">Level 1:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" placeholder="50" type="text" data-ng-class="{'error': configForm.level1.$invalid && formSubmitted}" name="level1" data-ng-model="config.level1" data-ng-init="config.level1='50'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the number in(%) you would like to send the first credit limit notification notice" ></i>
                                    <div class="error-area" data-ng-show="configForm.level1.$invalid && formSubmitted" ><i  tooltip="Level1 is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                           <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.level2.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-2 col-sm-3 control-label">Level 2:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" placeholder="80" type="text" data-ng-class="{'error': configForm.level2.$invalid && formSubmitted}" name="level2" data-ng-model="config.level2" data-ng-init="config.level2='80'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the number in(%) you would like to send the second credit limit notification notice" ></i>
                                    <div class="error-area" data-ng-show="configForm.level2.$invalid && formSubmitted" ><i  tooltip="Level2 is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                           <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.level3.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-2 col-sm-3 control-label">Level 3:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" placeholder="90" type="text" data-ng-class="{'error': configForm.level3.$invalid && formSubmitted}" name="level3" data-ng-model="config.level3" data-ng-init="config.level3='90'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the number in(%) you would like to send the third credit limit notification notice" ></i>
                                    <div class="error-area" data-ng-show="configForm.level3.$invalid && formSubmitted" ><i  tooltip="Level3 is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">
                                </label>
                                <div class="col-md-5 col-sm-6">
                                    <button class="btn btn-info" type="submit">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>


        </div>
    </div>
</form>


