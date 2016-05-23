<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="domainForm" data-ng-submit="save(domainForm)" method="post"
	novalidate="">
	<input type="hidden" name="passwordErrorMessage" id="passwordErrorMessage" data-ng-model="account.passwordErrorMessage" value='<fmt:message key="please.check.confirm.password" bundle="${msg}" />' />
		<div class="inmodal">
		<div class="modal-header">
			<panda-modal-header id="add_company_page_title" page-icon="fa fa-user-plus" hide-zone="false"
				page-title='Add Company'></panda-modal-header>
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
										<input required="true" type="text" name="name" id="add_company_company_name"
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
								ng-class="{'text-danger': domainForm.companyNameAbbreviation.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="company.name.abbreviation(domain.name)" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="text" name="companyNameAbbreviation" id = "add_company_company_name_abbrevation"
											data-ng-model="domain.companyNameAbbreviation" class="form-control"
											data-ng-class="{'error': domainForm.companyNameAbbreviation.$invalid && formSubmitted}">
										<i tooltip="This is will be Domain Name"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.companyNameAbbreviation.$invalid && formSubmitted">
											<i
												ng-attr-tooltip="{{ domainForm.companyNameAbbreviation.errorMessage || 'company Name Abbreviation required' }}"
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
										<input type="text" required="true" name="companyAddress" id="add_company_company_address"
											data-ng-model="domain.companyAddress" class="form-control"
											data-ng-class="{'error': domainForm.companyAddress.$invalid && formSubmitted}">
										<i tooltip="Company address of the company"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.companyAddress.$invalid && formSubmitted">
											<i
												ng-attr-tooltip="{{ domainForm.companyAddress.errorMessage || 'Company Address required' }}"
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
										<input required="true" type="text" name="cityHeadquarter" id="add_company_city_headquarters"
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
						<div class="col-md-6 col-sm-6">
						     <div class="form-group"
								ng-class="{'text-danger': domainForm.portalUserName.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="portal.user.name" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input type="text" required="true" name="portalUserName" id="add_company_portal_user_name"
											data-ng-model="domain.portalUserName" class="form-control"
											data-ng-class="{'error': domainForm.portalUserName.$invalid && formSubmitted}">
										<i tooltip="Name of the portal user"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										<div class="error-area"
											data-ng-show="domainForm.portalUserName.$invalid && formSubmitted">
											<i ng-attr-tooltip="{{ domainForm.portalUserName.errorMessage || 'Portal user name required' }}"
												class="fa fa-warning error-icon"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group"
								ng-class="{'text-danger': domainForm.password.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="common.password" bundle="${msg}" /><span
										class="text-danger">*</span></label>
									<div class="col-md-6 col-sm-6">
										  <input required="true" type="password" id="password" name="password" id="add_company_password"
											data-ng-model="domain.password" class="form-control"
											data-ng-class="{'error': domainForm.password.$invalid && formSubmitted}">
										<i tooltip="Password of the portal user name"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
									<div class="error-area" data-ng-show="domainForm.password.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="password.is.required" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
									</div>
								</div>
							</div>

							<div class="form-group" ng-class="{'text-danger': domainForm.confirmPassword.$invalid && formSubmitted}">
								<div class="row">
									<label class="col-md-4 col-sm-4 control-label"><fmt:message key="confirm.password" bundle="${msg}" /><span class="text-danger">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input required="true" type="password" id="confirmPassword" name="confirmPassword" id="add_company_confirm_password"
											data-ng-model="account.confirmPassword" class="form-control"
											data-ng-class="{'error': domainForm.confirmPassword.$invalid && formSubmitted}">
										<i tooltip="Confirm Password of the company"
											class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
									     <div class="error-area" data-ng-show="domainForm.confirmPassword.$invalid && formSubmitted" >
                                    <i ng-attr-tooltip="{{ domainForm.confirmPassword.errorMessage || '<fmt:message key="confirm.password.is.required" bundle="${msg}" />' }}" class="fa fa-warning error-icon"></i>
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
									ng-class="{'text-danger': domainForm.primaryFirstNames.$invalid && formSubmitted}">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="first.name" bundle="${msg}" /><span class="text-danger">*</span>
										</label>
										<div class="col-md-6 col-sm-6">
											<input type="text" name="primaryFirstNames" id="add_company_primary_first_names"
												data-ng-model="domain.primaryFirstName" class="form-control"
												data-ng-class="{'error': domainForm.primaryFirstNames.$invalid && formSubmitted}" required>
											<i tooltip="Primary first name of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											<div class="error-area"
												data-ng-show="domainForm.primaryFirstNames.$invalid && formSubmitted">
												<i ng-attr-tooltip="{{ domainForm.primaryFirstNames.errorMessage || 'Primary first name required' }}"
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
											<input type="text"  required="true" name="lastName" id="add_company_primary_last_name"
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
											<input required="true"type="email" name="email" id="add_company_primary_email_id"
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
											<input type = "text" required="true" id="add_company_primary_phone_number" ng-model="domain.phone" name="phone" ng-pattern="/^\d+$/"  maxlength="14" class="form-control"
												data-ng-class="{'error': domainForm.email.$invalid && formSubmitted}">
											<span class="text-danger" ng-show="domainForm.phone.$error.pattern">Numbers only allowed!</span>
											<span class="text-danger" ng-show="domainForm.phone.$error.maxlength">Not a valid range!</span>

											<i tooltip="Phone of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											<div class="error-area"
												data-ng-show="domainForm.phone.$invalid && formSubmitted">
												<i ng-attr-tooltip="{{ domainForm.phone.errorMessage || 'Phone required' }}"
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
											<input type="text" name="primaryFirstName" id="add_company_secondary_first_name"
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
											<input type="text" name="SecondarylastName" id="add_company_secondary_last_name"
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
											<input type="email" name="Secondaryemail" data-ng-model="domain.secondaryContactEmail" id="add_company_secondary_email_id"
												class="form-control" data-ng-class="{'error': domainForm.Secondaryemail.$invalid && formSubmitted}"> <i
												tooltip="Email of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
												<div class="error-area"
												data-ng-show="domainForm.Secondaryemail.$invalid && formSubmitted">
												<i
													ng-attr-tooltip="{{ domainForm.Secondaryemail.errorMessage || 'Email required' }}"
													class="fa fa-warning error-icon"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<label class="col-md-4 col-sm-4 control-label"><fmt:message key="phone.number" bundle="${msg}" /></label>
										<div class="col-md-6 col-sm-6">
											<input type = "text" id="add_company_secondary_phone_number" ng-model="domain.secondaryContactPhone" name="Secondaryphone" ng-pattern="/^\d+$/"  maxlength="14" class="form-control">
											<span class="text-danger" ng-show="domainForm.Secondaryphone.$error.pattern">Numbers only allowed!</span>
											<span class="text-danger" ng-show="domainForm.Secondaryphone.$error.maxlength">Not a valid range!</span>
											<i tooltip="Phone of the company"
												class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
										</div>
										<div class="error-area"
												data-ng-show="domainForm.Secondaryphone.$invalid && formSubmitted">
												<i ng-attr-tooltip="{{ domainForm.Secondaryphone.errorMessage || 'Phone required' }}"
													class="fa fa-warning error-icon"></i>
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
            <get-loader-image data-ng-show="showLoader"></get-loader-image>

			<a class="btn btn-default" id="add_company_cancel_button" data-ng-hide="showLoader" data-ng-click="cancel()"><fmt:message key="common.cancel" bundle="${msg}" /></a>
			<button class="btn btn-info" id="add_company_add_button" data-ng-hide="showLoader" type="submit"><fmt:message key="common.add" bundle="${msg}" />	</button>
		</div>

	</div>
</form>