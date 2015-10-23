<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
    <div class="form-group" data-ng-class="{ 'text-danger' : retailManagementForm.instance.$invalid && formSubmitted}">

        <label class="col-md-2 col-sm-2 control-label p-xs">Instance Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.instance.$invalid && formSubmitted}" name="instance" valid-number data-ng-model="retailManagement.instance" data-ng-init="retailManagement.instance = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total instance limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.instance.$invalid && formSubmitted" ><i  tooltip="Instance Limit is required." class="fa fa-warning error-icon"></i></div>
        </div>
        <div class="col-md-1 col-sm-1"></div>
        <label class="col-md-2 col-sm-2 control-label p-xs">Volume Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.volume.$invalid && formSubmitted}" name="volume" valid-number data-ng-model="retailManagement.volume" data-ng-init="retailManagement.volume = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total storage limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.volume.$invalid && formSubmitted" ><i  tooltip="Volume Limit is required." class="fa fa-warning error-icon"></i></div>
        </div>
    </div>
</div>

<div class="row">
    <div class="form-group" data-ng-class="{ 'text-danger' : retailManagementForm.snapshot.$invalid && formSubmitted}">

        <label class="col-md-2 col-sm-2 control-label p-xs">Snapshot Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.snapshot.$invalid && formSubmitted}" name="snapshot" valid-number data-ng-model="retailManagement.snapshot" data-ng-init="retailManagement.snapshot = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total snapshot limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.snapshot.$invalid && formSubmitted" ><i  tooltip="Snapshot Limit is required." class="fa fa-warning error-icon"></i></div>

        </div>
        <div class="col-md-1 col-sm-1"></div>
        <label class="col-md-2 col-sm-2 control-label p-xs">Network Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.network.$invalid && formSubmitted}" name="network" valid-number data-ng-model="retailManagement.network" data-ng-init="retailManagement.network = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total network limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.network.$invalid && formSubmitted" ><i  tooltip="Network Limit is required." class="fa fa-warning error-icon"></i></div>

        </div>
    </div>
</div>
<div class="row">
    <div class="form-group" data-ng-class="{ 'text-danger' : retailManagementForm.publicIp.$invalid && formSubmitted}">

        <label class="col-md-2 col-sm-2 control-label p-xs">Public Ip Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.publicIp.$invalid && formSubmitted}" name="publicIp" valid-number data-ng-model="retailManagement.publicIp" data-ng-init="retailManagement.publicIp = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total public Ip limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.publicIp.$invalid && formSubmitted" ><i  tooltip="Public Ip Limit is required." class="fa fa-warning error-icon"></i></div>

        </div>
        <div class="col-md-1 col-sm-1"></div>
        <label class="col-md-2 col-sm-2 control-label p-xs">VPC Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.vpc.$invalid && formSubmitted}" name="vpc" valid-number data-ng-model="retailManagement.vpc" data-ng-init="retailManagement.vpc = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total public Ip limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.vpc.$invalid && formSubmitted" ><i  tooltip="VPC Limit is required." class="fa fa-warning error-icon"></i></div>

        </div>
    </div>
</div>

<div class="row">
    <div class="form-group" data-ng-class="{ 'text-danger' : retailManagementForm.cpu.$invalid && formSubmitted}">

        <label class="col-md-2 col-sm-2 control-label p-xs">CPU Limits:
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.cpu.$invalid && formSubmitted}" name="cpu" valid-number data-ng-model="retailManagement.cpu" data-ng-init="retailManagement.cpu = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total CPU limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.cpu.$invalid && formSubmitted" ><i  tooltip="CPU Limit is required." class="fa fa-warning error-icon"></i></div>
        </div>
        <div class="col-md-1 col-sm-1"></div>
        <label class="col-md-2 col-sm-2 control-label p-xs">Memory Limits (MB):
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.memory.$invalid && formSubmitted}" name="memory" valid-number data-ng-model="retailManagement.memory" data-ng-init="retailManagement.memory = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total memory limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.memory.$invalid && formSubmitted" ><i  tooltip="Memory Limit is required." class="fa fa-warning error-icon"></i></div>
        </div>
    </div>
</div>


<div class="row">
    <div class="form-group" data-ng-class="{ 'text-danger' : retailManagementForm.primaryStorage.$invalid && formSubmitted}">
        <label class="col-md-2 col-sm-2 control-label p-xs">Primary Storage Limits (GB):
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.primaryStorage.$invalid && formSubmitted}" name="primaryStorage" valid-number data-ng-model="retailManagement.primaryStorage" data-ng-init="retailManagement.primaryStorage = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total primary storage limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.primaryStorage.$invalid && formSubmitted" ><i  tooltip="Primary storage Limit is required." class="fa fa-warning error-icon"></i></div>
        </div>
        <div class="col-md-1 col-sm-1"></div>
        <label class="col-md-2 col-sm-2 control-label p-xs">Secondary Storage Limits (GB):
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3 col-sm-3">
            <input type="text" required data-ng-class="{'error': retailManagementForm.secondaryStorage.$invalid && formSubmitted}" name="secondaryStorage" valid-number data-ng-model="retailManagement.secondaryStorage" data-ng-init="retailManagement.secondaryStorage = '-1'" class="form-control" >
            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Total secondary storage limit for retail project." ></i>
            <div class="error-area" data-ng-show="retailManagementForm.secondaryStorage.$invalid && formSubmitted" ><i  tooltip="Secondary storage Limit is required." class="fa fa-warning error-icon"></i></div>

        </div>
    </div>
</div>
