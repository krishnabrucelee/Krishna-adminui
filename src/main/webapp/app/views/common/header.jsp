<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="logo" class="light-version">
    <img src="images/theme_logo.jpg" />

</div>
<nav role="navigation" data-ng-controller="headerCtrl">
    <minimaliza-menu></minimaliza-menu>
    <div id="navbar" class="navbar-collapse collapse" >

        <ul class="nav navbar-nav navbar-right round-corner" >

			<li data-ng-repeat="theme in themeSettingsList.headers" ><a class="label-menu-corner" data-ng-if="theme.url != null" target="_blank" href="http://{{theme.url}}" >{{theme.name}}<span class="label label-warning"></span></a></li>

            <li data-ng-class="{active: $state.includes('support')}"><a class="label-menu-corner" ui-sref="support.tickets" ><fmt:message key="common.helpdesk" bundle="${msg}" /><span class="label label-success">2</span></a></li>

            <li data-ng-class="{active: $state.includes('activity')}"><a  class="label-menu-corner" ui-sref="activity" ><fmt:message key="common.activity" bundle="${msg}" /><span class="label label-warning">{{global.sessionValues.eventTotal }}</span></a></li>

            <li class="dropdown" dropdown>

                <a class="dropdown-toggle icon-content" id="user_name" href="#" dropdown-toggle>
                    <i class="pe-7s-user"></i>
                    <span class="caret"></span>
                </a>

                <ul class="dropdown-menu hdropdown flipInX">
                                        <li data-ng-show="appLanguage == 'en'"><a id="language" data-ng-click="updateLanguage( appLanguage )"><fmt:message key="common.language.name" bundle="${msg}" /></a></li>
                    <li data-ng-hide="appLanguage == 'en'"><a id="language" data-ng-click="updateLanguage( appLanguage )"><fmt:message key="common.language.name" bundle="${msg}" /> </a></li>
                    <li><a ui-sref="profile" id="profile">
                        <fmt:message key="common.profile" bundle="${msg}" />
                    </a></li>
                    <li><a>{{ "v" + global.sessionValues.buildNumber }}</<a></li>
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






