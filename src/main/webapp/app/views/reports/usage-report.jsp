<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="row" ng-controller="invoiceListReport">
    <div class="hpanel">
        <div class="panel-heading">
            <div class="">
                <div class="col-lg-10 col-md-10 col-sm-10 col-md-offset-1">
                    <div class="panel-info panel ">
                        <div class="panel-heading">
                            <h3 class="panel-title">Generate {{ $state.current.data.pageTitle}}</h3>
                        </div>

                        <div class="row m-t-md">
                            <div class="col-md-6 col-sm-6">

                                 <div class="form-group m-l-md"
                                    ng-class="{'text-danger' : !usageStatisticsObj.startDate && formSubmitted}">

                                    <div class="row">
                                        <label class="col-md-3 col-sm-3 control-label">From
                                            Date: <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-md-7 col-sm-7 ">
                                            <div class="input-group">
                                                <input type="text" readonly

                                                    data-ng-class="{'error': !usageStatisticsObj.startDate && formSubmitted}"
                                                    class="form-control"
                                                    datepicker-popup="{{global.date.format}}"
                                                    max-date="usageStatisticsObj.endDate" name="fromDate"
                                                    data-ng-model="usageStatisticsObj.startDate"
                                                    is-open="usageStatisticsObj.startDateOpened"
                                                    datepicker-options="global.date.dateOptions"
                                                    close-text="Close" /> <span class="input-group-btn">
                                                    <button type="button" class="btn btn-default"
                                                        ng-click="open($event, 'startDateOpened')"
                                                        data-ng-class="{'error': !usageStatisticsObj.startDate && formSubmitted}">
                                                        <i class="glyphicon glyphicon-calendar"></i>
                                                    </button>
                                                </span>
                                            </div>
                                            <div class="error-area"
                                                data-ng-show="!usageStatisticsObj.startDate && formSubmitted">
                                                <i tooltip="From date is Required" class=""></i>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group m-l-md">
                                <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Group By:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <!-- <select class="form-control input-group col-xs-5" name="groupBy"
                                        data-ng-model="groupBy"
                                        data-ng-init="groupBy='project';">
                                        <option value="service">Service</option>
                                        <option value="project">Project</option>
                                        <option value="department">Department</option>
                                    </select> -->
                                    <select
                                    class="form-control input-group col-xs-5" name="UsageType"
                                    data-ng-model="usageStatisticsObj.usageType"
                                    data-ng-options="UsageType.name for UsageType in formElements.UsageTypeList">
                                    <option value="">Select</option>
                                </select>
                                </div>
                                </div>
                                </div>
                            </div>
                            <div class="col-md-6  col-sm-6" >


                                <div class="form-group m-l-md"
                                    ng-class="{
                                            'text-danger'
                                            : !usageStatisticsObj.endDate && formSubmitted}">
                                    <div class="row">
                                        <label class="col-md-3 col-sm-3 control-label">To
                                            Date: <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-md-7 col-sm-7 ">
                                            <div class="input-group">
                                                <input type="text"
                                                    data-ng-class="{'error': !usageStatisticsObj.endDate && formSubmitted}"
                                                    readonly
                                                    class="form-control"
                                                    datepicker-popup="{{global.date.format}}"
                                                    min-date="usageStatisticsObj.startDate" name="endDate"
                                                    data-ng-model="usageStatisticsObj.endDate"
                                                    is-open="usageStatisticsObj.endDateOpened"
                                                    datepicker-options="global.date.dateOptions"
                                                    close-text="Close" /> <span class="input-group-btn">
                                                    <button type="button"
                                                        data-ng-class="{'error': !usageStatisticsObj.endDate && formSubmitted}"
                                                        class="btn btn-default"
                                                        ng-click="open($event, 'endDateOpened')">
                                                        <i class="glyphicon glyphicon-calendar"></i>
                                                    </button>
                                                </span>
                                            </div>
                                            <div class="error-area"
                                                data-ng-show="!usageStatisticsObj.endDate && formSubmitted">
                                                <i tooltip="To date is Required" class=""></i>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group m-l-md" data-ng-show="global.sessionValues.type == 'ROOT_ADMIN'">
                                <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Domain:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select
                                    class="form-control input-group col-xs-5" name="domain"
                                    data-ng-model="usageStatisticsObj.domain"
                                    data-ng-options="domainObj.name for domainObj in domainList">
                                    <option value="">Select</option>
                                </select>
                                </div>
                                </div>
                                </div>

                            </div>
                        </div>
                        <div class="row ">
                            <span class="col-md-4 col-sm-4"></span> <span
                                class="col-md-7 col-sm-7 p-md">
                                <button type="submit" data-ng-click="getUsageReport()" class="btn btn-info">Generate</button>
                                <!-- <a class="btn btn-default" data-ng-click="reset()"> Cancel </a> -->
                            </span>

                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <div class="">
            <div class="col-md-10 col-sm-12 col-xs-10 col-md-offset-1">
                <div class="white-content">

                    <div data-ng-hide="showLoader" style="margin: 1%">
                        <get-loader-image data-ng-show="showLoader"></get-loader-image>
                    </div>
                    <div data-ng-show="showLoader"
                        class="table-responsive">
                        <table cellspacing="1" cellpadding="1"
                            class="table table-bordered white-content">
                            <thead>
                                <tr class="bg-primary">
                                    <th width="5%">S.no.</th>
                                    <th width="45%">Name</th>
                                    <th width="20%" class="text-center">Usage (Hours)</th>
                                    <th width="15%" class="text-center">Department</th>
                                </tr>
                            </thead>
                            <tbody>
                             <tr  data-ng-repeat="usage in usageStatistics">
                             <td>{{ $index + 1 }}</td>
                              					 <td data-ng-if = "usage.name">

                                                    {{ usage.name}}
                                                </td>
                                                <td data-ng-if = "usage.usagename">
                                                    {{ usage.usage.usageType}}
                                                </td>
                                                 <td data-ng-if = "usage.usageType == '6'">
                                                    {{ usage.usageid}}
                                                </td>
                                                <td >
                                                    {{ usage.usage}}
                                                </td>
                                                <td>
                                                    {{ usage.account}}
                                                </td>
                                                      </tbody>
                                                       <tbody data-ng-show="usageStatistics.length == '0'">
                                						<tr><td colspan="4"> No records found!! </td></tr>
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
