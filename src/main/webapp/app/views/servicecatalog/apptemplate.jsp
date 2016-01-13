<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row" data-ng-hide="viewContent" ng-controller="templateListCtrl">
    <div class="hpanel">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">
                    <div class="pull-left">
						<div class="dashboard-box pull-left">
                            <span class="pull-right"><fmt:message key="template.totaltemplate" bundle="${msg}" /></span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/template-icon.png"></span>
                            <b class="pull-right">{{totalIsoCount}}</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right"><fmt:message key="windows.template" bundle="${msg}" /></span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/template-icon.png"></span>
                            <b class="pull-right">{{windowsIsoTemplate}}</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right"><fmt:message key="linux.template" bundle="${msg}" /></span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/template-icon.png"></span>
                            <b class="pull-right">{{linuxIsoTemplate}}</b>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="pull-right">
						<panda-quick-search></panda-quick-search>
                        <div class="clearfix"></div>
                        <span class="pull-right m-l-sm m-t-sm">
                            <a class="btn btn-info" ui-sref="servicecatalog.list-templatestore.list-apptemplate-iso-create"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add</a>
                            <a class="btn btn-info" ui-sref="servicecatalog.list-templatestore" title="Refresh"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <pagination-content-iso></pagination-content-iso>
        <div class="white-content">
        <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
            <div class="table-responsive" data-ng-hide="showLoader">
                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th><fmt:message key="template.name" bundle="${msg}" /></th>
                            <th><fmt:message key="template.os" bundle="${msg}" /></th>
                            <th><fmt:message key="template.type" bundle="${msg}" /></th>
                            <th><fmt:message key="template.zone" bundle="${msg}" /></th>
                            <th><fmt:message key="template.hypervisor" bundle="${msg}" /></th>
                            <th><fmt:message key="template.cost" bundle="${msg}" /> (<app-currency></app-currency>)</th>
                            <th><fmt:message key="common.status" bundle="${msg}" /></th>
                            <th><fmt:message key="common.action" bundle="${msg}" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="template in filteredCount = (isoList| filter: quickSearch)">

                            <td>{{ template.name}}</td>
                            <td>
                                {{ template.osCategory.name}}

                            </td>
                            <td>
                                {{ template.osType.description}}
                            </td>
                            <td>{{ template.zone.name}} </td>
                            <td>{{ template.hypervisor.name}}</td>
                            <td><b class="text-danger">
                                    {{ template.templateCost[0].cost}} <span>/ month</span>
                                </b></td>
                            <td>
                                {{ template.status }}
                            </td>
                            <td>
                                <a class="icon-button" title="<fmt:message key="common.edit" bundle="${msg}" />" ui-sref="servicecatalog.list-templatestore.list-apptemplate-iso-edit({id: {{ template.id}}})"  ><span class="fa fa-edit"></span></a>
                                <a has-permission="DELETE_MY_TEMPLATE" class="icon-button" title="<fmt:message key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm', template)" ><span class="fa fa-trash"></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <pagination-content-iso></pagination-content-iso>

    </div>
</div>
