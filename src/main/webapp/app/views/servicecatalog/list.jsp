<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div ui-view>
<div class="row"  ng-controller="computeListCtrl">
    <div class="" >
        <div class="hpanel">
            <div class="panel-heading no-padding">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="pull-left dashboard-btn-area">
                            <div class="dashboard-box pull-left">
                             <div class="instance-border-content-normal">
                                <span class="pull-left"><img src="images/instance-icon.png"></span>
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="compute.totalcompute" bundle="${msg}" /></span>
                                <b class="pull-left">{{computeOffering.Count}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="dashboard-box pull-left">
                            	<div class="instance-border-content-normal">
                                 <span class="pull-left"><img src="images/instance-icon.png"></span>
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="compute.enabledcompute" bundle="${msg}" /></span>
                                <b class="pull-left">{{computeOffering.Count}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <a class="btn btn-info font-bold" id="compute_offerings_add_button" ui-sref="servicecatalog.list-compute.list-compute-offer"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                            <a class="btn btn-info" id="compute_offerings_refresh_button" ui-sref="servicecatalog.list-compute" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                        </div>
                        <div class="pull-right dashboard-filters-area">
							<panda-quick-search></panda-quick-search>
							<span class="pull-right m-r-sm">
								<select
								    id="compute_offerings_domain_filter"
									class="form-control input-group col-xs-5" name="domainView"
									data-ng-model="domainView"
									data-ng-change="selectDomainView(1)"
									data-ng-options="domainView.name for domainView in domain.domaintypeList">
									<option value=""> <fmt:message key="common.domain.filter" bundle="${msg}" /></option>
								</select>
							</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">

                            </span>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
                    <div class="row" id="compute_offerings_pagination_container">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
					<div data-ng-show="showLoader" style="margin: 1%">
						<get-loader-image data-ng-show="showLoader"></get-loader-image>
					</div>
					<div data-ng-hide = "showLoader" class="table-responsive">
					            <div class="white-content">
					                    <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped" id="compute_offerings_table">
                        <thead>
                            <tr>
                            	<th data-ng-click="changeSort('name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.name" bundle="${msg}" /></th>
                            	<th data-ng-click="changeSort('numberOfCores',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='numberOfCores'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.vcpu" bundle="${msg}" /></th>
                            	<th data-ng-click="changeSort('clockSpeed',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='clockSpeed'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.speed" bundle="${msg}" /></th>
                            	<th data-ng-click="changeSort('memory',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='memory'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.memory" bundle="${msg}" /></th>
                            	<th data-ng-click="changeSort('storageType',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='storageType'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.type" bundle="${msg}" /></th>
                                <th><fmt:message key="common.action" bundle="${msg}" /></th>
                            </tr>
                        </thead>
                        <tbody data-ng-hide="computeList.length > 0">
                               <tr>
                                   <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                               </tr>
                           </tbody>
                           <tbody data-ng-show="computeList.length > 0">
                            <tr data-ng-repeat="compute in filteredCount = (computeList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                <td>

                                    <!--<a class="text-info" ui-sref="servicecatalog.list-compute.view-catalog({id: {{ catalog.id}}})"  title="View Catalog" >{{ catalog.name}}</a>-->
                                    {{compute.name}}
                                </td>
                                <td>{{ compute.numberOfCores}}</td>
                                <td>{{ compute.clockSpeed}}</td>
                                <td>{{ compute.memory}} </td>
                                <td>{{ compute.storageType}} </td>

                                <td>

                                    <a class="icon-button test-compute_offerings_edit_button" id="compute_offerings_edit_button_{{compute.id}}" data-unique-field="{{compute.name}}"
                                     title="<fmt:message key="common.edit" bundle="${msg}" /> " ui-sref="servicecatalog.list-compute.list-view-compute-offer({id: {{ compute.id}}})"   ><span class="fa fa-edit m-r"></span></a>
                                    <a class="icon-button" title="Stop" data-ng-show="instance.state == 'Running'">
                                        <span class="fa fa-ban m-r" ></span>
                                    </a>

                                    <a class="icon-button test_compute_offerings_delete_button" id="compute_offerings_delete_button_{{compute.id}}" title="<fmt:message key="common.delete" bundle="${msg}" /> " data-ng-click="delete('sm', compute)"  ><span class="fa fa-trash"></span></a>

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
