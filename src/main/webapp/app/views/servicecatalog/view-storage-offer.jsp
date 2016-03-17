<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="storageForm" data-ng-submit="update(storageForm)" data-ng-controller="storageEditCtrl" method="post" novalidate="" >
    <div class="hpanel">
        <div class="panel-body">
            <div class="row  ">
                <div class="col-md-12"><h4><label><fmt:message key="edit.disk.offer"
								bundle="${msg}" /></label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group" ng-class="{'text-danger': storageForm.name.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message
									key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
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
                            <label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message
									key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
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
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
										key="common.company" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6"> <b>{{storage.domain.name || " - "}} </b>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" ><fmt:message
									key="storage.storagetype" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6"> <b>{{storage.storageType || " N/A "}} </b>
                           </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="storage.storagetag" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6"> <b>{{storage.storageTags || " - "}} </b>
                           </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" ><fmt:message
									key="storage.qostype" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-6"> <b>{{storage.qosType || " N/A "}} </b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4" >
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="common.size" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6"> <b>{{storage.diskSize || " N/A "}} </b>
                            </div>
                        </div>

                    </div>
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
						</div>
					</div>
							<div class="form-group" data-ng-if="storage.isCustomDisk " >
						<div class="row">
							<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.cost.per.gb.per.month" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)
							</label>
							<div class="col-md-4 col-sm-4 col-xs-4">
								<input type="text" valid-price name="costmonth"
									data-ng-model="storage.storagePrice[0].costGbPerMonth" class="form-control">
							</div>

						</div>
					</div>

				</div>
				<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
					<div class="form-group" ng-class="{'text-danger': storageForm.zone.$invalid && formSubmitted}">
						<div class="row">
							<label class="col-md-4 col-sm-6 control-label font-normal"><fmt:message key="common.zonename" bundle="${msg}" /><span class="text-danger">*</span></label>
							<div class="col-md-6  col-sm-5 col-xs-4">
								<select required="true"

									class="form-control input-group" name="zone"
									data-ng-model="storage.zone" data-ng-class="{'error': storageForm.zone.$invalid && formSubmitted}"
									ng-options="zone.name for zone in zoneList">
									<option value="" class=""><fmt:message
									key="common.select" bundle="${msg}" />
									</option>
								</select>
								<div class="error-area"
											data-ng-show="storageForm.zone.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ storageForm.zone.errorMessage || '<fmt:message key="zone.is.required" bundle="${msg}" />' }}"
												class="fa fa-warning error-icon">
											</i>
										</div>
							</div>							</div>
						</div>
					</div>

				<div class="row">
					<div class="col-md-12  col-sm-12">
						<span class="pull-right">
						<get-loader-image data-ng-show="showLoader"></get-loader-image>
						<a data-ng-hide="showLoader" class="btn btn-default" ui-sref="servicecatalog.list-storage">
						    <fmt:message key="common.cancel" bundle="${msg}" /></a>
							<button data-ng-hide="showLoader" class="btn btn-info" type="submit"
								ng-disabled="form.storageForm.$invalid"><fmt:message key="common.apply" bundle="${msg}" /></button>
						</span>
					</div>
				</div>
				</div>
				</div>
			</div>
</form>


