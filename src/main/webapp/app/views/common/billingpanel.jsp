<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div id="navigation">
    <ul side-navigation class="nav" id="side-menu">
        <li ng-class="{active: $state.includes('home')}">
            <a ui-sref="dashboard">
                <span class="pe-7s-home pe-2x nav-menu-icons"></span>
                <span class="nav-label">Home</span>
            </a>
        </li>
<!--        <li ng-class="{active: $state.includes('billing')}">

            <span class="label label-default" style="display: block;font-size: 17px;padding-top: 7px;height: 35px;padding-right: 46px; border-radius: 0px;" ><span class="pe-7s-cart  nav-menu-icons" style="font-size:17px;margin-right: 12px;"></span>Billing</span>
        </li>-->
        <li ng-class="{active: $state.includes('billing.current-usage')}">
            <a ui-sref="billing.current-usage" href="#/billing/usage"><span class="pe-7s-graph pe-2x nav-menu-icons"></span> <span class="nav-label">Current Usage</span> </a>

        </li>
        <li ng-class="{active: $state.includes('billing.invoice')}">
            <a ui-sref="billing.invoice" href="#/billing/invoice" >
                <span class="pe-7s-news-paper pe-2x nav-menu-icons"></span>
                <span class="nav-label">Invoice</span>
            </a>
        </li>
        <li ng-class="{active: $state.includes('billing.payments')}">
            <a ui-sref="billing.payments" href="#/billing/payments">
                <span class="pe-7s-cash pe-2x nav-menu-icons"></span>
                <span class="nav-label">Payments</span>
            </a>
        </li>
        <li ng-class="{active: $state.includes('billing.recurring')}">
            <a href="#/billing/recurring" ui-sref="billing.recurring">
                <span class="pe-7s-timer pe-2x nav-menu-icons"></span>
                <span class="nav-label">Recurring Items</span>
            </a>
        </li>



    </ul>
</div>