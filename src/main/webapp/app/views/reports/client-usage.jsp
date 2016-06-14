<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view data-ng-controller="reportCtrl">
    <div data-ng-include src="'app/views/reports/client-generator.jsp'"></div>
    <div class="report-wrapper">
    <div data-ng-show="formSubmitted">
            <div class="label-primary row p-sm h6 text-white fa-bold">
                <span  data-ng-show="reports.dateRange"><fmt:message key="date.range" bundle="${msg}" /> : {{reports.dateRange}}</span><span data-ng-show="reports.status"> | <fmt:message key="common.state" bundle="${msg}" /> : {{reports.status}} </span><span data-ng-show="reports.startDate && reports.dateRange=='period'"> | <fmt:message key="from.date" bundle="${msg}" /> :<em>{{reports.startDate| date:'dd-MMM-yyyy' }}</em></span><span data-ng-show="reports.endDate && reports.dateRange=='period'"> | <fmt:message key="to.date" bundle="${msg}" /> :<em>{{reports.endDate| date:'dd-MMM-yyyy' }}</em>
                	</span>
                	<a data-ng-if="defaultLanguage=='en'"
								href="{{ global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientStartDate}}&toDate={{clientEndDate}}&status={{reports.status}}&type=pdf&range={{reports.dateRange}}&lang=ENGLISH"
								class="btn btn-default  pull-right m-l-xs"><span
								class="fa fa-file-pdf-o text-danger"></span> PDF</a>

					<a data-ng-if="defaultLanguage=='en'"
								href="{{global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientStartDate}}&toDate={{clientEndDate}}&status={{reports.status}}&type=xlsx&range={{reports.dateRange}}&lang=ENGLISH"
								class="btn btn-default pull-right m-r-xs"><span
								class=" fa fa-file-excel-o text-success"></span> XLSX</a>
								
					<a data-ng-if="defaultLanguage=='zh'"
								href="{{ global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientStartDate}}&toDate={{clientEndDate}}&status={{reports.status}}&type=pdf&range={{reports.dateRange}}&lang=CHINESE"
								class="btn btn-default  pull-right m-l-xs"><span
								class="fa fa-file-pdf-o text-danger"></span> PDF</a>

					<a data-ng-if="defaultLanguage=='zh'"
								href="{{global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientStartDate}}&toDate={{clientEndDate}}&status={{reports.status}}&type=xlsx&range={{reports.dateRange}}&lang=CHINESE"
								class="btn btn-default pull-right m-r-xs"><span
								class=" fa fa-file-excel-o text-success"></span> XLSX</a>

                </div>
       	</div>
                            <get-login-loader-image data-ng-show="showLoader"></get-login-loader-image>

    </div>
	<div data-ng-hide="showLoader">
			<div class="report-wrapper">
					<div class="row white-content" data-ng-show="myframe">
						<iframe width="400" height="700" id="myframe" name="myframe" class="embed-responsive-item col-md-12 client-usage-report-iframe"></iframe>
					</div>
			</div>

	</div>
</div>