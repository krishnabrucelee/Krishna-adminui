<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="snapshotForm" data-ng-submit="saveVolumeSnapshot(snapshotForm)" data-ng-controller="miscellaneousListCtrl" novalidate = "">
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
                                <label class="col-md-4 col-sm-3 control-label "><fmt:message key="template.zone" bundle="${msg}" /><span class="text-danger">*</span></label>
                                <div class="col-md-6  col-sm-7 col-xs-7">
                                    <select required="true"  class="form-control " name="zone" data-ng-model="miscellaneous.zone" ng-options="zone.name for zone in formElements.zoneList" data-ng-class="{'error': snapshotForm.zone.$invalid && formSubmitted}" >
                                        <option value="">Select</option>
                                    </select>
                                    <i  tooltip="<fmt:message key="template.zone.tooltip" bundle="${msg}" />" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
                                    <div class="error-area" data-ng-show="snapshotForm.zone.$invalid && formSubmitted" ><i  tooltip="<fmt:message key="template.zone.error" bundle="${msg}" />" class="fa fa-warning error-icon"></i></div>
                                </div>
                            </div>
                            </div>
                             <div class="form-group">
                                <div class="form-group" ng-class="{'text-danger': snapshotForm.description.$invalid && formSubmitted}">
                                <div class="row">
                                    <label class="col-md-4 col-sm-4 control-label font-normal">Cost per GB/day (<app-currency class="text-danger"></app-currency>)<span class="text-danger">*</span></label>
                                    <div class="col-md-6 col-sm-6  col-xs-6">
                                        <input required="true" type="text" valid-price name="description" data-ng-if =" miscellaneous.costType ='VOLUMESNAPSHOT'" data-ng-model="miscellaneous.costperGB" data-ng-class="{'error': snapshotForm.description.$invalid && formSubmitted}" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="form-group">
                                <div class="row  ">
                                    <div class="col-md-4 col-sm-4"></div>

                                    <div class="col-md-6 col-sm-6   ">
                                             <get-loader-image data-ng-if="showLoader"></get-loader-image>
                                              <button class="btn btn-info pull-right" data-ng-if="!showLoader"  type="submit" ng-disabled="form.snapshotForm.$invalid" ><fmt:message key="common.add" bundle="${msg}" /></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="white-content">

                                <div class="table-responsive">
                                    <table cellspacing="1" cellpadding="1" class="table table-bordered  table-striped">
                                        <thead>
                                            <tr>
                                                <th>Zone</th>
                                                <th>Cost/GB/day</th>

                                            </tr>
                                        </thead>
                                        <tbody >
                                            <tr data-ng-repeat="miscellaneous in volumeList| filter: miscellaneousSearch">
                                                <td>
                                                    {{miscellaneous.zone.name}}
                                                </td>
                                                <td><h5 class="text-danger"><app-currency></app-currency>{{miscellaneous.costperGB}}</td>

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