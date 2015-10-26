<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-controller="cloudStackCtrl" method="post" novalidate="" data-ng-submit="save(configForm)">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/cloudstack" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="back" bundle="${msg}" /></a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="panel-body">
                    <div class="col-md-7 col-sm-7 ">
                        <div class="form-group" data-ng-class="{'text-danger': configForm.URL.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="url" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required= "true" type="text" name="URL"  class="form-control" data-ng-model="config.apiURL" data-ng-class="{'error': configForm.URL.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="configForm.URL.$invalid && formSubmitted" ><i  tooltip="URL  is Required" class="fa fa-warning error-icon"></i></div>

                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The URL of the cloudStack server you wish to integrate with" ></i>



                                </div>

                            </div>
                        </div>



                        <div class="form-group" data-ng-class="{'text-danger': configForm.rootAPI.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="rootapikey" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <input  required="true" type="text" name="rootAPI" class="form-control" data-ng-model="config.apiKey" data-ng-class="{'error': configForm.rootAPI.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The api key of the admin user from cloud stack " ></i>
                                    <div class="error-area" data-ng-show="configForm.rootAPI.$invalid && formSubmitted" ><i  tooltip="rootAPI  is Required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" data-ng-class="{'text-danger': configForm.secretKey.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="secretkey" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="secretKey" class="form-control" data-ng-model="config.secretKey" data-ng-class="{'error': configForm.secretKey.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The secret key of the admin user from cloud stack " ></i>
                                    <div class="error-area" data-ng-show="configForm.secretKey.$invalid && formSubmitted" ><i  tooltip="secretKey  is Required" class="fa fa-warning error-icon"></i></div>

                                </div>

                            </div>
                        </div>

                        <div class="form-group" >
                            <div class="row">
                                <span class="pull-right">
                                    <button class="btn btn-info" type="submit" ng-disabled="form.configForm.$invalid" ><fmt:message key="save" bundle="${msg}" /></button>
                                </span>
                            </div>
                        </div>

                    </div>

                </div>
            </div>


        </div>
    </div>
</form>