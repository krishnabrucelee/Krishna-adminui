<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row">
    <div class="col-lg-7 col-md-7 col-sm-12 project-information">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-cloud m-r-xs"></i>Project Information</h3>
            </div>
            <div class="panel-body no-padding">
                <div class="row">
                    <div class="col-md-6 col-sm-6 border-right m-l-n-xxs h-260">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <label for="projectInfoId" class="font-normal m-r-md">Project</label>
                                <div class="font-bold pull-right" id="projectInfoId">
                                    {{ projectInfo.id}} |
                                    <span class="m-l-xs text-info">{{ projectInfo.accountType.name}}</span> |
                                    <span class="m-l-xs" data-ng-class="projectInfo.status.name == 'ACTIVE' ? 'text-success': 'text - danger'">{{ projectInfo.status.name}}</span>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <label for="projectInfoCardVerified" class="font-normal m-r-md">Card Verified</label>
                                <div class="font-bold pull-right" id="projectInfoCardVerified" data-ng-show="projectInfo.cardVerified">Verified</div>
                                <div class="font-bold pull-right" id="projectInfoCardVerified" data-ng-hide="projectInfo.cardVerified">Not Verified</div>
                            </li>
                            <li class="list-group-item">
                                <label for="projectInfoFirstName" class="font-normal m-r-md">First Name</label>
                                <div class="font-bold pull-right" id="projectInfoFirstName"> {{ projectInfo.firstName}}</td>
                            </li>
                            <li class="list-group-item">
                                <label for="projectInfoLastName" class="font-normal m-r-md">Last Name</label>
                                <div class="font-bold pull-right" id="projectInfoLastName"> {{ projectInfo.lastName}}</td>
                            </li>
                            <li class="list-group-item">
                                <label for="projectInfoUserName" class="font-normal m-r-md">User Name</label>
                                <div class="font-bold pull-right" id="projectInfoUserName"> {{ projectInfo.userName}}</td>

                            </li>


                        </ul>
                    </div>
                    <div class="col-md-6  col-sm-6  h-260">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <label for="projectInfoDomainName" class="font-normal m-r-md">Domain</label>
                                <div class="font-bold pull-right" id="projectInfoDomainName"> {{ projectInfo.domainName}}</td>
                            </li>
                            <li class="list-group-item">
                                <label for="projectInfoEmail" class="font-normal m-r-md">Email</label>
                                <div class="font-bold pull-right" id="projectInfoEmail"> {{ projectInfo.email}}</div>
                            </li>
                            <li class="list-group-item h-100">
                                <label for="projectInfoAddress" class="font-normal m-r-md">Address</label><br>
                                <div class="font-bold pull-right" id="projectInfoAddress">
                                    <div>{{ projectInfo.billingAddress}}  {{ projectInfo.billingState}} </div>
                                    <div>{{ projectInfo.billingCountry}}  {{ projectInfo.billingZip}}</div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <label for="projectInfoPhone" class="font-normal m-r-md">Phone</label>
                                <div class="font-bold pull-right" id="projectInfoPhone"> {{ projectInfo.phoneNumber}}</div>
                            </li>
                        </ul>
                    </div>
                </div>



            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-8 h-260 invoice-billing">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-calculator m-r-xs"></i>Invoice/Billing</h3>
            </div>
            <div class="panel-body no-padding">
                <ul class="list-group">
                    <li class="list-group-item">
                        <label for="billingCreditLimit" class="font-normal m-r-md">Credit Limit</label>
                        <div class="font-bold pull-right" id="billingCreditLimit"><app-currency></app-currency> {{ projectInfo.creditLimit}}</div>
                    </li>
                    <li class="list-group-item">
                        <label for="billingPaid" class="font-normal m-r-md">Paid</label>
                        <div class="font-bold pull-right" id="billingPaid">
                            <app-currency></app-currency> {{ projectInfo.totalPaid}}
                        </div>
                    </li>
                    <li class="list-group-item">
                        <label for="billingDue" class="font-normal m-r-md">Due</label>
                        <span class="font-bold pull-right" id="billingDue"><app-currency></app-currency> {{ projectInfo.totalPayable}}</span>
                    </li>
                    <li class="list-group-item">
                        <label for="billingRefund" class="font-normal m-r-md">Refund</label>
                        <span class="font-bold pull-right text-danger" id="billingRefund"><app-currency></app-currency> 0.00</span>
                    </li>
                    <li class="list-group-item">
                        <label for="billingAvailableCredit" class="font-normal m-r-md">Available Credit</label>
                        <span class="font-bold pull-right" id="billingAvailableCredit"><app-currency></app-currency> {{ (projectInfo.totalPaid - projectInfo.totalPayable) | number:0}}</span>
                    </li>
                    <li class="list-group-item  text-success">
                        <label for="billingIncome" class="font-normal m-r-md">Income</label>
                        <span class="font-bold pull-right" id="billingIncome"><app-currency></app-currency> 0.00 </span>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-4 project-information-btn-area">
        <div class="h-260">
            <a class="btn btn-default disabled w-sm m-t-xs" title="Activate"> Activate</a>
            <a class="btn btn-info w-sm m-t-xs" data-ng-click="confirmProjectCancellation()" title="Cancel">Cancel</a>
            <a class="btn btn-info w-sm  m-t-xs" data-ng-click="confirmProjectSuspension()" title="Suspend">Suspend</a>
            <a class="btn btn-default w-sm  m-t-xs disabled" title="Refund">Refund</a>
            <a class="btn btn-info w-sm m-t-xs"  data-ng-click="project.category = 'infraLimitSummary'" title="Infra Limits"> Infra Limits</a>
        </div>
    </div>
</div>

<hr>