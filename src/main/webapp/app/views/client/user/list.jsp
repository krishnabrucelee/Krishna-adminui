<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view >
    <div ng-controller="userListCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left dashboard-btn-area">
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
                                <b class="pull-left">{{(activeUsers | filter:{status:'ENABLED', domainId:domainView.id}:true).length}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="dashboard-box pull-left">
                                 <div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="inactive.users" bundle="${msg}" /></span>
                                <b class="pull-left">{{(activeUsers | filter:{status:'DISABLED', domainId:domainView.id}:true).length}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                             <div class="dashboard-box pull-left">
                                 <div class="instance-border-content-normal">
                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message key="removed.users" bundle="${msg}" /></span>
                                <b class="pull-left">{{(activeUsers | filter:{status:'DELETED', domainId:domainView.id}).length}}</b>
                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <a class="btn btn-info" data-ng-click="list(1)" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg"></span></a>
                        </div>
                        <div class="pull-right dashboard-filters-area">
							<form data-ng-submit="searchList(userSearch)">
							<div class="quick-search pull-right">
								<div class="input-group">
									<input data-ng-model="userSearch" id="user_list_search" type="text" valid-characters class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
								   	<span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
								</div>
							</div>
                            <span class="pull-right m-r-sm">
                                <select
                                    class="form-control input-group col-xs-5" name="domainView"
                                    data-ng-model="domainView"
                                    data-ng-change="selectDomainView(1)"
                                    data-ng-options="domainView.name for domainView in domainListView">
                                    <option value=""> <fmt:message key="common.domain.filter" bundle="${msg}" /></option>
                                </select>
                            </span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm"></span>
                            </form>
                        </div>
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                           <div data-ng-show="showLoader" style="margin: 1%">
                                        <get-loader-image data-ng-show="showLoader"></get-loader-image>
                                    </div>
                            <div class="table-responsive" data-ng-hide="showLoader">
                            <div class="white-content">
                                <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th data-ng-click="changeSort('userName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='userName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="user.name" bundle="${msg}" /></th>
                                             <th  data-ng-click="changeSort('department.userName',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='department.userName'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.department" bundle="${msg}" /></th>
                                             <th  data-ng-click="changeSort('domain.name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='domain.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.domain" bundle="${msg}" /></th>
                                            <th data-ng-click="changeSort('type',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='type'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="user.type" bundle="${msg}" /></th>
                                            <th data-ng-click="changeSort('role.name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='role.name'? 'sorting_desc' : 'sorting_asc' "><fmt:message key="common.role" bundle="${msg}" /></th>
                                            <th data-ng-click="changeSort('email',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='email'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.email" bundle="${msg}" /></th>
                                            <th data-ng-click="changeSort('status',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                                        </tr>
                                    </thead>
                                    <tbody data-ng-hide="accountList.length > 0">
                                           <tr>
                                              <td class="col-md-7 col-sm-7" colspan="7"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                           </tr>
                                       </tbody>
                                    <tbody data-ng-show="accountList.length > 0">
                                        <tr data-ng-repeat="account in filteredCount = accountList">
                                              <td>{{ account.userName}}</td>
                                                <td>{{account.department.userName}}</td>
                                            <td>{{account.domain.name}}</td>
                                            <td>{{account.type}}</td>
                                            <td>{{account.role.name || '-'}} </td>
                                            <td>{{account.email || '-'}} </td>
                                            <td>
                                              <div data-ng-show="showUserListLoader[account.id]" style="margin: 1%">
                                                <get-custom-loader-image custom-loader="showUserListLoader[account.id]" ></get-custom-loader-image>
                                                        </div>

                                              <span data-ng-hide="showUserListLoader[account.id]">
                                                <label class="badge badge-success p-xs" data-ng-if="account.status == 'ENABLED'"> <fmt:message key="common.enabled" bundle="${msg}" /> </label>
                                                <label class="badge badge-danger p-xs" data-ng-if="account.status == 'DISABLED'"> <fmt:message key="common.disabled" bundle="${msg}" /> </label>
                                                <label class="badge badge-danger p-xs" data-ng-if="account.status == 'DELETED'"> <fmt:message key="common.deleted" bundle="${msg}" /> </label>
                                                <label class="badge badge-danger p-xs" data-ng-if="account.status == 'SUSPENDED'"> <fmt:message key="common.suspended" bundle="${msg}" /> </label>
                                                <button class="btn btn-default suspend-btn" title="<fmt:message key="common.suspend" bundle="${msg}" />" data-ng-if="account.status == 'ENABLED' || account.status == 'DISABLED'" data-ng-click="suspendUserAccount(account)">
                                                     <span class="fa fa-ban text-center"> </span>
                                                </button>
                                                <button class="btn btn-default suspend-btn" title="<fmt:message key="common.enable" bundle="${msg}" />" data-ng-if="account.status == 'SUSPENDED'" data-ng-click="enableUserAccount(account)">
                                                     <span class="fa fa-check-circle-o text-center"> </span>
                                                </button>
                                               </span>
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