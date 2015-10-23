<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form name="configForm" data-ng-submit="validateLogin(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/general"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="panel-body">
                    <div class="col-md-6 col-sm-6 border-right">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.name.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Name:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="name" data-ng-model="config.name" data-ng-init="config.name = 'panda'" class="form-control" data-ng-class="{'error': configForm.name.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Your Company Name as you want it to appear throughout the system" ></i>
                                    <div class="error-area" data-ng-show="configForm.name.$invalid && formSubmitted" ><i  tooltip="Name is Required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group"  ng-class="{
                                            'text-danger'
                                            : configForm.email.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Email:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="email" data-ng-model="config.email"  data-ng-init="config.email = 'assistanz.test@gmail.com'" class="form-control" data-ng-class="{'error': configForm.email.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Your Company email address" ></i>
                                    <div class="error-area" data-ng-show="configForm.email.$invalid && formSubmitted" ><i  tooltip="Email is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.address.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Address:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="address" data-ng-model="config.address" data-ng-init="config.address = 'Address1'" class="form-control" data-ng-class="{'error': configForm.address.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="This text is displayed on the invoice as the pay to details" ></i>
                                    <div class="error-area" data-ng-show="configForm.address.$invalid && formSubmitted" ><i  tooltip="Address is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Address Extension:

                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input type="text" name="addressExtension" placeholder="Enter Address Extension" data-ng-model="config.addressExtension" data-ng-init=" "  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the extra information about the company location like landmark,new by area,etc.." ></i>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.city.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">City:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="city" data-ng-model="config.city" data-ng-init="config.city = 'CBE'" class="form-control" data-ng-class="{'error': configForm.city.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter a city where your company is located" ></i>
                                    <div class="error-area" data-ng-show="configForm.city.$invalid && formSubmitted" ><i  tooltip="City is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.country.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Country:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7 col-sm-7">
                                    <select required="true" class="form-control input-group" data-ng-class="{'error': configForm.country.$invalid && formSubmitted}" name="country" data-ng-model="config.country" data-ng-init="config.country = formElements.countryList[1]"  ng-options="country.name for country in formElements.countryList" >
                                    </select>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter a country where your company is located" ></i>
                                    <div class="error-area" data-ng-show="configForm.country.$invalid && formSubmitted" ><i  tooltip="Country is Required" class="fa fa-warning error-icon"></i></div>

                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.state.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">State:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="state" data-ng-model="config.state" data-ng-init="config.state = 'TN'" class="form-control" data-ng-class="{'error': configForm.state.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter a state where your company is located" ></i>
                                    <div class="error-area" data-ng-show="configForm.state.$invalid && formSubmitted" ><i  tooltip="State is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.zipCode.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Zip Code:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="zipCode" data-ng-model="config.zipCode" data-ng-init="config.zipCode = '642008'" class="form-control" data-ng-class="{'error': configForm.zipCode.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter your company area extension code" ></i>
                                    <div class="error-area" data-ng-show="configForm.zipCode.$invalid && formSubmitted" ><i  tooltip="Zip Code is Required" class="fa fa-warning error-icon"></i></div>


                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.phoneNo.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Phone Number:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="phoneNo" data-ng-model="config.phoneNo" data-ng-init="config.phoneNo = '9236549870'" class="form-control" data-ng-class="{'error': configForm.phoneNo.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the phone number of your company( minimum 1 number is required)" ></i>
                                    <div class="error-area" data-ng-show="configForm.phoneNo.$invalid && formSubmitted" ><i  tooltip="Phone number is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.faxNumber.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Fax:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="faxNumber" data-ng-model="config.faxNumber" data-ng-init="config.faxNumber = '99870'" class="form-control" data-ng-class="{'error': configForm.faxNumber.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter the fax number of your company( minimum 1 number is required)" ></i>
                                    <div class="error-area" data-ng-show="configForm.faxNumber.$invalid && formSubmitted" ><i  tooltip="Fax number is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Logo URL:
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input type="text" name="logo" placeholder="Enter Logo URL"  class="form-control" data-ng-class="{'error': configForm.logo.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="give an url of your company logo for this panel(width should be 200px, and height should be 50px" ></i>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Background image URL:
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input type="text" name="backgroundImageURL" placeholder="Enter Background URL"  class="form-control" data-ng-class="{'error': configForm.backgroundImageURL.$invalid && formSubmitted}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.signaturName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Signature Name:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7" >
                                    <input required="true" type="text" name="signaturName" data-ng-model="config.signature" data-ng-init="config.signature = 'panda'" class="form-control" data-ng-class="{'error': configForm.signaturName.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter your company signature for declaration,terms and conditions in mail templates" ></i>
                                    <div class="error-area" data-ng-show="configForm.signaturName.$invalid && formSubmitted" ><i  tooltip="Signature is Required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>

                        </div>

                        <div class="form-group" data-ng-class="{
                                            'text-danger'
                                            : configForm.summernoteTextTwo.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 control-label ">Terms and Conditions:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7" data-ng-class="{'error': configForm.summernoteTextTwo.$invalid && formSubmitted}" >
                                    <summernote name="summernoteTextTwo" required="true" height="100"  data-ng-model="config.summernoteTextTwo" placeholder="Terms and conditions"  config="summernoteOpt" data-ng-class="{'error': configForm.summernoteTextTwo.$invalid && formSubmitted}"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="Enter your company rules and regulations here(These conditions will appears user signup terms and conditions page)" ></i>
                                    <div class="error-area" data-ng-show="configForm.summernoteTextTwo.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <button class="btn btn-info pull-right" type="submit">Update</button>
                </div>
            </div>
        </div>
    </div>
</form>

