<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="taxForm" data-ng-submit="updateTax(taxForm)" method="post" novalidate="" >
	<div class="inmodal">
		<div class="modal-header">
			<panda-modal-header hide-zone="true" page-icon="fa fa-edit" page-title="<fmt:message key="tax.edit" bundle="${msg}" />"></panda-modal-header>
		</div>

		<div class="modal-body">
			<div class="row">
				<div class="col-md-12 col-sm-12">
						<div class="form-group"
							ng-class="{'text-danger': taxForm.name.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-4 col-sm-5 control-label"><fmt:message key="common.name" bundle="${msg}" />:
									<span class="text-danger">*</span>
								</label>

								<div class="col-md-6 col-sm-7">
									<input readonly required="true" type="text" name="name"
										data-ng-model="tax.name" class="form-control"
										ng-class="{'error' : taxForm.name.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="tax.help.name" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="taxForm.name.$invalid && formSubmitted">
										<i data-ng-attr-tooltip="{{ taxForm.name.errorMessage || '<fmt:message key="tax.error.name" bundle="${msg}" />' }}"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"
							ng-class="{'text-danger': taxForm.description.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-4 col-sm-5 control-label"><fmt:message key="common.description" bundle="${msg}" />:
									<span class="text-danger">*</span>
								</label>

								<div class="col-md-6 col-sm-7">
									<input required="true" type="text" name="description"
										data-ng-model="tax.description" class="form-control"
										ng-class="{'error':taxForm.description.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="tax.help.description" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="taxForm.description.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="tax.error.description" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>



								</div>

							</div>
						</div>
						<div class="form-group"
							ng-class="{'text-danger' :taxForm.percentage.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-4 col-sm-5 control-label"><fmt:message key="common.percentage" bundle="${msg}" />:
									<span class="text-danger">*</span>
								</label>

								<div class="col-md-6 col-sm-7">
									<input required="true" type="number" name="percentage"
										data-ng-model="tax.percentage" class="form-control"
										ng-class="{'error' : taxForm.percentage.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="tax.help.percentage" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="taxForm.percentage.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="tax.error.percentage" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<get-loader-image data-ng-if="showLoader"></get-loader-image>

		<button type="button" class="btn btn-default "
			data-ng-if="!showLoader" ng-click="cancel()" data-dismiss="modal">
			<fmt:message key="common.cancel" bundle="${msg}" />
		</button>
		<button data-ng-hide="showLoader" class="btn btn-info" type="submit">
			<fmt:message key="common.update" bundle="${msg}" />
		</button>

	</div>
	</div>
</form>
