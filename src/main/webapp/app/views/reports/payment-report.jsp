<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view data-ng-controller="paymentListReport">
    <!-- <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm"><a href="#" class="btn btn-info  pull-right m-l-xs"><span class="fa fa-file-pdf-o "></span> PDF</a><a href="#" class="btn btn-info pull-right m-r-xs"><span class=" fa fa-file-excel-o "></span> CSV</a></div> -->
	<div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-right">
					        <panda-quick-search></panda-quick-search>
							<span class="pull-right m-r-sm">
								<select class="form-control input-group col-xs-5" name="statusView"
									data-ng-model="statusView"
									data-ng-change="selectDomainView(1, domainView.name, statusView)"
									data-ng-options="statusView for (id, statusView) in formElements.invoiceStatusList">
									<option value="">All Status</option>
								</select>
							</span>
							<span class="pull-right m-r-sm">
								<select
									class="form-control input-group col-xs-5" name="domainView"
									data-ng-model="domainView"
									data-ng-change="selectDomainView(1, domainView.name, statusView)"
									data-ng-options="domainView.name for domainView in domainList">
									<option value=""> <fmt:message key="common.domain.filter" bundle="${msg}" /></option>
								</select>
							</span>
							<div class="clearfix"></div>
							<span class="pull-right m-l-sm m-t-sm"></span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">
                    <div class="white-content">
                    <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
                        <div data-ng-hide="showLoader" class="table-responsive">
                            <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                                <thead>
                                    <tr>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('invoiceNumber',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='invoiceNumber'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.invoice.no" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('domain.name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='domain.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="domain.name" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('billPeriod',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='billPeriod'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.billing.period" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('totalCost',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='totalCost'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.payable" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('dueDate',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='dueDate'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.due.date" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('paidOn',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='paidOn'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.paid.on" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('transactionReference',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='transactionReference'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.transaction.reference" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('paymentMethod',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='paymentMethod'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.payment.method" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1" data-ng-click="changeSort('status',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-1"><fmt:message key="common.action" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody data-ng-hide="invoiceList.length > 0">
                                    <tr>
                                        <td class="col-md-10 col-sm-10" colspan="10"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-show="invoiceList.length > 0">
                                    <tr data-ng-repeat=" invoice in filteredCount = (invoiceList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                        <td>{{ invoice.invoiceNumber}}</td>
                                        <td>{{ invoice.domain.name}}</td>
                                        <td>{{ invoice.billPeriod}}</td>
                                        <td>{{ invoice.totalCost}}</td>
                                        <td>{{ invoice.dueDate | date:'yyyy-MM-dd HH:mm:ss'}}</td>
                                        <td>{{ invoice.paidOn | date:'yyyy-MM-dd HH:mm:ss'}}</td>
                                        <td>-</td>
                                        <td>{{ invoice.paymentMethod}}</td>
                                        <td>{{ invoice.status}}</td>
                                        <td>
                                            <a data-ng-show="invoice.status != 'PAID'" class="btn btn-info btn-sm m-l-sm m-t-xs" title="Mark as Paid" data-ng-click="PayNow('sm', invoice)">Mark as Paid</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <pagination-content></pagination-content>
                </div>
            </div>
        </div>
</div>
