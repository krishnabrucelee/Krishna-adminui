<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form name="domainForm" data-ng-submit="update(domainForm)" method="post" novalidate="">
	<div class="inmodal" >
	<div class="modal-header">
		<panda-modal-header page-icon="fa fa-user-plus" hide-zone="false" page-title='Edit Domain'></panda-modal-header>
	</div>
	<div class="modal-body">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="form-group"
								ng-class="{'text-danger': domainForm.name.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="company.name" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="text" id="name" name="name"
											data-ng-model="domain.name" class="form-control"
											data-ng-class="{'error': domainForm.name.$invalid && formSubmitted}">
										<i tooltip="Name of the company"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.name.$invalid && formSubmitted">
											<i
												ng-attr-tooltip="{{ domainForm.name.errorMessage || 'Name required' }}"
												class="fa fa-warning error-icon"></i>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group"
								ng-class="{'text-danger': domainForm.companyNameAbb.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="company.name.abbreviation(domain.name)" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="text" name="companyNameAbb"
											data-ng-model="domain.companyNameAbbreviation" class="form-control"
											data-ng-class="{'error': domainForm.companyNameAbb.$invalid && formSubmitted}">
										<i tooltip="Abbreviation of the company name"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.companyNameAbb.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ domainForm.companyNameAbb.errorMessage || 'company Name Abbreviation required' }}"
												class="fa fa-warning error-icon"></i>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group"
								ng-class="{'text-danger': domainForm.companyAddress.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="company.address" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="text" name="companyAddress"
											data-ng-model="domain.companyAddress" class="form-control"
											data-ng-class="{'error': domainForm.companyAddress.$invalid && formSubmitted}">
										<i tooltip="Company address of the company"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.companyAddress.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ domainForm.companyAddress.errorMessage || 'Company Address required' }}"
												class="fa fa-warning error-icon"></i>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="col-md-6 col-sm-6">
							<div class="form-group"
								ng-class="{'text-danger': domainForm.portalUserName.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="portal.user.name" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="text" name="portalUserName"
											data-ng-model="domain.portalUserName" class="form-control"
											data-ng-class="{'error': domainForm.portalUserName.$invalid && formSubmitted}">
										<i tooltip="Name of the portal user"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.portalUserName.$invalid && formSubmitted">
											<i
												ng-attr-tooltip="{{ domainForm.portalUserName.errorMessage || 'Portal user name required' }}"
												class="fa fa-warning error-icon"></i>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group"
								ng-class="{'text-danger': domainForm.cityHeadquarter.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="city.headquarters" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="text" name="cityHeadquarter"
											data-ng-model="domain.cityHeadquarter" class="form-control"
											data-ng-class="{'error': domainForm.cityHeadquarter.$invalid && formSubmitted}">
										<i tooltip="City head quarter of the company"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.cityHeadquarter.$invalid && formSubmitted">
											<i
												ng-attr-tooltip="{{ domainForm.cityHeadquarter.errorMessage || 'City head quarter required' }}"
												class="fa fa-warning error-icon"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-6 col-sm-6">

							<fieldset class="scheduler-border ">
								<legend class="scheduler-border"><fmt:message key="primary.contact" bundle="${msg}" /></legend>
								<div class="form-group"
									ng-class="{'text-danger': domainForm.primaryFirstName.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="first.name" bundle="${msg}" /><span class="text-danger">*</span>
										</label>
										<div class="col-md-6 col-sm-6">
											<input required="true" type="text" name="primaryFirstName"
												data-ng-model="domain.primaryFirstName" class="form-control"
												data-ng-class="{'error': domainForm.primaryFirstName.$invalid && formSubmitted}">
											<i tooltip="Primary first name of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											<div class="error-area"
												data-ng-show="domainForm.primaryFirstName.$invalid && formSubmitted">
												<i
													ng-attr-tooltip="{{ domainForm.primaryFirstName.errorMessage || 'Primary first name required' }}"
													class="fa fa-warning error-icon"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group"
									ng-class="{'text-danger': domainForm.lastName.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="last.name" bundle="${msg}" /><span class="text-danger">*</span>
										</label>
										<div class="col-md-6 col-sm-6">
											<input required="true" type="text" name="lastName"
												data-ng-model="domain.lastName" class="form-control"
												data-ng-class="{'error': domainForm.lastName.$invalid && formSubmitted}">
											<i tooltip="Last name of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											<div class="error-area"
												data-ng-show="domainForm.lastName.$invalid && formSubmitted">
												<i
													ng-attr-tooltip="{{ domainForm.lastName.errorMessage || 'Last name required' }}"
													class="fa fa-warning error-icon"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group"
									ng-class="{'text-danger': domainForm.email.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="email.id" bundle="${msg}" /><span
											class="text-danger">*</span></label>
										<div class="col-md-6 col-sm-6">
											<input type="text" name="email"
												data-ng-model="domain.email" class="form-control"
												data-ng-class="{'error': domainForm.email.$invalid && formSubmitted}">
											<i tooltip="Email of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											<div class="error-area"
												data-ng-show="domainForm.email.$invalid && formSubmitted">
												<i
													ng-attr-tooltip="{{ domainForm.email.errorMessage || 'Email required' }}"
													class="fa fa-warning error-icon"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group"
									ng-class="{'text-danger': domainForm.phone.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="phone.number" bundle="${msg}" /><span
											class="text-danger">*</span></label>
										<div class="col-md-6 col-sm-6">
											<input required="true" type="text" valid-number name="phone"
												data-ng-model="domain.phone" class="form-control"
												data-ng-class="{'error': domainForm.phone.$invalid && formSubmitted}">
											<i tooltip="Phone of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											<div class="error-area"
												data-ng-show="domainForm.phone.$invalid && formSubmitted">
												<i
													ng-attr-tooltip="{{ domainForm.phone.errorMessage || 'Phone required' }}"
													class="fa fa-warning error-icon"></i>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</div>


						<div class="col-md-6 col-sm-6">

							<fieldset class="scheduler-border ">
								<legend class="scheduler-border"><fmt:message key="secondary.contact" bundle="${msg}" /></legend>
								<div class="form-group">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="first.name" bundle="${msg}" /></label>
										<div class="col-md-6 col-sm-6">
											<input type="text" name="primaryFirstName"
												data-ng-model="domain.secondaryContactName" class="form-control">
											<i tooltip="Secondary first name of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="last.name" bundle="${msg}" /></label>
										<div class="col-md-6 col-sm-6">
											<input type="text" name="lastName"
												data-ng-model="domain.secondaryContactLastName" class="form-control">
											<i tooltip="Last name of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
								<label class="col-md-4 col-sm-4 control-label"><fmt:message key="email.id" bundle="${msg}" /></label>

										<div class="col-md-6 col-sm-6">
											<input type="text" name="email" data-ng-model="domain.secondaryContactEmail"
												class="form-control"> <i
												tooltip="Email of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="phone.number" bundle="${msg}" /></label>
										<div class="col-md-6 col-sm-6">
											<input type="text" valid-number name="phone"
												data-ng-model="domain.secondaryContactPhone" class="form-control">
											<i tooltip="Phone of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>

										</div>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="modal-footer">

            <a class="btn btn-default"  data-ng-click="cancel()"><fmt:message key="common.cancel" bundle="${msg}" /></a>
            <button class="btn btn-info" type="submit"><fmt:message key="common.add" bundle="${msg}" /></button>
        </div>

    </div>
</form>