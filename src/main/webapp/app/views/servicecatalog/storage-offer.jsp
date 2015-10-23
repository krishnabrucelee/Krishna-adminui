<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="storageForm" data-ng-submit="save(storageForm)" data-ng-controller="storageListCtrl" method="post" novalidate="" >
    <div class="hpanel">
        <div class="panel-body">
            <div class="row  ">
                <div class="col-md-12"><h4><label>Create Disk Offer</label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group" ng-class="{'text-danger': storageForm.name.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Name<span class="text-danger">*</span></label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <input required="true" type="text" name="name" data-ng-model="storage.name" class="form-control" data-ng-class="{'error': storageForm.name.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="storageForm.name.$invalid && formSubmitted" ><i  tooltip="Disk Name is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group" ng-class="{'text-danger': storageForm.description.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Description<span class="text-danger">*</span></label>
                            <div class="col-md-6 col-sm-6">
                                <input required="true" type="text" name="description" data-ng-model="storage.description" class="form-control" data-ng-class="{'error': storageForm.description.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="storageForm.description.$invalid && formSubmitted" ><i  tooltip="Description is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Storage Tag</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="storagetag" data-ng-model="storage.storageTags" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >Storage Type</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <select data-ng-init="storage.storagetype = storagetype.storagetypeList[0]"  class="form-control input-group" name="storagetype" data-ng-model="storage.storagetype" ng-options="storagetype.name for storagetype in storagetype.storagetypeList" >
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <label class="font-normal"> <input icheck type="checkbox"  ng-model="storage.isPublic"  ng-init="storage.isPublic = true"> Public</label>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <label class="font-normal"> <input icheck type="checkbox" ng-model="storage.isCustomDisk"> Custom Disk </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >QOS Type</label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <select class="form-control input-group" name="qostype" data-ng-model="storage.qostype" ng-options="hypervisor.name for hypervisor in formElements.qosList"  >
                                    <option value="">Select</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"  data-ng-if="!storage.isCustomDisk "  data-ng-class="{'text-danger': storageForm.size.$invalid && formSubmitted}">
                    <div class="form-group" >
                        <div class="row" data-ng-required="false">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Size (GB)<span class="text-danger">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input   valid-number type="text " ng-required="!storage.isCustomDisk" name="size" data-ng-model="storage.diskSize" class="form-control" data-ng-class="{'error': storageForm.size.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="storageForm.size.$invalid && formSubmitted" ><i  tooltip="Disk Size is Required" class="fa fa-warning error-icon"></i></div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-if="storage.isCustomDisk">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Min Size(GB)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input valid-number type="text" name="minsize" data-ng-model="storage.minDiskSize" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-if="storage.isCustomDisk">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Max Size(GB)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input valid-number type="text" name="maxsize" data-ng-model="storage.maxDiskSize" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-if="!storage.isPublic">
                    <div class="form-group"  >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >Domain</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <select  class="form-control input-group" name="domain" data-ng-model="storage.domain" ng-options="domain.name for domain in domain.domaintypeList" >
                                    <option value="">Select</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-show="storage.qostype.id == 1">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >Disk Read Rate(BPS)
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input type="text" name="diskreadrate" valid-number data-ng-model="storage.diskBytesReadRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-show="storage.qostype.id == 1">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >Disk Write Rate(BPS)
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input type="text" name="diskwriterate" valid-number data-ng-model="storage.diskBytesWriteRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-show="storage.qostype.id == 1">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Disk Read Rate(IOPS)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="diskreadrateiops" valid-number  data-ng-model="storage.diskIopsReadRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-show="storage.qostype.id == 1" >
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Disk Write Rate(IOPS)</label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <input  type="text" name="diskwriterateiops" valid-number  data-ng-model="storage.diskIopsWriteRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-show="storage.qostype.id == 2" >
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Min IOPS</label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <input  type="text" name="diskreadrateiops" valid-number  data-ng-model="storage.diskMinIops" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-ng-show="storage.qostype.id == 2">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Max IOPS</label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <input  type="text" name="diskwriterateiops" valid-number  data-ng-model="storage.diskMaxIops" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row  ">
                <div class="col-md-12"> <h4><label>Pricing Info</label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Zone Name</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <select data-ng-init="storage.zone.name = zone.zoneList[0]" class="form-control input-group" name="zone" data-ng-model="storage.zone.name" ng-options="zone.name for zone in zone.zoneList" >
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="!storage.isCustomDisk">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Cost per month(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" valid-decimal name="costmonth" data-ng-model="storage.costPerMonth" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="storage.isCustomDisk">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Cost GB per month(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input type="text" name="costMonth" data-ng-model="storage.costMonth" class="form-control" >                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
                    <div class="form-group">
                        <div class="row" >
                            <label class="col-md-6 col-sm-6 control-label font-normal">Cost per hour(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <b> <p class="text-danger"> 0.00000</p></b>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12  col-sm-12">
                        <span class="pull-right">
                            <a class="btn btn-default btn-outline"  ui-sref="servicecatalog.list-storage">Cancel</a>
                            <button class="btn btn-info" type="submit" ng-disabled="form.storageForm.$invalid" >Create</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


