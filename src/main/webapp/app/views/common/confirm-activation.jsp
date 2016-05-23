<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="inmodal" >
    <div class="modal-header">
        <panda-modal-header hide-zone="false" page-icon="fa fa-warning" page-title="<fmt:message key="account.activation.confirmation" bundle="${msg}" />"></panda-modal-header>
        <!--<h2 class="modal-title" id="myModalLabel">Confirm Detach Volume</h2>-->
    </div>

    <div class="modal-body">
        <div class=" row">
            <div class="form-group has-error col-md-3 col-sm-3  col-xs-3">

                <span class="fa fa-3x fa-warning text-warning"></span>
            </div>
            <div class="form-group has-error col-md-9 col-sm-9  col-xs-9">
                <p ><fmt:message key="are.you.sure.do.you.want.to.enable" bundle="${msg}" /> </p>
            </div>


        </div>

    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default " ng-click="cancel()" data-dismiss="modal"><fmt:message key="common.cancel" bundle="${msg}" /></button>
        <button type="button" class="btn btn-default btn-danger2" ng-click="ok(suspensionObject)" data-dismiss="modal"><fmt:message key="common.ok" bundle="${msg}" /></button>

    </div>
</div>
