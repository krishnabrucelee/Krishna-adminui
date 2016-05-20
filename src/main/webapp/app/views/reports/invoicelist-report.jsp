<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<style type="text/css">
body
{
    counter-reset: Serial;           /* Set the Serial counter to 0 */
}

table tbody.auto-serial
{
    border-collapse: separate;
}

table tbody.auto-serial tr td:first-child:before
{
  counter-increment: Serial;      /* Increment the Serial counter */
  content: counter(Serial); /* Display the counter */
}
</style>
</head>
<div ui-view data-ng-controller="invoiceListReport">
    <!-- <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm"><a href="#" class="btn btn-info  pull-right m-l-xs"><span class="fa fa-file-pdf-o "></span> PDF</a><a href="#" class="btn btn-info pull-right m-r-xs"><span class=" fa fa-file-excel-o "></span> CSV</a></div> -->
    <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-right dashboard-btn-area">
                            <div class="pull-right" data-ng-if="!defaultView">
										<a	href="{{viewpdf}}" class="btn btn-default  pull-right m-l-xs" data-ng-click="pdf()"><span
										class="fa fa-file-pdf-o text-danger"></span> PDF</a>

										<a	href="{{viewexcel}}" class="btn btn-default  pull-right m-l-xs" data-ng-click="excel()"><span
										class=" fa fa-file-excel-o text-success"></span> XLSX</a>
										<div class="clearfix"></div>
									<!-- <iframe width="400" height="700" id="myframe" name="myframe"
										class="embed-responsive-item col-md-12 client-usage-report-iframe"></iframe> -->
							</div>
							<div class="pull-right" data-ng-if="defaultView">
				           <a
										href="{{ global.PING_APP_URL }}invoice/report?type=pdf"
										class="btn btn-default  pull-right m-l-xs"><span
										class="fa fa-file-pdf-o text-danger"></span> PDF</a>
							<a			href="{{ global.PING_APP_URL }}invoice/report?type=xlsx"
										class="btn btn-default  pull-right m-l-xs"><span
										class=" fa fa-file-excel-o text-success"></span> XLSX</a>
												<div class="clearfix"></div>



								<!-- <iframe width="400" height="700" id="myReportframe" name="myReportframe"
									class="embed-responsive-item col-md-12 client-usage-report-iframe"></iframe> -->
							</div>

                            <span class="pull-right m-r-sm">
                                <select class="form-control input-group col-xs-5" name="statusView"
                                    data-ng-model="statusView"
                                    data-ng-change="selectDomainView(1, domainView.companyNameAbbreviation, statusView)"
                                    data-ng-options="statusView for (id, statusView) in formElements.invoiceStatusList">
                                    <option value="">All Status</option>
                                </select>
                            </span>
                            <span class="pull-right m-r-sm">
                                <select
                                    class="form-control input-group col-xs-5" name="domainView"
                                    data-ng-model="domainView"
                                    data-ng-change="selectDomainView(1, domainView.companyNameAbbreviation, statusView)"
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
                            <table cellspacing="1" cellpadding="1" class="table table-bordered">
                                <thead>
                                    <tr>
                                      	<th class="label-primary text-white">S.No</th>
                                        <th class="label-primary text-white"  data-ng-class="sort.descending && sort.column =='invoiceNumber'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.invoice.no" bundle="${msg}" />.</th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='domain.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.company" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='billPeriod'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.billing.period" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='totalCost'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.payable" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='dueDate'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.due.date" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right" ><fmt:message key="common.action" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody data-ng-hide="invoiceList.length > 0">
                                    <tr>
                                        <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-show="invoiceList.length > 0" class="auto-serial">
                                    <tr data-ng-repeat=" invoice in filteredCount = (invoiceList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                    	<td></td>
                                        <td>{{ invoice.invoiceNumber}}</td>
                                       	<td class="text-right">{{ invoice.domain.name}}</td>
                                        <td class="text-right">{{ invoice.billPeriod}}</td>
                                        <td class="text-right">{{ invoice.totalCost}}</td>
                                        <td class="text-right">{{ invoice.dueDate | date:'yyyy-MM-dd'}}</td>
                                        <td class="text-right">
                                            {{ invoice.status}}</td>
                                        <td class="text-right">
                                            <a data-ng-if="invoice.status == 'DUE'" class="m-l-sm btn btn-sm btn-default " data-ng-click="viewInvoice(invoice, 'Chinese')">Chinese </a>
                                            <a data-ng-if="invoice.status == 'DUE'" class="m-l-sm btn btn-sm btn-info" data-ng-click="viewInvoice(invoice, 'English')">English </a>
                                            <button data-ng-if="invoice.status == 'DRAFT'" class="m-l-sm btn btn-sm btn-info" data-ng-click="generateDueInvoice(invoice)">Generate Invoice</button>
                                        </td>
                                        <!-- <td></td> -->
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>