<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view>
<div class="row" data-ng-hide="viewContent" data-ng-controller="servicesCtrl">
    <div class="" >
        <div class="hpanel">
            <div class="panel-heading no-padding">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left dashboard-btn-area">
                            <div class="dashboard-box pull-left">
     							<div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="total.services" bundle="${msg}" /></span>
                                <b class="pull-left">{{servicesList.Count}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <a class="btn btn-info font-bold" id="services_add_button" data-ng-click="addServices('md')"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                            <a class="btn btn-info" id="service_category_refresh_button" data-ng-click="list(1)" title="<fmt:message
									key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                        </div>
                        <div class="pull-right dashboard-filters-area" id="services_quick_search">
						<form data-ng-submit="searchList(servicesSearch)">
							<div class="quick-search pull-right">
								<div class="input-group">
									<input data-ng-model="servicesSearch" id="service_category_list_search" type="text" valid-characters class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
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
                <div class="clearfix"></div>
            </div>
			<div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
             <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
            <div data-ng-hide = "showLoader">
                      <div class="white-content">

                <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                    <thead>
                        <tr>
                            <th data-ng-click="changeSort('serviceCode',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='serviceCode'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="service.code" bundle="${msg}" /></th>
                            <th data-ng-click="changeSort('serviceName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='serviceName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="service.name" bundle="${msg}" /></th>
                            <th data-ng-click="changeSort('serviceCategory.category',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='serviceCategory.category'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="service.category" bundle="${msg}" /></th>
							<th data-ng-click="changeSort('unitPrice',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='unitPrice'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="service.unit.price" bundle="${msg}" /> (<app-currency class="text-danger ng-binding">¥</app-currency>)</th>
                        	<th><fmt:message key="common.action" bundle="${msg}" /></th>
                        </tr>
                    </thead>
                        <tbody data-ng-hide="servicesList.length > 0">
                               <tr>
                                   <td class="col-md-5 col-sm-5" colspan="5"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                               </tr>
                           </tbody>
                    <tbody data-ng-show="servicesList.length > 0">
                        <tr data-ng-repeat="services in filteredCount = (servicesList| filter: quickSearch | orderBy:sort.column:sort.descending)">
                            <td>
                                {{ services.serviceCode}}
                            </td>
                            <td>
                                {{ services.serviceName}}
                            </td>
                            <td>
                                {{ services.serviceCategory.category}}
                            </td>
                            <td>
                            <b class="text-danger ng-binding">{{ services.servicesCost[0].cost || 0}} /<span class="ng-scope"><fmt:message key="service.unit.price.format" bundle="${msg}" /></span></b>
                            </td>
                            <td>
                                <a class="icon-button test_storage_offerings_edit_button" data-ng-click="editServices('md', services)" title="<fmt:message
					            key="common.edit" bundle="${msg}" />"  ><span class="fa fa-edit m-r"></span></a>
                                <a class="icon-button test_storage_offerings_delete_button" title="<fmt:message
					            key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm', services)" ><span class="fa fa-trash"></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <pagination-content></pagination-content>
        </div>
        </div>
        </div>
        </div>
    </div>
</div>

</div>