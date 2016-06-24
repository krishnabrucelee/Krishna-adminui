<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view>

	<div  ng-controller="projectListCtrl">
		<div class="hpanel">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						<div class="pull-left dashboard-btn-area">
							<div class="dashboard-box pull-left">
								<div class="instance-border-content-normal">
								<span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="total.project" bundle="${msg}" /></span>
								<b class="pull-left">{{projectList.Count}}</b>
								<div class="clearfix"></div></div>
							</div>
							<div class="dashboard-box pull-left">
								<div class="instance-border-content-normal">
								<span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="retail.project" bundle="${msg}" /></span>
								<b class="pull-left">0</b>
								<div class="clearfix"></div>
								</div>
							</div>
							<div class="dashboard-box pull-left">
								<div class="instance-border-content-normal">
								<span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="trial.project" bundle="${msg}" /></span>
								<b class="pull-left">{{projectList.Count}}</b>
								<div class="clearfix"></div>
								</div>
							</div>
							<a class="btn btn-info" data-ng-click="list(1)" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg"></span></a>
						</div>
						<div class="pull-right dashboard-filters-area" id="instances_quick_search">
						<form data-ng-submit="searchList(vmSearch)">
							<div class="quick-search pull-right">
								<div class="input-group">
									<input data-ng-model="vmSearch" id="project_list_search" type="text" valid-characters class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
								   	<span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
								</div>
							</div>
							<span class="pull-right m-r-sm" >
								<select
									class="form-control input-group col-xs-5" name="domainView"
									data-ng-model="domainView"
									data-ng-change="selectDomainView(domainView)"
									data-ng-options="domainView.name for domainView in domainListView">
									<option value=""> <fmt:message key="common.domain.filter" bundle="${msg}" /></option>
								</select>
							</span>
							<div class="clearfix"></div>
							<span class="pull-right m-l-sm m-t-sm">
							</span>
						</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 ">
					<div class="white-content">
					 <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
						<div class="table-responsive" data-ng-hide="showLoader">
							<table cellspacing="1" cellpadding="1"
								class="table table-bordered dataTable table-striped">
								<thead>
									<tr>
										<th data-ng-click="changeSort('id',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='id'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="project.id" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='projectOwnerUserName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="project.name" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('domainName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='domainName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.company" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('description',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='description'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.description" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('departmentUserName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='departmentUserName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.department" bundle="${msg}" /></th>
										<th data-ng-click="changeSort('status',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
									    <!-- <th>Paid (CNY)</th> -->
									</tr>
								</thead>
								<tbody data-ng-hide="projectList.length > 0">
                                    <tr>
                                        <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
								<tbody data-ng-show="projectList.length > 0">
									<tr
										data-ng-repeat="project in filteredCount = (projectList| filter: quickSearch| orderBy:sort.column:sort.descending)">
										<td><a class="text-info" title="<fmt:message key="view.project" bundle="${msg}" />">{{ project.id}}</a></td>
										<td>{{ project.name}}</td>
										<td>{{ project.domainName}}</td>
										<td>{{ project.description}}</td>
										<td>{{ project.departmentUserName}}</td>
										<!-- <td>{{ project.totalPaid}}</td> -->
										<td><label class="icon-button btn btn-success  btn-sm"
											title="{{ project.status}}">{{
												project.status}}</label></td>
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