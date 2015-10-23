<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateAdd(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" ui-sref="configuration.home.tax" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="col-md-7 col-sm-7">


                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.taxName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Tax Name:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true"  type="text" name="taxName" data-ng-model="config.taxName"   class="form-control" ng-class="{
                                            'error'
                                            : configForm.taxName.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Name of the Tax" ></i>
                                    <div class="error-area" data-ng-show="configForm.taxName.$invalid && formSubmitted" ><i  tooltip="Tax Name is required" class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.description.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Description:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="text" name="description" data-ng-model="config.description" class="form-control" ng-class="{
                                            'error'
                                            :configForm.percentage.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="A detail description about the tax" ></i>
                                    <div class="error-area" data-ng-show="configForm.description.$invalid && formSubmitted" ><i  tooltip="Description is required" class="fa fa-warning error-icon"></i></div>



                                </div>

                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :configForm.percentage.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Percentage:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <input required="true" type="number" name="percentage" data-ng-model="config.percentage" class="form-control" ng-class="{
                                            'error'
                                            :configForm.percentage.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The allocated percentage(%) of the tax" ></i>
                                    <div class="error-area" data-ng-show="configForm.percentage.$invalid && formSubmitted" ><i  tooltip="Percentage is required" class="fa fa-warning error-icon"></i></div>


                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                 <div class="col-md-6 col-sm-7">
                                     <button class="btn btn-info" type="submit">Create</button></div></div></div>
                    </div>

                </div>
            </div>


        </div>
    </div></form>