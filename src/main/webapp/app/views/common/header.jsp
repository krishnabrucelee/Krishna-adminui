<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div id="logo" class="light-version" data-ng-controller="headerCtrl" >
    <img data-ng-src={{logoImage}} />
</div>
<nav role="navigation" data-ng-controller="headerCtrl">
    <minimaliza-menu></minimaliza-menu>
    <div id="navbar" class="navbar-collapse collapse" >

        <ul class="nav navbar-nav navbar-right round-corner" >

			<li data-ng-repeat="theme in themeSettingsList.headers" ><a class="label-menu-corner" data-ng-if="theme.url != null && appLanguage != 'zh'" target="_blank" href="http://{{theme.url}}" >{{theme.name}}<span class="label label-warning"></span></a></li>
        <li data-ng-repeat="theme in themeSettingsList.headers" >
		<a class="label-menu-corner" data-ng-if="theme.url != null && appLanguage != 'en'" target="_blank" href="http://{{theme.url}}" >{{theme.chineseName}}
		<span class="label label-warning"></span></a></li>
            <li data-ng-class="{active: $state.includes('activity')}" data-ng-if="global.event==0"><a  class="label-menu-corner" ui-sref="activity" ><fmt:message key="common.activity" bundle="${msg}" /><span class="label label-warning"></span></a></li>
            <li data-ng-class="{active: $state.includes('activity')}" data-ng-if="global.event!=0"><a  class="label-menu-corner" ui-sref="activity" ><fmt:message key="common.activity" bundle="${msg}" /><span class="label label-warning">{{global.event }}</span></a></li>

            <li class="dropdown" dropdown>
                <a class="dropdown-toggle icon-content" id="user_name" href="#" dropdown-toggle>
                    <i class="pe-7s-user"></i>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu hdropdown flipInX">
					<li >
						<div class="pull-left eng-lang">
							<a class="lang m-l-md" id="language" data-ng-if="appLanguage != 'en'" data-ng-click="updateLanguage( 'en' )">English </a>
							<label class="lang m-l-md" id="language" data-ng-if="appLanguage == 'en'">English </label>
						</div>
						<div class="pull-left chn-lang">
							<a class="lang" id ="language" data-ng-if="appLanguage != 'zh'" data-ng-click="updateLanguage( 'zh' )">中文</a>
							<label class="lang" id ="language" data-ng-if="appLanguage == 'zh'">中文</label>
						</div>
						<div class="clearfix"></div>
					</li>
                    <li><a ui-sref="profile" id="profile">
                        <fmt:message key="common.profile" bundle="${msg}" />
                    </a></li>
                    <li><a>{{ "V" + global.sessionValues.buildNumber }}</<a></li>
                    <li><a href="javascript:void(0)" id="logout" data-ng-click="logout()"><fmt:message key="common.logout" bundle="${msg}" /> </a></li>
                </ul>

            </li>
        </ul>
    </div>

</nav>

<script>
    $(document).ready(function () {
        $(".dropdown").hover(
                function () {
                    $('.dropdown-menu:hidden', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu:visible', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                    $(this).toggleClass('open');
                }
        );
    });
</script>






