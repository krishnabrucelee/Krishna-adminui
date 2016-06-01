<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<!DOCTYPE html>
<html data-ng-app="panda-ui-admin">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Page title set in pageTitle directive -->
    <title page-title></title>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
   <link rel="shortcut icon" type="image/x-ico" href="favicon.ico" />

    <!-- build:css(.) styles/vendor.css -->
    <!-- bower:css -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css" />


    <!-- endbower -->
    <!-- endbuild -->

    <!-- build:css({.tmp,app}) styles/style.css -->
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/custom-style.css">
    <link rel="stylesheet" href="styles/login-loader.css">
    <!-- endbuild -->
</head>
<body class="blank login-bg" data-ng-controller="loginCtrl" data-ng-style="{'background':(backgroundImage ? 'url('+backgroundImage+')' : '') }">
<div class="login-container">
    <div class="row">
        <div class="col-md-12">
        <div data-ng-bind-html="welcomeContent | to_trusted "></div>
            <div class="hpanel hbgblue">
                <div class="panel-body" >
                    <form name="test" method="post" id="loginForm" data-ng-submit="loginForm()">
                         <h6 class="alert alert-danger" style="display: none" id="errorMsg"></h6>
                         <div class="form-group">
                             <label class="control-label" for="username"><fmt:message key="common.username" bundle="${msg}" /></label>
                             <input type="text" placeholder="<fmt:message key="common.small.username" bundle="${msg}" />" title="<fmt:message key="please.enter.your.username" bundle="${msg}" />" required="" data-ng-model="username" name="username" id="username" class="form-control">
                         </div>
                         <div class="form-group">
                             <label class="control-label" for="password"><fmt:message key="common.password" bundle="${msg}" /></label>
                             <input type="password" title="<fmt:message key="please.enter.your.password" bundle="${msg}" />" placeholder="******" required="" data-ng-model="password" name="password" id="password" class="form-control">
                         </div>
                         <div class="checkboxs">
                             <input data-ng-click="rememberMe()" id="remember" data-ng-model="remember" name="remember" type="checkbox">
                             <label for="remeber_login"><fmt:message key="remember.login" bundle="${msg}" /></label>
                             <p class="small">(<fmt:message key="private.computer" bundle="${msg}" />)</p>
                         </div>
                         <input type="hidden" value="${REQUEST_PROTOCOL}" id="request_protocol" />
                         <input type="hidden" value="${REQUEST_PORT}" id="request_port" />
                         <input type="hidden" value="${REQUEST_ADMIN_FOLDER}" id="request_admin_folder" />
                    <get-login-loader-image data-ng-show="showLoader"></get-login-loader-image>
                    <button data-ng-hide="showLoader" id="login_button" type="submit" class="btn btn-default"><fmt:message key="common.login" bundle="${msg}" /></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div><p data-ng-bind-html="footerContent | to_trusted"></p></div>
        </div>
    </div>
</div>
</body>

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/angular/angular.min.js"></script>
<script src="bower_components/sanitize/angular-sanitize.min.js"></script>
<script src="bower_components/angular/angular-cookies.js"></script>
<script src="scripts/controllers/loginController.js"></script>
<script src="scripts/factories/rememberMeService.js"></script>
<script src="scripts/constants/appConstants.js"></script>
<script src="scripts/factories/globalConfig.js"></script>
<script src="bower_components/angular-local-storage/dist/angular-local-storage.js"></script>
<script src="scripts/directives/directives.js"></script>
<script type="text/javascript">
    function loginForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if (username == "user" && password == "user")
        {
            window.location.href = "index.html#/dashboard";
        } else {
            var target = document.getElementById("errorMsg");
            target.innerHTML = "Invalid Username or Password";
            target.style.display = 'block';
            target.style["margin-bottom"] = '10px';
        }
    }
</script>
<script type="text/javascript">
    var ADMIN_CONTEXT_PATH = "<%=request.getContextPath()%>";
    var REQUEST_PROTOCOL = document.getElementById("request_protocol").value;
    if(REQUEST_PROTOCOL == "" || typeof(REQUEST_PROTOCOL) == "undefined" || REQUEST_PROTOCOL == null) {
    	REQUEST_PROTOCOL = "http";
    }

    var REQUEST_PORT = document.getElementById("request_port").value;
    if(REQUEST_PORT != "" && typeof(REQUEST_PORT) != "undefined" && REQUEST_PORT != null) {
    	REQUEST_PORT = ":" + REQUEST_PORT;
    }

    var REQUEST_ADMIN_FOLDER = document.getElementById("request_admin_folder").value;
    if(REQUEST_ADMIN_FOLDER == "" || typeof(REQUEST_ADMIN_FOLDER) == "undefined" || REQUEST_ADMIN_FOLDER == null) {
    	REQUEST_ADMIN_FOLDER = "/admin/";
    }
</script>
</html>