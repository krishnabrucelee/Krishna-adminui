<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="white-content">
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.email" type="button"><i class="fa fa-envelope fa-3x"></i> <h5><fmt:message key="email.config" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.organization-detail" type="button"><i class="fa fa-calculator fa-3x"></i> <h5><fmt:message key="organization.details" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.login-security" type="button"><i class="fa fa-sign-in fa-3x"></i> <h5><fmt:message key="login.security" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.signup" type="button"><i class="fa fa-wrench fa-3x"></i> <h5><fmt:message key="signup.settings" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.admin-user" type="button"><i class="fa fa-users fa-3x"></i> <h5><fmt:message key="admin.users" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.support" type="button"><i class="fa fa-support fa-3x"></i> <h5><fmt:message key="common.support" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.language" type="button"><i class="fa fa-language fa-3x"></i> <h5><fmt:message key="common.language" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.email-template" type="button"><i class="fa fa-envelope-o fa-3x"></i> <h5><fmt:message key="email.template" bundle="${msg}" /></h5></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100" ui-sref="configuration.home.theme-settings" type="button"><i class="fa fa-cogs fa-3x"></i> <h5><fmt:message key="theme.settings" bundle="${msg}" /></h5></button></div>
</div>
