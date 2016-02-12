<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form name="storageForm" data-ng-submit="save(storageForm)"
	data-ng-controller="storageListCtrl" method="post" novalidate="">
	<div class="hpanel">
		<div class="panel-body">
			<div class="row  ">
				<div class="col-md-12">
					<h4>
						<label><fmt:message key="create.disk.offer"
								bundle="${msg}" /></label>
						<hr>
					</h4>
				</div>
			</div>
			<div class="row">
                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 border-right" >
                <div class="row">
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group"
						ng-class="{'text-danger': storageForm.name.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message
									key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
							<div class="col-md-8  col-sm-6 col-xs-6">
								<input required="true" type="text" name="name"
									data-ng-model="storage.name" class="form-control"
									data-ng-class="{'error': storageForm.name.$invalid && formSubmitted}">
								<div class="error-area" data-ng-show="storageForm.name.$invalid && formSubmitted">
								<div class="error-area" data-ng-show="storageForm.name.$invalid && formSubmitted" >
								<i ng-attr-tooltip="{{ '<fmt:message key="storage.offer.required" bundle="${msg}" />' || '<fmt:message key="storage.name.size.error" bundle="${msg}" />' }}" class="fa fa-warning error-icon"></i>
								</div>
								</div>
							</div>
						</div>
					</div>
	                </div>
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group"
						ng-class="{'text-danger': storageForm.description.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message
									key="common.description" bundle="${msg}" /><span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-6">
								<input required="true" type="text" name="description"
									data-ng-model="storage.description" class="form-control"
									data-ng-class="{'error': storageForm.description.$invalid && formSubmitted}">
								<div class="error-area"
									data-ng-show="storageForm.description.$invalid && formSubmitted">
								<div class="error-area" data-ng-show="storageForm.description.$invalid && formSubmitted" >
								<i ng-attr-tooltip="{{ '<fmt:message key="storage.description.required" bundle="${msg}" />' || '<fmt:message key="storage.description.size.error" bundle="${msg}" />' }}" class="fa fa-warning error-icon"></i>
								</div>
								</div>
							</div>
						</div>
					</div>
	                </div>
                </div>
                <div class="row">
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group">
						<div class="row">
							<label
								class="col-md-4 col-sm-4 col-xs-6 control-label font-normal"><fmt:message
									key="storage.storagetag" bundle="${msg}" /></label>
							<div class="col-md-8 col-sm-6 col-xs-6">
								<input type="text" name="storagetag"
									data-ng-model="storage.storageTags" class="form-control">
							</div>
						</div>
					</div>
	                </div>
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group">
						<div class="row">
							<label
								class="col-md-4 col-sm-4 col-xs-6 control-label font-normal"><fmt:message
									key="storage.storagetype" bundle="${msg}" /></label>
							<div class="col-md-8 col-sm-6 col-xs-6">
								<select
									data-ng-init="storage.storageType = storageType.storagetypeList[0]"
									class="form-control input-group" name="storageType"
									data-ng-model="storage.storageType"
									ng-options="storageType for  (id, storageType)  in storageType.storagetypeList">
								</select>
							</div>
						</div>
					</div>
	                </div>
                </div>
                <div class="row">
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group">
						<div class="row">
							<label
								class="col-md-4 col-sm-4 col-xs-6 control-label font-normal"><fmt:message
									key="storage.qostype" bundle="${msg}" /></label>
							<div class="col-md-8  col-sm-6 col-xs-6">
								<select class="form-control input-group" name="qosType"
									data-ng-model="storage.qosType"
									ng-options="qosType for  (id, qosType)  in formElements.qosList">
									<option value="">Select</option>
								</select>
							</div>
						</div>
					</div>
	                </div>
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<label class="font-normal"> <input  icheck
									type="checkbox" ng-model="storage.isPublic"
									ng-init="storage.isPublic = true"> <fmt:message
										key="storage.public" bundle="${msg}" />
								</label>
							</div>
							<div class="col-md-6 col-sm-6">
								<label class="font-normal"> <input icheck
									type="checkbox" ng-model="storage.isCustomDisk"> <fmt:message
										key="storage.customdisk" bundle="${msg}" />
								</label>
							</div>
						</div>
					</div>
	                </div>
                </div>
                <div class="row">
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group" data-ng-if="!storage.isCustomDisk "
					data-ng-class="{'text-danger': storageForm.size.$invalid && formSubmitted}">
						<div class="row" data-ng-required="false">
							<label
								class="col-md-4 col-sm-4 col-xs-6 control-label font-normal"><fmt:message
									key="common.size" bundle="${msg}" /><span class="text-danger">*</span>
							</label>
							<div class="col-md-8 col-sm-6 col-xs-6">
								<input valid-number type="text "
									ng-required="!storage.isCustomDisk" name="size"
									data-ng-model="storage.diskSize" class="form-control"
									data-ng-class="{'error': storageForm.size.$invalid && formSubmitted}">
								<div class="error-area"
									data-ng-if="storageForm.size.$invalid && formSubmitted">
									<i tooltip="<fmt:message
									key="storage.disksize.required" bundle="${msg}" />"
										class="fa fa-warning error-icon"></i>
								</div>

							</div>
						</div>
					</div>
	                </div>
	                <div class="col-md-6  col-sm-6 col-xs-4 col-lg-6 " >
						<div class="form-group" data-ng-if="!storage.isPublic">
						<div class="row">
							<label
								class="col-md-4 col-sm-4 col-xs-6 control-label font-normal"><fmt:message
									key="storage.domain" bundle="${msg}" /></label>
							<div class="col-md-8 col-sm-6 col-xs-6">
								<select class="form-control input-group" name="domain"
									data-ng-model="storage.domain"
									ng-options="domain.name for domain in formElements.domainList">
									<option value="">Select</option>
								</select>
							</div>
						</div>
					</div>
	                </div>
                </div>
                </div>
                 <div class="col-md-6  col-sm-6 col-xs-4 col-lg-4 " data-ng-show="storage.qosType">
 								<fieldset class="scheduler-border"  >
                                <legend class="scheduler-border">Disk Performance</legend>
				<div class="" data-ng-show="storage.qosType == 'Hypervisor'">
					<div class="form-group">
						<div class="row">
							<label
								class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.diskreadratebps" bundle="${msg}" /> </label>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<input type="text" name="diskreadrate" valid-number
									data-ng-model="storage.diskBytesReadRate" class="form-control">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label
								class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.diskwriteratebps" bundle="${msg}" /></label>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<input type="text" name="diskwriterate" valid-number
									data-ng-model="storage.diskBytesWriteRate" class="form-control">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label
								class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.diskreadrateiops" bundle="${msg}" /></label>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<input type="text" name="diskreadrateiops" valid-number
									data-ng-model="storage.diskIopsReadRate" class="form-control">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label
								class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.diskwriterateiops" bundle="${msg}" /></label>
							<div class="col-md-6  col-sm-6 col-xs-6">
								<input type="text" name="diskwriterateiops" valid-number
									data-ng-model="storage.diskIopsWriteRate" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12" data-ng-show="storage.qosType == 'Storage'"
					data-ng-if="!storage.isCustomizedIops">
					<div class="form-group">
						<div class="row">
							<label
								class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.miniops" bundle="${msg}" /></label>
							<div class="col-md-6  col-sm-6 col-xs-6">
								<input type="text" name="diskreadrateiops" valid-number
									data-ng-model="storage.diskMinIops" class="form-control">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label
								class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.maxiops" bundle="${msg}" /></label>
							<div class="col-md-6  col-sm-6 col-xs-6">
								<input type="text" name="diskwriterateiops" valid-number
									data-ng-model="storage.diskMaxIops" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12" data-ng-show="storage.qosType == 'Storage'">
					<div class="form-group">
						<div class="row">
							<div class="col-md-6  col-sm-6 col-xs-6">
								<label class="font-normal"> <input icheck type="checkbox"
									ng-model="storage.isCustomizedIops"> <fmt:message
									key="common.customiops" bundle="${msg}" />
								</label>
							</div>
						</div>
					</div>
				</div>
               </fieldset>
                </div>
				</div>
				<div class="row  ">
				<div class="col-md-12">
					<h4>
						<label> <fmt:message key="common.pricinginfo" bundle="${msg}" /></label>
						<hr>
					</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div class="form-group" data-ng-if="!storage.isCustomDisk " >
						<div class="row">
							<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.cost.per.month" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)
							</label>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<input type="text" valid-price name="costmonth"
									data-ng-model="storage.storagePrice[0].costPerMonth" class="form-control">
							</div>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<b>
								<p class="text-danger">{{
									storage.storagePrice[0].costPerMonth /24 |
									number:4}}/day </p>
									<!-- <p class="text-danger m-t-sm">{{ storage.costPerHourGB / 24 }}/day</p> -->
								</b>
							</div>
						</div>
					</div>
					<div class="form-group" data-ng-if="storage.isCustomDisk " >
						<div class="row">
							<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.cost.per.gb.per.month" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)
							</label>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<input  type="text" valid-price name="costmonth"
									data-ng-model="storage.storagePrice[0].costGbPerMonth" class="form-control">
							</div>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<b>	<p class="text-danger">{{
									storage.storagePrice[0].costGbPerMonth / 24 |
									number:4}}/day </p>
								</b>
							</div>
						</div>
					</div>
					</div>
					<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
					<div class="form-group" ng-class="{'text-danger': storageForm.zone.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-6 col-sm-6 control -label font-normal"><fmt:message key="common.zonename" bundle="${msg}" />
							<span class="text-danger">*</span></label>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<select data-ng-init="storage.zone = zoneList[0]" required="true"
									class="form-control input-group" name="zone"
									data-ng-model="storage.storagePrice[0].zone"
									ng-options=" zone.name for zone in zoneList"
									data-ng-class="{'error': storageForm.zone.$invalid && formSubmitted}">
									<option value="" class="">Select</option>
								</select>
								<div class="error-area"
									data-ng-show="storageForm.zone.$invalid && formSubmitted">
									<div class="error-area"
										data-ng-show="storageForm.zone.$invalid && formSubmitted">
										<i ng-attr-tooltip="{{ '<fmt:message key="template.zone.error" bundle="${msg}" />' }}"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<div data-ng-show="storage.qosType == 'Storage'" >
						<div class="form-group" data-ng-if="!storage.isCustomizedIops">
							<div class="row">
								<label
									class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.cost.for.iops" bundle="${msg}" /> (<app-currency class="text-danger"></app-currency>)
								</label>
								<div class="col-md-4  col-sm-4 col-xs-4">
									<input type="text" name="costperiops" valid-price
										data-ng-model="storage.storagePrice[0].costPerIops" class="form-control">
								</div>
								<div class="col-md-4 col-sm-4 col-xs-4">
								<b>
									<p class="text-danger">{{ storage.storagePrice[0].costPerIops /24 |
									number:4 }}/day </p>
								</b>
							</div>

							</div>
						</div>
						<div class="form-group" data-ng-if="storage.isCustomizedIops">
							<div class="row">
								<label
									class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.cost.per.iops" bundle="${msg}" /> (<app-currency class="text-danger"></app-currency>)
								</label>
								<div class="col-md-4  col-sm-4 col-xs-4">
									<input type="text" name="costperiops" valid-price
										data-ng-model="storage.storagePrice[0].costIopsPerMonth" class="form-control">
								</div>
								<div class="col-md-4 col-sm-4 col-xs-4">
								<b>
									<p class="text-danger m-t-sm">{{ storage.storagePrice[0].costIopsPerMonth /24 | number:4 }}/day </p>
								</b>
							</div>
							</div>
						</div>
					</div>
					</div>
					</div>

				<div class="row">
					<div class="col-md-12  col-sm-12">
						<span class="pull-right"> <a
							class="btn btn-default btn-outline"
							ui-sref="servicecatalog.list-storage"><fmt:message key="common.cancel" bundle="${msg}" /></a>
							<button class="btn btn-info" type="submit"
								ng-disabled="form.storageForm.$invalid"><fmt:message key="common.create" bundle="${msg}" /></button>
						</span>
					</div>
				</div>
				</div>
				</div>
			</form>

