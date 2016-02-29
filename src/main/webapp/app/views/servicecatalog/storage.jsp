<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view>
<div class="row" data-ng-hide="viewContent" data-ng-controller="storageListCtrl">
    <div class="" >
        <div class="hpanel">
            <div class="panel-heading no-padding">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left">
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
                            <a class="btn btn-info" ui-sref="servicecatalog.list-storage.list-storage-offer"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                            <a class="btn btn-info" ui-sref="servicecatalog.list-storage" title="Refresh"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
<%--                             <div class="dashboard-box pull-left">
                                <span class="pull-right"><fmt:message
										key="storage.disabledoffering" bundle="${msg}" /></span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">0</b>
                                <div class="clearfix"></div>
                            </div> --%>
                        </div>
                        <div class="pull-right">
						<panda-quick-search></panda-quick-search>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">

                            </span>
                        </div>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
             <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
            <div class="table-responsive" data-ng-hide="showLoader">
            <div class="white-content">

                    <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                        <thead>
                            <tr>
                               <th data-ng-click="changeSorting('name')" data-ng-class="sort.descending && sort.column =='name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.name" bundle="${msg}" /></th>
                               <th data-ng-click="changeSorting('storageType')" data-ng-class="sort.descending && sort.column =='storageType'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.type" bundle="${msg}" /></th>
                               <th data-ng-click="changeSorting('diskSize')" data-ng-class="sort.descending && sort.column =='diskSize'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.size" bundle="${msg}" /></th>
                               <th data-ng-click="changeSorting('isCustomDisk')" data-ng-class="sort.descending && sort.column =='isCustomDisk'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.custom" bundle="${msg}" /></th>
                               <th><fmt:message key="common.action" bundle="${msg}" /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="storage in filteredCount = (storageList| filter: quickSearch| orderBy:sort.column:sort.descending)">
                                <td>
                                    {{ storage.name}}
                                </td>
                                <td>{{ storage.storageType}} </td>
                                <td><span data-ng-if="storage.diskSize <= 0">0</span><span data-ng-if="storage.diskSize > 0">{{ storage.diskSize}}</span></td>
                                <!--  <td>{{ storage.diskSize}}</td>-->
                                <td>{{ storage.isCustomDisk}}</td>
                                <td>
                                    <a class="icon-button"  ui-sref="servicecatalog.list-storage.list-view-storage-offer({id: {{ storage.id}}})" title="Edit"  ><span class="fa fa-edit m-r"></span></a>
<!--                                     <a class="icon-button" title="Enable" data-ng-hide="storage.state == 'Enable'">
                                        <span class="fa fa-play m-r" ></span>
                                    </a> -->
<!--                                     <a class="icon-button" title="Disable" data-ng-show="storage.state == 'Disable'">
                                        <span class="fa fa-ban m-r" ></span>
                                    </a> -->

                                    <a class="icon-button" title="Delete" data-ng-click="delete('sm', storage)" ><span class="fa fa-trash"></span></a>
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