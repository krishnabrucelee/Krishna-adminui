<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row" ng-controller="billingCtrl">
    <div class="hpanel">
        <div class="panel-heading">
            <div class="row">
                <div class="col-lg-10 col-md-10 col-sm-10 col-md-offset-1">
                    <div class="panel-info panel ">
                        <div class="panel-heading">
                            <h3 class="panel-title">{{ $state.current.data.pageTitle}}</h3>
                        </div>
                        <div class="row m-t-md">
                            <div class="col-md-7 col-sm-7 pull-right m-b-sm">NOTE:
                                <span class="text-danger ">Use negative number for discount (Ex: -1) and positive number for adjustment (Ex: 1) </span>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group m-l-md">
                                    <div class="row">
                                    <label class="col-md-5 col-sm-5 control-label">Domain:
                                        <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-5 col-sm-5">
                                        <select
                                        class="form-control input-group col-xs-5" name="domain"
                                        data-ng-change="domainChange(billingSettingsObj.domain)"
                                        data-ng-model="billingSettingsObj.domain"
                                        data-ng-options="domainObj.name for domainObj in domainList">
                                        <option value="">Select</option>
                                        </select>
                                    </div>
                                    </div>
                                 </div>
                                 <div class="form-group m-l-md"
                                    ng-class="{
                                            'text-danger'
                                           : !billingSettingsObj.startDate && formSubmitted}">
                                    <div class="row">
                                        <label class="col-md-5 col-sm-5 control-label">Valid
                                            From: <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-md-5 col-sm-5 ">
                                            <div class="input-group">
                                                <input type="text" readonly
                                                    data-ng-class="{'error': !billingSettingsObj.startDate && formSubmitted}"
                                                    class="form-control"
                                                    datepicker-popup="{{global.date.format}}"
                                                    max-date="billingSettingsObj.endDate" name="fromDate"
                                                    data-ng-model="billingSettingsObj.startDate"
                                                    is-open="billingSettingsObj.startDateOpened"
                                                    datepicker-options="global.date.dateOptions"
                                                    close-text="Close" /> <span class="input-group-btn">
                                                    <button type="button" class="btn btn-default"
                                                        ng-click="open($event, 'startDateOpened')"
                                                        data-ng-class="{'error': !billingSettingsObj.startDate && formSubmitted}">
                                                        <i class="glyphicon glyphicon-calendar"></i>
                                                    </button>
                                                </span>
                                            </div>
                                            <div class="error-area"
                                                data-ng-show="!billingSettingsObj.startDate && formSubmitted">
                                                <i tooltip="From date is Required" class=""></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6  col-sm-6">
                                <div class="form-group m-l-md">
                                    <div class="row">
                                    <label class="col-md-6 col-sm-6 control-label">Adjustment Percentage:
                                        <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-5 col-sm-5">
                                        <input required="true" type="text" valid-price name="discountPercentage" data-ng-model="billingSettingsObj.discountPercentage" class="form-control col-md-4">
                                        <div class="error-area" data-ng-show="billingSettingsObj.discountPercentage.$invalid" ><i  tooltip="<fmt:message key="billingSettingsObj.discountPercentage.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                    </div>
                                    </div>
                                </div>
                                <div class="form-group m-l-md"
                                    ng-class="{
                                            'text-danger'
                                            : !billingSettingsObj.endDate && formSubmitted}">
                                    <div class="row">
                                        <label class="col-md-6 col-sm-6 control-label">Expires
                                            On:
                                        </label>
                                        <div class="col-md-5 col-sm-5 ">
                                            <div class="input-group">
                                                <input type="text"
                                                    data-ng-class="{'error': !billingSettingsObj.endDate && formSubmitted}"
                                                    readonly
                                                    class="form-control"
                                                    datepicker-popup="{{global.date.format}}"
                                                    min-date="billingSettingsObj.startDate" name="endDate"
                                                    data-ng-model="billingSettingsObj.endDate"
                                                    is-open="billingSettingsObj.endDateOpened"
                                                    datepicker-options="global.date.dateOptions"
                                                    close-text="Close" /> <span class="input-group-btn">
                                                    <button type="button"
                                                        data-ng-class="{'error': !billingSettingsObj.endDate && formSubmitted}"
                                                        class="btn btn-default"
                                                        ng-click="open($event, 'endDateOpened')">
                                                        <i class="glyphicon glyphicon-calendar"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6  col-sm-6">
                                <div class="form-group m-l-md">
                                    <div class="row">
                                    <label class="col-md-5 col-sm-5 control-label">Billable Item:
                                        <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-5 col-sm-5">
                                        <select required="true" multiple="multiple" class="form-control input-group" name="billing" data-ng-model="billingSettingsObj.billableItems" ng-options="billingObj.name for billingObj in billableList">
						                    <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
						                </select>
                                    </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row ">
                            <span class="col-md-4 col-sm-4"></span> <span
                                class="col-md-7 col-sm-7 p-md">
                                <button type="submit" data-ng-click="getBillingSettings()" class="btn btn-info">Add</button>
                                <!-- <a class="btn btn-default" data-ng-click="reset()"> Cancel </a> -->
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <div class="row">
            <div class="col-md-10 col-sm-10 col-xs-10 col-md-offset-1">
                <div class="white-content">
                    <div data-ng-hide="showLoader" style="margin: 1%">
                        <get-loader-image data-ng-show="showLoader"></get-loader-image>
                    </div>
                    <div class="table-responsive">
                        <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                                <thead>
                                    <tr>
                                    	<th class="col-md-2 col-sm-2">Domain</th>
                                    	<th class="col-md-2 col-sm-2">Adjustment Percentage</th>
                                    	<th class="col-md-2 col-sm-2">Valid From</th>
                                    	<th class="col-md-2 col-sm-2">Expires On</th>
                                    	<th class="col-md-2 col-sm-2">Billable Item</th>
                                    	<th class="col-md-1 col-sm-1"><fmt:message key="common.action" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody data-ng-hide="billableItemDiscountList.length > 0">
                                    <tr>
                                        <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-show="billableItemDiscountList.length > 0">
                                    <tr data-ng-repeat="discount in billableItemDiscountList">
                                        <td>{{ discount.domain.name}}</td>
                                        <td>{{ discount.discountPercentage}}</td>
                                        <td>{{ discount.startDate | date:'yyyy-MM-dd'}}</td>
                                        <td data-ng-show="today <= discount.endDate">{{ discount.endDate | date:'yyyy-MM-dd'}}</td>
                                        <td class="text-danger" data-ng-hide="today <= discount.endDate">{{ discount.endDate | date:'yyyy-MM-dd'}}</td>
                                        <td><span data-ng-repeat="item in discount.billableItems">{{item.name}} {{$last ? '' : ', '}}</span></td>
                                        <td><a class="icon-button" title="<fmt:message key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm', discount)" ><span class="fa fa-trash"></span></a></td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>
                </div>
                <br />
                <br />
                <pagination-content></pagination-content>
            </div>
        </div>
    </div>
</div>
