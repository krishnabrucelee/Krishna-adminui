<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm"  method="post" novalidate="" data-ng-controller="billableItemsCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/chargeback"  title="<fmt:message key="common.back" bundle="${msg}" />" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
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
                                    <input data-ng-model="billingSearch" type="text" class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" href="javascript:void(0);" data-ng-click="createBillableItem()"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>

                            </span>
                        </div>
                    </div></div>

					<pagination-content></pagination-content>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">
	                    <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-2 col-sm-2"><fmt:message key="common.name" bundle="${msg}" /></th>
                                <th class="col-md-2 col-sm-2"><fmt:message key="common.unit" bundle="${msg}" /></th>
                                <th class="col-md-3 col-sm-3"><fmt:message key="common.type" bundle="${msg}" /></th>
                                <th class="col-md-3 col-sm-3"><fmt:message key="common.tax" bundle="${msg}" /></th>
                                <th class="col-md-2 col-sm-2"><fmt:message key="common.action" bundle="${msg}" /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="billing in billableItems | filter:billingSearch">
                                <td>
                                    {{ billing.name }}

                                </td>
                                <td>{{ global.BILLABLE_ITEM.BILLABLE_UNIT[billing.billableUnit] }}</td>
                                <td>{{ global.BILLABLE_ITEM.BILLABLE_TYPE[billing.billableType] }}</td>
								<td>{{ (billing.tax.name) ? billing.tax.name : "NA"  }}</td>
                                <td>

                                    <span>
                               <a class="btn btn-info" data-ng-click="edit('md', billing)"> <fmt:message key="common.edit" bundle="${msg}" /></a>
                            	<a class="btn btn-info" data-ng-click="delete('sm', billing)" > <fmt:message key="common.delete" bundle="${msg}" /></a>
                            </span>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div></div>
					<pagination-content></pagination-content>

                </div>
            </div>


        </div>
    </div>
</form>
