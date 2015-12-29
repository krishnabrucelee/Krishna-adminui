<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




<div ui-view>
<div class="row"  ng-controller="computeListCtrl">
    <div class="" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="pull-left">
                            <div class="dashboard-box pull-left">
                                <span class="pull-right"><fmt:message key="compute.totalcompute" bundle="${msg}" /></span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/instance-icon.png"></span>
                                <b class="pull-right">{{computeOffering.Count}}</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right"><fmt:message key="compute.enabledcompute" bundle="${msg}" /></span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/instance-icon.png"></span>
                                <b class="pull-right">{{computeOffering.Count}}</b>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="pull-right">
							<panda-quick-search></panda-quick-search>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" ui-sref="servicecatalog.list-compute.list-compute-offer"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                                <a class="btn btn-info" ui-sref="servicecatalog.list-compute" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <pagination-content></pagination-content>
            <div class="white-content">
					<div data-ng-show="showLoader" style="margin: 1%">
						<get-loader-image data-ng-show="showLoader"></get-loader-image>
					</div>
					<div data-ng-hide = "showLoader" class="table-responsive">
                    <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><fmt:message key="common.name" bundle="${msg}" /></th>
                                <th><fmt:message key="common.vcpu" bundle="${msg}" /></th>
                                <th><fmt:message key="common.speed" bundle="${msg}" /></th>
                                <th><fmt:message key="common.memory" bundle="${msg}" /></th>
                                <th><fmt:message key="common.type" bundle="${msg}" /></th>
                                <th><fmt:message key="common.action" bundle="${msg}" /></th>
                            </tr>
                        </thead>
                        <tbody data-ng-hide="computeList.length > 0">
                               <tr>
                                   <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                               </tr>
                           </tbody>
                           <tbody data-ng-show="computeList.length > 0">
                            <tr data-ng-repeat="compute in filteredCount = (computeList| filter: quickSearch)">
                                <td>

                                    <!--<a class="text-info" ui-sref="servicecatalog.list-compute.view-catalog({id: {{ catalog.id}}})"  title="View Catalog" >{{ catalog.name}}</a>-->
                                    {{compute.name}}
                                </td>
                                <td>{{ compute.numberOfCores}}</td>
                                <td>{{ compute.clockSpeed}}</td>
                                <td>{{ compute.memory}} </td>
                                <td>{{ compute.storageType}} </td>

                                <td>
                                  <a class="icon-button" title="<fmt:message key="common.edit" bundle="${msg}" />" data-ng-click="edit('lg', domain)">
                                                    <span class="fa fa-edit"> </span>
                                                </a>

                                    <a class="icon-button" title="Stop" data-ng-show="instance.state == 'Running'">
                                        <span class="fa fa-ban m-r" ></span>
                                    </a>

                                    <a class="icon-button" 	title="<fmt:message key="common.delete" bundle="${msg}" /> " data-ng-click="delete('sm', compute)"  ><span class="fa fa-trash"></span></a>

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
