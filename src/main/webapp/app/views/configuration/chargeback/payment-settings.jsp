<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

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
                            <label class="col-md-4 col-sm-4 control-label">Credit Card Processing Enable:
                            </label>

                            <div class="col-md-2 col-sm-3">
                                <input icheck  name="creditCard"  type="checkbox" data-ng-model="payment.creditCard" />
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Credit Card Processing Enable for panel" ></i>

                            </div>

                        </div>
                    </div>

                        <div class="form-group" data-ng-show="payment.creditCard ">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label">Enable Card Verification On Sign Up:
                            </label>

                            <div class="col-md-2 col-sm-3">
                                <input icheck name="cardVerification"  type="checkbox" data-ng-checked="true" data-ng-model="payment.cardVerification"/>
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Credit Card Processing Enable On Signup" ></i>

                            </div>

                        </div>
                    </div>

                        <div class="form-group">
                             <div class="row">
                                  <label class="col-md-4 col-sm-4 control-label">
                            </label>
                                 <div class="col-md-5 col-sm-6">
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

