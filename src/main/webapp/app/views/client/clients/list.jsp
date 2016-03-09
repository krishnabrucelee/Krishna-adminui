<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- This is content container for nested view in UI-Router-->
<!-- You can put here any constant element in app content for example: Page title or breadcrum -->

<!-- <!-- Header --><!--
<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>

Navigation
<ng-include id="menu" src="global.getViewPageUrl('common/navigation.jsp')"></ng-include> -->

<!-- Main Wrapper -->
<!-- <div id="wrapper">
 -->    <div class="content">
        <div ui-view>
            <div ng-controller="domainListCtrl">
                <div class="hpanel">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 ">
								<div class="pull-left">
		                            <div class="dashboard-box pull-left">
		     							<div class="instance-border-content-normal">
		                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="total.company" bundle="${msg}" /></span>
		                                <b class="pull-left">{{domainList.Count}}</b>
		                                <div class="clearfix"></div>
		                                </div>
		                            </div>
		                            <a class="btn btn-info" data-ng-click="addDomain('lg',domain)"><span class="pe-7s-add-user pe-lg font-bold m-r-xs"></span><fmt:message key="add.company" bundle="${msg}" /></a>
                                    <a class="btn btn-info " ui-sref="client.client" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
		                        </div>
                                <div class="pull-right">
                                    <panda-quick-search></panda-quick-search>
                                    <div class="clearfix"></div>
                                    <span class="pull-right m-l-sm m-t-sm"></span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12 ">
                            <div class="white-content">
                            <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
                                <div data-ng-hide="showLoader" class="table-responsive">
                                    <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped ">
                                        <thead>
                                        <tr>
										<th data-ng-click="changeSort('name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="company.name" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('companyNameAbbreviation',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='companyNameAbbreviation'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="domain.name" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('portalUserName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='portalUserName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="portal.user.name" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('cityHeadquarter',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='cityHeadquarter'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="city.headquarters" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('email',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='email'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="email.id" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('phone',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='phone'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="phone.number" bundle="${msg}" /></th>
                                        <th><fmt:message key="common.action" bundle="${msg}" /></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr data-ng-class="{'bg-row text-white' : domain.isSelected == true }"  data-ng-repeat="domain in filteredCount = (domainList| filter: quickSearch | orderBy:sort.column:sort.descending)">

                                                <td>{{domain.name}}</td>
                                                <td>{{domain.companyNameAbbreviation}}</td>
                                                <td>{{domain.portalUserName}}</td>
                                                <td>{{domain.cityHeadquarter}}</td>
                                                <td>{{domain.email}}</td>
                                                <td>{{domain.phone}}</td>
                                                <td>
											    <a class="icon-button" title="<fmt:message key="common.edit" bundle="${msg}" />" data-ng-click="edit('lg', domain)">
                                                    <span class="fa fa-edit"> </span>
                                                </a>
												<a class="icon-button" data-ng-click="getDepartmentsByDomain(domain.id)" ui-sref="client.client.quota({id: {{ domain.id }}, view: 'client-quota'})" title="<fmt:message key="common.edit.quota" bundle="${msg}" />">
                                                    <span class="fa font-bold pe-7s-edit"> </span>
                                                </a>
                                                <a class="icon-button" title="<fmt:message key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm', domain)" ><span class="fa fa-trash"></span></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                          <pagination-content></pagination-content>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- </div> -->