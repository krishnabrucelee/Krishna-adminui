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
                            <span class="pull-right">Total Template</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/template-icon.png"></span>
                            <b class="pull-right">13</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Windows Template</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/template-icon.png"></span>
                            <b class="pull-right">04</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Linux Template</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/template-icon.png"></span>
                            <b class="pull-right">09</b>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <div class="quick-search ">
                            <div class="input-group">
                                <input data-ng-model="templateSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <span class="pull-right m-l-sm m-t-sm">
                            <a class="btn btn-info" ui-sref="servicecatalog.list-templatestore.list-view-template-create"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add</a>
                            <a class="btn btn-info" ui-sref="" title="Refresh"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="white-content">
            <div class="table-responsive">
                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Template Name</th>
                            <th>Operating System</th>
                            <th>OS Type</th>
                            <th>Zone</th>
                            <th>Hypervisor</th>
                            <th>Cost/GB/month (<app-currency></app-currency>)</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="template in templateList| filter: templateSearch">

                            <td> <img src="images/os/{{template.image}}" alt="" height="25" width="25" class="m-r-5">{{ template.template.name}}</td>
                            <td>
                                {{ template.osType.name}}

                            </td>
                            <td>
                                {{ template.osCategory.osTypeList[1].name}}
                            </td>
                            <td>{{ template.zone.name}} </td>
                            <td>{{ template.hypervisor}}</td>
                            <td><b class="text-danger">
                                    0.00 <span>/ month</span>
                                </b></td>
                            <td>
                                Ready
                            </td>
                            <td>
                                <a class="icon-button" title="Edit" ui-sref="servicecatalog.list-templatestore.list-view-template-edit({id: {{ template.id}}})"  ><span class="fa fa-edit"></span></a>
                                <a class="icon-button" title="Delete"  data-ng-click="delete()" ><span class="fa fa-trash"></span></a>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
