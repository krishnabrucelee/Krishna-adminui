<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view >

    <div ng-controller="clientListCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-right">
                            <div class="quick-search ">
                                <div class="input-group">
                                    <input data-ng-model="clientSearch" type="text" class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <span class="pull-right m-l-sm m-t-sm">
                                <a class="btn btn-info" ui-sref="client.client.add"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span><fmt:message key="common.add" bundle="${msg}" /></a>
                            </span>
                        </div>
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">

                        <div class="white-content">
                            <div class="table-responsive">
                                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="col-md-2 col-sm-3"><fmt:message key="company.name" bundle="${msg}" /></th>
                                            <th class="col-md-2 col-sm-3"><fmt:message key="headquarter" bundle="${msg}" /></th>
                                            <th class="col-md-2 col-sm-3"><fmt:message key="contact.name" bundle="${msg}" /></th>
                                            <th class="col-md-2 col-sm-3"><fmt:message key="phone.number" bundle="${msg}" /></th>
                                            <th class="col-md-1 col-sm-2"><fmt:message key="common.action" bundle="${msg}" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-ng-repeat="domain  in domainList | filter: clientSearch">
                                            <td>{{ domain.name}}</td>
                                            <td>{{ client.headquarter}}</td>
                                            <td>{{ client.contactName}} </td>
                                            <td>{{ client.phoneNo}} </td>
                                            <td>
                                            <a class="icon-button" ui-sref="client.client.edit" title="<fmt:message key="common.edit" bundle="${msg}" />" > <span class="fa fa-edit"></span></a>

												<a class="icon-button"  ui-sref="client.client.quotalimit({id: {{domain.id}}, quotaType: 'client-quota'})" title="<fmt:message key="common.quota.limit" bundle="${msg}" />"  ><span class="fa font-bold pe-7s-edit"></span></a>

												<a class="icon-button" title="<fmt:message key="common.delete" bundle="${msg}" />" data-ng-click="delete('sm')"><span class="fa fa-trash"></span></a>
										    </td>
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
