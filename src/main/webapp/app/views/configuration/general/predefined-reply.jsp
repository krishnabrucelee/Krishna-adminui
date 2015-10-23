<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validatePredefined(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">

                <div class="panel-body"><div class="col-md-7 col-sm-7">

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.department.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Department:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="department" data-ng-class="{'error': configForm.department.$invalid && formSubmitted}" data-ng-model="config.department" ng-options="department.name for department in formElements.departmentList" >
                                        <option value="">Select</option>
                                    </select>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Select the department" ></i>
                                    <div class="error-area" data-ng-show="configForm.department.$invalid && formSubmitted" ><i  tooltip="Department is required." class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.subject.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Subject:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="subject" data-ng-model="config.subject"   class="form-control" data-ng-class="{'error': configForm.subject.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter subject" ></i>
                                    <div class="error-area" data-ng-show="configForm.subject.$invalid && formSubmitted" ><i  tooltip="Subject is required." class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group"  data-ng-class="{
                                            'text-danger'
                                            : configForm.summernoteTextTwo.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-4 col-sm-5 control-label ">Content:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7" data-ng-class="{'error': configForm.summernoteTextTwo.$invalid && formSubmitted}">
                                    <summernote name="summernoteTextTwo" required="true" height="100"  data-ng-model="config.summernoteTextTwo" config="summernoteOpt" data-ng-class="{'error': configForm.summernoteTextTwo.$invalid && formSubmitted}"></summernote>
                                    <div class="error-area" data-ng-show="configForm.summernoteTextTwo.$invalid && formSubmitted" ></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                                    <button class="btn btn-info" type="submit">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</form>
