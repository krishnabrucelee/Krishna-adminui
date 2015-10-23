<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="TemplateForm" data-ng-submit="save(TemplateForm)" method="post" novalidate="" data-ng-controller="templateListCtrl">

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="col-md-6 col-sm-6 border-right">
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.name.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Name<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="name" data-ng-model="template.name" class="form-control" data-ng-class="{'error': TemplateForm.name.$invalid && formSubmitted}">
                                    <i  tooltip="Name of the Template" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.name.$invalid && formSubmitted" ><i  tooltip="Template Name is Required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group" ng-class="{'text-danger': TemplateForm.description.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Description<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <div class="error-area" data-ng-show="TemplateForm.description.$invalid && formSubmitted" ><i  tooltip="Description is Required" class="fa fa-warning error-icon"></i></div>
                                    <input required="true" type="text" name="description" data-ng-model="template.description" class="form-control" data-ng-class="{'error': TemplateForm.description.$invalid && formSubmitted}" >
                                    <i  tooltip="Description of the Template" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{'text-danger': TemplateForm.url.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">URL<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" name="url" data-ng-model="template.url" class="form-control" data-ng-class="{'error': TemplateForm.url.$invalid && formSubmitted}" >
                                    <i  tooltip="Management Server will download from the specified URL" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.url.$invalid && formSubmitted" ><i  tooltip="URL is Required" class="fa fa-warning error-icon"></i></div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Reference URL</label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input  type="text" name="refurl" data-ng-model="template.refurl" class="form-control" >
                                    <i  tooltip="Reference URL" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                </div>

                            </div>
                        </div>

                        <div class="form-group"ng-class="{'text-danger': TemplateForm.zone.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label ">Zone<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select required="true"  class="form-control " name="zone" data-ng-model="compute.zone.name" ng-options="zone.name for zone in formElements.zoneList" data-ng-class="{'error': TemplateForm.zone.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i  tooltip="Choose the Zone " class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.zone.$invalid && formSubmitted" ><i  tooltip="Zone is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{'text-danger': TemplateForm.hypervisor.$invalid && formSubmitted}">                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label" >Hypervisor<span class="text-danger">*</span>
                                </label>

                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select required="true" class="form-control input-group" name="hypervisor" data-ng-model="template.hypervisor" ng-options="hypervisor.name for hypervisor in formElements.hypervisorList" data-ng-class="{'error': TemplateForm.hypervisor.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i tooltip="Choose the hypervisor"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
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

                                    <i tooltip="Choose the Root disk controller"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
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

                                    <i tooltip="Choose the Nic adapter type list"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
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

                                    <i tooltip="Choose the Keyboard type"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"  ng-class="{'text-danger':TemplateForm.format.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Format<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <select required="true" class="form-control input-group" name="format" data-ng-model="template.format" ng-options="format.name for format in template.hypervisor.formatList" data-ng-class="{'error': TemplateForm.format.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i tooltip="Choose the Format"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.format.$invalid && formSubmitted" ><i  tooltip="Format is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.cost.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Cost(0 - for Free)<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" type="text" valid-decimal name="cost" data-ng-model="template.cost" class="form-control" data-ng-class="{'error': TemplateForm.format.$invalid && formSubmitted}" >
                                    <i  tooltip="Cost" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.cost.$invalid && formSubmitted" ><i  tooltip="Cost is Required" class="fa fa-warning error-icon"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.mincore.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Minimum Core<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="mincore" data-ng-model="template.mincore" class="form-control" data-ng-class="{'error': TemplateForm.mincore.$invalid && formSubmitted}" >
                                    <i  tooltip="Minimum Core for the Template" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.mincore.$invalid && formSubmitted" ><i  tooltip="Minimum Core  is Required" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" ng-class="{'text-danger': TemplateForm.minmemory.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-3 col-sm-3 control-label">Minimum Memory(MB)<span class="text-danger">*</span></label>
                                <div class="col-md-7  col-sm-7 col-xs-7">
                                    <input required="true" valid-number type="text" name="minmemory" data-ng-model="template.minmemory" class="form-control" data-ng-class="{'error': TemplateForm.minmemory.$invalid && formSubmitted}" >
                                    <i  tooltip="Minimum Memory for the Template" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.minmemory.$invalid && formSubmitted" ><i  tooltip="Minimum Memory  is Required" class="fa fa-warning error-icon"></i></div>
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
                                    <select required="true" class="form-control input-group" name="osCategory" data-ng-model="template.osCategory" ng-options="osCategory.name for osCategory in formElements.osCategoryList" data-ng-class="{'error': TemplateForm.osCategory.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i tooltip="Choose the OS Category"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
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
                                    <select required="true" class="form-control input-group" name="osType" data-ng-model="template.osType" ng-options="osType.name for osType in template.osCategory.osTypeList" data-ng-class="{'error': TemplateForm.osType.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i tooltip="Choose the type"  class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="TemplateForm.osType.$invalid && formSubmitted" ><i  tooltip="OS Type is Required" class="fa fa-warning error-icon"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">

                                <label class="col-md-3 col-sm-3 col-xs-3 control-label" >Architecture<span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="radio" name= "architecture" ng-model="template.sixfour"> 64 Bit </label>
                                    <label class="m-l-sm"> <input icheck type="radio" name= "architecture" ng-model="template.threetwo"> 32 Bit</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.extractable"> <span class="m-l-sm">Extractable</span> </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.passwordEnabled"> <span class="m-l-sm">Password Enabled</span> </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.featured"> <span class="m-l-sm">Featured</span> </label>
                                </div>
                                <div class="col-md-6  col-sm-6 col-lg-6">
                                    <label> <input icheck type="checkbox" ng-model="template.routing"> <span class="m-l-sm">Routing </span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <label class="control-normal"> <input  icheck type="checkbox"  ng-model="storage.onetimecharge">  <span class="m-l-sm">One time Chargeable</span></label>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" data-ng-class="{'text-danger': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}">
                            <div class="row" >
                                <label class="col-md-3 col-sm-3 control-label "> Detailed Description<span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" >
                                    <summernote class=""  name="summernoteTextTwo" required="true" height="200"  data-ng-model="template.summernoteTextTwo"  config="summernoteOpt" data-ng-class="{'error': TemplateForm.summernoteTextTwo.$invalid && formSubmitted}" ></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="Description Required" ></i>
                                </div>
                                <div class="error-area" data-ng-show="TemplateForm.summernoteTextTwo.$invalid && formSubmitted" ></div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <span class="pull-right">
                                    <a class="btn btn-default btn-outline"  ui-sref="servicecatalog.list-templatestore">Cancel</a>
                                    <button class="btn btn-info" type="submit" ng-disabled="form.TemplateForm.$invalid" >Add</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

