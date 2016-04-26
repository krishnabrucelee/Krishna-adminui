<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view data-ng-controller="reportCtrl">
    <div data-ng-include src="'app/views/reports/client-generator.jsp'"></div>
    <div class="report-wrapper">
    <div data-ng-show="formSubmitted">
            <div class="label-primary row p-sm h6 text-white fa-bold">
                <span  data-ng-show="reports.dateRange">Date Range : {{reports.dateRange}}</span><span data-ng-show="reports.status"> | Status : {{reports.status}} </span><span data-ng-show="reports.startDate && reports.dateRange=='period'"> | Start Date :<em>{{reports.startDate| date:'dd-MMM-yyyy' }}</em></span><span data-ng-show="reports.endDate && reports.dateRange=='period'"> | To Date :<em>{{reports.endDate| date:'dd-MMM-yyyy' }}</em> 
                	</span><a
								href="{{ global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientStartDate}}&toDate={{clientEndDate}}&status={{reports.status}}&type=pdf&range={{reports.dateRange}}"
								class="btn btn-default  pull-right m-l-xs"><span
								class="fa fa-file-pdf-o text-danger"></span> PDF</a>
								
					<a
								href="{{global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientStartDate}}&toDate={{clientEndDate}}&status={{reports.status}}&type=xlsx&range={{reports.dateRange}}"
								class="btn btn-default pull-right m-r-xs"><span
								class=" fa fa-file-excel-o text-success"></span> XLSX</a>
                
                </div>
       	</div>
        <div class="text-center m-t-xxxl" data-ng-show="showLoader">
            <img src="images/loading-bars.svg" />
        </div>
    </div>
	<div data-ng-hide="showLoader">
			<div class="report-wrapper">
					<div class="row white-content" data-ng-show="myframe">
						<iframe width="400" height="700" id="myframe" name="myframe" class="embed-responsive-item col-md-12 client-usage-report-iframe"></iframe>
					</div>
			</div>

	</div>
</div>