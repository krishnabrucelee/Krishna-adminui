<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <form name="configForm" data-ng-submit="validatePaymentGateway(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
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

                    <div class="row">
                        <div class="col-md-12 col-sm-12">

                            <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th class="col-md-2 col-sm-2">Gateway Name</th>
                                        <th class="col-md-2 col-sm-2">Gateway type</th>
                                        <th class="col-md-1 col-sm-2">Enable/Disable</th>
                                        <th class="col-md-1 col-sm-2">Is Default</th>
                                        <th class="col-md-1 col-sm-2">Include/Exclude</th>
                                        <th class="col-md-1 col-sm-2">Processing Fee Percent(%)</th>
                                        <th class="col-md-2 col-sm-2">Processing Fee Amount(CNY)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-ng-repeat="payment in paymentGateList" >
                                        <td>
                                            {{payment.gatewayName}}

                                        </td>
                                        <td>
                                            {{payment.gatewayType}}

                                        </td>
                                        <td>

                                                <input icheck type="checkbox"  name="enable" data-ng-model="payment.enabledPayment" id="{{payment.id}}"  />
                                        </td>
                                        <td>

                                            <input icheck type="radio"  name="default"  data-ng-model="payment.isDefault" value="{{payment.id}}" id="{{payment.id}}" data-ng-change="updatePaymentDefault(payment, $index)"  />

                                        </td>
                                        <td>
                                            <input icheck type="checkbox"  name="include" data-ng-model="payment.include"  />
                                        </td>
                                        <td>
                                            {{payment.processingFeePercent}}
                                        </td>
                                        <td>
                                            {{payment.processingFeeAmount}}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>


                        </div></div>


                    <button class="btn btn-info pull-right" type="submit">Update</button>

                </div>



            </div>
        </div>


    </div>
</form>