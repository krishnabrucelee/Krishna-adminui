<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div >
    <form name="paymentForm" method="POST" data-ng-submit="addPayment(paymentForm)" novalidate >
        <div class="inmodal" >
            <div class="modal-header">
                <panda-modal-header page-icon="fa fa-money" page-title="Add Payment" hide-zone="true"></panda-modal-header>

            </div>
            <div class="modal-body">
                <div class="form-group" >
                    <div class="row">
                        <label class="col-md-3 col-sm-3 control-label">Name:
                        </label>
                        <div class="col-md-7 col-sm-7">
                            {{ projectInfo.firstName}}
                        </div>
                    </div>
                </div>
                <div class="form-group" data-ng-class="{ 'text-danger' : paymentForm.paymentAmount.$invalid && formSubmitted}">
                    <div class="row">
                        <label class="col-md-3 col-sm-3 control-label">Payment Amount:
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-7 col-sm-7">
                            <input type="text" required name="paymentAmount" valid-number data-ng-model="payment.paymentAmount" class="form-control" data-ng-class="{'error': paymentForm.paymentAmount.$invalid && formSubmitted}">
                            <div class="error-area" data-ng-show="paymentForm.paymentAmount.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>

                <div class="form-group" data-ng-class="{ 'text-danger' : paymentForm.transactionDate.$invalid && formSubmitted}">
                    <div class="row">
                        <label class="col-md-3 col-sm-3 control-label">Transaction Date:
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-7 col-sm-7">
                            <div class="input-group">
                                <input type="text" readonly required name="transactionDate" data-ng-model="payment.transactionDate" class="form-control" data-ng-class="{'error': paymentForm.transactionDate.$invalid && formSubmitted}"
                                       datepicker-popup="{{global.date.format}}" data-ng-model="payment.transactionDate" is-open="payment.transactionDateOpened" datepicker-options="global.date.dateOptions" ng-required="true" close-text="Close">
                                <span class="input-group-btn">
                                    <button type="button" data-ng-class="{'error': paymentForm.transactionDate.$invalid && formSubmitted}" class="btn btn-default" ng-click="open($event, 'transactionDateOpened')"><i class="glyphicon glyphicon-calendar"></i></button>
                                </span>
                            </div>
                            <div class="error-area" data-ng-show="paymentForm.transactionDate.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>

                <div class="form-group" >
                    <div class="row">
                        <label class="col-md-3 col-sm-3 control-label">Description:
                        </label>
                        <div class="col-md-7 col-sm-7">
                            <textarea name="description"  data-ng-model="payment.description" class="form-control" ></textarea>
                        </div>
                    </div>
                </div>



            </div>

            <div class="modal-footer">

                <a class="btn btn-default" ng-click="cancel()"> Cancel </a>
                <button type="submit" class="btn btn-info" > Update </button>


            </div>
        </div>
    </form>
</div>