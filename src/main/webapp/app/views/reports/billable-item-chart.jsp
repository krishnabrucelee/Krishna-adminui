<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view data-ng-controller="reportCtrl">
    <div data-ng-include src="'views/reports/billable-chart-generator.html'"></div>
    <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm"><a href="#" class="btn btn-info  pull-right m-l-xs"><span class="fa fa-file-pdf-o "></span> PDF</a><a href="#" class="btn btn-info pull-right m-r-xs"><span class=" fa fa-file-excel-o "></span> CSV</a></div>

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div data-ng-show="formSubmitted">
            <div class="label-primary row p-sm h6 text-white fa-bold">
                <span  data-ng-show="reports.dateRange">Date Range : {{reports.dateRange}}</span><span data-ng-show="reports.zone"> | Zone : {{reports.zone}} </span><span data-ng-show="reports.billable"> | Billable Item Report : {{reports.billable}} </span><span data-ng-show="reports.selective !='' && reports.billable == 'selective'"> | Selective Billable Item  : <span data-ng-repeat="selectives in reports.selective">{{selectives.name}}, </span> </span> <span data-ng-show="reports.projectType"> | Project: {{reports.projectType}} </span><span data-ng-show="reports.startDate && reports.dateRange=='period'"> | Start Date :<em>{{reports.startDate| date:'dd-MMM-yyyy' }}</em></span><span data-ng-show="reports.endDate && reports.dateRange=='period'"> | To Date :<em>{{reports.endDate| date:'dd-MMM-yyyy' }}</em> </span></div>
        </div>
        <div class="text-center m-t-xxxl" data-ng-show="showLoader">
            <img src="images/loading-bars.svg" />
        </div>

    </div>
    <div class="col-md-12 col-sm-12 col-xs-12">


        <div class="white-content">
            <div class="table-responsive">
                <div data-ng-hide="showLoader">
                    <div class="row" data-ng-show="chartEnable" >
                        <div class="col-md-6 chart-area">
                            <div class="hpanel">
                                <div class="panel-heading">
                                    Amount Summary
                                </div>
                                <div class="panel-body">
                                    <div>
                                        <canvas barchart options="singleBarChartOptions" data="amountSummaryData" height="160" width="400"  ></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 chart-area">
                            <div class="hpanel">
                                <div class="panel-heading">
                                    Count Summary
                                </div>
                                <div class="panel-body">
                                    <div>
                                        <canvas barchart options="singleBarChartOptions" data="countSummaryData" height="160" width="400"  ></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

