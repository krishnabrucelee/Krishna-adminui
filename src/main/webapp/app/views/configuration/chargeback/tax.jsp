<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm"  method="post" novalidate="" data-ng-controller="taxCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/chargeback"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
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
                                    <input data-ng-model="taxSearch" type="text" class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" href="javascript:void(0);" data-ng-click="createTax()"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>

                            </span>
                        </div>
                    </div></div>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">

                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-3 col-sm-3"><fmt:message key="common.name" bundle="${msg}" /></th>
                                <th class="col-md-3 col-sm-3"><fmt:message key="common.description" bundle="${msg}" /></th>
                                <th class="col-md-3 col-sm-3"><fmt:message key="common.percentage" bundle="${msg}" />(%)</th>
                                <th class="col-md-3 col-sm-3"><fmt:message key="common.action" bundle="${msg}" /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="tax in taxList | filter:taxSearch">
                                <td>
                                 {{tax.name }}

                                </td>
                               <td>
                                 {{tax.description}}

                                </td>
                                <td>
                                 {{tax.percentage}}

                                </td>

                                <td>
                                    <span>
                               <a class="btn btn-info" href="javascript:void(0)" data-ng-click="edit('md', tax)"> <fmt:message key="common.edit" bundle="${msg}" /></a>
                            <a class="btn btn-info" data-ng-click="delete('sm', tax)" > <fmt:message key="common.delete" bundle="${msg}" /></a>
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