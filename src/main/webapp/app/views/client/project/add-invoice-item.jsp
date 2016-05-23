<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div >
    <form name="invoiceItemForm" method="POST" data-ng-submit="addPayment(invoiceItemForm)" novalidate >
        <div class="inmodal" >
            <div class="modal-header">
                <panda-modal-header page-icon="fa fa-plus-circle" page-title="Add Item" hide-zone="true"></panda-modal-header>

            </div>
            <div class="modal-body">
                <div class="form-group" data-ng-class="{ 'text-danger' : invoiceItemForm.name.$invalid && formSubmitted}">
                    <div class="row">
                        <label class="col-md-3 col-sm-3 control-label">Name:<span class="text-danger">*</span></label>
                        <div class="col-md-7 col-sm-7">
                            <input type="text" required name="name" data-ng-model="payment.name" class="form-control" data-ng-class="{'error': invoiceItemForm.name.$invalid && formSubmitted}">
                            <div class="error-area" data-ng-show="invoiceItemForm.name.$invalid && formSubmitted" ><i  tooltip="Required field." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>
                <div class="form-group" data-ng-class="{ 'text-danger' : invoiceItemForm.paymentAmount.$invalid && formSubmitted}">
                    <div class="row">
                        <label class="col-md-3 col-sm-3 control-label">Amount:
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-7 col-sm-7" >
                            <input type="text" required name="paymentAmount" valid-number data-ng-model="payment.paymentAmount" class="form-control" data-ng-class="{'error': invoiceItemForm.paymentAmount.$invalid && formSubmitted}">
                            <div class="error-area" data-ng-show="invoiceItemForm.paymentAmount.$invalid && formSubmitted" ><i  tooltip="Required field." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3 col-sm-3 control-label">
                            <label ><span class="m-r-sm">Tax Enabled </span><input type="checkbox" ng-model="payment.taxEnabled" icheck="" > </label>
                        </div>
                        <div class="col-md-2 col-sm-2 control-label" data-ng-show="payment.taxEnabled">
                            <label ><span class="m-r-sm">Tax Precentage </label>
                        </div>
                        <div class="col-md-5 col-sm-5" data-ng-show="payment.taxEnabled">
                            <input type="text" name="taxPercentage" valid-number data-ng-model="payment.taxPercentage" class="form-control" >
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3 col-sm-3 control-label">
                            <label><span class="m-r-sm">Is Recurring</span> <input type="checkbox" ng-model="payment.isRecurring" icheck="" > </label>
                        </div>
                        <div class="col-md-2 col-sm-2 control-label" data-ng-show="payment.isRecurring">
                            <label ><span class="m-r-sm">Billing Cycles(0-for unlimited) </label>
                        </div>
                        <div class="col-md-5 col-sm-5" data-ng-show="payment.isRecurring">
                            <input type="text" name="billingCycles" valid-number data-ng-model="payment.billingCycles" class="form-control" >
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">

                <a class="btn btn-default" ng-click="cancel()"> Cancel </a>
                <button type="submit" class="btn btn-info" > Add </button>


            </div>
        </div>
    </form>
</div>