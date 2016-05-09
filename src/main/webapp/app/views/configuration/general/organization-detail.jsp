<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form name="configForm" data-ng-submit="save(configForm,organization)" method="post" novalidate="" data-ng-controller="organizationCtrl">

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
                                    <input required="true" type="text" name="name" data-ng-model="organization.name" class="form-control" data-ng-class="{'error': configForm.name.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="company.name.system" bundle="${msg}" />"></i>
                                    <div class="error-area" data-ng-show="configForm.name.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.name" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <input required="true" type="text" name="email" data-ng-model="organization.email"  class="form-control" data-ng-class="{'error': configForm.email.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.email" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.email.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="error.organization.email" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <input required="true" type="text" name="address" data-ng-model="organization.address" class="form-control" data-ng-class="{'error': configForm.address.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.address" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.address.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="error.organization.address" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Address Extension:

                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input type="text" name="addressExtension" placeholder="Enter Address Extension" data-ng-model="organization.addressExtension"  class="form-control" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.extradetails" bundle="${msg}" />" ></i>
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
                                    <input required="true" type="text" name="city" data-ng-model="organization.city" class="form-control" data-ng-class="{'error': configForm.city.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.city" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.city.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="error.organization.city" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <input required="true" type="text" name="country" data-ng-model="organization.country"  class="form-control" data-ng-class="{'error': configForm.country.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.country.name" bundle="${msg}" />"></i>
                                    <div class="error-area" data-ng-show="configForm.country.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.country" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <input required="true" type="text" name="state" data-ng-model="organization.state"  class="form-control" data-ng-class="{'error': configForm.state.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.state.name" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.state.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.state" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <input required="true" type="text" name="zipCode" data-ng-model="organization.zipcode" class="form-control" data-ng-class="{'error': configForm.zipCode.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.zipcode.name" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.zipCode.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.zipcode" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>


                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.phoneNo.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Phone Number:<span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7">
                                    <input required="true" type="text" name="phoneNo" data-ng-model="organization.phone" class="form-control" data-ng-class="{'error': configForm.phoneNo.$invalid && formSubmitted}" >
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.phone.name" bundle="${msg}" />"></i>
                                    <div class="error-area" data-ng-show="configForm.phoneNo.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.phone" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <input required="true" type="text" name="faxNumber" data-ng-model="organization.fax" class="form-control" data-ng-class="{'error': configForm.faxNumber.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.fax.name" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.faxNumber.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.fax" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Logo URL:
                                </label>
                                <div class="col-md-7 col-sm-7">
									<input type="url" name="logo"
										class="form-control" data-ng-model="organization.logoURL"
										data-ng-class="{'error': configForm.logo.$invalid && formSubmitted}">

									<div class="error-area"
										data-ng-show="configForm.logo.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="organization.url.name" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
									</div>
								 <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.url" bundle="${msg}" />" ></i>

								</div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Background image URL:
                                </label>
                                 <div class="col-md-7 col-sm-7">
									<input type="url" name="backgroundImageURL"
										class="form-control" data-ng-model="organization.backGroundImageURL"
										data-ng-class="{'error': configForm.backgroundImageURL.$invalid && formSubmitted}">

									<div class="error-area"
										data-ng-show="configForm.backgroundImageURL.$invalid && formSubmitted">
										<i tooltip="not.valid.url" class="fa fa-warning error-icon"></i>
									</div>
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.background.url" bundle="${msg}" />" ></i>
								</div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : configForm.signaturName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Signature Name:<span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7 col-sm-7" >
                                    <input required="true" type="text" name="signaturName" data-ng-model="organization.signature"  class="form-control" data-ng-class="{'error': configForm.signaturName.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="organization.signature.name" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.signaturName.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="organization.signature" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
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
                                    <summernote name="summernoteTextTwo" required="true" height="100"  data-ng-model="organization.termsCondition" placeholder="Terms and conditions"  config="summernoteOpt" data-ng-class="{'error': configForm.summernoteTextTwo.$invalid && formSubmitted}"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="organization.terms" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="configForm.summernoteTextTwo.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <span class="pull-right">
                    <a class="btn btn-default btn-outline" id="cancel_button" data-ng-hide="showLoader" ui-sref="configuration.home({category:'general'})"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                    <button data-ng-if="organization.id == null" class="btn btn-info" data-ng-hide="showLoader" type="submit"><fmt:message key="common.add" bundle="${msg}" /></button>
                <button data-ng-if="organization.id != null" class="btn btn-info" data-ng-hide="showLoader" type="submit"><fmt:message key="common.update" bundle="${msg}" /></button>
				</span>

                </div>
            </div>
        </div>
    </div>
</form>

