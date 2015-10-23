<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="billableForm" data-ng-submit="validateBillableChart(billableForm)" method="post" novalidate="">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="panel-info panel ">

                <div class="row m-t-md">

                    <div class="col-md-6 col-sm-6">
                        <div class="form-group m-l-md" ng-class="{
                                            'text-danger'
                                            : billableForm.dateRange.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label"> Date Range:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-init="report.dateRange = reportElements.dateList[1]" name="dateRange" data-ng-model="report.dateRange" ng-options="dateRange.name for dateRange in reportElements.dateList" >

                                    </select>
                                    <span class="help-block m-b-none" data-ng-show="billableForm.dateRange.$invalid && formSubmitted" >Date range is required.</span>
                                </div>
                            </div>
                        </div>


                        <div class="form-group m-l-md" ng-class="{
                                            'text-danger'
                                            : billableForm.zone.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label"> Zone Based:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-init="report.zone = reportElements.zoneList[1]" name="zone" data-ng-model="report.zone" ng-options="zone.name for zone in reportElements.zoneList" >

                                    </select>
                                    <span class="help-block m-b-none" data-ng-show="billableForm.zone.$invalid && formSubmitted" >Zone is required.</span>
                                </div>
                            </div>
                        </div>


                        <div class="form-group m-l-md"  ng-class="{
                                            'text-danger'
                                            : billableForm.billable.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label"> For {{report.zone.name}} Based Billable item
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-init="report.billable = reportElements.billableList[1]" name="billable" data-ng-model="report.billable" ng-options="billable.name for billable in reportElements.billableList" >

                                    </select>
                                    <span class="help-block m-b-none" data-ng-show="billableForm.billable.$invalid && formSubmitted" >Billable Item is required.</span>
                                </div>
                            </div>
                        </div>


                        <div class="form-group m-l-md" ng-class="{
                                            'text-danger'
                                            : billableForm.project.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label"> For Project:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-init="report.project = reportElements.projectList[1]" name="project" data-ng-model="report.project" ng-options="project.name for project in reportElements.projectList" >

                                    </select>
                                    <span class="help-block m-b-none" data-ng-show="billableForm.project.$invalid && formSubmitted" >Project is required.</span>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-md-6  col-sm-6">
                        <div class="form-group m-l-md" data-ng-show="report.dateRange.value == 'period'" ng-class="{
                                            'text-danger'
                                           : !report.startDate && formSubmitted}">

                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">From Date:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7 ">
                                    <div class="input-group">
                                        <input type="text" readonly data-ng-show="report.dateRange.value == 'period'" class="form-control" datepicker-popup="{{global.date.format}}" name="fromDate" data-ng-class="{'error': !report.startDate && formSubmitted}" data-ng-model="report.startDate" max-date="report.endDate" is-open="report.startDateOpened" datepicker-options="global.date.dateOptions"  close-text="Close" />
                                        <span class="input-group-btn">
                                            <button type="button" data-ng-class="{'error': !report.startDate && formSubmitted}" data-ng-model="report.startDate" class="btn btn-default" ng-click="open($event, 'startDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>

                                        </span>
                                    </div>
                                    <div class="error-area" data-ng-show="!report.startDate && formSubmitted" ></i></div>

                                </div>


                            </div>

                        </div>

                        <div class="form-group m-l-md" data-ng-show="report.dateRange.value == 'period'" ng-class="{
                                            'text-danger'
                                            : !report.endDate && formSubmitted}">

                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">To Date:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7 ">
                                    <div class="input-group">
                                        <input type="text" data-ng-show="report.dateRange.value == 'period'" readonly class="form-control" datepicker-popup="{{global.date.format}}" name="endDate" data-ng-class="{'error': !report.endDate && formSubmitted}" data-ng-model="report.endDate" min-date="report.startDate"  is-open="report.endDateOpened" datepicker-options="global.date.dateOptions"  close-text="Close" />
                                        <span class="input-group-btn">
                                            <button type="button" data-ng-class="{'error': !report.endDate && formSubmitted}" data-ng-model="report.endDate" class="btn btn-default" ng-click="open($event, 'endDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>
                                        </span>
                                    </div>
                                    <div class="error-area" data-ng-show="!report.endDate && formSubmitted" ></i></div>

                                </div>
                            </div>
                        </div>


                        <div class="form-group m-l-md" data-ng-show="report.billable.value == 'selective'" ng-class="{
                                            'text-danger'
                                            :!report.selective && formSubmitted}">
                            <div class="row">
                                <div class="col-md-4 col-sm-4">

                                    <label class="col-md-12 col-sm-12 control-label no-padding">Billable Item
                                        <span class="text-danger">*</span>
                                    </label>
                                    <dfn>For Multi Select (CTRL+item)</dfn>
                                </div>

                                <div class="col-md-7 col-sm-7">
                                    <select multiple="true" class="form-control input-group"  name="selective" data-ng-class="{'error': !report.selective && formSubmitted}" data-ng-model="report.selective" ng-options="selective.name for selective in reportElements.selectiveList" >
                                    </select>
                                    <div class="error-area" data-ng-show="!report.selective && formSubmitted" ><i  tooltip="Billable Item  is Required" ></i></div>
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