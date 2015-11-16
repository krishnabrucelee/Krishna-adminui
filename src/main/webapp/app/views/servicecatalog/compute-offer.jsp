<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form name="computeForm" data-ng-submit="save(computeForm)" data-ng-controller="computeListCtrl" method="post" novalidate="" >
    <div class="hpanel">
        <div class="panel-body">
            <div class="row  ">
                <div class="col-md-12"><h4><label><fmt:message key="create.compute.offering" bundle="${msg}" /></label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-6  col-sm-12 col-xs-4 col-lg-6 border-right" >
                    <div class="row">
                        <div class="col-md-6  col-sm-12 col-xs-4">
                            <div class="form-group" ng-class="{'text-danger': computeForm.name.$invalid && formSubmitted}">
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <input required="true" type="text" name="name" data-ng-model="compute.name" class="form-control" data-ng-class="{'error': computeForm.name.$invalid && formSubmitted}">
                                        <div class="error-area" data-ng-show="computeForm.name.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="compute.offer.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group" >
                                <div class="row" >
                                    <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.storagetype" bundle="${msg}" /></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <select data-ng-init="compute.storageType = formElements.storageTypeList[0]"  class="form-control input-group" name="storagetype" data-ng-model="compute.storageType" ng-options="storageType for (id, storageType) in formElements.storageTypeList" >
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" >
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.storagetag" bundle="${msg}" /></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <input type="text" name="storagetag" data-ng-model="compute.storageTags" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.networkrate" bundle="${msg}" /></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <input  type="text" valid-number name="network" data-ng-model="compute.networkRate" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-group"  >
                                <div class="row" >
                                    <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.diskio" bundle="${msg}" /></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <select data-ng-init="compute.diskIo = formElements.diskioList[0]" class="form-control input-group" name="diskio" data-ng-model="compute.diskIo" ng-options=" diskio for (id, diskio) in formElements.diskioList" >
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-t-md "data-ng-show="!compute.isPublic">
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.domain" bundle="${msg}" /></label>
                                    <div class="col-md-7 col-sm-7 col-xs-7">
                                        <select  class="form-control input-group" name="domain" data-ng-model="compute.domain" ng-options="domain.name for domain in domain.domaintypeList" >
                                            <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6  col-sm-12 col-xs-4">
                            <div class="form-group" ng-class="{'text-danger': computeForm.displayText.$invalid && formSubmitted}">
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <input required="true" type="text" name="displayText" data-ng-model="compute.displayText" class="form-control" data-ng-class="{'error': computeForm.displayText.$invalid && formSubmitted}">
                                        <div class="error-area" data-ng-show="computeForm.displayText.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="compute.description.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" >
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.hosttag" bundle="${msg}" /></label>
                                    <div class="col-md-7  col-sm-7 col-xs-7">
                                        <input type="text" name="hosttag" data-ng-model="compute.hostTags" class="form-control" >
                                    </div>
                                </div>
                            </div>
                                                        <div class="form-group" >

                             <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.qostype" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <select class="form-control input-group" name="qosType" data-ng-model="compute.qosType" ng-options="qosType for (id,qosType) in formElements.qosList"  >
                                    <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
                                </select>
                            </div>
                        </div>


                            <div class="form-group">
                                <div class="row m-t-md">
                                    <div class="col-md-6 col-sm-6">
                                        <label class="font-normal "> <input icheck type="checkbox" ng-model="compute.cpuCapacity"  ><fmt:message key="compute.cpucap" bundle="${msg}" /></label>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <label class="font-normal"> <input icheck type="checkbox" ng-model="compute.isHighAvailabilityEnabled"> <fmt:message key="compute.offerha" bundle="${msg}" /></label>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row m-t-md">

                                    <div class="col-md-6 col-sm-6">
                                        <label class="font-normal "> <input icheck type="checkbox"  data-ng-model="compute.isPublic"  ng-init="compute.isPublic = true"> <fmt:message key="compute.public" bundle="${msg}" /></label>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <label class="font-normal"> <input icheck type="checkbox"  data-ng-model="compute.customized" > <fmt:message key="compute.custom" bundle="${msg}" /></label>
                                    </div>


                                </div>
                            </div>

                    </div>


                        </div>

                    </div>
                </div>
                <div class="col-md-6  col-sm-12 col-xs-4 col-lg-6 ">
                    <div class="row">
                    <div class="col-md-6  col-sm-12 col-xs-4" data-ng-if="!compute.customized">
                        <fieldset class="scheduler-border"  >
                                <legend class="scheduler-border">Compute Resource</legend>
                                <div class="form-group"  ng-class="{'text-danger': computeForm.memory.$invalid && formSubmitted}">
                                    <div class="row">
                                        <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.memory" bundle="${msg}" /><span class="text-danger">*</span></label>
                                        <div class="col-md-6  col-sm-6 col-xs-6">
                                            <input required="true" valid-number  type="text" name="memory" data-ng-model="compute.memory" class="form-control" data-ng-class="{'error': computeForm.memory.$invalid && formSubmitted}">
                                            <div class="error-area" data-ng-show="computeForm.memory.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="compute.memory.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" ng-class="{'text-danger': computeForm.vcpucore.$invalid && formSubmitted}">
                                    <div class="row">
                                        <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.vcpu.core" bundle="${msg}" /><span class="text-danger">*</span></label>
                                        <div class="col-md-6  col-sm-6 col-xs-6">
                                            <input required="true" valid-number type="text" name="vcpucore" data-ng-model="compute.numberOfCores" class="form-control" data-ng-class="{'error': computeForm.vcpucore.$invalid && formSubmitted}">
                                            <div class="error-area" data-ng-show="computeForm.vcpucore.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="compute.vcpu.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" ng-class="{'text-danger': computeForm.speed.$invalid && formSubmitted}">
                                    <div class="row">
                                        <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.speed" bundle="${msg}" /><span class="text-danger">*</span></label>
                                        <div class="col-md-6  col-sm-6 col-xs-6">
                                            <input required="true"  valid-number type="text" name="speed" data-ng-model="compute.clockSpeed" class="form-control" data-ng-class="{'error': computeForm.speed.$invalid && formSubmitted}">
                                            <div class="error-area" data-ng-show="computeForm.speed.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="compute.speed.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                        </div>
                        <div class="col-md-6  col-sm-12 col-xs-4" data-ng-if="compute.qosType">

                            <fieldset class="scheduler-border"  >
                                <legend class="scheduler-border">Disk Performance</legend>
                    <div class="form-group" data-ng-show="compute.qosType == 'HYPERVISOR'" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" ><fmt:message key="common.diskreadratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input type="text" name="diskreadrate" valid-number data-ng-model="compute.diskBytesReadRate" class="form-control" >
                            </div>
                        </div>
                    </div>

                    <div class="form-group" data-ng-show="compute.qosType == 'HYPERVISOR'" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" ><fmt:message key="common.diskwriteratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input type="text" name="diskwriterate" valid-number data-ng-model="compute.diskBytesWriteRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="compute.qosType == 'HYPERVISOR'">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message key="common.diskreadrateiops" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <input  type="text" name="diskreadrateiops" valid-number  data-ng-model="compute.diskIopsReadRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="compute.qosType == 'HYPERVISOR'">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message key="common.diskwriterateiops" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <input  type="text" name="diskwriterateiops" valid-number  data-ng-model="compute.diskIopsWriteRate" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="compute.qosType == 'STORAGE'" data-ng-if="!compute.customizedIops">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.miniops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="diskreadrateiops" valid-number  data-ng-model="compute.minIops" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="compute.qosType == 'STORAGE'" data-ng-if="!compute.customizedIops">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.maxiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="diskwriterateiops" valid-number  data-ng-model="compute.maxIops" class="form-control" >
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-show="compute.qosType == 'STORAGE'">
                        <div class="row">
                            <div class="col-md-6  col-sm-6 col-xs-6">
                                <label class="font-normal"> <input icheck
                                                                   type="checkbox" ng-model="compute.customizedIops"> <fmt:message
                                                                   key="common.customiops" bundle="${msg}" />
                                </label>
                            </div>
                        </div>
                    </div>
                            </fieldset>
                        </div>



                    </div>
                </div>

            </div>
            <div class="row  ">
                    <div class="col-md-12"> <h4><label><fmt:message key="common.pricinginfo" bundle="${msg}" /></label><hr></h4></div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="common.zonename" bundle="${msg}" /></label>
                                <div class="col-md-4  col-sm-4 col-xs-4">
                                    <select data-ng-init="compute.computeCost[0].zone = formElements.zoneList[0]" class="form-control input-group" name="zone" data-ng-model="compute.computeCost[0].zone" ng-options="zone.name for zone in formElements.zoneList" >
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="row" data-ng-show="compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.per.vcpu.core" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceRunningCostVcpu" data-ng-model="compute.computeCost[0].instanceRunningCostPerVcpu" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ (compute.computeCost[0].instanceRunningCostVcpu * compute.computeCost[0].instanceRunningCostPerVcpu)| number:4}}/hr</p></label>
                            </div>
                            <div class="row" data-ng-show="!compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.for.vcpu.core" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceRunningCostVcpu" data-ng-model="compute.computeCost[0].instanceRunningCostVcpu" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceRunningCostVcpu / 720 | number:4}}/hr</p></label>
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="row" data-ng-show="compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.per.memory" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceRunningCostMemory" data-ng-model="compute.computeCost[0].instanceRunningCostPerMB" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostMemory.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceStoppageCostMemory * compute.computeCost[0].instanceStoppageCostPerMB | number:4}}/hr</p></label>
                            </div>
                            <div class="row" data-ng-show="!compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.for.memory" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceRunningCostMemory" data-ng-model="compute.computeCost[0].instanceRunningCostMemory" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostMemory.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceRunningCostMemory / 720 | number:4}}/hr</p></label>
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="row" data-ng-show="compute.customizedIops">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.per.iops" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceRunningCostIops" data-ng-model="compute.computeCost[0].instanceRunningCostPerIops" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostIops.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ (compute.computeCost[0].instanceRunningCostIops * compute.computeCost[0].instanceRunningCostPerIops)| number:4}}/hr</p></label>
                            </div>
                            <div class="row" data-ng-show="!compute.customizedIops">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.for.iops" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceRunningCostIops" data-ng-model="compute.computeCost[0].instanceRunningCostIops" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostIops.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceRunningCostIops / 720 | number:4}}/hr</p></label>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="common.setupcost" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="setupCost" data-ng-model="compute.computeCost[0].setupCost" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.setupCost.$invalid && formSubmitted" ></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="row" data-ng-show="compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.per.vcpu.core" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceStoppageCostVcpu" data-ng-model="compute.computeCost[0].instanceStoppageCostPerVcpu" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceStoppageCostVcpu * compute.computeCost[0].instanceStoppageCostPerVcpu | number:4}}/hr</p></label>
                            </div>
                            <div class="row" data-ng-show="!compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.for.vcpu.core" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceStoppageCostVcpu" data-ng-model="compute.computeCost[0].instanceStoppageCostVcpu" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceStoppageCostVcpu / 720 | number:4}}/hr</p></label>
                            </div>
                        </div>

                        <div class="form-group">
                        <div class="row" data-ng-show="compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.per.memory" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceStoppageCostMemory" data-ng-model="compute.computeCost[0].instanceStoppageCostPerMB" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostMemory.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{compute.computeCost[0].instanceStoppageCostMemory * compute.computeCost[0].instanceStoppageCostPerMB  | number:4}}/hr</p></label>
                            </div>
                            <div class="row" data-ng-show="!compute.customized">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.for.memory" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceStoppageCostMemory" data-ng-model="compute.computeCost[0].instanceStoppageCostMemory" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostMemory.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceStoppageCostMemory / 720 | number:4}}/hr</p></label>
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="row" data-ng-show="compute.customizedIops">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.per.iops" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceStoppageCostIops" data-ng-model="compute.computeCost[0].instanceStoppageCostPerIops" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostIops.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceStoppageCostIops * compute.computeCost[0].instanceStoppageCostPerIops | number:4}}/hr</p></label>
                            </div>
                            <div class="row" data-ng-show="!compute.customizedIops">
                                <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.for.iops" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                                <div class="col-md-3  col-sm-3 col-xs-3">
                                    <input  type="text" valid-decimal name="instanceStoppageCostIops" data-ng-model="compute.computeCost[0].instanceStoppageCostIops" class="form-control" >
                                    <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostIops.$invalid && formSubmitted" ></span>
                                </div>
                                <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.computeCost[0].instanceStoppageCostIops / 720 | number:4}}/hr</p></label>
                            </div>
                        </div>

                    </div>
                </div>
            <div class="row">
                <div class="col-md-12  col-sm-12">
                    <span class="pull-right">
                        <a class="btn btn-default btn-outline"  ui-sref="servicecatalog.list-compute"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                        <button class="btn btn-info" type="submit" ng-disabled="form.computeForm.$invalid" ><fmt:message key="common.create" bundle="${msg}" /></button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</form>