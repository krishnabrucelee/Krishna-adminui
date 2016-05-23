<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="hpanel">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="quick-search pull-right">
                        <div class="input-group">
                            <input data-ng-model="invoiceSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                            <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                        </div>
                    </div>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>

        <div class="white-content">
            <div class="table-responsive">
                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Invoice No</th>
                            <th>Current Usage (CNY)</th>
                            <th>Total Payable</th>
                            <th>Invoice Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="invoice in invoiceList| filter: invoiceSearch">
                            <td>
                                <a class="text-info" data-ng-click="toggleInvoiceDetails(invoice)"  title="Invoice Details" >0000{{ invoice.id}}</a>
                            </td>
                            <td>{{ invoice.currentDue}}</td>
                            <td>{{ invoice.totalAmount}} </td>
                            <td>{{ invoice.invoiceDate}} </td>
                            <td>{{ invoice.status}} </td>
                            <td>
                                <a class="icon-button" title="PDF"  ><span class="fa fa-file-pdf-o"></span></a>
                                <a class="icon-button" title="View" data-ng-click="toggleInvoiceDetails(invoice)"  ><span class="fa fa-eye"></span></a>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>