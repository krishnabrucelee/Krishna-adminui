<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="vmsnapshotForm" data-ng-submit="save(vmsnapshotForm)" data-ng-controller="miscellaneousListCtrl" >
    <div class="row">
        <div class="col-md-12 col-sm-12" >
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12 ">
                            <div class="quick-search pull-right">
                                <div class="input-group">
                                    <input data-ng-model="miscellaneousSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="white-content">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal">Zone Name</label>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <select  class="form-control input-group" data-ng-init="miscellaneous.zone.name = zone.zoneList[0]"  name="zone" data-ng-model="miscellaneous.zone.name" ng-options="zone.name for zone in zone.zoneList" >
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal">Cost/GB/month(<app-currency class="text-danger"></app-currency>)</label>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <input  type="text" valid-decimal name="description" data-ng-model="miscellaneous.cost" class="form-control" placeholder="10.00" >

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal">(Billing Cost)/GB/hour(<app-currency class="text-danger"></app-currency>)</label>
                                    <div class="col-md-6 col-sm-6">
                                        <b class="text-danger">
                                            0.00000
                                        </b>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-md-4 col-sm-4"></div>

                                    <div class="col-md-6 col-sm-6 ">
                                        <button class="btn btn-info pull-right" type="submit" ng-disabled="form.vmsnapshotForm.$invalid" >Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                                <div class="white-content">

                                    <div class="table-responsive">
                                        <table cellspacing="1" cellpadding="1" class="table table-bordered  table-striped ">
                                            <thead>
                                                <tr>
                                                    <th>Zone</th>
                                                    <th>Cost/GB/month</th>

                                                </tr>
                                            </thead>
                                            <tbody >
                                                <tr data-ng-repeat="miscellaneous in miscellaneousList| filter: miscellaneousSearch">
                                                    <td>
                                                        {{miscellaneous.zone}}
                                                    </td>
                                                    <td><app-currency></app-currency>0.01944</td>

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
    </div>
</form>