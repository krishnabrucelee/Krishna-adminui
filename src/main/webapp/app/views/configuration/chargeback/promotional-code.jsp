<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

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
                                    <input data-ng-model="promotionSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" ui-sref="configuration.home.add-promotional"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add</a>

                            </span>
                        </div>
                    </div></div>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">

                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-1 col-sm-3">Code</th>
                                <th class="col-md-2 col-sm-3">Type</th>
                                <th class="col-md-1 col-sm-3">Value</th>
                                <th class="col-md-2 col-sm-3">Start Date(yyyy-mm-dd)</th>
                                <th class="col-md-2 col-sm-3">End Date(yyyy-mm-dd)</th>
                                <th class="col-md-1 col-sm-3">Maximum Uses</th>
                                <th class="col-md-3 col-sm-3">Admin notes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="promotion in promotionList | filter:taxSearch">
                                <td>
                                 {{promotion.code}}

                                </td>
                               <td>
                                 {{promotion.type}}

                                </td>
                                <td>
                                  {{promotion.value}}

                                </td>
                                 <td>
                                  {{promotion.startDate}}

                                </td>
                                <td>
                                  {{promotion.endDate}}

                                </td>
                                 <td>
                                  {{promotion.maximumUses}}

                                </td>
                                 <td>
                                  {{promotion.adminNotes}}

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