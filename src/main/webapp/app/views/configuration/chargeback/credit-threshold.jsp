<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <span class="pull-left">
                            <a class="btn btn-info" href="#/configuration/chargeback"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body">
                <ul class="nav nav-tabs" data-ng-init="templateCategory = 'trialManagement'">
        <li class="active"><a  data-ng-click="templateCategory = 'trialManagement'" data-toggle="tab">Trial Management</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'retailManagement'" data-toggle="tab">Retail Management</a></li>
        <li class=""><a  data-ng-click="templateCategory = 'creditLimit'" data-toggle="tab">Credit Limit Notification Settings</a></li>

    </ul>

                <div class="tab-content">

        <div class="tab-pane" data-ng-class="{'active' : templateCategory == 'trialManagement'}" id="step1-dashboard">
        <div data-ng-include src="'views/configuration/chargeback/trial-management.html'"></div>

        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'retailManagement'}" id="step1-config">
            <div data-ng-include src="'views/configuration/chargeback/retail-management.html'"></div>
        </div>
        <div class="tab-pane"  data-ng-class="{'active' : templateCategory == 'creditLimit'}" id="step1-config">
            <div data-ng-include src="'views/configuration/chargeback/credit-limit.html'"></div>
        </div>

    </div>

             </div>
            </div>
        </div>


</div>