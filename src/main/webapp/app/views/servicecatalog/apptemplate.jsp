<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row" data-ng-hide="viewContent" data-ng-controller="templateListCtrl">
    <div class="hpanel">
        <div class="panel-heading no-padding">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">
                    <div class="pull-left dashboard-btn-area">
						<div class="dashboard-box pull-left">
							<div class="instance-border-content-normal">
								<span class="pull-left"><img src="images/template-icon.png"></span>
	                            <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="template.totaltemplate" bundle="${msg}" /></span>

	                            <b class="pull-left">{{totalIsoCount}}</b>
	                            <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="dashboard-box pull-left">
	                        <div class="instance-border-content-normal">
	                        	<span class="pull-left"><img src="images/template-icon.png"></span>
	                            <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="windows.template" bundle="${msg}" /></span>

	                            <b class="pull-left">{{windowsIsoTemplate}}</b>
	                            <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="dashboard-box pull-left">
	                        <div class="instance-border-content-normal">
	                        	<span class="pull-left"><img src="images/template-icon.png"></span>
	                            <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="linux.template" bundle="${msg}" /></span>

	                            <b class="pull-left">{{linuxIsoTemplate}}</b>
	                            <div class="clearfix"></div>
                            </div>
                        </div>
                        <a class="btn btn-info font-bold" ui-sref="servicecatalog.list-apptemplate.list-apptemplate-iso-create"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                            <a class="btn btn-info" data-ng-click="isolist(1)" title="<fmt:message
									key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                    </div>
                    <div class="pull-right dashboard-filters-area">
						<form data-ng-submit="searchListing(templatequickSearch)">
							<div class="quick-search pull-right">
								<div class="input-group">
									<input data-ng-model="templatequickSearch" id="iso_template_list_search" type="text" class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
								   	<span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
								</div>
							</div>
							<div class="clearfix"></div>
							<span class="pull-right m-l-sm m-t-sm">
							</span>
						</form>
						</div>
                </div>
            </div>
        </div>
        <pagination-content-iso></pagination-content-iso>
        <div class="white-content">
        <div data-ng-show = "showLoader" style="margin: 1%">
    		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      	</div>
            <div class="table-responsive" data-ng-hide="showLoader">
                <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                    <thead>
                        <tr>
                            <th data-ng-click="changeSorts('name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="template.name" bundle="${msg}" /></th>
                            <th data-ng-click="changeSorts('osCategoryName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='osCategory.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="template.os" bundle="${msg}" /></th>
                            <th data-ng-click="changeSorts('osTypeDescription',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='osType.description'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="template.type" bundle="${msg}" /></th>
                            <th data-ng-click="changeSorts('zoneName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='zone.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="template.zone" bundle="${msg}" /></th>
                            <th><fmt:message key="template.cost" bundle="${msg}" />(<app-currency></app-currency>)</th>
                            <th data-ng-click="changeSorts('status',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                            <th><fmt:message key="common.action" bundle="${msg}" /></th>
                        </tr>
                    </thead>
                      <tbody data-ng-hide="isoList.length > 0">
                              		 <tr>
                                   <td class="col-md-6 col-sm-6" colspan="10"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                              			 </tr>
                           			</tbody>
                    <tbody data-ng-show="isoList.length > 0">
<!--                         <tr data-ng-repeat="template in filteredCount = (isoList| filter: quickSearch | orderBy:sort.column:sort.descending)">
 -->

                       <tr data-ng-repeat="template in isoList">

 							<td>{{ template.name}}</td>
                            <td>{{ template.osCategoryName}}</td>
                            <td>{{ template.osTypeDescription}}</td>
                            <td>{{ template.zoneName}}</td>
                            <td><b class="text-danger">{{ template.templateCost || 0}} <span>/ day</span></b></td>
                            <td>{{ template.status }}</td>
                            <td>
                                <a class="icon-button" title="<fmt:message key="common.edit" bundle="${msg}" />" ui-sref="servicecatalog.list-apptemplate.list-apptemplate-iso-edit({id: {{ template.id}}})"  ><span class="fa fa-edit"></span></a>
                                <a has-permission="DELETE_MY_TEMPLATE" class="icon-button" title="<fmt:message key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm', template.id)" ><span class="fa fa-trash"></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <pagination-content-iso></pagination-content-iso>
    </div>
</div>
