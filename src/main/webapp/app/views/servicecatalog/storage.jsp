<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view>
<div class="row" data-ng-hide="viewContent" data-ng-controller="storageListCtrl">
    <div class="" >
        <div class="hpanel">
            <div class="panel-heading no-padding">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left dashboard-btn-area">
                            <div class="dashboard-box pull-left">
                            	<div class="instance-border-content-normal">
	                            	<span class="pull-left"><img src="images/volume-icon.png"></span>
	                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message
											key="storage.totaloffering" bundle="${msg}" /></span>

	                                <b class="pull-left">{{storageList.Count}}</b>
	                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="dashboard-box pull-left">
                            	<div class="instance-border-content-normal">
	                            	<span class="pull-left"><img src="images/volume-icon.png"></span>
	                                <span class="pull-left m-t-xs m-l-xs m-r-xs"><fmt:message
											key="storage.enabledoffering" bundle="${msg}" /></span>

	                                <b class="pull-left">{{storageList.Count}}</b>
	                                <div class="clearfix"></div>
                                </div>
                            </div>
                            <a class="btn btn-info font-bold" id="storage_offerings_add_button" ui-sref="servicecatalog.list-storage.list-storage-offer"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                            <a class="btn btn-info" id="storage_offerings_refresh_button" data-ng-click="list(1)" title="<fmt:message
									key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
<%--                             <div class="dashboard-box pull-left">
                                <span class="pull-right"><fmt:message
										key="storage.disabledoffering" bundle="${msg}" /></span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">0</b>
                                <div class="clearfix"></div>
                            </div> --%>
                        </div>
                        <div class="pull-right dashboard-filters-area" id="instances_quick_search">
						<form data-ng-submit="searchList(vmSearch)">
							<div class="quick-search pull-right">
								<div class="input-group">
									<input data-ng-model="vmSearch" id="storage_list_search" type="text" valid-characters class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
								   	<span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
								</div>
							</div>
							<span class="pull-right m-r-sm" >
								<select
									class="form-control input-group col-xs-5" name="domainView"
									data-ng-model="domainView"
									data-ng-change="selectDomainView(1)"
									data-ng-options="domainView.name for domainView in formElements.domainList">
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
                <div class="clearfix"></div>
            </div>
            <div class="row" id="storage_offerings_pagination_container">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
             <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
            <div class="table-responsive" data-ng-hide="showLoader">
            <div class="white-content">

                    <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped" id="storage_offerings_table">
                        <thead>
                            <tr>
                               <th data-ng-click="changeSort('name',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.name" bundle="${msg}" /></th>
                               <th data-ng-click="changeSort('storageType',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='storageType'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.type" bundle="${msg}" /></th>
                               <th data-ng-click="changeSort('diskSize',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='diskSize'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.size" bundle="${msg}" /></th>
                               <th data-ng-click="changeSort('isCustomDisk',paginationObject.currentPage)" data-ng-class="sort.descending && sort.column =='isCustomDisk'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.custom" bundle="${msg}" /></th>
                               <th><fmt:message key="common.action" bundle="${msg}" /></th>
                            </tr>
                        </thead>
                        <tbody data-ng-hide="storageList.length > 0">
                               <tr>
                                   <td class="col-md-5 col-sm-5" colspan="5"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                               </tr>
                           </tbody>
                           <tbody data-ng-show="storageList.length > 0">
                            <tr data-ng-repeat="storage in filteredCount = (storageList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                <td>
                                    {{ storage.name}}
                                </td>
                                <td>{{ storage.storageType}} </td>
                                <td><span data-ng-if="storage.diskSize <= 0">0</span><span data-ng-if="storage.diskSize > 0">{{ storage.diskSize}}</span></td>
                                <!--  <td>{{ storage.diskSize}}</td>-->
                                <td>{{ (storage.isCustomDisk) ? "Yes" : "No"}}</td>
                                <td>
                                    <a class="icon-button test_storage_offerings_edit_button" id="storage_offerings_edit_button_{{storage.id}}" data-unique-field="{{storage.name}}"  ui-sref="servicecatalog.list-storage.list-view-storage-offer({id: {{ storage.id}}})" title="<fmt:message
									key="common.edit" bundle="${msg}" />"  ><span class="fa fa-edit m-r"></span></a>
<!--                                     <a class="icon-button" title="Enable" data-ng-hide="storage.state == 'Enable'">
                                        <span class="fa fa-play m-r" ></span>
                                    </a> -->
<!--                                     <a class="icon-button" title="Disable" data-ng-show="storage.state == 'Disable'">
                                        <span class="fa fa-ban m-r" ></span>
                                    </a> -->

                                    <a class="icon-button test_storage_offerings_delete_button" id="storage_offerings_delete_button_{{storage.id}}" data-unique-field="{{storage.name}}" title="<fmt:message
									key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm', storage)" ><span class="fa fa-trash"></span></a>
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