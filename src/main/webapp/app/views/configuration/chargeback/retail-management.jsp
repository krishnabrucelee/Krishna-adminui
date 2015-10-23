<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="hpanel" data-ng-controller="retailManagementCtrl">
    <div class="panel-body">
        <form name="retailManagementForm" method="POST" data-ng-submit="validateRetailManagementLimit(retailManagementForm)" novalidate >
            <div class="row">
                <div class="form-group" data-ng-class="{ 'text-danger' : retailManagementForm.creditLimit.$invalid && formSubmitted}">

                    <label class="col-md-2 col-sm-2 control-label p-xs">Credit Limit:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-3 col-sm-3">
                        <input type="text" required data-ng-class="{'error': retailManagementForm.creditLimit.$invalid && formSubmitted}" name="creditLimit" valid-number data-ng-model="retailManagement.creditLimit" data-ng-init="retailManagement.creditLimit = '2000'" class="form-control" >
                        <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Credit limit amount for retail account." ></i>
                         <div class="error-area" data-ng-show="retailManagementForm.creditLimit.$invalid && formSubmitted" ><i  tooltip="Credit Limit is required." class="fa fa-warning error-icon"></i></div>

                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                    <label class="col-md-2 col-sm-2 control-label ">Enable Threshold Limit:
                    </label>
                    <div class="col-md-3 col-sm-3">
                        <input type="checkbox" icheck name="enableThreshold" data-ng-model="retailManagement.enableThreshold" class="form-control" >
                        <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Tick this box to set resources limit for new signup user('-1' denotes no limit for all resource)." ></i>

                    </div>
                </div>
            </div>
            <div data-ng-show="retailManagement.enableThreshold">
                <div data-ng-include src="'views/configuration/chargeback/retail-management-limit.html'"></div>
            </div>


            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="pull-right">
                        <button type="submit" class="btn btn-info" > Update </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>


