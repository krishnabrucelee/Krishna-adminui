<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view data-ng-controller="reportCtrl">
    <div data-ng-include src="'views/reports/client-generator.html'"></div>
    <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm"><a href="#" class="btn btn-info  pull-right m-l-xs"><span class="fa fa-file-pdf-o "></span> PDF</a><a href="#" class="btn btn-info pull-right m-r-xs"><span class=" fa fa-file-excel-o "></span> CSV</a></div>

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div data-ng-show="formSubmitted">
            <div class="label-primary row p-sm h6 text-white fa-bold">

                <span  data-ng-show="reports.dateRange">Date Range : {{reports.dateRange}}</span><span data-ng-show="reports.status"> | Status : {{reports.status}} </span><span data-ng-show="reports.startDate && reports.dateRange=='period'"> | Start Date :<em>{{reports.startDate| date:'dd-MMM-yyyy' }}</em></span><span data-ng-show="reports.endDate && reports.dateRange=='period'"> | To Date :<em>{{reports.endDate| date:'dd-MMM-yyyy' }}</em> </span></div>
        </div>
        <div class="text-center m-t-xxxl" data-ng-show="showLoader">
            <img src="images/loading-bars.svg" />
        </div>

    </div>

    <div class="col-md-12 col-sm-12 col-xs-12">


        <div class="white-content">
            <div class="table-responsive">
                <div data-ng-hide="showLoader">
                    <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Project ID</th>
                                <th>Project</th>
                                <th>Company Name</th>
                                <th>Status</th>
                                <th>Instance</th>
                                <th>VM Snapshot</th>
                                <th>Storage</th>
                                <th>Snapshot Memory</th>
                                <th>Public IPs</th>
                                <th>Port Forwarding</th>
                                <th>Load Balancer</th>
                                <th>Total Amount (<app-currency>$</app-currency>)</th>
                        <th>Total Payable (<app-currency>$</app-currency>)</th>
                        <th>Total Paid (<app-currency>$</app-currency>)</th>
                        <th>Avaliable Credit (<app-currency>$</app-currency>)</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="client in generatedList">
                                <td>{{client.projects.no}}</td>
                                <td>{{client.projects.name}}</td>
                                <td>{{client.companyName}}</td>
                                <td>{{client.status}}</td>
                                <td>{{client.resource.instance}}</td>
                                <td>{{client.resource.vmSnapshot}}</td>
                                <td>{{client.resource.storage}}</td>
                                <td>{{client.resource.memorySnapshot}}</td>
                                <td>{{client.resource.ip}}</td>
                                <td>{{client.resource.port}}</td>
                                <td>{{client.resource.lb}}</td>
                                <td>{{client.amount}}</td>
                                <td>{{client.payable}}</td>
                                <td>{{client.paid}}</td>
                                <td>{{client.credit}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

</div>