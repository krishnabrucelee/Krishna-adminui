<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="computeForm" data-ng-submit="save(computeForm)"
	data-ng-controller="computeListCtrl" method="post" novalidate="">
	<div class="hpanel">
		<div class="panel-body">
			<div class="row  ">
				<div class="col-md-12">
					<h4>
						<label><fmt:message key="create.compute.offering" bundle="${msg}" />
						</label>
						<hr>
					</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6  col-sm-12 col-xs-4 col-lg-6 border-right">
					<div class="row">
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group"
								ng-class="{'text-danger': computeForm.name.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message
											key="common.name" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<input required="true" id="create_compute_offering_name" type="text" name="name" ng-minlength="1" ng-maxlength= "30"
											data-ng-model="compute.name" class="form-control"
											data-ng-class="{'error': computeForm.name.$invalid && formSubmitted}">
									    <span style="color:red" ng-show="computeForm.name.$error.minlength "><fmt:message key="your.name.should.contain.atleast.4.characters" bundle="${msg}" /></span>
       								    <span style="color:red" ng-show="computeForm.name.$error.maxlength "><fmt:message key="your.name.must.be.less.than.30.characters" bundle="${msg}" /> </span>
										<div class="error-area"
											data-ng-show="computeForm.name.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ computeForm.name.errorMessage || '<fmt:message key="compute.offer.required" bundle="${msg}" />' }}"
												class="fa fa-warning error-icon">
											</i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group"
								ng-class="{'text-danger': computeForm.displayText.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message
											key="common.description" bundle="${msg}" /><span class="text-danger">*</span>
										</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<input required="true" type="text" id="create_compute_offering_display_text" name="displayText"
											data-ng-model="compute.displayText" class="form-control"
											data-ng-class="{'error': computeForm.displayText.$invalid && formSubmitted}">
										<div class="error-area"
											data-ng-show="computeForm.displayText.$invalid && formSubmitted">
											<i tooltip="<fmt:message key="compute.description.required" bundle="${msg}" />"
												class="fa fa-warning error-icon">
											</i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row">
									<label
										class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="compute.storagetype" bundle="${msg}" />
									</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<select id="create_compute_offering_storage_type"
											data-ng-init="compute.storageType = formElements.storageTypeList[0]"
											class="form-control input-group" name="storagetype"
											data-ng-model="compute.storageType"
											ng-options="storageType for (id, storageType) in formElements.storageTypeList">
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message
											key="compute.hosttag" bundle="${msg}" />
									</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<input type="text" name="hosttag" id="create_compute_offering_host_tag"
											data-ng-model="compute.hostTags" class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.storagetag" bundle="${msg}" />
									</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<input type="text" name="storagetag" id="create_compute_offering_storage_tag"
											data-ng-model="compute.storageTags" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">

								<div class="row">
									<label
										class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message
											key="compute.qostype" bundle="${msg}" /></label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<select class="form-control input-group" name="qosType" id="create_compute_offering_qos_tag"
											data-ng-model="compute.qosType"
											ng-options="qosType for (id,qosType) in formElements.qosList">
											<option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row m-t-md">
									<div class="col-md-6 col-sm-6">
										<label class="font-normal "> <input icheck id="create_compute_offering_cpuCapacity"
											type="checkbox" ng-model="compute.cpuCapacity">
										<fmt:message key="compute.cpucap" bundle="${msg}" /></label>
									</div>
									<div class="col-md-6 col-sm-6">
										<label class="font-normal"> <input icheck
											type="checkbox" id="create_compute_offering_isHighAvailabilityEnabled" ng-model="compute.isHighAvailabilityEnabled">
											<fmt:message key="compute.offerha" bundle="${msg}" /></label>
									</div>

								</div>
							</div>
						</div>
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row m-t-md">

									<div class="col-md-6 col-sm-6">
										<label class="font-normal "> <input icheck id="create_compute_offering_isPublic"
											type="checkbox" data-ng-model="compute.isPublic"
											ng-init="compute.isPublic = true"> <fmt:message
												key="compute.public" bundle="${msg}" /></label>
									</div>
									<div class="col-md-6 col-sm-6">
										<label class="font-normal"> <input icheck id="create_compute_offering_customized"
											type="checkbox" data-ng-model="compute.customized">
											<fmt:message key="compute.custom" bundle="${msg}" /></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message
											key="common.networkrate" bundle="${msg}" /></label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<input type="text" valid-number name="network" id="create_compute_offering_network_rate"
											data-ng-model="compute.networkRate" class="form-control">
									</div>
								</div>
							</div>
							<div class="form-group m-t-md " ng-class="{'text-danger': computeForm.domain.$invalid && formSubmitted}" data-ng-if="!compute.isPublic">
									<div class="row">
										<label
											class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message
												key="compute.domain" bundle="${msg}" /><span class="text-danger">*</span> </label>
										<div class="col-md-7 col-sm-7 col-xs-7">
											<select required = "true" class="form-control input-group" name="domain"
												data-ng-model="compute.domain" id="create_compute_offering_domain"
												ng-options="domain.name for domain in domain.domaintypeList" data-ng-class="{'error': computeForm.domain.$invalid && formSubmitted}">
												<option value=""><fmt:message key="common.select"
														bundle="${msg}" /></option>
											</select>
											<div class="error-area"
											data-ng-show="computeForm.domain.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ computeForm.domain.errorMessage || '<fmt:message key="domain.is.required" bundle="${msg}" />' }}"
												class="fa fa-warning error-icon">
											</i>
										</div>
										</div>
									</div>
								</div>
						</div>
						<div class="col-md-6  col-sm-12 col-xs-4">
							<div class="form-group">
								<div class="row">
									<label
										class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message
											key="compute.diskio" bundle="${msg}" /></label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<select
											data-ng-init="compute.diskIo = formElements.diskioList[0]"
											class="form-control input-group" name="diskio" id="create_compute_offering_diskIo"
											data-ng-model="compute.diskIo"
											ng-options=" diskio for (id, diskio) in formElements.diskioList">
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6  col-sm-12 col-xs-4 col-lg-6 ">
					<div class="row">
						<div class="col-md-6  col-sm-12 col-xs-4"
							data-ng-if="!compute.customized">
							<fieldset class="scheduler-border">
								<legend class="scheduler-border"><fmt:message
											key="compute.resource" bundle="${msg}" /></legend>
								<div class="form-group"
									ng-class="{'text-danger': computeForm.memory.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message
												key="common.memory" bundle="${msg}" /><span
											class="text-danger">*</span></label>
										<div class="col-md-6  col-sm-6 col-xs-6">
											<input required="true" valid-number type="text" name="memory" id="create_compute_offering_memory"
												data-ng-model="compute.memory" class="form-control"
												data-ng-class="{'error': computeForm.memory.$invalid && formSubmitted}">
											<div class="error-area"
												data-ng-show="computeForm.memory.$invalid && formSubmitted">
												<i tooltip="<fmt:message key="compute.memory.required" bundle="${msg}" />"
													class="fa fa-warning error-icon">
												</i>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group"
									ng-class="{'text-danger': computeForm.vcpucore.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message
												key="compute.vcpu.core" bundle="${msg}" /><span class="text-danger">*</span>
										</label>
										<div class="col-md-6  col-sm-6 col-xs-6">
											<input required="true" valid-number type="text" id="create_compute_offering_vcpu_core"
												name="vcpucore" data-ng-model="compute.numberOfCores"
												class="form-control"
												data-ng-class="{'error': computeForm.vcpucore.$invalid && formSubmitted}">
											<div class="error-area"
												data-ng-show="computeForm.vcpucore.$invalid && formSubmitted">
												<i tooltip="<fmt:message key="compute.vcpu.required" bundle="${msg}" />"
													class="fa fa-warning error-icon">
												</i>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group"
									ng-class="{'text-danger': computeForm.speed.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message
												key="common.speed" bundle="${msg}" /><span class="text-danger">*</span>
										</label>
										<div class="col-md-6  col-sm-6 col-xs-6">
										<input required="true"  valid-number type="text" name="speed" id="create_compute_offering_clock_speed"
												data-ng-model="compute.clockSpeed" minlength="4" maxlength="4" data-ng-keyup="validateNumbers()" class="form-control"
												data-ng-class="{'error': computeForm.speed.$invalid && formSubmitted}">

											<span style="color:red" ng-show="computeForm.speed.$error.minlength"><fmt:message key="not.a.valid.range" bundle="${msg}" /></span>
											<span style="color:red" ng-show="computeForm.speed.$error.maxlength"><fmt:message key="not.a.valid.range" bundle="${msg}" /></span>

											<div class="error-area"
												data-ng-show="computeForm.speed.$invalid && formSubmitted">
												<i tooltip="<fmt:message key="compute.speed.required" bundle="${msg}" />"
													class="fa fa-warning error-icon">
												</i>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="col-md-6  col-sm-12 col-xs-4"
							data-ng-if="compute.qosType">

							<fieldset class="scheduler-border">
								<legend class="scheduler-border"><fmt:message
												key="disk.performance" bundle="${msg}" /></legend>
								<div class="form-group"
									data-ng-show="compute.qosType == 'HYPERVISOR'">
									<div class="row">
										<label
											class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message key="common.diskreadratebps" bundle="${msg}" />
										</label>
										<div class="col-md-6 col-sm-6 col-xs-6">
											<input type="text" name="diskreadrate" id="create_compute_offering_disk_read_rate" valid-number
												data-ng-model="compute.diskBytesReadRate"
												class="form-control">
										</div>
									</div>
								</div>

								<div class="form-group"
									data-ng-show="compute.qosType == 'HYPERVISOR'">
									<div class="row">
										<label
											class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
												key="common.diskwriteratebps" bundle="${msg}" /> </label>
										<div class="col-md-6 col-sm-6 col-xs-6">
											<input type="text" id="create_compute_offering_disk_write_rate" name="diskwriterate" valid-number
												data-ng-model="compute.diskBytesWriteRate"
												class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group"
									data-ng-show="compute.qosType == 'HYPERVISOR'">
									<div class="row">
										<label
											class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
												key="common.diskreadrateiops" bundle="${msg}" />
										</label>
										<div class="col-md-6 col-sm-6 col-xs-6">
											<input type="text" id="create_compute_offering_disk_read_rate_iops" name="diskreadrateiops" valid-number
												data-ng-model="compute.diskIopsReadRate"
												class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group"
									data-ng-show="compute.qosType == 'HYPERVISOR'">
									<div class="row">
										<label
											class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
												key="common.diskwriterateiops" bundle="${msg}" />
										</label>
										<div class="col-md-6  col-sm-6 col-xs-6">
											<input type="text" id="create_compute_offering_disk_write_rate_iops" name="diskwriterateiops" valid-number
												data-ng-model="compute.diskIopsWriteRate"
												class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group"
									data-ng-show="compute.qosType == 'STORAGE'"
									data-ng-if="!compute.customizedIops">
									<div class="row">
										<label
											class="col-md-6 col-sm-6 col-xs-4 control-label font-normal"><fmt:message
												key="common.miniops" bundle="${msg}" />
										</label>
										<div class="col-md-6  col-sm-6 col-xs-7">
											<input type="text" id="create_compute_offering_min_iops"
											 name="diskreadrateiops" valid-number
												data-ng-model="compute.minIops" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group"
									data-ng-show="compute.qosType == 'STORAGE'"
									data-ng-if="!compute.customizedIops">
									<div class="row">
										<label
											class="col-md-6 col-sm-6 col-xs-4 control-label font-normal"><fmt:message
												key="common.maxiops" bundle="${msg}" />
										</label>
										<div class="col-md-6  col-sm-6 col-xs-7">
											<input type="text" name="diskwriterateiops" id="create_compute_offering_max_iops" valid-number
												data-ng-model="compute.maxIops" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group"
									data-ng-show="compute.qosType == 'STORAGE'">
									<div class="row">
										<div class="col-md-6  col-sm-6 col-xs-6">
											<label class="font-normal"> <input icheck
												type="checkbox" data-ng-change="customCheck(compute)" id="create_compute_offering_customized_iops" ng-model="compute.customizedIops"> <fmt:message
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
			<div class="row">
				<div class="col-md-12">
					<h4>
						<label><fmt:message key="common.pricinginfo"
								bundle="${msg}" /></label>
						<hr>
					</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group" ng-class="{'text-danger': computeForm.zone.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="common.zonename" bundle="${msg}" /><span class="text-danger">*</span>
							</label>
							<div class="col-md-4  col-sm-4 col-xs-4">
								<select required = "true" id="create_compute_offering_compute_cost_zone"
									data-ng-init="compute.computeCost[0].zone = formElements.zoneList[0]"
									class="form-control input-group" name="zone"
									data-ng-model="compute.computeCost[0].zone"
									ng-options="zone.name for zone in formElements.zoneList" data-ng-class="{'error': computeForm.zone.$invalid && formSubmitted}">
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
				</div>
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group">
						<div class="row">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="common.setupcost" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)
							 </label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="setupCost" id="create_compute_offering_compute_cost_set_up_cost"
									data-ng-model="compute.computeCost[0].setupCost"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.setupCost.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.per.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceRunningCostVcpu"
								    id="create_compute_offering_compute_cost_instance_running_cost_per_vcpu"
									data-ng-model="compute.computeCost[0].instanceRunningCostPerVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted"></span>
							</div>
						</div>
						<div class="row" data-ng-show="!compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.for.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)
							</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceRunningCostVcpu"
								    id="create_compute_offering_compute_cost_instance_running_cost_vcpu"
									data-ng-model="compute.computeCost[0].instanceRunningCostVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostVcpu.$invalid && formSubmitted"></span>
							</div>

						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.per.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceStoppageCostVcpu"
								    id="create_compute_offering_compute_cost_instance_stoppage_cost_per_vcpu"
									data-ng-model="compute.computeCost[0].instanceStoppageCostPerVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted"></span>
							</div>
						</div>
						<div class="row" data-ng-show="!compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.for.vcpu.core" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)
							</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceStoppageCostVcpu"
								    id="create_compute_offering_compute_cost_instance_stoppage_cost_vcpu"
									data-ng-model="compute.computeCost[0].instanceStoppageCostVcpu"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostVcpu.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.per.memory" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
								    id="create_compute_offering_compute_cost_instance_running_cost_per_mb"
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
									name="instanceRunningCostMemory"
									id="create_compute_offering_compute_cost_instance_running_cost_memory"
									data-ng-model="compute.computeCost[0].instanceRunningCostMemory"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceRunningCostMemory.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.per.memory" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price
									name="instanceStoppageCostMemory"
									id="create_compute_offering_compute_cost_instance_stoppage_cost_per_mb"
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
									id="create_compute_offering_compute_cost_instance_stoppage_cost_memory"
									data-ng-model="compute.computeCost[0].instanceStoppageCostMemory"
									class="form-control"> <span
									class="help-block m-b-none"
									ng-show="computeForm.instanceStoppageCostMemory.$invalid && formSubmitted"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group">
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.running.cost.per.mhz.speed" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceRunningCostSpeed"
								    id="create_compute_offering_compute_cost_instance_running_cost_per_mhz"
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
						<div class="row" data-ng-show="compute.customized">
							<label class="col-md-7 col-sm-7 control-label font-normal"><fmt:message
									key="instance.stoppage.cost.per.mhz.speed" bundle="${msg}" />(<app-currency
									class="text-danger"></app-currency>)</label>
							<div class="col-md-3  col-sm-3 col-xs-3">
								<input type="text" valid-price name="instanceStoppageCostSpeed"
								    id="create_compute_offering_compute_cost_instance_stoppage_cost_per_mhz"
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
					<span data-ng-hide="showLoader" class="pull-right">


					 <a	class="btn btn-default btn-outline" id="create_compute_offering_cancel_button" data-ng-hide="showLoader" ui-sref="servicecatalog.list-compute"><fmt:message	key="common.cancel" bundle="${msg}" /></a>
						<button class="btn btn-info" id="create_compute_offering_create_button" type="submit" data-ng-hide="showLoader" ng-disabled="form.computeForm.$invalid"> <fmt:message key="common.create" bundle="${msg}" />
						</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</form>