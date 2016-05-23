<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateGrant(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl" >

    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header page-icon="" hide-zone="true" page-title="Grant API Access"></panda-modal-header>

        </div>
     <div class="modal-body">
         <div class="row">
             <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="pull-right">
            <button type="button" class="btn btn-default " ng-click="cancel()" data-dismiss="modal">No</button>
            <button class="btn btn-info" type="submit">Yes</button>
                 </div>
             </div>
         </div>
     </div>
    </div>
</form>




