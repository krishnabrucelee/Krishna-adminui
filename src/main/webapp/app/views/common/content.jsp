<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>
<ng-include id="menu"
	src="global.getViewPageUrl('common/navigation.jsp')"></ng-include>
<!-- Main Wrapper -->
<div id="wrapper">
	<div small-header class="normalheader transition ng-scope small-header">
		<div class="hpanel" tour-step order="1"
			content="Place your page title and breadcrumb. Select small or large header or give the user choice to change the size."
			placement="bottom">
			<div class="panel-body">
				<div id="hbreadcrumb" class="pull-left">
					<ol class="hbreadcrumb breadcrumb">
						<li><a ui-sref="dashboard"><fmt:message key="common.home"
									bundle="${msg}" /></a></li>
						<li ng-repeat="state in $state.$current.path"
							ng-switch="$last || !!state.abstract" ng-class="{active: $last}">
							<span ng-if="state.data.pageTitle === 'Create Compute Offer'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="create.compute.offer" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="create.compute.offer"
										bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Edit Compute Offer'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="edit.compute.offer" bundle="${msg}" /></a> <span
								ng-switch-when="true">{{ state.data.pageName }}</span>
							</span>
							<span ng-if="state.data.pageTitle === 'client'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="resource.allocation" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="resource.allocation" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Dashboard'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.dashboard" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.dashboard" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Compute'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="compute" bundle="${msg}" /></a> <span ng-switch-when="true"><fmt:message
										key="compute" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Service'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="service" bundle="${msg}" /></a> <span ng-switch-when="true"><fmt:message
										key="service" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Create Storage Offer'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="create.storage.offer" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="create.storage.offer"
										bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Edit Storage Offer'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="edit.storage.offer" bundle="${msg}" /></a> <span
								ng-switch-when="true">{{ state.data.pageName }}</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Storage'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="storage" bundle="${msg}" /></a> <span ng-switch-when="true"><fmt:message
										key="storage" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Miscellaneous'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.miscellaneous" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.miscellaneous"
										bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Configuration'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="configuration" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="configuration"
										bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Cloudstack'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="Cloudstack" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="Cloudstack"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'General'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="General" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="General"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Admin User'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="admin.user" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="admin.user"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Add Admin User'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="add.admin.user" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="add.admin.user"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Chargeback'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="Chargeback" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="Chargeback"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Resource Allocation'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="resource.allocation" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="resource.allocation"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Import Data'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="import.data" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="import.data"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Manual Usage'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="import.usage" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="import.usage"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Zone Description'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="zone.description" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="zone.description"
										bundle="${msg}" />
							</span>
							</span>
                        	<span ng-if="state.data.pageTitle === 'Template'">
	                         <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}">
	                         <fmt:message key="common.templates" bundle="${msg}" /></a>
	                         <span ng-switch-when="true"><fmt:message key="common.templates" bundle="${msg}" /></span>
                        	</span>
                        	<span ng-if="state.data.pageTitle === 'Create Template'">
	                         <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}">
	                         <fmt:message key="create.template" bundle="${msg}" /></a>
	                         <span ng-switch-when="true"><fmt:message key="create.template" bundle="${msg}" /></span>
                        	</span>
                        	<span ng-if="state.data.pageTitle === 'Edit Template'">
	                         <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}">
	                         <fmt:message key="edit.template" bundle="${msg}" /></a>
	                         <span ng-switch-when="true">{{ state.data.pageName }}</span>
                        	</span>
                        	<span ng-if="state.data.pageTitle === 'Template ISO'">
	                         <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}">
	                         <fmt:message key="template.iso" bundle="${msg}" /></a>
	                         <span ng-switch-when="true"><fmt:message key="template.iso" bundle="${msg}" /></span>
                        	</span>
                        	<span ng-if="state.data.pageTitle === 'Edit ISO'">
	                         <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}">
	                         <fmt:message key="edit.iso" bundle="${msg}" /></a>
	                         <span ng-switch-when="true">{{ state.data.pageName }}</span>
                        	</span>
                        	<span ng-if="state.data.pageTitle === 'Create ISO'">
	                         <a ng-switch-when="false"  href="{{'#' + state.url.format($state.params)}}">
	                         <fmt:message key="create.iso" bundle="${msg}" /></a>
	                         <span ng-switch-when="true"><fmt:message key="create.iso" bundle="${msg}" /></span>
                        	</span>
							<span ng-if="state.data.pageTitle === 'System Configuration'">
								<a ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="system.configuration" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message
										key="system.configuration" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Network'">
								<a ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.networks" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message
										key="common.networks" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Applications'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.applications" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.applications"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Clients'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.clients" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.clients"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Projects'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.projects" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.projects"
										bundle="${msg}" />

							</span>
							</span>
							<span id="company_page_title" ng-if="state.data.pageTitle === 'Company'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.company" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.company"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Add Client'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="add.client" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="add.client"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Edit Client'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="edit.client" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="edit.client"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Users'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.users" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.users"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Billable Items'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="billable.items" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="billable.items"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Tax'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="billable.items" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.tax"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Email Configuration'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="email.configuration" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="email.configuration"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Email Template'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="email.template" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="email.template"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Organization Details'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="organization.details" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="organization.details"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Login Security'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="login.security" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="login.security"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Sign up Setting'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="sign.up.setting" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="sign.up.setting"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Support'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.support" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.support"
										bundle="${msg}" />
							</span>
							</span>
								<span ng-if="state.data.pageTitle === 'Language'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.language" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.language"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Credit and Resource Threshold'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="credit.resource" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="credit.resource"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Payment Settings'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="payment.settings" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="payment.settings"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Billing Type Settings'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="billing.type.settings" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="billing.type.settings"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Invoice'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="invoice" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="invoice"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Promotional Code'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="promotional.code" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="promotional.code"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Add Promotional Code'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="add.promotional.code" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="add.promotional.code"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Discount'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="discount" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="discount"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Add Discount'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="add.discount" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="add.discount"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Late Fee'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="late.fee" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="late.fee"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Payment Gateway'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="payment.gateway" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="payment.gateway"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Currency'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="currency" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="currency"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Report'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.reports" bundle="${msg}" /></a> <span ng-switch-when="true"><fmt:message
										key="common.reports" bundle="${msg}" /></span>
							</span>
							<span ng-if="state.data.pageTitle === 'Invoice List Report'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.invoicelistreport" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.invoicelistreport"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Payment Report'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.paymentreport" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.paymentreport"
										bundle="${msg}" />
							</span>
							</span>
							<span ng-if="state.data.pageTitle === 'Client Usage Report'"> <a
								ng-switch-when="false"
								href="{{'#' + state.url.format($state.params)}}"><fmt:message
										key="common.clientusage" bundle="${msg}" /></a> <span
								ng-switch-when="true"><fmt:message key="common.clientusage"
										bundle="${msg}" />
							</span>
							</span>
						</li>
					</ol>
				</div>
				<%-- <h2 class="font-light m-b-xs">
					 <span id="compute_offer_page_title" ng-if="$state.current.data.pageTitle === 'Compute Offer'"><fmt:message key="compute.offer" bundle="${msg}" /></span>
					 <span id="storage_offer_page_title" ng-if="$state.current.data.pageTitle === 'Storage Offer'">
						<a ng-switch-when="false" ng-href="{{'#' + state.url.format($stateParams)}}"><fmt:message key="view.storage" bundle="${msg}" /></a>
					    <span ng-switch-when="true">{{ state.data.pageName }</span>
					 </span>
				     <span id="edit_template_page_title" ng-if="$state.current.data.pageTitle === 'Edit Template'"><fmt:message key="edit.template" bundle="${msg}" /></span>
				     <span id="create_template_page_title" ng-if="$state.current.data.pageTitle === 'Create Template'"><fmt:message key="create.template" bundle="${msg}" /></span>
				     <span id="templates_page_title" ng-if="$state.current.data.pageTitle === 'Template'"><fmt:message key="common.templates" bundle="${msg}" /></span>
				     <span id="template_iso_page_title" ng-if="$state.current.data.pageTitle === 'Template ISO'"><fmt:message key="template.iso" bundle="${msg}" /></span>
				     <span id="edit_iso_page_title" ng-if="$state.current.data.pageTitle === 'Edit ISO'"><fmt:message key="edit.iso" bundle="${msg}" /></span>
				     <span id="create_iso_page_title" ng-if="$state.current.data.pageTitle === 'Create ISO'"><fmt:message key="create.iso" bundle="${msg}" /></span>
	                 <span id="create_storage_offer_page_title" ng-if="$state.current.data.pageTitle === 'Create Storage Offer'"><fmt:message key="create.storage.offer" bundle="${msg}" /></span>
	                 <span id="create_compute_offer_page_title" ng-if="$state.current.data.pageTitle === 'Create Compute Offer'"><fmt:message key="create.compute.offer" bundle="${msg}" /></span>
	                 <span id="edit_compute_offer_page_title" ng-if="$state.current.data.pageTitle === 'Edit Compute Offer'"><fmt:message key="edit.compute.offer" bundle="${msg}" /></span>
	                 <span id="edit_storage_offer_page_title" ng-if="$state.current.data.pageTitle === 'Edit Storage Offer'"><fmt:message key="edit.storage.offer" bundle="${msg}" /></span>
				     <span id="company_page_title" ng-if="$state.current.data.pageTitle === 'Company'"><fmt:message key="common.company" bundle="${msg}" /></span>
				     <span id="applications_page_title" ng-if="$state.current.data.pageTitle === 'Applications'"><fmt:message key="common.applications" bundle="${msg}" /></span>
				     <span id="projects_page_title" ng-if="$state.current.data.pageTitle === 'Projects'"><fmt:message key="common.projects" bundle="${msg}" /></span>
				     <span id="users_page_title" ng-if="$state.current.data.pageTitle === 'Users'"><fmt:message key="common.users" bundle="${msg}" /></span>
					 <span id="compute_offerings_page_title" ng-if="$state.current.data.pageTitle === 'Compute'"><fmt:message key="common.compute.offerings" bundle="${msg}" /></span>
					 <span id="storage_offerings_page_title" ng-if="$state.current.data.pageTitle === 'Storage'"><fmt:message key="common.storage.offerings" bundle="${msg}" /></span>
                     <span id="networks_page_title" ng-if="$state.current.data.pageTitle === 'Network'"><fmt:message key="common.networks" bundle="${msg}" /></span>
                     <span id="miscellaneous_page_title" ng-if="$state.current.data.pageTitle === 'Miscellaneous'"><fmt:message key="common.miscellaneous" bundle="${msg}" /></span>
                     <span id="email_configuration_page_title" ng-if="$state.current.data.pageTitle === 'Email Configuration'"><fmt:message key="email.configuration" bundle="${msg}" /></span>
				     <span id="organization_details_page_title" ng-if="$state.current.data.pageTitle === 'Organization Details'"><fmt:message key="organization.details" bundle="${msg}" /></span>
				     <span id="login_security_page_title" ng-if="$state.current.data.pageTitle === 'Login Security'"><fmt:message key="login.security" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Sign up Setting'"><fmt:message key="sign.up.setting" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Admin User'"><fmt:message key="admin.user" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Add Admin User'"><fmt:message key="add.admin.user" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Support'"><fmt:message key="common.support" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Language'"><fmt:message key="common.language" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Billable Items'"><fmt:message key="billable.items" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Credit and Resource Threshold'"><fmt:message key="credit.resource" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Payment Settings'"><fmt:message key="payment.settings" bundle="${msg}" /></span>
				     <span ng-if="$state.current.data.pageTitle === 'Billing Type Settings'"><fmt:message key="billing.type.settings" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Invoice'"><fmt:message key="invoice" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Tax'"><fmt:message key="common.tax" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Promotional Code'"><fmt:message key="promotional.code" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Add Promotional Code'"><fmt:message key="add.promotional.code" bundle="${msg}" /></span>
		             <span ng-if="$state.current.data.pageTitle === 'Discount'"><fmt:message key="discount" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Add Discount'"><fmt:message key="add.discount" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Late Fee'"><fmt:message key="late.fee" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Payment Gateway'"><fmt:message key="payment.gateway" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Resource Allocation'"><fmt:message key="resource.allocation" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Zone Description'"><fmt:message key="zone.description" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Import Data'"><fmt:message key="import.data" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Manual Usage'"><fmt:message key="import.usage" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Email Template'"><fmt:message key="email.template" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Invoice List Report'"><fmt:message key="common.invoicelistreport" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Payment Report'"><fmt:message key="common.paymentreport" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Client Usage Report'"><fmt:message key="common.clientusage" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'ConfigCategory'"><fmt:message key="configuration" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'System Configuration'"><fmt:message key="system.configuration" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Currency'"><fmt:message key="currency" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'client'"><fmt:message key="resource.allocation" bundle="${msg}" /></span>
					 <span ng-if="$state.current.data.pageTitle === 'Dashboard'"><fmt:message key="common.dashboard" bundle="${msg}" /></span>
				</h2>
				<small>{{ $state.current.data.pageDesc}}</small> --%>
			</div>
		</div>
	</div>
	<div class="content">
		<div ui-view></div>
	</div>
	<div id="footer" ng-include="'app/views/common/footer.jsp'"></div>
</div>

<!-- Redirect to login when passing the wrong URL -->
<script>
    var pageUrl = window.location.href;
    if(pageUrl.indexOf("index#/login") > -1 || pageUrl.endsWith("index#/")) {
        var contextPath = '<%= request.getContextPath() %>';
        var baseUrl = window.location.protocol + "//" + window.location.host + contextPath + '/login';
        window.location = baseUrl;
    }
</script>
<script>
	$(window).load(function() {
		$('.easy-tree').EasyTree({
			addable : true,
			editable : true,
			deletable : true
		});
	});
</script>
