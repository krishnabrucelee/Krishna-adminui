<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view  data-ng-controller="reportCtrl" >
    <div data-ng-include src="'views/reports/common-generator.html'"></div>
    <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm"><a href="#" class="btn btn-info  pull-right m-l-xs"><span class="fa fa-file-pdf-o "></span> PDF</a><a href="#" class="btn btn-info pull-right m-r-xs"><span class=" fa fa-file-excel-o "></span> CSV</a></div>

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div data-ng-show="formSubmitted">
            <div class="label-primary row p-sm h6 text-white fa-bold">

                <span data-ng-show="reports.dateRange">Date Range : {{reports.dateRange}}</span><span data-ng-show="reports.projectType"> | Project Type : {{reports.projectType}} </span><span data-ng-show="reports.startDate && reports.dateRange=='period'"> | Start Date :<em>{{reports.startDate| date:'dd-MMM-yyyy' }}</em></span><span data-ng-show="reports.endDate && reports.dateRange=='period'"> | To Date :<em>{{reports.endDate| date:'dd-MMM-yyyy' }}</em> </span>

            </div>
        </div>
                           <get-login-loader-image data-ng-show="showLoader"></get-login-loader-image>


    </div>
    <div class="col-md-12 col-sm-12 col-xs-12">


        <div class="white-content">
            <div class="table-responsive">
                <div data-ng-hide="showLoader">
                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Project Number</th>
                            <th>Sign Up date</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Card Verified</th>
                            <th>Project Type</th>
                            <th>Total Amount (<app-currency>$</app-currency>)</th>
                    <th>Total Payable (<app-currency>$</app-currency>)</th>
                    <th>Credit Limit (<app-currency>$</app-currency>)</th>
                    </tr>
                    </thead>

                    <tbody>
                        <tr data-ng-repeat="signUp in generatedList">
                            <td>{{signUp.projects.no}}</td>
                            <td>{{signUp.date}}</td>
                            <td>{{signUp.email}}</td>
                            <td>{{signUp.status}}</td>
                            <td>{{signUp.cardVerified}}</td>
                            <td>{{signUp.projects.type}}</td>
                            <td>{{signUp.amount}}</td>
                            <td>{{signUp.payable}}</td>
                            <td>{{signUp.credit}}</td>
                        </tr>
                    </tbody>

                </table>
            </div>
                 </div>
        </div>
    </div>

</div>

