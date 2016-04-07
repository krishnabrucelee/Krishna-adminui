<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="cg-notify-message panda-ui-admin-notify" ng-class="$classes">
    <div class="p-md">
    <div ng-show="!$messageTemplate">
        {{$message}}
    </div>

    <div ng-show="$messageTemplate" class="cg-notify-message-template test-success-notify" id="success_notify">

    </div>

    <button type="button" class="cg-notify-close" ng-click="$close()">
        <span aria-hidden="true">&times;</span>
        <span class="cg-notify-sr-only">Close</span>
    </button>
    </div>

</div>