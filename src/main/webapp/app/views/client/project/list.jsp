<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div ui-view>

	<div ng-controller="projectListCtrl">
		<div class="hpanel">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						<div class="pull-left">
							<div class="dashboard-box pull-left">
								<span class="pull-right"><fmt:message key="total.project" bundle="${msg}" /></span>
								<div class="clearfix"></div>
								<span class="pull-left m-t-xs"><!-- <img
									src="images/project-icon.png"> --></span> <b class="pull-right">{{projectList.Count}}</b>
								<div class="clearfix"></div>
							</div>
							<div class="dashboard-box pull-left">
								<span class="pull-right"><fmt:message key="retail.project" bundle="${msg}" /></span>
								<div class="clearfix"></div>
								<span class="pull-left m-t-xs"><!-- <img
									src="images/project-icon.png"> --></span> <b class="pull-right">0</b>
								<div class="clearfix"></div>
							</div>
							<div class="dashboard-box pull-left">
								<span class="pull-right"><fmt:message key="trial.project" bundle="${msg}" /></span>
								<div class="clearfix"></div>
								<span class="pull-left m-t-xs"><!-- <img
									src="images/project-icon.png"> --></span> <b class="pull-right">{{projectList.Count}}</b>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="pull-right">
							<panda-quick-search></panda-quick-search>
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
										<th data-ng-click="changeSorting('id')" data-ng-class="sort.descending && sort.column =='id'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="project.id" bundle="${msg}" /></th>
										<th data-ng-click="changeSorting('name')" data-ng-class="sort.descending && sort.column =='projectOwner.userName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="project.name" bundle="${msg}" /></th>
										<th data-ng-click="changeSorting('domain.name')" data-ng-class="sort.descending && sort.column =='domain.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.company" bundle="${msg}" /></th>
										<th data-ng-click="changeSorting('description')" data-ng-class="sort.descending && sort.column =='description'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.description" bundle="${msg}" /></th>
										<th data-ng-click="changeSorting('department.userName')" data-ng-class="sort.descending && sort.column =='department.userName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.department" bundle="${msg}" /></th>
										<th data-ng-click="changeSorting('status')" data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
									    <!-- <th>Paid (CNY)</th> -->
									</tr>
								</thead>
								<tbody>
									<tr
										data-ng-repeat="project in filteredCount = (projectList| filter: quickSearch| orderBy:sort.column:sort.descending)">
										<td><a class="text-info"
											ui-sref="client.project.view({id: {{ project.id}}})"
											title="View Project">{{ project.id}}</a></td>
										<td>{{ project.name}}</td>
										<td>{{ project.domain.name}}</td>
										<td>{{ project.description}}</td>
										<td>{{ project.department.userName}}</td>
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