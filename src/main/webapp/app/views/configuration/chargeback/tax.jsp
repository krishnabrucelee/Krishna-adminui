<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm"  method="post" novalidate="" data-ng-controller="configurationCtrl">
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

                         <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm">


                        <div class="pull-right">
                            <div class="quick-search ">
                                <div class="input-group">
                                    <input data-ng-model="taxSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" ui-sref="configuration.home.add-tax"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add</a>

                            </span>
                        </div>
                    </div></div>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">

                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-3 col-sm-3">Tax Name</th>
                                <th class="col-md-3 col-sm-3">Description</th>
                                <th class="col-md-3 col-sm-3">Tax Percentage(%)</th>
                                <th class="col-md-3 col-sm-3">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="tax in taxList | filter:taxSearch">
                                <td>
                                 {{tax.taxName}}

                                </td>
                               <td>
                                 {{tax.taxDescription}}

                                </td>
                                <td>
                                 {{tax.taxPercentage}}

                                </td>

                                <td>
                                    <span>
                               <a class="btn btn-info" ui-sref="configuration.home.edit-tax"> Edit</a>
                            <a class="btn btn-info" data-ng-click="openDeleteContainer('sm')" > Delete</a>
                            </span>

                                </td>
                            </tr>
                        </tbody>
                    </table>


                    </div></div>


                </div>
            </div>


        </div>
    </div>
</form>