<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="servicesForm" method="POST" data-ng-submit="edit(servicesForm, services)" novalidate >
<div class="inmodal ">
    <div class="modal-header">
        <panda-modal-header page-icon="fa-file-text fa" hide-zone="false"
			page-title="<fmt:message key="service.edit" bundle="${msg}" />">
        </panda-modal-header>
    </div>
    <div class="modal-body">
     	<div data-ng-show="showLoader" style="margin: 20%">
		    <get-loader-image data-ng-show="showLoader"></get-loader-image>
		</div>
     	<div data-ng-hide="showLoader">
	               <div class="form-group" data-ng-class="{ 'text-danger' : servicesForm.serviceCode.$invalid && formSubmitted}">
                        <div class="row">
                            <label  class="col-md-3 col-xs-12 col-sm-2 control-label"><fmt:message key="service.code" bundle="${msg}" />
                                <span class="text-danger">*</span>
                            </label>
                            <div class="col-md-5 col-xs-12 col-sm-5">
                                <input required="true" type="text" name="serviceCode" data-ng-model="services.serviceCode" class="form-control" data-ng-class="{'error': servicesForm.serviceCode.$invalid && formSubmitted}" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="service.code" bundle="${msg}" />" ></i>
                                <div class="error-area" data-ng-show="servicesForm.serviceCode.$invalid && formSubmitted" >
                                <i ng-attr-tooltip="{{ servicesForm.serviceCode.errorMessage || '<fmt:message key="services.serviceCode.is.required" bundle="${msg}" />' }}"
									class="fa fa-warning error-icon">
								</i>
							</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" data-ng-class="{ 'text-danger' : servicesForm.serviceName.$invalid && formSubmitted}">
	                   <div class="row">
	                       <label  class="col-md-3 col-xs-12 col-sm-2 control-label"><fmt:message key="common.name" bundle="${msg}" />
	                           <span class="text-danger">*</span>
	                       </label>
	                       <div class="col-md-5 col-xs-12 col-sm-5">
	                           <input required="true" type="text" name="serviceName" data-ng-model="services.serviceName" class="form-control" data-ng-class="{'error': servicesForm.serviceName.$invalid && formSubmitted}" >
	                           <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="common.name" bundle="${msg}" />" ></i>
	                           <div class="error-area" data-ng-show="servicesForm.serviceName.$invalid && formSubmitted" >
	                           <i ng-attr-tooltip="{{ servicesForm.serviceName.errorMessage || '<fmt:message key="services.serviceName.is.required" bundle="${msg}" />' }}"
					           class="fa fa-warning error-icon">
				               </i>
			               </div>
	                       </div>
	                   </div>
	                </div>
                 <div class="form-group" data-ng-class="{ 'text-danger' : servicesForm.serviceCategory.$invalid && formSubmitted}">
                   <div class="row">
                       <label  class="col-md-3 col-xs-12 col-sm-2 control-label"><fmt:message key="service.category" bundle="${msg}" />
                           <span class="text-danger">*</span>
                       </label>
                       <div class="col-md-5 col-xs-12 col-sm-5">
                           <select required="true" class="form-control input-group" name=serviceCategory data-ng-model="services.serviceCategory" ng-options="serviceCategory.category for serviceCategory in formElements.serviceCategoryList" data-ng-class="{'error': servicesForm.serviceCategory.$invalid && formSubmitted}" >
                               <option value=""><fmt:message key="common.select" bundle="${msg}" /></option>
                           </select>
                           <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="service.category" bundle="${msg}" />" ></i>
                           <div class="error-area" data-ng-show="servicesForm.serviceCategory.$invalid && formSubmitted" >
                           <i ng-attr-tooltip="{{ servicesForm.serviceCategory.errorMessage || '<fmt:message key="servicecategory.category.is.required" bundle="${msg}" />' }}"
				           class="fa fa-warning error-icon">
			               </i>
		               </div>
                       </div>
                   </div>
                </div>
                <div class="form-group">
                   <div class="row">
                       <label  class="col-md-3 col-xs-12 col-sm-2 control-label"><fmt:message key="service.upload.icon" bundle="${msg}" /></label>
                       <div class="col-md-7 col-xs-12 col-sm-7">
                       <div class="pull-left panel-border">
                           <img src={{serviceIconImage}} alt="" >
                       </div>
                       <div class="pull-left m-l-md">
                           <input type="file" name="serviceIcon" accept=".ico" class="custom-file-input" file-model="services.serviceIconFile"/>
                           <span><label><fmt:message key="service.icon.file.size" bundle="${msg}" /></label></span>
                       </div>
		               </div>
                   </div>
                </div>
                <div class="form-group">
	                <div class="row">
	                   <label  class="col-md-3 col-xs-12 col-sm-2 control-label"><fmt:message key="service.unit.price" bundle="${msg}" />(<app-currency
						class="text-danger"></app-currency>) /<span class="ng-scope"><fmt:message key="service.unit.price.format" bundle="${msg}" /></span></label></label>
	                   <div class="col-md-5 col-xs-12 col-sm-5">
	                       <input type="text" valid-price name="unitPrice" data-ng-model="services.unitPrice" class="form-control" data-ng-class="{'error': servicesForm.unitPrice.$invalid && formSubmitted}" >
	                       <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="service.unit.price" bundle="${msg}" />" ></i>
	                </div>
	                </div>
                </div>
				<div class="form-group">
                   <div class="row">
                       <label  class="col-md-3 col-xs-12 col-sm-2 control-label"><fmt:message key="common.description" bundle="${msg}" /></label>
                       <div class="col-md-5 col-xs-12 col-sm-5">
                           <input type="text" name="description" data-ng-model="services.description" class="form-control">
                           <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="<fmt:message key="common.description" bundle="${msg}" />" ></i>
		               </div>
                   </div>
                </div>
           	<div class="row form-group text-center">
           		<a class="btn btn-default" ng-click="cancel()"> <fmt:message key="common.cancel" bundle="${msg}" /> </a>
				<button class="btn btn-info" data-ng-hide="showLoader" type="submit"><fmt:message key="common.update" bundle="${msg}" /></button>
           	</div>
	    </div>
    </div>
   </div>
</form>