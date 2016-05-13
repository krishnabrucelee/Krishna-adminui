<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form name="TemplateForm" data-ng-submit="update(TemplateForm)" method="post" novalidate="" data-ng-controller="templateEditCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="col-md-6 col-sm-6 border-right">
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.name.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="name" data-ng-model="template.name" class="form-control" data-ng-class="{'error': TemplateForm.name.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.name.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.name.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.description.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6 col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="description" data-ng-model="template.description" class="form-control" data-ng-class="{'error': TemplateForm.description.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.description.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.description.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="common.url" bundle="${msg}" /></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input type="text" name="url" data-ng-model="template.url" class="form-control" readonly >
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="template.refurl" bundle="${msg}" /></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input type="text" name="url" data-ng-model="template.url" class="form-control" readonly >
                                </div>
                            </div>
                        </div>
                        <div class="form-group"ng-class="{'text-danger': TemplateForm.zone.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label control-normal"><fmt:message key="template.zone" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="zone" data-ng-model="template.zone.name" class="form-control" readonly data-ng-class="{'error': TemplateForm.zone.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.zone.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.zone.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.hypervisor.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label" ><fmt:message key="template.hypervisor" bundle="${msg}" /><span class="text-danger">*</span>
                                </label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="hypervisor" data-ng-model="template.hypervisor.name" class="form-control" readonly data-ng-class="{'error': TemplateForm.hypervisor.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.hypervisor.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.hypervisor.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 4">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" DISABLED ng-model="template.xsVersion"> <fmt:message key="template.originalxsversion" bundle="${msg}" /> </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 2">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.rootdiskcontroller" bundle="${msg}" /></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <select class="form-control input-group" name="rootDiskController" data-ng-model="template.rootDiskController" ng-options="rootDiskController for (id, rootDiskController) in formElements.rootDiskControllerList" >
                                        <option value="">No Thanks</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 2">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.nicadapter" bundle="${msg}" /></label>
                                <div class="col-md-6 col-sm-7 col-xs-7">
                                    <select  class="form-control input-group" name="nicType" data-ng-model="template.nicAdapter" ng-options="nicType for (id, nicType) in formElements.nicTypeList" >
                                        <option value="">No Thanks</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 2">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.keyboard" bundle="${msg}" /></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <select  class="form-control input-group" name="keyboardType" data-ng-model="template.keyboardType" ng-options="keyboardType for (id, keyboardType) in formElements.keyboardTypeList" >
                                        <option value="">No Thanks</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"  ng-class="{'text-danger': TemplateForm.format.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.format" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6 col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="format" data-ng-model="template.format" class="form-control" readonly data-ng-class="{'error': TemplateForm.format.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.format.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.format.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-if="!template.templateCreationType" ng-class="{'text-danger': TemplateForm.cost.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="template.cost" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="cost" valid-price data-ng-model="template.templateCost[0].cost" class="form-control"  data-ng-class="{'error': TemplateForm.cost.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.cost.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.cost.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.mincore.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="template.minimumcore" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="mincore" data-ng-model="template.minimumCore" class="form-control" data-ng-class="{'error': TemplateForm.mincore.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.mincore.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.minimumcore.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.minmemory.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-3 control-label"><fmt:message key="template.minimummemory" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="minmemory" data-ng-model="template.minimumMemory" class="form-control" data-ng-class="{'error': TemplateForm.minmemory.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.minmemory.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.minimummemory.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.osCategory.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.oscategory" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <select required="true" class="form-control input-group" name="osCategory" data-ng-model="template.osCategory"  value="{{template.osCategory.name}}" ng-options="osCategory.name for osCategory in formElements.osCategoryList" data-ng-class="{'error': TemplateForm.osCategory.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <div class="error-area" data-ng-show="TemplateForm.osCategory.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.oscategory.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.osType.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.ostype" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="osType" data-ng-model="template.osType.description" class="form-control" readonly data-ng-class="{'error': TemplateForm.osType.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.osType.$invalid && formSubmitted" ><i  ng-attr-tooltip="<fmt:message key="template.ostype.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.osVersion.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-4 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.osversion" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="osVersion" data-ng-model="template.osVersion" class="form-control" data-ng-class="{'error': TemplateForm.osVersion.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.osVersion.$invalid && formSubmitted" >
                                    	<i  ng-attr-tooltip="<fmt:message key="template.osversion.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.architecture.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" ><fmt:message key="template.architecture" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input required="true" icheck type="radio" name= "architecture" ng-checked="template.architecture=='64'" value="64" ng-model="template.architecture"> 64 <fmt:message key="common.bit" bundle="${msg}" /></label>
                                    <label  class="m-l-sm"> <input required="true" icheck type="radio" name= "architecture" ng-checked="template.architecture=='32'" value="32" ng-model="template.architecture"> 32 <fmt:message key="common.bit" bundle="${msg}" /></label>
                                    <div class="error-area" data-ng-show="TemplateForm.architecture.$invalid && formSubmitted" >
                                    	<i  ng-attr-tooltip="<fmt:message key="template.architecture.error" bundle="${msg}" />" class="fa error-icon"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.extractable"> <fmt:message key="template.extractable" bundle="${msg}" /> </label>
                                </div>
                                <%-- <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label data-ng-if ="template.passwordEnabled"> <input  icheck type="checkbox" ng-model="template.passwordEnabled"> <fmt:message key="template.password.enabled" bundle="${msg}" /></label>
                                </div> --%>
                                 <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.featured"> <fmt:message key="template.featured" bundle="${msg}" /> </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" data-ng-show="!template.templateCreationType">

                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.routing"> <fmt:message key="template.routing" bundle="${msg}" /> </label>
                                </div>
                                <div class="col-md-6 col-sm-6" data-ng-show="!template.templateCreationType">
                                    <label> <input icheck type="checkbox" ng-model="template.oneTimeChargeable"> <fmt:message key="template.onetimechargeable" bundle="${msg}" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" >

                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.share"> <fmt:message key="template.share" bundle="${msg}" /> </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"  data-ng-class="{'text-danger': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 control-label "> <fmt:message key="template.detaileddescription" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" >
                                    <summernote class="" name="summernoteTextTwo" required="true" height="200"  data-ng-model="template.detailedDescription"  config="summernoteOpt" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" ></summernote>
                                    <div class="error-area" data-ng-show="TemplateForm.summernoteTextTwo.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <span class="pull-right">
                                    <get-loader-image data-ng-show="showLoader"></get-loader-image>
                                    <a data-ng-hide="showLoader" class="btn btn-default"  ui-sref="servicecatalog.list-templatestore"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                                    <button data-ng-hide="showLoader" class="btn btn-info" type="submit" ng-disabled="form.computeForm.$invalid" ><fmt:message key="common.apply" bundle="${msg}" /></button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
