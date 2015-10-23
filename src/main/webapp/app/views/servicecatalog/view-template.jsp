<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="TemplateForm" data-ng-submit="update(TemplateForm)" method="post" novalidate="" data-ng-controller="templateListCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="col-md-6 col-sm-6 border-right">
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.name.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Name<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="name" data-ng-model="template.template.name" class="form-control" data-ng-class="{'error': TemplateForm.name.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.name.$invalid && formSubmitted" ><i  tooltip="Template Name is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.description.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Description<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="description" data-ng-model="template.desc" class="form-control" data-ng-class="{'error': TemplateForm.description.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.description.$invalid && formSubmitted" ><i  tooltip="Description is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.url.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">URL<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="url" data-ng-model="template.url" class="form-control" readonly data-ng-class="{'error': TemplateForm.url.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.url.$invalid && formSubmitted" ><i  tooltip="URL is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Refrence URL</label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="url" data-ng-model="template.url" class="form-control" >
                                </div>
                            </div>
                        </div>
                        <div class="form-group"ng-class="{'text-danger': TemplateForm.zone.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label control-normal">Zone<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="zone" data-ng-model="template.zone.name" class="form-control" readonly data-ng-class="{'error': TemplateForm.zone.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.zone.$invalid && formSubmitted" ><i  tooltip="Zone is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : TemplateForm.hypervisor.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label" >Hypervisor<span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="hypervisor" data-ng-model="template.hypervisor" class="form-control" readonly data-ng-class="{'error': TemplateForm.hypervisor.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.hypervisor.$invalid && formSubmitted" ><i  tooltip="Hypervisor is Required" class="fa fa-warning error-icon"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 3">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.originalXsVersion"> Original XS Version is 6.1+ </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 4">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Root disk controller</label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select class="form-control input-group" name="rootDiskController" data-ng-model="template.rootDiskController" ng-options="rootDiskController.name for rootDiskController in template.hypervisor.rootDiskControllerList" >
                                        <option value="">No Thanks</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 4">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >NIC adapter type</label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select  class="form-control input-group" name="nicType" data-ng-model="template.nicType" ng-options="nicType.name for nicType in template.hypervisor.nicTypeList" >
                                        <option value="">No Thanks</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" data-ng-show="template.hypervisor.id == 4">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Keyboard type</label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select  class="form-control input-group" name="format" data-ng-model="template.keyboardType" ng-options="keyboardType.name for keyboardType in template.hypervisor.keyboardTypeList" >
                                        <option value="">No Thanks</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            : TemplateForm.hypervisor.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label" >Hypervisor<span class="text-danger">*</span>
                                </label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="hypervisor" data-ng-model="template.hypervisor" class="form-control" readonly data-ng-class="{'error': TemplateForm.hypervisor.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.hypervisor.$invalid && formSubmitted" ><i  tooltip="Hypervisor is Required" class="fa fa-warning error-icon"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="form-group"  ng-class="{
                                            'text-danger'
                                            :TemplateForm.format.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Format<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="format" data-ng-model="template.format" class="form-control" readonly data-ng-class="{'error': TemplateForm.format.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.format.$invalid && formSubmitted" ><i  tooltip="Format is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.cost.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Cost(0 - for Free)<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="cost" valid-decimal data-ng-model="template.zerocost" class="form-control"  data-ng-class="{'error': TemplateForm.cost.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.cost.$invalid && formSubmitted" ><i  tooltip="Enter the Value" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.mincore.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Minimum Core<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="mincore" data-ng-model="template.mincore" class="form-control" data-ng-class="{'error': TemplateForm.mincore.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.mincore.$invalid && formSubmitted" ><i  tooltip="Minimum Core is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.minmemory.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Minimum Memory(MB)<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="minmemory" data-ng-model="template.minmemory" class="form-control" data-ng-class="{'error': TemplateForm.minmemory.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.minmemory.$invalid && formSubmitted" ><i  tooltip="Minimum Memory is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :TemplateForm.osCategory.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >OS Category<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="osCategory" data-ng-model="template.osCategory.name" class="form-control" readonly data-ng-class="{'error': TemplateForm.osCategory.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.osCategory.$invalid && formSubmitted" ><i  tooltip="OS Category is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{
                                            'text-danger'
                                            :TemplateForm.osType.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >OS Type<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="osType" data-ng-model="template.osCategory.osTypeList[1].name" class="form-control" readonly data-ng-class="{'error': TemplateForm.osType.$invalid && formSubmitted}">
                                    <div class="error-area" data-ng-show="TemplateForm.osType.$invalid && formSubmitted" ><i  tooltip="OS Type is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Architecture<span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="radio" name= "architecture" ng-model="template.sixfour"> 64 Bit </label>
                                    <label  class="m-l-sm"> <input icheck type="radio" name= "architecture" ng-model="template.threetwo"> 32 Bit</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Template Types<span class="text-danger">*</span></label>
                                <div class="col-md-9  col-sm-9 col-lg-9  ">
                                    <label > <input icheck type="radio" name= "templatetype" ng-model="template.sixfour"> OS Templates</label>
                                    <label class="m-l-sm"> <input icheck type="radio" name= "templatetype" ng-model="template.threetwo">App Templates</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.extractable"> Extractable </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.passwordEnabled"> Password Enabled </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.featured"> Featured </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.routing"> Routing </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <label class="control-normal"> <input  icheck type="checkbox"  ng-model="template.onetimecharge">  One time Chargeable</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"  data-ng-class="{'text-danger': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 control-label "> Detailed Description<span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" >
                                    <summernote class="" name="summernoteTextTwo" required="true" height="200"  data-ng-model="template.detaileddescription"  config="summernoteOpt" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" ></summernote>
                                    <div class="error-area" data-ng-show="TemplateForm.summernoteTextTwo.$invalid && formSubmitted" ></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <span class="pull-right">
                                    <a class="btn btn-default btn-outline"  ui-sref="servicecatalog.list-templatestore">Cancel</a>
                                    <button class="btn btn-info" type="submit" ng-disabled="form.computeForm.$invalid" >Apply</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

