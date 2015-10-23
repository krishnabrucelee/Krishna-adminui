<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateBilling(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" ui-sref="configuration.home.billing" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body"><div class="col-md-7 col-sm-7">

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.name.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Name:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7" data-ng-class="{'error': configForm.name.$invalid && formSubmitted}">
                                    <input required="true" type="text" readonly name="name" data-ng-model="config.name" data-ng-init="config.name = 'ComputingOffer'"  class="form-control" data-ng-class="{'error': configForm.name.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Billable Item Name" ></i>
                                    <div class="error-area" data-ng-show="configForm.name.$invalid && formSubmitted" ><i  tooltip="Name is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger':configForm.enable.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Enabled:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7" data-ng-class="{'error': configForm.enable.$invalid && formSubmitted}">
                                    <label>

                                        <input icheck required="true" type="checkbox" data-ng-class="{'error': configForm.enable.$invalid && formSubmitted}" name="enable" data-ng-init="config.enable = true"  data-ng-model="config.enable"  >

                                        <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Tick this box to enable this item in invoice" ></i>
                                    </label>
                                    <div class="error-area" data-ng-show="configForm.enable.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.tax.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Tax:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-class="{'error': configForm.tax.$invalid && formSubmitted}" name="tax" data-ng-init="config.tax = formElements.taxList[0]" data-ng-model="config.tax" ng-options="tax.name for tax in formElements.taxList" >

                                    </select>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The Tax which is applied for this item" ></i>
                                    <div class="error-area" data-ng-show="configForm.tax.$invalid && formSubmitted" ><i  tooltip="Tax is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger':configForm.discountable.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Discountable:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7" data-ng-class="{'error': configForm.discountable.$invalid && formSubmitted}">
                                    <label>

                                        <input icheck required="true" type="checkbox" data-ng-class="{'error': configForm.discountable.$invalid && formSubmitted}" name="discountable" data-ng-init="config.discountable = true"  data-ng-model="config.discountable"  >

                                        <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Tick this box to enable discount for this item" ></i>
                                    </label>
                                    <div class="error-area" data-ng-show="configForm.discountable.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button class="btn btn-info" type="submit">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</form>
