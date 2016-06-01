<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="form.detachForm" ng-controller="networkListCtrl">
    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header hide-zone="false" page-custom-icon="images/network-icon-2.png" page-title="<fmt:message
									key="view.network.offer" bundle="${msg}" />"></panda-modal-header>

        </div>

        <div class="modal-body" >
            <div class=" row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="table-responsive">
                        <table cellspacing="5" cellpadding="5"  class=" w-m table  table-hover table-striped table-mailbox table-bordered ">
<!--                             <tr> <td><label>Zone</label></td><td>{{ network.zone.name}}</td></tr>
 -->                            <tr>  <td><label><fmt:message key="common.name" bundle="${msg}" /></label></td> <td>{{network.name}}</td></tr>
                            <tr> <td><label><fmt:message key="common.description" bundle="${msg}" /></label></td> <td>{{ network.displayText}}</td></tr>
                            <tr> <td><label><fmt:message key="common.traffictype" bundle="${msg}" /></label></td> <td>{{ network.trafficType}}</td></tr>
                            <tr> <td><label><fmt:message key="common.guestiptype" bundle="${msg}" /></label></td><td>{{ network.guestIpType}}</td></tr>
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal-footer">
                    <button type="button" class="btn btn-info " ng-click="cancel()" data-dismiss="modal"><fmt:message
									key="common.ok" bundle="${msg}" /></button>
                </div>
    </div>

</form>