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
                                <a class="btn btn-info" ui-sref="configuration.home.discount" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.discountName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Discount Name:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-5 col-sm-6">
                                    <input required="true" type="text"  name="discountName" data-ng-model="config.discountName"   class="form-control" data-ng-class="{'error': configForm.discountName.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Discount Name" ></i>
                                    <div class="error-area" data-ng-show="configForm.discountName.$invalid && formSubmitted" ><i  tooltip="Discount Name is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div></div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.type.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Type:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <select required="true" class="form-control input-group" name="type" data-ng-model="config.type" ng-options="type.name for type in formElements.typeDiscountList  " data-ng-class="{'error': configForm.type.$invalid && formSubmitted}">
                                        <option value="">Select</option>
                                    </select>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Type of Discount, 1)User base:Discount will be added to draft invoice, 2)Plan base:Discount is added on every VM created" ></i>
                                    <div class="error-area" data-ng-show="configForm.type.$invalid && formSubmitted" ><i  tooltip="Type is required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.value.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Value(in %):
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" type="text"  name="value" data-ng-model="config.value"   class="form-control" data-ng-class="{'error': configForm.value.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Discount Value(in %)" ></i>
                                    <div class="error-area" data-ng-show="configForm.value.$invalid && formSubmitted" ><i  tooltip="Value is required" class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div></div>



                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Billing Cycles:
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input type="text"  name="billingCycles" data-ng-model="config.billingCycles"   class="form-control" >
                                    <span class="help-block m-b-none" ng-show="configForm.billingCycles.$invalid && formSubmitted" >Billing cycles is required.</span>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Billing Cycles for Discount" ></i>

                                </div>

                            </div>
                        </div>

                        <div class="form-group" data-ng-show="config.type.id==1" ng-class="{
                                            'text-danger'
                                            :configForm.applyUser.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Apply to user:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <select required="true" class="form-control input-group" name="applyUser" data-ng-model="config.applyUser" ng-options="applyUser.name for applyUser in formElements.applyUserList  " ng-class="{
                                            'error'
                                            :configForm.applyUser.$invalid && formSubmitted}">
                                        <option value="">Select</option>
                                    </select>
                                    <div class="error-area" data-ng-show="configForm.applyUser.$invalid && formSubmitted" ><i  tooltip="Apply to user is required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                            <div class="form-group" data-ng-show="config.type.id==2" ng-class="{
                                            'text-danger'
                                            :configForm.applyPlan.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Apply to plan:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <select required="true" class="form-control input-group" name="applyPlan" data-ng-model="config.applyPlan" ng-options="applyPlan.name for applyPlan in formElements.applyPlanList  " ng-class="{
                                            'error'
                                            :configForm.applyPlan.$invalid && formSubmitted}">
                                        <option value="">Select</option>
                                    </select>
                                    <div class="error-area" data-ng-show="configForm.applyPlan.$invalid && formSubmitted" ><i  tooltip="Apply to plan is required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group" data-ng-show="config.applyUser.id == 2 && config.type.id==1" ng-class="{
                                            'text-danger'
                                            :configForm.user.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">User:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <select required="true" class="form-control input-group" name="user" data-ng-model="config.user" ng-options="user.name for user in formElements.userList  " ng-class="{
                                            'error'
                                            :configForm.user.$invalid && formSubmitted}">
                                        <option value="">Select</option>
                                    </select>
                                    <div class="error-area" data-ng-show="configForm.user.$invalid && formSubmitted" ><i  tooltip="User is required" class="fa fa-warning error-icon"></i></div>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="User for this Discount" ></i>
                                </div>

                            </div>
                        </div>
                         <div class="form-group" data-ng-show="config.applyPlan.id == 2 && config.type.id==2" ng-class="{
                                            'text-danger'
                                            :configForm.plan.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Plan:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <select required="true" class="form-control input-group" name="plan" data-ng-model="config.plan" ng-options="plan.name for plan in formElements.planList  " ng-class="{
                                            'error'
                                            :configForm.plan.$invalid && formSubmitted}">
                                        <option value="">Select</option>
                                    </select>
                                    <div class="error-area" data-ng-show="configForm.plan.$invalid && formSubmitted" ><i  tooltip="Plan is required" class="fa fa-warning error-icon"></i></div>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Plan for this Discount" ></i>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">
                                </label>
                                <div class="col-md-5 col-sm-6">
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

