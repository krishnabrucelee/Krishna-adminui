<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="form.detachForm" data-ng-controller="deleteCtrl">
    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header id="delete_storage_offer_page_title" hide-zone="false" page-icon="fa fa-trash" page-title="<fmt:message key="common.delete.confirmation" bundle="${msg}" />"></panda-modal-header>
        </div>
        <div class="modal-body">
            <div class=" row">
                <div class="form-group has-error col-md-3 col-sm-3  col-xs-3">
                    <span class="fa fa-3x fa-warning text-warning"></span>
                </div>
                <div class="form-group has-error col-md-9 col-sm-9  col-xs-9">
                    <p ><fmt:message key="common.are.you.sure.do.you.want.to.delete" bundle="${msg}" /> ?</p>
                </div>
            </div>
        </div>
        <div class="modal-footer">
        	<get-loader-image data-ng-show="showLoader"></get-loader-image>
            <button type="button" id="delete_storage_offer_cancel_button" data-ng-hide="showLoader" class="btn btn-default " ng-click="cancel()" data-dismiss="modal"><fmt:message key="common.cancel" bundle="${msg}" /></button>
            <button type="submit" id="delete_storage_offer_ok_button" data-ng-hide="showLoader" class="btn btn-default btn-danger2" ng-click="ok(deleteId)" data-dismiss="modal"><fmt:message key="common.ok" bundle="${msg}" /></button>
        </div>
    </div>
</form>