<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<%--  <footer class="footer" data-ng-controller="headerCtrl">
 <span class="pull-left"><fmt:message key="common.copyright" bundle="${msg}" /> © <fmt:message key="common.footer" bundle="${msg}" />.</span>

<ul class="footer-custom-links text-center pull-left">
<li data-ng-repeat="theme in themeSettingsList.customisation" ><a class="label-menu-corner" data-ng-if="theme.footerUrl != null" target="_blank" href="http://{{theme.footerUrl}}" >{{theme.footerName}}<span class="label label-warning"></span></a></li>
</ul>
<span class="pull-right">
            <fmt:message key="panda.cloud.management.portal" bundle="${msg}" />
        </span>
 </footer> --%>

<footer class="footer" data-ng-controller="headerCtrl">
	<div class="col-md-4 col-sm-12 text-left">
	{{themeSettingsList.themeFooterLeft}}
	</div>
	<div class="col-md-4 col-sm-12">
		<ul class="footer-custom-links text-center">
			<li data-ng-repeat="theme in themeSettingsList.footers" data-ng-if="theme.url != null">

				<a class="label-menu-corner" target="_blank" href="http://{{theme.url}}">{{theme.name}}</a>
			</li>
		</ul>
	</div>
	<div class="col-md-4 col-sm-12 text-right">
		{{themeSettingsList.themeFooterRight}}
	</div>
</footer>