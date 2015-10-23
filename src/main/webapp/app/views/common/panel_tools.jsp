<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- This is template for panel tools -->
<!-- It contains collapse function (showhide) and close function (closebox) -->
<!-- All function is handled from directive panelTools in directives.js file -->
<div class="panel-tools">
    <a ng-click="showhide()"><i class="fa fa-chevron-up"></i></a>
    <a ng-click="closebox()"><i class="fa fa-times"></i></a>
</div>