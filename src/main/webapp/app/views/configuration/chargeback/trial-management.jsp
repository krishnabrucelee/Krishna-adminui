<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateInvoice(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">

                <div class="panel-body">
                    <div class="col-md-8 col-sm-8">

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">TRIAL ENABLED:
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input icheck data-ng-class="{'error': configForm.tax.$invalid && formSubmitted}" name="trialEnabled"  type="checkbox" data-ng-model="management.trialEnabled" />
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Tick this box to enable Card verification in sign up" ></i>

                                </div>

                            </div>
                        </div>
                        <div class="form-group" data-ng-show="management.trialEnabled" ng-class="{
                                            'text-danger'
                                            : configForm.trialCredit.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Trial Credit Limit:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true"  type="text" data-ng-class="{'error': configForm.trialCredit.$invalid && formSubmitted}" name="trialCredit" data-ng-model="config.trialCredit" data-ng-init="config.trialCredit='50'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total credit limit for trial account." ></i>
                                    <div class="error-area" data-ng-show="configForm.trialCredit.$invalid && formSubmitted" ><i  tooltip="Trial Credit Limit is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                           <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.instanceLimit.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Instance Limit:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" type="text" data-ng-class="{'error': configForm.instanceLimit.$invalid && formSubmitted}" name="instanceLimit" data-ng-model="config.instanceLimit" data-ng-init="config.instanceLimit='2'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total Instance allowed for trial account." ></i>
                                    <div class="error-area" data-ng-show="configForm.instanceLimit.$invalid && formSubmitted" ><i  tooltip="Instance Limit is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                           <div class="form-group"  ng-class="{
                                            'text-danger'
                                            : configForm.storageLimit.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Storage Limit:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" type="text" data-ng-class="{'error': configForm.storageLimit.$invalid && formSubmitted}" name="storageLimit" data-ng-model="config.storageLimit" data-ng-init="config.storageLimit='2'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total Storage allowed for trial account." ></i>
                                    <div class="error-area" data-ng-show="configForm.storageLimit.$invalid && formSubmitted" ><i  tooltip="Storage Limit is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group"  ng-class="{
                                            'text-danger'
                                            : configForm.snapshotLimit.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Snapshot Limit:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" type="text" data-ng-class="{'error': configForm.snapshotLimit.$invalid && formSubmitted}" name="snapshotLimit" data-ng-model="config.snapshotLimit" data-ng-init="config.snapshotLimit='2'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total Snapshot allowed for trial account(No auto snapshot for trial account)." ></i>
                                    <div class="error-area" data-ng-show="configForm.snapshotLimit.$invalid && formSubmitted" ><i  tooltip="Snapshot Limit is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                           <div class="form-group"  ng-class="{
                                            'text-danger'
                                            : configForm.bandwidthLimit.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">Bandwidth Limit:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-6">
                                    <input required="true" type="text" data-ng-class="{'error': configForm.bandwidthLimit.$invalid && formSubmitted}" name="bandwidthLimit" data-ng-model="config.bandwidthLimit" data-ng-init="config.bandwidthLimit='2'"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total Bandwidth allowed for trial account in GB." ></i>
                                    <div class="error-area" data-ng-show="configForm.bandwidthLimit.$invalid && formSubmitted" ><i  tooltip="Bandwidth Limit is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-4 control-label">
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


