<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateDeleteTax(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header hide-zone="true" page-icon="fa fa-trash" page-title="Delete"></panda-modal-header>
            <!--<h2 class="modal-title" id="myModalLabel">Confirm Detach Volume</h2>-->
        </div>

        <div class="modal-body">
            <div class=" row">
                <div class="form-group has-error col-md-3 col-sm-3  col-xs-3">

                    <span class="fa fa-3x fa-warning text-warning"></span>
                </div>
                <div class="form-group has-error col-md-9 col-sm-9  col-xs-9">
                    <p >Are you sure do you want to delete this tax ?</p>
                </div>


            </div>

        </div>
        <div class="modal-footer">
            <get-loader-image data-ng-if="showLoader"></get-loader-image>
            <button type="button" data-ng-if="!showLoader" class="btn btn-default " ng-click="cancel()" data-dismiss="modal">Cancel</button>
            <button type="submit" data-ng-if="!showLoader" class="btn btn-default btn-danger2" ng-click="detach()" data-dismiss="modal">Ok</button>

        </div>
    </div>

</form>