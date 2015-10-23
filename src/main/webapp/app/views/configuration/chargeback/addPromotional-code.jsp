<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validatePromotion(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" ui-sref="configuration.home.promotional" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.code.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Code:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text"  name="code" data-ng-model="config.code"   class="form-control" ng-class="{
                                            'error'
                                            : configForm.code.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Code for promotion" ></i>
                                    <div class="error-area" data-ng-show="configForm.code.$invalid && formSubmitted" ><i  tooltip="Code is required" class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div></div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.type.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Type:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="type" data-ng-model="config.type" ng-options="type.name for type in formElements.typeList  " ng-class="{
                                            'error'
                                            : configForm.type.$invalid && formSubmitted}">
                                        <option value="">Select</option>
                                    </select>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Type of Promotion Code" ></i>
                                    <div class="error-area" data-ng-show="configForm.type.$invalid && formSubmitted" ><i  tooltip="Type is required" class="fa fa-warning error-icon"></i></div>



                                </div>

                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.value.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Value:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text"  name="value" data-ng-model="config.value"   class="form-control" ng-class="{
                                            'error'
                                            : configForm.value.$invalid && formSubmitted}">

                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Credit Value for Promotion Code" ></i>
                                    <div class="error-area" data-ng-show="configForm.value.$invalid && formSubmitted" ><i  tooltip="Value is required" class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div></div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.startDate.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Start Date(yyyy-mm-dd):
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7 ">
                                    <div class="input-group">
                                        <input type="text" readonly class="form-control" ng-class="{'error': configForm.startDate.$invalid && formSubmitted}" datepicker-popup="{{global.date.format}}" max-date="activity.endDate" name="startDate" data-ng-model="activity.startDate" is-open="activity.startDateOpened" datepicker-options="global.date.dateOptions" ng-required="true" close-text="Close" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default" ng-class="{'error' : configForm.startDate.$invalid && formSubmitted}" ng-click="open($event, 'startDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>
                                        </span>
                                    </div>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Start Date for Promotion Code" ></i>
                                    <div class="error-area" data-ng-show="configForm.startDate.$invalid && formSubmitted" ><i  tooltip="Start Date is required" class="fa fa-warning error-icon"></i></div>

                                </div>


                            </div>

                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.endDate.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">End Date(yyyy-mm-dd):
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7 ">
                                    <div class="input-group">
                                        <input type="text" readonly class="form-control" ng-class="{'error': configForm.endDate.$invalid && formSubmitted}" datepicker-popup="{{global.date.format}}" min-date="activity.startDate" name="endDate" data-ng-model="activity.endDate" is-open="activity.endDateOpened" datepicker-options="global.date.dateOptions" ng-required="true" close-text="Close" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default" ng-class="{'error': configForm.endDate.$invalid && formSubmitted}" ng-click="open($event, 'endDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>
                                        </span>
                                    </div>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="End Date for Promotion Code" ></i>
                                    <div class="error-area" data-ng-show="configForm.endDate.$invalid && formSubmitted" ><i  tooltip="End Date is required" class="fa fa-warning error-icon"></i></div>

                                </div>


                            </div>

                        </div>

                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Maximum Uses:
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input type="text"  name="maximumUses" data-ng-model="config.maximumUses"   class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Maximum Uses for this Promotion Code" ></i>

                                </div>

                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.adminNotes.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Admin notes:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">

                                    <textarea rows="4" required="true" type="text" name="adminNotes" data-ng-model="config.adminNotes" class="form-control" ng-class="{
                                            'error'
                                            : configForm.adminNotes.$invalid && formSubmitted}"></textarea>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin notes for Promotion Code" ></i>
                                    <div class="error-area" data-ng-show="configForm.adminNotes.$invalid && formSubmitted" ><i  tooltip="Admin notes is required" class="fa fa-warning error-icon"></i></div>


                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button class="btn btn-info" type="submit">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>


        </div>
    </div>
</form>

