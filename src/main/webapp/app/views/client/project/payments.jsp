<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ng-controller="projectPaymentCtrl">
    <div class="hpanel">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <a class="btn btn-info pull-right" data-ng-click="getPaymentForm('md', projectInfo)"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add</a>
                    <div class="quick-search pull-right m-r-sm">
                        <div class="input-group">
                            <input data-ng-model="invoiceSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                            <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="white-content">
            <div class="table-responsive">
                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Payment Id</th>
                            <th>Project</th>
                            <th>Payment Date</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="payment in paymentList| filter: paymentSearch">
                            <td>
                                {{ payment.id }}
                            </td>
                            <td>{{ payment.project.firstName}}</td>
                            <td>{{ payment.paymentDate}} </td>
                            <td>{{ payment.description}} </td>
                            <td>
                                <a class="icon-button" title="View"  ><span class="fa fa-eye"></span></a>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
