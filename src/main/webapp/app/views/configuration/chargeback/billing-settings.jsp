<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateInvoice(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
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
                    <div class="col-md-8 col-sm-8">

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">Hourly Billing Enable:
                                </label>

                                <div class="col-md-4 col-sm-5">
                                    <input icheck  name="billing"  type="radio" data-ng-model="hourly" />
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enable Hourly Billing for VM,Disk and Snapshot" ></i>

                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">Monthly Billing Enable:
                                </label>

                                <div class="col-md-4 col-sm-5">
                                    <input icheck name="billing"  type="radio"  data-ng-model="monthly"/>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enable Monthly Billing for VM,Disk and Snapshot" ></i>

                                </div>

                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">Usage Calculation Type:

                                </label>
                                <div class="col-md-4 col-sm-5">
                                    <label class="">

                                        <input icheck type="radio"  value="Actual" name="usageCalculationType" data-ng-model="actual"  > Actual


                                    </label>
                                    <label class="m-l-sm">

                                        <input icheck type="radio" value="Hourly" name="usageCalculationType" data-ng-model="hourly" data-ng-checked="true" > Hourly


                                    </label>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enable Monthly Billing for VM,Disk and Snapshot" ></i>

                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-4 control-label">
                                </label>
                                <div class="col-md-4 col-sm-5">
                                    <button class="btn btn-info" type="submit">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>


        </div>
    </div>
</form>

