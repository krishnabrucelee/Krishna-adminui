<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="TemplateForm" data-ng-submit="save(TemplateForm)" method="post" novalidate="" data-ng-controller="templateListCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="col-md-6 col-sm-6 border-right">
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.name.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="name" data-ng-model="template.name" class="form-control" data-ng-class="{'error': TemplateForm.name.$invalid && formSubmitted}">
                                    <i  tooltip="<fmt:message key="iso.name.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.name.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.name.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.description.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <div class="error-area" data-ng-show="TemplateForm.description.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.description.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                    <input required="true" type="text" name="description" data-ng-model="template.description" class="form-control" data-ng-class="{'error': TemplateForm.description.$invalid && formSubmitted}" >
                                    <i  tooltip="<fmt:message key="iso.description.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.url.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="common.url" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="url" data-ng-model="template.url" class="form-control" data-ng-class="{'error': TemplateForm.url.$invalid && formSubmitted}" >
                                    <i  tooltip="<fmt:message key="iso.url.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.url.$invalid && formSubmitted" >
                                        <i  tooltip="<fmt:message key="iso.url.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="iso.refurl" bundle="${msg}" /></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input  type="text" name="refurl" data-ng-model="template.referenceUrl" class="form-control" >
                                    <i  tooltip="<fmt:message key="iso.refurl.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"ng-class="{'text-danger': TemplateForm.zone.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label "><fmt:message key="iso.zone" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select required="true"  class="form-control " name="zone" data-ng-model="template.zone" ng-options="zone.name for zone in formElements.zoneList" data-ng-class="{'error': TemplateForm.zone.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i  tooltip="<fmt:message key="iso.zone.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.zone.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.zone.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.cost.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="template.cost" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" valid-price name="cost" data-ng-model="template.templateCost[0].cost" class="form-control" data-ng-class="{'error': TemplateForm.cost.$invalid && formSubmitted}" >
                                    <i  tooltip="<fmt:message key="iso.cost.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.cost.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.cost.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.mincore.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="iso.minimumcore" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="mincore" data-ng-model="template.minimumCore" class="form-control" data-ng-class="{'error': TemplateForm.mincore.$invalid && formSubmitted}" >
                                    <i  tooltip="<fmt:message key="iso.minimumcore.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.mincore.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.minimumcore.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.minmemory.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="iso.minimummemory" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="minmemory" data-ng-model="template.minimumMemory" class="form-control" data-ng-class="{'error': TemplateForm.minmemory.$invalid && formSubmitted}" >
                                    <i  tooltip="<fmt:message key="iso.minimummemory.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.minmemory.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.minimummemory.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
						<div class="form-group">
                        	<div class="row">
                                 <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input type="hidden" class="form-control input-group" name="hypervisor" data-ng-model="template.hypervisor" ng-init="template.hypervisor.id = '8'" >
 								</div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="row" >
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input type="hidden" class="form-control input-group" name="format" data-ng-model="template.format" ng-init="template.format = '8'" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.osCategory.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" ><fmt:message key="iso.oscategory" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select required="true" class="form-control input-group" name="osCategory" data-ng-change="categoryChange()" data-ng-model="template.osCategory" ng-options="osCategory.name for osCategory in formElements.osCategoryList" data-ng-class="{'error': TemplateForm.osCategory.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i tooltip="<fmt:message key="iso.oscategory.tooltip" bundle="${msg}" />"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.osCategory.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.oscategory.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.osType.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" ><fmt:message key="iso.ostype" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select required="true" class="form-control input-group" name="osType" data-ng-model="template.osType" ng-options="osType.description for osType in formElements.osTypeList" data-ng-class="{'error': TemplateForm.osType.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i tooltip="<fmt:message key="iso.ostype.tooltip" bundle="${msg}" />"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.osType.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.ostype.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.osVersion.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label"><fmt:message key="iso.osversion" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <div class="error-area" data-ng-show="TemplateForm.osVersion.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="iso.osversion.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                    <input required="true" type="text" name="osVersion" data-ng-model="template.osVersion" class="form-control" data-ng-class="{'error': TemplateForm.osVersion.$invalid && formSubmitted}" >
                                    <i  tooltip="<fmt:message key="iso.osversion.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.architecture.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" ><fmt:message key="iso.architecture" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input required="true" icheck type="radio" name= "architecture" value="64" ng-model="template.architecture"> 64 <fmt:message key="common.bit" bundle="${msg}" /></label>
                                    <label class="m-l-sm"> <input required="true" icheck type="radio" name= "architecture" value="32" ng-model="template.architecture"> 32 <fmt:message key="common.bit" bundle="${msg}" /></label>
                                    <div class="error-area" data-ng-show="TemplateForm.architecture.$invalid && formSubmitted" >
                                    	<i  ng-attr-tooltip="<fmt:message key="iso.architecture.error" bundle="${msg}" />" class="fa error-icon"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.extractable"> <span class="m-l-sm"><fmt:message key="iso.extractable" bundle="${msg}" /></span> </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-checked="true" ng-model="template.bootable"> <span class="m-l-sm"><fmt:message key="iso.bootable" bundle="${msg}" /></span> </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.featured"> <span class="m-l-sm"><fmt:message key="iso.featured" bundle="${msg}" /></span> </label>
                                </div>
								<div class="col-md-6 col-sm-6">
                                    <label> <input icheck type="checkbox" ng-model="template.oneTimeChargeable">  <span class="m-l-sm"><fmt:message key="iso.onetimechargeable" bundle="${msg}" /></span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
								 <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.share"> <span class="m-l-sm"><fmt:message key="iso.share" bundle="${msg}" /></span> </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-class="{'text-danger': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 control-label "> <fmt:message key="iso.detaileddescription" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" >
                                    <summernote class=""  name="summernoteTextTwo" required="true" height="200"  data-ng-model="template.detailedDescription"  config="summernoteOpt" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" ></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="iso.detaileddescription.tooltip" bundle="${msg}" />" ></i>
                                </div>
                                <div class="error-area" data-ng-show="TemplateForm.summernoteTextTwo.$invalid && formSubmitted" ></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                      	 <get-loader-image data-ng-show="showLoader"></get-loader-image>
                                <span  data-ng-hide="showLoader" class="pull-right">
                                    <a class="btn btn-default btn-outline"  data-ng-hide="showLoader" ui-sref="servicecatalog.list-apptemplate"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                                    <button class="btn btn-info" type="submit"  data-ng-hide="showLoader" ng-disabled="form.TemplateForm.$invalid" ><fmt:message key="common.add" bundle="${msg}" /></button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
