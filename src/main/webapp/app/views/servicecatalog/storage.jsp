<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view>
<div class="row" data-ng-hide="viewContent" ng-controller="storageListCtrl">
    <div class="" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left">
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Total Offering</span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">13</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Enabled Offering</span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">04</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Disabled Offering</span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">09</b>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="pull-right">
                            <div class="quick-search ">
                                <div class="input-group">
                                    <input data-ng-model="storageSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" ui-sref="servicecatalog.list-storage.list-storage-offer"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add</a>
                                <a class="btn btn-info" ui-sref="servicecatalog.list-storage" title="Refresh"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
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
                                <th>Name</th>
                                <th>Type</th>
                                <th>Size (GB)</th>
                                <th>Custom</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="storage in storageList| filter: storageSearch">
                                <td>
                                    {{ storage.name}}
                                </td>
                                <td>{{ storage.storageType}} </td>
                                <td>{{ storage.diskSize}}</td>
                                <td>{{ storage.isCustomDisk}}</td>
                                <td>
                                    <a class="icon-button"  ui-sref="servicecatalog.list-storage.list-view-storage-offer({id: {{ storage.id}}})" title="Edit"  ><span class="fa fa-edit m-r"></span></a>
                                    <a class="icon-button" title="Enable" data-ng-hide="storage.state == 'Enable'">
                                        <span class="fa fa-play m-r" ></span>
                                    </a>
                                    <a class="icon-button" title="Disable" data-ng-show="storage.state == 'Disable'">
                                        <span class="fa fa-ban m-r" ></span>
                                    </a>

                                    <a class="icon-button" title="Delete" data-ng-click="delete('sm', storage.id)" ><span class="fa fa-trash"></span></a>
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