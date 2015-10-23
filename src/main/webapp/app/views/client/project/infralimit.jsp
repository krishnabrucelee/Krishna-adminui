<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="hpanel" data-ng-controller="projectInfraLimitCtrl">
    <div class="panel-body">
        <form name="infraLimitForm" method="POST" data-ng-submit="validateInfraLimit(infraLimitForm)" novalidate >
            <div class="row">
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.instance.$invalid && formSubmitted}">

                    <label class="col-md-5 col-sm-2 control-label">Instance Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="instance" valid-number data-ng-model="infraLimit.instance" class="form-control" data-ng-class="{'error': infraLimitForm.instance.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.instance.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.volume.$invalid && formSubmitted}">
                    <label class="col-md-5 col-sm-2 control-label">Volume Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="volume" valid-number data-ng-model="infraLimit.volume" class="form-control" data-ng-class="{'error': infraLimitForm.volume.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.volume.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.snapshot.$invalid && formSubmitted}">

                    <label class="col-md-5 col-sm-2 control-label">Snapshot Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="snapshot" valid-number data-ng-model="infraLimit.snapshot" class="form-control" data-ng-class="{'error': infraLimitForm.snapshot.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.snapshot.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.network.$invalid && formSubmitted}">
                    <label class="col-md-5 col-sm-2 control-label">Network Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="network" valid-number data-ng-model="infraLimit.network" class="form-control" data-ng-class="{'error': infraLimitForm.network.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.network.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.publicIp.$invalid && formSubmitted}">

                    <label class="col-md-5 col-sm-2 control-label">Public Ip Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="publicIp" valid-number data-ng-model="infraLimit.publicIp" class="form-control" data-ng-class="{'error': infraLimitForm.publicIp.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.publicIp.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.vpc.$invalid && formSubmitted}">
                    <label class="col-md-5 col-sm-2 control-label">VPC Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="vpc" valid-number data-ng-model="infraLimit.vpc" class="form-control" data-ng-class="{'error': infraLimitForm.vpc.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.vpc.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.cpu.$invalid && formSubmitted}">

                    <label class="col-md-5 col-sm-2 control-label">CPU Limits:
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="cpu" valid-number data-ng-model="infraLimit.cpu" class="form-control" data-ng-class="{'error': infraLimitForm.cpu.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.cpu.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.memory.$invalid && formSubmitted}">
                    <label class="col-md-5 col-sm-2 control-label">Memory Limits(MB):
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="memory" valid-number data-ng-model="infraLimit.memory" class="form-control" data-ng-class="{'error': infraLimitForm.memory.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.memory.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
            </div>


            <div class="row">
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.primaryStorage.$invalid && formSubmitted}">
                    <label class="col-md-5 col-sm-2 control-label">Primary Storage Limits(GB):
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="primaryStorage" valid-number data-ng-model="infraLimit.primaryStorage" class="form-control" data-ng-class="{'error': infraLimitForm.primaryStorage.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.primaryStorage.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
                <div class="form-group col-md-6" data-ng-class="{ 'text-danger' : infraLimitForm.secondaryStorage.$invalid && formSubmitted}">
                    <label class="col-md-5 col-sm-2 control-label">Secondary Storage Limits(GB):
                        <span class="text-danger">*</span>
                    </label>
                    <div class="col-md-7 col-sm-3">
                        <input type="text" required name="secondaryStorage" valid-number data-ng-model="infraLimit.secondaryStorage" class="form-control" data-ng-class="{'error': infraLimitForm.secondaryStorage.$invalid && formSubmitted}">
                        <div class="error-area" data-ng-show="infraLimitForm.secondaryStorage.$invalid && formSubmitted" ><i  tooltip="Required field" class="fa fa-warning error-icon"></i></div>

                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="pull-right">
                        <a class="btn btn-default" ui-sref="client.project"> Cancel </a>
                        <button type="submit" class="btn btn-info" > Update </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
