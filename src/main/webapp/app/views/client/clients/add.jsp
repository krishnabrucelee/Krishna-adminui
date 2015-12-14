<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form name="clientForm" data-ng-submit="save(clientForm)" method="post" novalidate="" data-ng-controller="clientListCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" ui-sref="client.client"  title="<fmt:message key="common.back" bundle="${msg}" />" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">

                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.companyName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="company.name" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-5">
                                    <input required="true" type="text" name="companyName" data-ng-model="client.companyName"  class="form-control" data-ng-class="{'error': clientForm.companyName.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="name.of.the.company" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="clientForm.companyName.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="company.name.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.companyNameAbbreviation.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="company.name.abbreviation" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-5 col-sm-5">
                                    <input required="true" type="text" name="companyNameAbbreviation" data-ng-model="client.companyNameAbbreviation"  class="form-control" data-ng-class="{'error': clientForm.companyNameAbbreviation.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="abbreviation.name.of.the.company" bundle="${msg}" />"></i>
                                    <div class="error-area" data-ng-show="clientForm.companyNameAbbreviation.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="company.name.abbreviation.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="portal.user.name" bundle="${msg}" />:
                                </label>
                                <div class="col-md-5 col-sm-5">
                                    <input type="text" name="portalUserName" data-ng-model="client.portalUserName"  class="form-control">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="portal.user.name" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="common.password" bundle="${msg}" />:
                                </label>
                                <div class="col-md-5 col-sm-5">
                                    <input type="password" name="password" data-ng-model="client.password"  class="form-control">
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="confirm.password" bundle="${msg}" />:
                                </label>
                                <div class="col-md-5 col-sm-5">
                                    <input type="password" name="confirmPassword" data-ng-model="client.confirmPassword"  class="form-control">
                                </div>
                            </div>
                        </div>
                          <div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.cityHeadquarter.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="city.headquarters" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-5 col-sm-5">
                                    <input required="true" type="text" name="cityHeadquarter" data-ng-model="client.cityHeadquarter"  class="form-control" data-ng-class="{'error': clientForm.cityHeadquarter.$invalid && formSubmitted}">
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="headquarters.of.the.company" bundle="${msg}" />" ></i>
                                    <div class="error-area" data-ng-show="clientForm.cityHeadquarter.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="city.headquarters.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                          <div class="form-group">
                            <div class="row">
                                <label class="col-md-5 col-sm-6 control-label"><fmt:message key="company.address" bundle="${msg}" />:
                                </label>
                                <div class="col-md-5 col-sm-5">
                                <textarea rows="4" type="text" name="companyAddress" data-ng-model="client.companyAddress" class="form-control"></textarea>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="address.of.the.company" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="col-md-3 col-sm-3">
					<label><fmt:message key="primary.contact" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                    </label>
						<fieldset class="scheduler-border">
	                  		<div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.firstName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label  m-t-sm"><fmt:message key="first.name" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-11 col-sm-11">
                                    <input required="true" type="text" name="firstName" data-ng-model="client.firstName"  class="form-control" data-ng-class="{'error': clientForm.firstName.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="clientForm.firstName.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="first.name.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                            </div>
                            <div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.lastName.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label  m-t-sm"><fmt:message key="last.name" bundle="${msg}" />:
                                <span class="text-danger">*</span>
                                </label>
                                <div class="col-md-11 col-sm-11">
                                    <input required="true" type="text" name="lastName" data-ng-model="client.lastName"  class="form-control" data-ng-class="{'error': clientForm.lastName.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="clientForm.lastName.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="last.name.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                            </div>
                            <div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.emailId.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label  m-t-sm"><fmt:message key="email.id" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-11 col-sm-11">
                                    <input required="true" type="text" name="emailId" data-ng-model="client.emailId"  class="form-control" data-ng-class="{'error': clientForm.emailId.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="clientForm.emailId.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="email.id.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                            </div>
                            <div class="form-group" ng-class="{
                                            'text-danger'
                                            : clientForm.phoneNumber.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label  m-t-sm"><fmt:message key="phone.number" bundle="${msg}" />:
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="col-md-11 col-sm-11">
                                    <input required="true" type="text" name="phoneNumber" data-ng-model="client.phoneNumber"  class="form-control" data-ng-class="{'error': clientForm.phoneNumber.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="clientForm.phoneNumber.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="phone.number.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                            </div>
                        </fieldset>
					</div>
					<div class="col-md-3 col-sm-3">
						<label><fmt:message key="secondary.contact" bundle="${msg}" />:
                        </label>
						<fieldset class="scheduler-border">
						<div class="form-group" >
                            <div class="row">
                                <label class="col-md-11 col-sm-11 m-t-sm control-label m-t-sm"><fmt:message key="first.name" bundle="${msg}" />:
                                </label>
                                <div class="col-md-11 col-sm-11">
                                    <input type="text" name="firstName1" data-ng-model="client.firstName1"  class="form-control">
                                </div>
                            </div>
                            </div>
                            <div class="form-group" >
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label m-t-sm"><fmt:message key="last.name" bundle="${msg}" />:
                                </label>
                                <div class="col-md-11 col-sm-11">
                                    <input type="text" name="lastName1" data-ng-model="client.lastName1"  class="form-control">
                                    </div>
                            </div>
                            </div>
                            <div class="form-group" >
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label m-t-sm"><fmt:message key="email.id" bundle="${msg}" />:
                                </label>
                                <div class="col-md-11 col-sm-11">
                                    <input type="text" name="emailId1" data-ng-model="client.emailId1"  class="form-control">
                                </div>
                            </div>
                            </div>
                            <div class="form-group" >
                            <div class="row">
                                <label class="col-md-11 col-sm-11 control-label m-t-sm"><fmt:message key="phone.number" bundle="${msg}" />:
                                </label>
                                <div class="col-md-11 col-sm-11">
                                    <input type="text" name="phoneNumber1" data-ng-model="client.phoneNumber1"  class="form-control">
                                </div>
                            </div>
                        </div>
                        </fieldset>
					</div>
					<div class="col-md-12">
						<div class="form-group pull-right">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <a class="btn btn-default btn-outline"  ui-sref="client.client"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                                    <button class="btn btn-info" type="submit"><fmt:message key="common.add" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
					</div>
                </div>
            </div>
        </div>
    </div>
    </form>