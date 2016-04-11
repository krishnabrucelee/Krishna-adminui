<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view >
    <div ng-controller="applicationListCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left">
                            <div class="dashboard-box pull-left">
     							<div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="total.application" bundle="${msg}" /></span>
                                <b class="pull-left">{{applicationList.Count}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <a class="btn btn-info" ui-sref="client.application" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg"></span></a>
                        </div>
                        <div class="pull-right">
					        <panda-quick-search></panda-quick-search>
					        <span class="pull-right m-r-sm">
								<select
									class="form-control input-group col-xs-5" name="domainView"
									data-ng-model="domainView"
									data-ng-change="selectDomainView(1)"
									data-ng-options="domainView.name for domainView in domainListView">
									<option value=""><fmt:message key="common.all.company" bundle="${msg}" /></option>
								</select>
							</span>
							<div class="clearfix"></div>
							<span class="pull-right m-l-sm m-t-sm"></span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">
                    <div class="white-content">
                    <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
                        <div data-ng-hide="showLoader" class="table-responsive">
                            <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                                <thead>
                                    <tr>
                                    	<th class="col-md-2 col-sm-3" data-ng-click="changeSort('type',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='type'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.type" bundle="${msg}" /></th>
                                    	<th class="col-md-4 col-sm-5" data-ng-click="changeSort('description',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='description'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.description" bundle="${msg}" /></th>
                                    	<th class="col-md-1 col-sm-2" data-ng-click="changeSort('status',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody data-ng-hide="applicationList.length > 0">
                                    <tr>
                                        <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-show="applicationList.length > 0">
                                    <tr data-ng-repeat=" application in filteredCount = (applicationList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                        <td>{{ application.type}}</td>
                                        <td>{{ application.description}}</td>
                                        <td>
                                        	<label class="badge badge-success p-xs" data-ng-if="application.status == 'ENABLED'"> {{ application.status}} </label>
                                            <label class="badge badge-danger p-xs" data-ng-if="application.status == 'DISABLED'"> {{ application.status}} </label>
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
