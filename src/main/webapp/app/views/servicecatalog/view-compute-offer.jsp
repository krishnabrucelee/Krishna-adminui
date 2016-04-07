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
            <div class="row clear-form-div">
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group" ng-class="{'text-danger': computeForm.name.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                <input required="true" id="edit_compute_offer_name"
                                type="text" name="name" ng-minlength="4" ng-maxlength= "30" data-ng-model="compute.name" class="form-control" data-ng-class="{'error': computeForm.name.$invalid && formSubmitted}">
                                <span style="color:red" ng-show="computeForm.name.$error.minlength "><fmt:message key="your.name.should.contain.atleast.4.characters" bundle="${msg}" /></span>
       							<span style="color:red" ng-show="computeForm.name.$error.maxlength "><fmt:message key="your.name.must.be.less.than.30.characters" bundle="${msg}" /> </span>
                               <div class="error-area" data-ng-show="computeForm.name.$invalid && formSubmitted">
									<i ng-attr-tooltip="{{ computeForm.name.errorMessage || '<fmt:message key="compute.offer.required" bundle="${msg}" />' }}"	class="fa fa-warning error-icon"></i>
								</div>
							 </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group" ng-class="{'text-danger': computeForm.description.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                <input required="true" id="edit_compute_offer_display_text" type="text" name="displayText" data-ng-model="compute.displayText" class="form-control" data-ng-class="{'error': computeForm.displayText.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="computeForm.displayText.$invalid && formSubmitted" ><i  tooltip="Description is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group" >
                        <div class="row" >
                            <label class="col-md-6 col-sm-6 col-xs-4 control-label font-normal" ><fmt:message key="compute.storagetype" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                            	{{compute.storageType || " N/A "}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.hosttag" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                  {{compute.hostTags || " N/A "}}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.storagetag" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                 {{compute.storageTags || " N/A "}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="!compute.customized">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.memory" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                 {{compute.memory }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="!compute.customized">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.vcpu.core" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                 {{compute.numberOfCores}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="!compute.customized">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.speed" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
                                 {{compute.clockSpeed}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.networkrate" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							    {{compute.networkRate || " N/A "}}
                            </div>
                        </div>
                    </div>
                </div>
            <div class="col-md-4  col-sm-12 col-xs-4 clear-form">
                    <div class="form-group"  >
                        <div class="row" >
                            <label class="col-md-6 col-sm-6 col-xs-4 control-label font-normal" ><fmt:message key="compute.diskio" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							    {{compute.diskIo}}
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="compute.qosType == 'HYPERVISOR'">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal" ><fmt:message key="common.diskreadratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							   {{compute.diskBytesReadRate}}
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="compute.qosType == 'HYPERVISOR'">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal" ><fmt:message key="common.diskwriteratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							   {{compute.diskBytesWriteRate}}
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="compute.qosType == 'HYPERVISOR'">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.diskreadrateiops" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							   {{compute.diskIopsReadRate}}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4 clear-form" data-ng-show="compute.qosType == 'HYPERVISOR'">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-4 control-label font-normal"><fmt:message key="common.diskwriterateiops" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-7">
							    {{compute.diskIopsWriteRate}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-4 clear-form" data-ng-show="compute.qosType == 'STORAGE'">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-4 control-label font-normal"><fmt:message key="common.miniops" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							    {{compute.minIops}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-4 clear-form" data-ng-show="compute.qosType == 'STORAGE'">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-4 control-label font-normal"><fmt:message key="common.maxiops" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-7">
							    {{compute.maxIops}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 clear-form">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.cpucap" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6">
                                    {{compute.cpuCapacity || "N/A"}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 clear-form">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.offerha" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6">
                            {{compute.isHighAvailabilityEnabled}}
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4 clear-form">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="compute.public" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6">
                            <b>{{compute.isPublic}}</b>

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
					<div class="form-group"  ng-class="{'text-danger': computeForm.zone.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="common.zonename" bundle="${msg}" /><span class="text-danger">*</span>
							</label>
							<div class="col-md-4  col-sm-4 col-xs-4">
								<select required = "true"
                                    id="edit_compute_offer_zone"
									class="form-control input-group" name="zone"
									data-ng-model="compute.zone" data-ng-class="{'error': computeForm.zone.$invalid && formSubmitted}"
									ng-options="zone.name for zone in formElements.zoneList">
									<option value="" class=""><fmt:message
									key="common.select" bundle="${msg}" />
									</option>
								</select>
								<div class="error-area"
											data-ng-show="computeForm.zone.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ computeForm.zone.errorMessage || '<fmt:message key="zone.is.required" bundle="${msg}" />' }}"
												class="fa fa-warning error-icon">
											</i>
										</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.per.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceRunningCostVcpu"
								    id="edit_compute_offer_compute_cost_instance_running_cost_per_vcpu"
									data-ng-model="compute.computeCost[0].instanceRunningCostPerVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted"></span>
							</div>
							</div>
						<div class="row" data-ng-show="!compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.for.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceRunningCostVcpu"
								    id="edit_compute_offer_compute_cost_instance_running_cost_vcpu"
									data-ng-model="compute.computeCost[0].instanceRunningCostVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.per.memory" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
								    id="edit_compute_offer_compute_cost_instance_running_cost_per_mb"
									name="instanceRunningCostMemory"
									data-ng-model="compute.computeCost[0].instanceRunningCostPerMB"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostMemory.$invalid && formSubmitted"></span>
							</div>
							</div>
						<div class="row" data-ng-show="!compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.for.memory" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
								    id="edit_compute_offer_compute_cost_instance_running_cost_memory"
									name="instanceRunningCostMemory"
									data-ng-model="compute.computeCost[0].instanceRunningCostMemory"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostMemory.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
						<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.per.mhz.speed" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
									name="instanceRunningCostSpeed"
									id="edit_compute_offer_compute_cost_instance_running_cost_per_mhz"
									data-ng-model="compute.computeCost[0].instanceRunningCostPerMhz"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostSpeed.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">

					<div class="form-group">
						<div class="row">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="common.setupcost" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="setupCost"
								    id="edit_compute_offer_compute_cost_set_up_cost"
									data-ng-model="compute.computeCost[0].setupCost"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.setupCost.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.per.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price id="edit_compute_offer_compute_cost_instance_stoppage_cost_per_vcpu"
								    name="instanceStoppageCostVcpu"
									data-ng-model="compute.computeCost[0].instanceStoppageCostPerVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted"></span>
							</div>
						</div>
						<div class="row" data-ng-show="!compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.for.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceStoppageCostVcpu"
								    id="edit_compute_offer_compute_cost_instance_stoppage_cost_vcpu"
									data-ng-model="compute.computeCost[0].instanceStoppageCostVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.per.memory" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
									name="instanceStoppageCostMemory"
									id="edit_compute_offer_compute_cost_instance_stoppage_cost_per_mb"
									data-ng-model="compute.computeCost[0].instanceStoppageCostPerMB"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostMemory.$invalid && formSubmitted"></span>
							</div>
						</div>
						<div class="row" data-ng-show="!compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.for.memory" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
									name="instanceStoppageCostMemory"
									id="edit_compute_offer_compute_cost_instance_stoppage_cost_memory"
									data-ng-model="compute.computeCost[0].instanceStoppageCostMemory"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostMemory.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.per.mhz.speed" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
									name="instanceStoppageCostSpeed"
									id="edit_compute_offer_compute_cost_instance_stoppage_cost_per_mhz"
									data-ng-model="compute.computeCost[0].instanceStoppageCostPerMhz"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostSpeed.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
                    <div class="col-md-12  col-sm-12">
                     <get-loader-image data-ng-show="showLoader"></get-loader-image>
                        <span  data-ng-hide="showLoader" class="pull-right">
                            <a  data-ng-hide="showLoader" id="edit_compute_offer_cancel_button"
                             class="btn btn-default btn-outline"  ui-sref="servicecatalog.list-compute"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                            <button id="edit_compute_offer_apply_button" data-ng-hide="showLoader" class="btn btn-info" type="submit" ng-disabled="form.computeForm.$invalid" ><fmt:message key="common.apply" bundle="${msg}" /></button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
</form>


