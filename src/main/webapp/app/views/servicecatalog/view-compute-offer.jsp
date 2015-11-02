<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="computeForm" data-ng-submit="update(computeForm)" method="post" novalidate="" ng-controller="computeListCtrl">
    <div class="hpanel">
        <div class="panel-body">
            <div class="row  ">
                <div class="col-md-12"><h4><label><fmt:message key="edit.compute.offering" bundle="${msg}" /></label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" ng-class="{'text-danger': computeForm.name.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input required="true" type="text" name="name" data-ng-model="compute.name" class="form-control" data-ng-class="{'error': computeForm.name.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="computeForm.name.$invalid && formSubmitted" ><i  tooltip="Compute Offer Name is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" ng-class="{'text-danger': computeForm.description.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input required="true" type="text" name="displayText" data-ng-model="compute.displayText" class="form-control" data-ng-class="{'error': computeForm.displayText.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="computeForm.displayText.$invalid && formSubmitted" ><i  tooltip="Description is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row" >
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.storagetype" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="storageType" data-ng-model="compute.storageType" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.hosttag" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" name="hosttag" data-ng-model="compute.hostTags" class="form-control" readonly >
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.storagetag" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" name="storagetag" data-ng-model="compute.storageTags" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.memory" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-number name="memory" data-ng-model="compute.memory" class="form-control" readonly >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.vcpu.core" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number name="vcpucore" data-ng-model="compute.numberOfCores" class="form-control"readonly >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.speed" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input valid-number type="text" name="speed" data-ng-model="compute.clockSpeed" class="form-control" readonly >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.networkrate" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number name="network" data-ng-model="compute.networkRate" class="form-control"readonly >

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group"  >
                        <div class="row" >
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.diskio" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <select  class="form-control input-group" name="diskio" data-ng-model="compute.diskIo" ng-options="diskio for (id, diskio) in formElements.diskioList" >
                                </select>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal" ><fmt:message key="common.diskreadratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-number name="diskreadrate" data-ng-model="compute.diskBytesReadRate" class="form-control" >

                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal" ><fmt:message key="common.diskwriteratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-number name="diskwriterate" data-ng-model="compute.diskBytesWriteRate" class="form-control" >

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.diskreadrateiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number  name="diskreadrateiops" data-ng-model="compute.diskIopsReadRate" class="form-control" >

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.diskwriterateiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number name="diskwriterateiops" data-ng-model="compute.diskIopsWriteRate" class="form-control" >

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-4" >
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.miniops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="diskreadrateiops" valid-number  data-ng-model="compute.minIops" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-4" >
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.maxiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="diskwriterateiops" valid-number  data-ng-model="compute.maxIops" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.cpucap" bundle="${msg}" /></label>
                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="cpucap" data-ng-model="compute.cpuCapacity" class="form-control"readonly >
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.offerha" bundle="${msg}" /></label>
                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="offerha" data-ng-model="compute.isHighAvailabilityEnabled" class="form-control"readonly >
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.public" bundle="${msg}" /></label>
                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="isPublic" data-ng-model="compute.isPublic" class="form-control"readonly >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row  ">
                <div class="col-md-12"> <h4><label><fmt:message key="common.pricinginfo" bundle="${msg}" /></label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">

                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="common.zonename" bundle="${msg}" /></label>
                            <div class="col-md-4  col-sm-4 col-xs-4">
<!--                                 <input  type="text" name="zonename"  data-ng-model="compute.zone" class="form-control" readonly >
 -->
 							  <b>{{ compute.zone.name }}</b>

                            </div>
                        </div>
					</div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.for.vcpu.core" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="instanceRunningCostVcpu" data-ng-model="compute.instanceRunningCostVcpu" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted" ></span>
                            </div>
                            <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.instanceRunningCostVcpu / 720 | number:4}}/hr</p></label>
                        </div>
                    </div>
                      <div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.for.memory" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="instanceRunningCostMemory" data-ng-model="compute.instanceRunningCostMemory" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostMemory.$invalid && formSubmitted" ></span>
                            </div>
                            <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.instanceRunningCostMemory / 720 | number:4}}/hr</p></label>
                        </div>
                    </div>
                      <div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.running.cost.for.iops" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="instanceRunningCostIops" data-ng-model="compute.instanceRunningCostIops" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.instanceRunningCostIops.$invalid && formSubmitted" ></span>
                            </div>
                            <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.instanceRunningCostIops / 720 | number:4}}/hr</p></label>
                        </div>
                    </div>

                </div>
                <div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">

				<div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="common.setupcost" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="setupCost" data-ng-model="compute.setupCost" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.setupCost.$invalid && formSubmitted" ></span>
                            </div>
                        </div>
                        </div>
                 	<div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.for.vcpu.core" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="instanceStoppageCostVcpu" data-ng-model="compute.instanceStoppageCostVcpu" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted" ></span>
                            </div>
                            <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.instanceStoppageCostVcpu / 720 | number:4}}/hr</p></label>
                        </div>
                        </div>

                      <div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.for.memory" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="instanceStoppageCostMemory" data-ng-model="compute.instanceStoppageCostMemory" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostMemory.$invalid && formSubmitted" ></span>
                            </div>
                            <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.instanceStoppageCostMemory / 720 | number:4}}/hr</p></label>
                        </div>
                    </div>
                      <div class="form-group">
                        <div class="row">
                            <label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message key="instance.stoppage.cost.for.iops" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-3  col-sm-3 col-xs-3">
                                <input  type="text" valid-decimal name="instanceStoppageCostIops" data-ng-model="compute.instanceStoppageCostIops" class="form-control" >
                                <span class="help-block m-b-none" ng-show="computeForm.instanceStoppageCostIops.$invalid && formSubmitted" ></span>
                            </div>
                            <label class="col-md-2 col-sm-2  no-padding m-t-sm"> <p class="text-danger"> {{ compute.instanceStoppageCostIops / 720 | number:4}}/hr</p></label>
                        </div>
                    </div>

                </div>
				</div>
                <div class="row">
                    <div class="col-md-12  col-sm-12">
                        <span class="pull-right">
                            <a class="btn btn-default btn-outline"  ui-sref="servicecatalog.list-compute"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                            <button class="btn btn-info" type="submit" ng-disabled="form.computeForm.$invalid" ><fmt:message key="common.apply" bundle="${msg}" /></button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
</form>


