<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="inmodal" >
    <div class="modal-header">
        <panda-modal-header page-title="{{activity.pageTitle}} Description" hide-zone="true"></panda-modal-header>

    </div>
    <div class="modal-body">
        <div data-ng-show="activity.category == 'events'">
            <div data-ng-include src="'views/activity/event-description.jsp'" ></div>
        </div>
        <div data-ng-hide="activity.category == 'events'">
            <div data-ng-include src="'views/activity/other-description.jsp'" ></div>
        </div>
    </div>
    <div class="modal-footer">

        <a class="btn btn-info"  data-ng-click="cancel()">Close</a>

    </div>
</div>

