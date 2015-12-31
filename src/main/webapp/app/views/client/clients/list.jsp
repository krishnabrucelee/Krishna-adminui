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

                                <div class="pull-right">
                                    <panda-quick-search></panda-quick-search>
                                    <div class="clearfix"></div>
                                    <span class="pull-right m-l-sm m-t-sm">
                                        <a class="btn btn-info" data-ng-click="addDomain('lg',domain)"><span class="pe-7s-add-user pe-lg font-bold m-r-xs"></span><fmt:message key="add.company" bundle="${msg}" /></a>
                                        <a class="btn btn-info " ui-sref="project.home" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                                    </span>
                                </div>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <pagination-content></pagination-content>
                            <div class="white-content">
                            <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
                                <div data-ng-hide="showLoader" class="table-responsive">
                                    <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped ">
                                        <thead>
                                        <tr>

                                        <th><fmt:message key="company.name" bundle="${msg}" /></th>
                                        <th><fmt:message key="domain.name" bundle="${msg}" /></th>
                                        <th><fmt:message key="portal.user.name" bundle="${msg}" /></th>
                                        <th><fmt:message key="city.headquarters" bundle="${msg}" /></th>
                                        <th><fmt:message key="email.id" bundle="${msg}" /></th>
                                        <th><fmt:message key="phone.number" bundle="${msg}" /></th>
                                        <th><fmt:message key="common.action" bundle="${msg}" /></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr data-ng-class="{'bg-row text-white' : domain.isSelected == true }"  data-ng-repeat="domain in filteredCount = (domainList| filter: quickSearch)">

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