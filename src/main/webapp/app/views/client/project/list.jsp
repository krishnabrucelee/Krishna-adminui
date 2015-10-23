<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view >

    <div ng-controller="projectListCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left">
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Total Project</span>
                                <div class="clearfix"></div>
                                <span class="pull-left m-t-xs"><img src="images/project-icon.png"></span>
                                <b class="pull-right">13</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Retail Project</span>
                                <div class="clearfix"></div>
                                <span class="pull-left m-t-xs"><img src="images/project-icon.png"></span>
                                <b class="pull-right">04</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Trial Project</span>
                                <div class="clearfix"></div>
                                <span class="pull-left m-t-xs"><img src="images/project-icon.png"></span>
                                <b class="pull-right">09</b>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="pull-right">
                            <div class="quick-search pull-right m-t-xl">
                                <div class="input-group">
                                    <input data-ng-model="projectSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
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
                            <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>User Id</th>
                                        <th>Username</th>
                                        <th>Domain</th>
                                        <th>Project Type</th>
                                        <th>Current Due (CNY)</th>
                                        <th>Paid (CNY)</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-ng-repeat="project in projectList| filter: projectSearch">
                                        <td>
                                            <a class="text-info" ui-sref="client.project.view({id: {{ project.id}}})"  title="View Project" >{{ project.id}}</a>
                                        </td>
                                        <td>{{ project.userName}}</td>
                                        <td>{{ project.domainName}} </td>
                                        <td>{{ project.accountType.name}} </td>
                                        <td>{{ project.totalPayable}} </td>
                                        <td>{{ project.totalPaid}} </td>
                                        <td>
                                            <label class="icon-button btn btn-success  btn-sm" title="{{ project.status.name}}"  >{{ project.status.name}}</label>

                                        </td>
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