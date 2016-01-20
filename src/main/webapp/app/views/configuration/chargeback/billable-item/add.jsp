<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form name="billableForm" data-ng-submit="saveBillableItem(billableForm)" method="post"
	novalidate="" >
	<div class="inmodal">
		<div class="modal-header">
			<panda-modal-header hide-zone="true" page-icon="fa fa-plus-circle" page-title="<fmt:message key="billable.item.add" bundle="${msg}" />"></panda-modal-header>
		</div>

		<div class="modal-body">
			<div class="row">
				<div class="col-md-12 col-sm-12">
						<div class="form-group"
							ng-class="{'text-danger': billableForm.name.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-4 col-sm-5 control-label"><fmt:message key="common.name" bundle="${msg}" />:
									<span class="text-danger">*</span>
								</label>

								<div class="col-md-6 col-sm-7">
									<input required="true" type="text" name="name"
										data-ng-model="billableItem.name" class="form-control"
										ng-class="{'error' : billableForm.name.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="billableItem.help.name" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="billableForm.name.$invalid && formSubmitted">
										<i data-ng-attr-tooltip="{{ billableForm.name.errorMessage || '<fmt:message key="billableItem.error.name" bundle="${msg}" />' }}"
											class="fa fa-warning error-icon"></i>
									</div>

								</div>

							</div>
						</div>
						<div class="form-group"
							ng-class="{'text-danger': billableForm.billableType.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-4 col-sm-5 control-label"><fmt:message key="common.type" bundle="${msg}" />:
									<span class="text-danger">*</span>
								</label>

								<div class="col-md-6 col-sm-7">

									<select required="true" class="form-control input-group" name="billableType" data-ng-model="billableItem.billableType"  >
	                                    <option value="0">Infrastructure</option>
	                                    <option value="1">Managed</option>
	                                    <option value="2">Optional</option>
	                                </select>

									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="billableItem.help.billableType" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="billableForm.billableType.$invalid && formSubmitted">
										<i data-ng-attr-tooltip="{{ '<fmt:message key="billableItem.error.billableType" bundle="${msg}" />' }}"
											class="fa fa-warning error-icon"></i>
									</div>

								</div>

							</div>
						</div>
						<div class="form-group"
							ng-class="{'text-danger': billableForm.billableUnit.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-4 col-sm-5 control-label"><fmt:message key="common.type" bundle="${msg}" />:
									<span class="text-danger">*</span>
								</label>

								<div class="col-md-6 col-sm-7">

									<select required="true" class="form-control input-group" name="billableUnit" data-ng-model="billableItem.billableUnit"  >
	                                    <option value="0">Infrastructure</option>
	                                    <option value="1">Managed</option>
	                                    <option value="2">Optional</option>
	                                </select>

									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="billableItem.help.billableUnit" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="billableForm.billableUnit.$invalid && formSubmitted">
										<i data-ng-attr-tooltip="{{ '<fmt:message key="billableItem.error.billableUnit" bundle="${msg}" />' }}"
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
		<get-loader-image data-ng-show="showLoader"></get-loader-image>

		<button type="button" class="btn btn-default "
			data-ng-hide="showLoader" ng-click="cancel()" data-dismiss="modal">
			<fmt:message key="common.cancel" bundle="${msg}" />
		</button>
		<button data-ng-hide="showLoader" class="btn btn-info" type="submit">
			<fmt:message key="common.add" bundle="${msg}" />
		</button>

	</div>
	</div>
</form>