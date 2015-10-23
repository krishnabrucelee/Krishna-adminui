<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>
<ng-include id="menu" src="global.getViewPageUrl('common/navigation.jsp')"></ng-include>


<!-- Main Wrapper -->
<div id="wrapper">

<div class="content">
<div class="row">
    <div class="col-lg-12 text-center m-t-md">
        <h2>
            <fmt:message key="welcome.admin.panel" bundle="${msg}" />
        </h2>


        <p>
            <fmt:message key="cloud.management.portal" bundle="${msg}" />
        </p>
    </div>
</div>



</div>
</div>
