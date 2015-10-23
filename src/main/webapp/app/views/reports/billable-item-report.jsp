<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view data-ng-controller="reportCtrl">
    <div data-ng-include src="'views/reports/billable-generator.html'"></div>
    <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm"><a href="#" class="btn btn-info  pull-right m-l-xs"><span class="fa fa-file-pdf-o "></span> PDF</a><a href="#" class="btn btn-info pull-right m-r-xs"><span class=" fa fa-file-excel-o "></span> CSV</a></div>

    <div class="col-md-12 col-sm-12 col-xs-12">
         <div data-ng-show="formSubmitted">
              <div class="label-primary row p-sm h6 text-white fa-bold">
                  <span  data-ng-show="reports.dateRange">Date Range : {{reports.dateRange}}</span><span data-ng-show="reports.zone"> | Zone : {{reports.zone}} </span><span data-ng-show="reports.billable"> | Billable Item Report : {{reports.billable}} </span><span data-ng-show="reports.selective !='' && reports.billable == 'selective'"> | Selective Billable Item  : <span data-ng-repeat="selectives in reports.selective">{{selectives.name}}, </span> </span> <span data-ng-show="reports.projectType"> | Project: {{reports.projectType}} </span><span data-ng-show="reports.startDate && reports.dateRange=='period'"> | Start Date :<em>{{reports.startDate | date:'dd-MMM-yyyy' }}</em></span><span data-ng-show="reports.endDate && reports.dateRange=='period'"> | To Date :<em>{{reports.endDate | date:'dd-MMM-yyyy' }}</em> </span></div>
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
                            <th>Index No.</th>
                            <th>Project</th>
                            <th>Billable Item Report</th>
                            <th>Item Name</th>
                            <th>Item Reference ID</th>
                            <th>Date</th>
                            <th>Total Amount (<app-currency>$</app-currency>)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="billable in generatedList">
                         <td>{{$index+1}}</td>
                         <td>{{billable.projects.name}}</td>
                         <td>{{billable.billable.report}}</td>
                         <td>{{billable.billable.item}}</td>
                         <td>{{billable.billable.reference}}</td>
                         <td>{{billable.date}}</td>
                         <td>{{billable.amount}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>

    </div>

