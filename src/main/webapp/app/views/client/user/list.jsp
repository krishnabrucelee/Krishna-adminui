<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view >
    <div ng-controller="userListCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left">
                            <div class="dashboard-box pull-left">
     							<div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="total.users" bundle="${msg}" /></span>
                                <b class="pull-left">{{paginationObject.totalItems}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="dashboard-box pull-left">
                      			<div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="active.users" bundle="${msg}" /></span>
                                <b class="pull-left">{{(activeUsers | filter:{isActive:true}).length}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="dashboard-box pull-left">
                                 <div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="inactive.users" bundle="${msg}" /></span>
                                <b class="pull-left">{{(activeUsers | filter:{isActive:false}).length}}</b>
                                <div class="clearfix"></div>
                                </div>
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
                        <div data-ng-show="showLoader" style="margin: 1%">
						<get-loader-image data-ng-show="showLoader"></get-loader-image>
					</div>
                            <div class="table-responsive" data-ng-hide="showLoader">
                                <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                                    <thead>
                                        <tr>
                                        	<th data-ng-click="changeSorting('userName')" data-ng-class="sort.descending && sort.column =='userName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="user.name" bundle="${msg}" /></th>
                                        	<th data-ng-click="changeSorting('firstName')" data-ng-class="sort.descending && sort.column =='firstName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="first.name" bundle="${msg}" /></th>
                                        	<th data-ng-click="changeSorting('type')" data-ng-class="sort.descending && sort.column =='type'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="user.type" bundle="${msg}" /></th>
                                        	<th data-ng-click="changeSorting('email')" data-ng-class="sort.descending && sort.column =='email'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.email" bundle="${msg}" /></th>
                                        	<th data-ng-click="changeSorting('isActive')" data-ng-class="sort.descending && sort.column =='isActive'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>


                                        </tr>
                                    </thead>
                                    <tbody data-ng-hide="accountList.length > 0">
                               			<tr>
                                  			<td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                               			</tr>
                           			</tbody>
                                    <tbody data-ng-show="accountList.length > 0">
                                        <tr data-ng-repeat="account in filteredCount = (accountList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                        	<td>{{ account.userName}}</td>
                                            <td>{{ account.firstName}}</td>
                                            <td>{{ account.type}}</td>
                                            <td>{{ account.email}} </td>
                                            <td>
                                            	<label class="badge badge-success p-xs" data-ng-if="account.isActive == true"> Active </label>
                                                <label class="badge badge-danger p-xs" data-ng-if="account.isActive == false"> Inactive </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
           <pagination-content></pagination-content>
        </div>
    </div>
</div>