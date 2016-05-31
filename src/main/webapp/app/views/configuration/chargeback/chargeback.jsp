<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="white-content">
    <!-- <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.billing" type="button"><i class="fa fa-pencil-square-o fa-3x"></i> <h5>Billable Items</h5></button></div> -->
    <!-- <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.credit" type="button"><i class="fa fa-stack-exchange fa-3x"></i> <h5>Credit and Resource Threshold</h5></button></div> -->
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.paymentSettings" type="button"><i class="fa fa-money fa-3x"></i> <h5><fmt:message key="payment.settings" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.billing-settings" type="button"><i class="fa fa-file-text fa-3x"></i> <h5><fmt:message key="common.adjustments" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.invoice" type="button"><i class="fa fa-files-o fa-3x"></i> <h5><fmt:message key="invoice" bundle="${msg}" /></h5></button></div>
    <!-- <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.tax" type="button"><i class="fa fa-legal  fa-3x"></i> <h5>Tax</h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.promotional" type="button"><i class="fa fa-barcode fa-3x"></i> <h5>Promotional Code</h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.discount" type="button"><i class="fa fa-tags fa-3x"></i> <h5>Discount</h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.late-fee" type="button"><i class="fa fa-bullhorn fa-3x"></i> <h5>Late Fee</h5></button></div> -->
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.paymentGateway" type="button"><i class="fa fa-credit-card fa-3x"></i> <h5><fmt:message key="payment.gateway" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.currency" type="button"><i class="pe pe-7s-cash pe-3x"></i> <h5><fmt:message key="currency" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.resourceAllocation" type="button"><i class="fa fa-sliders fa-3x"></i> <h5><fmt:message key="resource.allocation" bundle="${msg}" /></h5></button></div>
</div>
