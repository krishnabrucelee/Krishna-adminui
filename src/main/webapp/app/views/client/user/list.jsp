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
                                <span class="pull-right">Total Users</span>
                                <div class="clearfix"></div>
                                <span class="pull-left m-t-xs"><img src="images/user-icon.png"></span>
                                <b class="pull-right">13</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Enabled Users</span>
                                <div class="clearfix"></div>
                                <span class="pull-left m-t-xs"><img src="images/user-icon.png"></span>
                                <b class="pull-right">04</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Disabled Users</span>
                                <div class="clearfix"></div>
                                <span class="pull-left m-t-xs"><img src="images/user-icon.png"></span>
                                <b class="pull-right">09</b>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="pull-right">
                            <div class="quick-search pull-right m-t-xl">
                                <div class="input-group">
                                    <input data-ng-model="userSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
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
                                            <th>Username</th>
                                            <th>Reference Id</th>
                                            <th>Domain</th>
                                            <th>Email</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-ng-repeat="user in userList| filter: userSearch">
                                            <td>{{ user.userName}}</td>
                                            <td>{{ user.uuid}}</td>
                                            <td>{{ user.domainName}} </td>
                                            <td>{{ user.email}} </td>
                                            <td>
                                                <label class="icon-button btn btn-success btn-sm" data-ng-show="user.enabled" title="Enabled"  >Enabled</label>
                                                <label class="icon-button btn btn-danger btn-sm" data-ng-hide="user.enabled" title="Disabled"  >Disabled</label>

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
