<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="clientForm" data-ng-submit="validateClientUsage(clientForm)" method="post" novalidate="">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="panel-info panel ">
                <div class="panel-heading">
                    <h3 class="panel-title">Generate {{ $state.current.data.pageTitle}}</h3>
                </div>

                <div class="row m-t-md">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group m-l-md" ng-class="{
                                            'text-danger'
                                            : clientForm.dateRange.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"> Date Range:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-init="report.dateRange = reportElements.dateList[1]" name="dateRange" data-ng-model="report.dateRange" ng-options="dateRange.name for dateRange in reportElements.dateList" >

                                    </select>
                                    <span class="help-block m-b-none" data-ng-show="clientForm.dateRange.$invalid && formSubmitted" >Date range is required.</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-l-md" ng-class="{
                                            'text-danger'
                                            : clientForm.status.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"> Status:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-init="report.status = reportElements.statusList[1]" name="status" data-ng-model="report.status" ng-options="status.name for status in reportElements.statusList" >

                                    </select>
                                    <span class="help-block m-b-none" data-ng-show="clientForm.status.$invalid && formSubmitted" >Status is required.</span>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-md-6  col-sm-6">

                        <div class="form-group m-l-md" data-ng-show="report.dateRange.value == 'period'" ng-class="{
                                            'text-danger'
                                           : !report.startDate && formSubmitted}">

                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"> From Date:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7 ">
                                    <div class="input-group">
                                        <input type="text" readonly data-ng-class="{'error': !report.startDate && formSubmitted}" data-ng-show="report.dateRange.value == 'period'" class="form-control" datepicker-popup="{{global.date.format}}" name="fromDate" max-date="report.endDate" data-ng-model="report.startDate" is-open="report.startDateOpened" datepicker-options="global.date.dateOptions"  close-text="Close" />
                                        <span class="input-group-btn">
                                            <button type="button" data-ng-class="{'error': !report.startDate && formSubmitted}" class="btn btn-default" ng-click="open($event, 'startDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>
                                        </span>
                                    </div>
                                    <div class="error-area" data-ng-show="!report.startDate && formSubmitted" ><i  tooltip="From date is Required" class=""></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-l-md" data-ng-show="report.dateRange.value == 'period'" ng-class="{
                                            'text-danger'
                                            : !report.endDate && formSubmitted}">

                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"> To Date:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7 ">
                                    <div class="input-group">
                                        <input type="text" data-ng-class="{'error': !report.endDate && formSubmitted}" data-ng-show="report.dateRange.value == 'period'" readonly class="form-control" datepicker-popup="{{global.date.format}}" name="endDate" min-date="report.startDate" data-ng-model="report.endDate"  is-open="report.endDateOpened" datepicker-options="global.date.dateOptions"  close-text="Close" />
                                        <span class="input-group-btn">
                                            <button type="button" data-ng-class="{'error': !report.endDate && formSubmitted}" class="btn btn-default" ng-click="open($event, 'endDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>
                                        </span>
                                    </div>
                                    <div class="error-area" data-ng-show="!report.endDate && formSubmitted" ><i  tooltip="To date is Required" class=""></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <span class="col-md-4 col-sm-4"></span>
                    <span class="col-md-7 col-sm-7 p-md">
                        <button type="submit" class="btn btn-info"> Generate </button>
                        <a class="btn btn-default" data-ng-click="reset()" > Cancel </a>
                    </span>

                </div>



            </div>
        </div>


    </div>

    <hr>
</form>