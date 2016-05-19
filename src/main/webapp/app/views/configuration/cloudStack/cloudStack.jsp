<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="white-content">
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100 h-200" ui-sref="configuration.home.system" type="button"><i class="fa-3x fa fa-desktop"></i> <br/><fmt:message key="system.config" bundle="${msg}" /></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100 h-200" ui-sref="configuration.home.zone" type="button"><i class="fa-3x fa fa-map-marker"></i> <br/><fmt:message key="zone.desc" bundle="${msg}" /></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100 h-200" ui-sref="configuration.home.import" type="button"><i class="fa-3x fa fa-sign-in"></i> <br/><fmt:message key="cloudstack.discovery" bundle="${msg}" /></button></div>
    <div class="col-md-3 col-sm-4 m-b-md"><button class="btn btn-info box w-100 h-200" ui-sref="configuration.home.usage" type="button"><i class="fa-3x fa fa-sign-in"></i> <br/><fmt:message key="manual.usage.execution" bundle="${msg}" /></button></div>
</div>