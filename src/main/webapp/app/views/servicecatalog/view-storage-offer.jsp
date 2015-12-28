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
										key="storage.public" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6"> <b>{{storage.isPublic || " N/A "}} </b>
<!--                                 <input  type="text" name="public" data-ng-model="storage.isPublic" class="form-control" readonly>
 -->                            </div>
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
<!--                                 <input  type="text" name="storagetype" data-ng-model="storage.storageType" class="form-control" readonly>
 -->                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal"><fmt:message
									key="storage.storagetag" bundle="${msg}" /></label>
                            <div class="col-md-6 col-sm-6 col-xs-6"> <b>{{storage.storageTags || " N/A "}} </b>
<!--                                 <input  type="text" name="storagetag" data-ng-model="storage.storageTags" class="form-control" readonly>
 -->                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-6 col-sm-6 col-xs-6 control-label font-normal" ><fmt:message
									key="storage.qostype" bundle="${msg}" /></label>
                            <div class="col-md-6  col-sm-6 col-xs-6"> <b>{{storage.qosType || " N/A "}} </b>
<!--                                 <input  type="text" name="qostype" data-ng-model="storage.qosType" class="form-control"readonly >
 -->
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
<!--                                 <input  type="text" valid-number name="size" data-ng-model="storage.diskSize" class="form-control" readonly >
 -->
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
				<div class="form-group" >
						<div class="row">
							<label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.cost.per.gb.per.month" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)
							</label>
							<div class="col-md-1 col-sm-2 col-xs-4"> <b>{{storage.storagePrice[0].costGbPerMonth || " N/A "}} </b>
								<!-- <input data-ng-change="costPerHourGB()" type="text" valid-decimal name="costmonth"
									data-ng-model="storage.storagePrice[0].costGbPerMonth" class="form-control"> -->
							</div>
							<div class="col-md-4 col-sm-4 col-xs-4" data-ng-show="storage.storagePrice[0].costGbPerMonth">
								<b>
									<p class="text-danger m-t-xxs">{{ storage.costPerHourGB }}/hr</p>
								</b>
							</div>

						</div>
					</div>
					<div data-ng-show="storage.qosType == 'Storage'">
						<div class="form-group">
							<div class="row">
								<label
									class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.cost.per.iops" bundle="${msg}" /> (<app-currency class="text-danger"></app-currency>)
								</label>
								<div class="col-md-1  col-sm-2 col-xs-4"> <b>{{storage.storagePrice[0].costIopsPerMonth || " N/A "}} </b>
<!-- 									<input type="text" data-ng-keyup="costPerHourIOPS()" name="costperiops" valid-number
										data-ng-model="storage.storagePrice[0].costIopsPerMonth" class="form-control"> -->
								</div>
								<div class="col-md-4 col-sm-4 col-xs-4">
								<b>
									<p class="text-danger m-t-xxs">{{ storage.costPerHourIOPS }}/hr</p>
								</b>
							</div>

							</div>
						</div>
					</div>
				</div>



				<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12">
					<div class="form-group">
						<div class="row">
							<label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.zonename" bundle="${msg}" /></label> <b>{{ zoneList[0].name }}</b>
							 <!-- <div class="col-md-6 col-sm-6 col-lg-6 col-xs-6"> -->

						<%-- <div class="form-group">
						<div class="row">
							<label class="col-md-6 col-sm-6 control-label font-normal"><fmt:message key="common.zonename" bundle="${msg}" /></label>
							<div class="col-md-6 col-sm-6 col-xs-6">
								{{ zoneList[0].name }} --%>

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
								ng-disabled="form.storageForm.$invalid"><fmt:message key="common.apply" bundle="${msg}" /></button>
						</span>
					</div>
				</div>
			</div>
        </div>
    </div>
</form>


