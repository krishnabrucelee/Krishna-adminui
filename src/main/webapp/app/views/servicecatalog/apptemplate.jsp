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
                            <span class="pull-right m-t-xs"><img src="images/icon-template.png"></span>
                            <b class="pull-right">0</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Windows Template</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/icon-template.png"></span>
                            <b class="pull-right">0</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Linux Template</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/icon-template.png"></span>
                            <b class="pull-right">0</b>
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
                            <a class="btn btn-info" ui-sref="servicecatalog.list-templatestore" title="Refresh"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <label><p>You dont have any App Template yet. Create One Now</p>
                </label>
                </div>
        </div>

    </div>
</div>
