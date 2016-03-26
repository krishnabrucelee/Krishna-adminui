<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateInvoice(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
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

                        <div hidden class="form-group" ng-class="{
                                            'text-danger':configForm.invoiceGenerationType.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Invoice Generation is Fixed:<span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7" ng-class="{
                                            'error':configForm.invoiceGenerationType.$invalid && formSubmitted}">
                                    <label>
                                        <input icheck required="true" type="checkbox"  name="invoiceGenerationType" data-ng-init="config.invoiceGenerationType = true"  data-ng-model="config.invoiceGenerationType"  ng-class="{
                                            'error':configForm.invoiceGenerationType.$invalid && formSubmitted}">

                                        <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Tick this box to enable fixed billing Date" ></i>
                                    </label>
                                    <div class="error-area" data-ng-show="configForm.invoiceGenerationType.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>

                        <!-- <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.date.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Date of a month:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="date" data-ng-model="config.date" data-ng-init="config.date = formElements.dateList[1]" ng-options="date.id for date in formElements.dateList  " >
                                    </select>
                                    <div class="error-area" data-ng-show="configForm.date.$invalid && formSubmitted" ><i  tooltip="Date of Month is required" class="fa fa-warning error-icon"></i></div>

                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Fixing billing Date for invoice generation" ></i>
                                </div>

                            </div>
                        </div> -->


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.overDueDays.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Due Days:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text"  name="overDueDays" data-ng-model="config.overDueDays" class="form-control"ng-class="{
                                            'error'
                                            : configForm.overDueDays.$invalid && formSubmitted}" >
                                    <div class="error-area" data-ng-show="configForm.overDueDays.$invalid && formSubmitted" ><i  tooltip="Due Days are required." class="fa fa-warning error-icon"></i></div>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Due days for invoice" ></i>
                                </div>
                            </div></div>

                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Date Format:
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="dateFormat" data-ng-model="config.dateFormatType" ng-options="dateFormatType.name for dateFormatType in formElements.dateFormatList " >
                                        <option value="">Select</option>
                                    </select>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="This date format is applicable billing oriented external file such as pdf,csv,etc..files." ></i>
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
    </div>
</form>

