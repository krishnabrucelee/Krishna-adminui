<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="storageForm" data-ng-submit="update(storageForm)" data-ng-controller="storageEditCtrl" method="post" novalidate="" >
    <div class="hpanel">
        <div class="panel-body">
            <div class="row  ">
                <div class="col-md-12"><h4><label>Edit Disk Offer</label><hr></h4></div>
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
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Public</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="public" data-ng-model="storage.isPublic" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >Storage Type</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="storagetype" data-ng-model="storage.storageType" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Storage Tag</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="storagetag" data-ng-model="storage.storageTags" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" >QOS Type</label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <input  type="text" name="qostype" data-ng-model="storage.qosType" class="form-control"readonly >

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4" data-ng-show="storage.customdisk">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Custom Disk</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="customdisk" data-ng-model="storage.isCustomDisk" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" >


                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal">Size (GB)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" valid-number name="size" data-ng-model="storage.diskSize" class="form-control" readonly >

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
                                <input  type="text" name="size" data-ng-model="storage.zone" class="form-control" readonly >

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Cost GB per hour (<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <b> <p class="text-danger">0.04896</p></b>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal">Cost GB per month (<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" valid-decimal name="costmonth" data-ng-model="storage.costmonth" class="form-control"  placeholder="0.01265">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12  col-sm-12">
                        <span class="pull-right">
                            <a class="btn btn-default btn-outline"   ui-sref="servicecatalog.list-storage">Cancel</a>
                            <button class="btn btn-info" type="submit" ng-disabled="form.storageForm.$invalid" >Apply</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


