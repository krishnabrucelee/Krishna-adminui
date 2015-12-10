<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="logo" class="light-version">
    <img src="images/profile.jpg" />

</div>
<nav role="navigation">
    <minimaliza-menu></minimaliza-menu>
    <div id="navbar" class="navbar-collapse collapse">

        <ul class="nav navbar-nav navbar-right round-corner">
            <li data-ng-class="{active: $state.includes('support')}"><a class="label-menu-corner" ui-sref="support.tickets" ><fmt:message key="common.helpdesk" bundle="${msg}" /><span class="label label-success">2</span></a></li>

            <li data-ng-class="{active: $state.includes('activity')}"><a  class="label-menu-corner" ui-sref="activity" ><fmt:message key="common.activity" bundle="${msg}" /><span class="label label-warning">3</span></a></li>

            <li class="dropdown" dropdown>

                <a class="dropdown-toggle icon-content" href="#" dropdown-toggle>
                    <i class="pe-7s-user"></i>
                    <span class="caret"></span>
                </a>

                <ul class="dropdown-menu hdropdown flipInX">
                                        <li data-ng-show="appLanguage == 'en'"><a  data-ng-click="updateLanguage( appLanguage )"><fmt:message key="common.language.name" bundle="${msg}" /></a></li>
                    <li data-ng-hide="appLanguage == 'en'"><a data-ng-click="updateLanguage( appLanguage )"><fmt:message key="common.language.name" bundle="${msg}" /> </a></li>
                    <li><a ui-sref="profile">
                        <fmt:message key="common.profile" bundle="${msg}" />
                    </a></li>
                    <li><a href="javascript:void(0)" data-ng-click="logout()"><fmt:message key="common.logout" bundle="${msg}" /> </a></li>
                </ul>

            </li>
        </ul>
    </div>

</nav>

<script>
    $(document).ready(function () {
        $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                    $(this).toggleClass('open');
                }
        );
    });
</script>






