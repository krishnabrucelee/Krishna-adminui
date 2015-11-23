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
								<span class="pull-left m-t-xs"><img
									src="images/project-icon.png"></span> <b class="pull-right">{{projectList.length}}</b>
								<div class="clearfix"></div>
							</div>
							<div class="dashboard-box pull-left">
								<span class="pull-right"><fmt:message key="retail.project" bundle="${msg}" /></span>
								<div class="clearfix"></div>
								<span class="pull-left m-t-xs"><img
									src="images/project-icon.png"></span> <b class="pull-right">{{projectList.length - projectList.length }}</b>
								<div class="clearfix"></div>
							</div>
							<div class="dashboard-box pull-left">
								<span class="pull-right"><fmt:message key="trial.project" bundle="${msg}" /></span>
								<div class="clearfix"></div>
								<span class="pull-left m-t-xs"><img
									src="images/project-icon.png"></span> <b class="pull-right">{{projectList.length}}</b>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="pull-right">
							<div class="quick-search pull-right m-t-xl">
								<div class="input-group">
									<input data-ng-model="projectSearch" type="text"
										class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />"
										aria-describedby="quicksearch-go"> <span
										class="input-group-addon" id="quicksearch-go"><span
										class="pe-7s-search pe-lg font-bold"></span></span>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 ">
					<div class="white-content">
						<div class="table-responsive">
							<table cellspacing="1" cellpadding="1"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th><fmt:message key="project.id" bundle="${msg}" /></th>
										<th><fmt:message key="user.name" bundle="${msg}" /></th>
										<th><fmt:message key="common.company" bundle="${msg}" /></th>
										<th><fmt:message key="common.description" bundle="${msg}" /></th>
										<th><fmt:message key="common.department" bundle="${msg}" /></th>
										<!-- <th>Paid (CNY)</th> -->
										<th><fmt:message key="common.status" bundle="${msg}" /></th>
									</tr>
								</thead>
								<tbody>
									<tr
										data-ng-repeat="project in projectList| filter: projectSearch">
										<td><a class="text-info"
											ui-sref="client.project.view({id: {{ project.id}}})"
											title="View Project">{{ project.id}}</a></td>
										<td>{{ project.projectOwner.userName }}</td>
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
				</div>
			</div>
		</div>
	</div>
</div>