<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <form name="configForm" data-ng-submit="save(configForm)" method="post" novalidate="" data-ng-controller="paymentGatewayCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/chargeback"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
					<div class="col-md-7 col-sm-7 ">
					<div class="form-group"
							data-ng-class="{'text-danger': configForm.partnerID.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="partner.id" bundle="${msg}" />: <span
									class="text-danger">*</span> </label>
								<div class="col-md-7 col-sm-7">
									<input required="true" type="text" name="partnerID"
										class="form-control" data-ng-model="payment.partner"
										data-ng-class="{'error': configForm.partnerID.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="Partner id"></i>
									<div class="error-area"
										data-ng-show="configForm.partnerID.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="partner.id.is.required" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.notifyURL.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="notify.url" bundle="${msg}" />: <span class="text-danger">*</span>
								</label>

								<div class="col-md-7 col-sm-7">
									<input required="true" type="url" name="notifyURL"
										class="form-control" data-ng-model="payment.notifyURL"
										data-ng-class="{'error': configForm.notifyURL.$invalid && formSubmitted}">

									<div class="error-area"
										data-ng-show="configForm.notifyURL.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="notify.url.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
									</div>
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="The notifyURL for payment notification"></i>
								</div>
							</div>
						</div>
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.returnURL.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="return.url" bundle="${msg}" />: <span class="text-danger">*</span>
								</label>

								<div class="col-md-7 col-sm-7">
									<input required="true" type="url" name="returnURL"
										class="form-control" data-ng-model="payment.returnURL"
										data-ng-class="{'error': configForm.returnURL.$invalid && formSubmitted}">

									<div class="error-area"
										data-ng-show="configForm.returnURL.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="return.url.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
									</div>
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="The returnURL for payment notification"></i>
								</div>
							</div>
						</div>
						<div class="form-group" data-ng-class="{'text-danger': configForm.serviceType.$invalid && formSubmitted}">
								<div class="row">
									<label
										class="col-md-3 col-sm-3 control-label"><fmt:message key="service" bundle="${msg}" />:
										<span	class="text-danger">*</span>
									</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<select required="true"	class="form-control input-group" name="serviceType"
											data-ng-model="payment.serviceType"
											data-ng-class="{'error': configForm.serviceType.$invalid && formSubmitted}"
											ng-options="serviceType for (id, serviceType) in formElements.serviceTypeList">
											<option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
										</select>
										<div class="error-area"
										data-ng-show="configForm.serviceType.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="service.type.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
									    </div>
									    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="service.type" bundle="${msg}" />"></i>
									</div>
								</div>
							</div>
							<div class="form-group" data-ng-class="{'text-danger': configForm.currencyType.$invalid && formSubmitted}">
								<div class="row">
									<label
										class="col-md-3 col-sm-3 control-label"><fmt:message key="currency.type" bundle="${msg}" />:
										<span	class="text-danger">*</span>
									</label>
									<div class="col-md-7  col-sm-7 col-xs-7">
										<select required="true"	class="form-control input-group" name="currencyType"
											data-ng-model="payment.currencyType"
											data-ng-class="{'error': configForm.currencyType.$invalid && formSubmitted}"
											ng-options="currencyType for (id, currencyType) in formElements.currencyTypeList">
											<option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
										</select>
										<div class="error-area"
										data-ng-show="configForm.currencyType.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="currency.type.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
									   </div>
									   <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="currency.type" bundle="${msg}" />"></i>
									</div>
								</div>
							</div>

						<div class="form-group"
							data-ng-class="{'text-danger': configForm.securityCode.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="security.code" bundle="${msg}" />: <span
									class="text-danger">*</span> </label>

								<div class="col-md-7 col-sm-7">
									<input required="true" type="text" name="securityCode"
										class="form-control" data-ng-model="payment.securityCode"
										data-ng-class="{'error': configForm.securityCode.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="MD5 32 bit key"></i>
									<div class="error-area"
										data-ng-show="configForm.securityCode.$invalid && formSubmitted">
										<i tooltip= "<fmt:message key="security.code.is.required" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.moduleDisplayName.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="module.display.name" bundle="${msg}" />: <span
									class="text-danger">*</span> </label>

								<div class="col-md-7 col-sm-7">
									<input required="true" type="text" name="moduleDisplayName"
										class="form-control" data-ng-model="payment.moduleDisplayName"
										data-ng-class="{'error': configForm.moduleDisplayName.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="module.display.name" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="configForm.moduleDisplayName.$invalid && formSubmitted">
										<i tooltip= "<fmt:message key="module.display.name.is.required" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.sellerEmail.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="seller.email" bundle="${msg}" />: <span
									class="text-danger">*</span> </label>

								<div class="col-md-7 col-sm-7">
									<input required="true" type='email' valid-email name="sellerEmail"
										class="form-control" data-ng-model="payment.sellerEmail"
										data-ng-class="{'error': configForm.sellerEmail.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="seller.email" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="configForm.sellerEmail.$invalid && formSubmitted">
										<i tooltip= "<fmt:message key="seller.email.is.required" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
							<div class="col-md-3 col-sm-3"></div>
								<div class="col-md-7 col-sm-7">
								<get-loader-image data-ng-show="showLoader"></get-loader-image>
									<button class="btn btn-info" type="submit"  data-ng-hide="showLoader"
										ng-disabled="form.configForm.$invalid">
										<fmt:message key="common.save" bundle="${msg}" />
									</button>
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>


    </div>
</form>

