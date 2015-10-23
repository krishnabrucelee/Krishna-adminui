<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div>
    <div class="row">
        <div class="h4 col-md-9">
            <span class="m-l-xl">Current Usage <b> As On Date: {{ currentDate | date: 'dd-MM-yyyy'}}</b></span>
        </div>

        <div class="col-md-3">
            <span class="pull-right">
                <a class="btn btn-info" data-ng-click="toggleInvoiceDetails(invoice)"><span class="fa fa-arrow-circle-left font-bold m-r-xs"></span>Back</a>
                <a class="btn btn-info" data-ng-click="getInvoiceItemForm()"><span class="fa fa-plus-circle font-bold m-r-xs"></span>Add</a>
        </div>
    </div>
    <hr>
    <div class="row">
        <div  class="col-md-12 col-sm-12 m-l-xl">
            <div class="row">
                <div  class="col-md-2 col-sm-3 p-xxs">
                    <div class="hpanel hbgblue">
                        <div class="panel-body p-xs">
                            <div class="text-center">
                                <p class="font-light h1">
                                <app-currency></app-currency>  {{ invoice.previousBalance }}
                                </p>
                                <hr class="no-margins">
                                <h5>Previous Balance</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <div  class="col-md-1 text-center">
                    <div class="fa fa-minus-circle fa-3x m-t-xl"></div>
                </div>

                <div  class="col-md-2 col-sm-4 p-xxs">
                    <div class="hpanel hbgblue">
                        <div class="panel-body p-xs">
                            <div class="text-center">
                                <p class="font-light h1">
                                <app-currency></app-currency>  {{ invoice.payments }}
                                </p>
                                <hr class="no-margins">
                                <h5>Payments</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <div  class="col-md-1 text-center">
                    <div class="fa fa-plus-circle fa-3x m-t-xl"></div>
                </div>

                <div class="col-md-2 col-sm-4 p-xxs">
                    <div class="hpanel hbgblue">
                        <div class="panel-body p-xs">
                            <div class="text-center">
                                <p class="font-light h1">
                                <app-currency></app-currency>  {{ invoice.currentDue }}
                                </p>
                                <hr class="no-margins">
                                <h5>Current Usage</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <div  class="col-md-1 text-center">
                    <div class="fa fa-3x m-t-xl">=</div>
                </div>

                <div class="col-md-2 col-sm-4 p-xxs">
                    <div class="hpanel hbgblue">
                        <div class="panel-body p-xs">
                            <div class="text-center">
                                <p class="font-light h1">
                                <app-currency></app-currency>  {{ (invoice.previousBalance + invoice.currentDue - invoice.payments) | number : 2 }}
                                </p>
                                <hr class="no-margins">
                                <h5>Total Payable</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row border-content">
        <div class="col-md-3">

            <ul class="list-group">
                <li class="list-group-item active" >
                    <span class="badge">{{ invoice.currentDue }}</span> Zone Charges
                </li>
                <li class="list-group-item" data-ng-repeat="zone in invoice.zoneList" data-ng-click="showBreakUpPrice(zone)">
                    <span class="badge">{{ zone.total }}</span> {{ zone.name }}
                </li>
                <li class="list-group-item" data-ng-repeat="misc in invoice.miscList" data-ng-click="showBreakUpPrice(misc)">
                    <span class="badge">{{ misc.total }}</span> {{ misc.name }}
                </li>
            </ul>

        </div>
        <div class="col-md-3" data-ng-show="showBreakUps"  data-child="list-group" data-effect="fadeInLeft">
            <ul class="list-group animated-panel fadeInLeft">
                <li class="list-group-item active">
                    <span class="badge">{{ breakUpObj.total }}</span> Item Break-up
                </li>
                <li class="list-group-item" data-ng-repeat="breakUp in breakUpObj.breakUps" data-ng-click="showItemPrice(breakUp)">
                    <span class="badge">{{ breakUp.total }}</span> {{ breakUp.name }}
                </li>
            </ul>
        </div>

        <div class="col-md-6" data-ng-show="showBreakUpDetail" data-child="panel"  >
            <div class="panel panel-primary animated-panel fadeInLeft">
                <div class="panel-heading">
                    <h3 class="panel-title">Project Information</h3>
                </div>
                <div class="panel-body no-padding">
                    <div class="table-responsive   h-100">
                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped m-b-n">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Plan</th>
                                    <th>Unit</th>
                                    <th>Qty</th>
                                    <th>Charges</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-ng-repeat="item in breakUpDetailObj.itemList">
                                    <td>{{ item.name}}</td>
                                    <td>{{ item.plan}}</td>
                                    <td>{{ item.units}} </td>
                                    <td>{{ item.quantity}} </td>
                                    <td>{{ item.charges}} </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>



        </div>
    </div>
</div>
