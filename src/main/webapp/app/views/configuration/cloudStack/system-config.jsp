<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-controller="cloudStackCtrl"
	method="post" novalidate="" data-ng-submit="save(configForm)">

	<div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<span class="pull-left"> <a class="btn btn-info"
								href="#/configuration/cloudstack" title="<fmt:message key="common.back" bundle="${msg}" />"><span
									class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message
										key="common.back" bundle="${msg}" /></a>
							</span>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="panel-body">
					<div class="col-md-7 col-sm-7 ">
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.URL.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="url" bundle="${msg}" />: <span class="text-danger">*</span>
								</label>
								<div class="col-md-7 col-sm-7" >
									<input required="true" type="url" name="URL"
										class="form-control" data-ng-model="config.apiURL" data-ng-readonly = "config.id"
										data-ng-class="{'error': configForm.URL.$invalid && formSubmitted}">

									<div class="error-area"
										data-ng-show="configForm.URL.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="iso.url.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i>
									</div>
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="url.cloudstack" bundle="${msg}" />"></i>
								</div>
							</div>
						</div>
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.rootAPI.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="root.api.key" bundle="${msg}" />: <span
									class="text-danger">*</span> </label>
								<div class="col-md-7 col-sm-7">
									<input required="true" type="text" name="rootAPI"
										class="form-control" data-ng-model="config.apiKey" data-ng-readonly = "config.id"
										data-ng-class="{'error': configForm.rootAPI.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="api.key.cloudstack" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="configForm.rootAPI.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="root.api" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"
							data-ng-class="{'text-danger': configForm.secretKey.$invalid && formSubmitted}">
							<div class="row">
								<label class="col-md-3 col-sm-3 control-label"><fmt:message
										key="secret.key" bundle="${msg}" />: <span
									class="text-danger">*</span> </label>

								<div class="col-md-7 col-sm-7">
									<input required="true" type="text" name="secretKey"
										class="form-control" data-ng-model="config.secretKey" data-ng-readonly = "config.id"
										data-ng-class="{'error': configForm.secretKey.$invalid && formSubmitted}">
									<i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"
										tooltip="<fmt:message key="secret.key.cloudstack" bundle="${msg}" />"></i>
									<div class="error-area"
										data-ng-show="configForm.secretKey.$invalid && formSubmitted">
										<i tooltip="<fmt:message key="secret.key.required" bundle="${msg}" />"
											class="fa fa-warning error-icon"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<span class="pull-right">
								<get-loader-image data-ng-show="showLoader"></get-loader-image>
									<button data-ng-if = "!config.id" class="btn btn-info" type="submit"  data-ng-hide="showLoader"
										ng-disabled="form.configForm.$invalid">

										<fmt:message key="common.save" bundle="${msg}" />
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>