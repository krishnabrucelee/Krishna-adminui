<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Redirect to login when passing the wrong URL -->
    <script>
        var pageUrl = window.location.href;
        if(pageUrl.indexOf("index#/login") > -1 || pageUrl.endsWith("index#/")) {
            var contextPath = '<%= request.getContextPath() %>';
            var baseUrl = window.location.protocol + "//" + window.location.host + contextPath + '/login';
            window.location = baseUrl;
        }
    </script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Page title set in pageTitle directive -->
    <title page-title></title>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" type="image/x-ico" href="favicon.ico" />

    <!-- build:css(.) styles/vendor.css -->
    <!-- bower:css -->
    <link rel="stylesheet" href="bower_components/angular-notify/dist/angular-notify.min.css" />
    <link rel="stylesheet" href="bower_components/fontawesome/css/font-awesome.css" />
    <link rel="stylesheet" href="bower_components/metisMenu/dist/metisMenu.css" />
    <link rel="stylesheet" href="bower_components/animate.css/animate.css" />
    <link rel="stylesheet" href="bower_components/sweetalert/lib/sweet-alert.css" />
    <link rel="stylesheet" href="bower_components/fullcalendar/dist/fullcalendar.min.css" />
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="bower_components/summernote/dist/summernote.css" />
    <link rel="stylesheet" href="bower_components/ng-grid/ng-grid.min.css" />
    <link rel="stylesheet" href="bower_components/angular-ui-tree/dist/angular-ui-tree.min.css" />
    <link rel="stylesheet" href="bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css" />
    <link rel="stylesheet" href="bower_components/datatables_plugins/integration/bootstrap/3/dataTables.bootstrap.css" />
    <link rel="stylesheet" href="bower_components/angular-xeditable/dist/css/xeditable.css" />
    <link rel="stylesheet" href="bower_components/ui-select/dist/select.min.css" />
    <link rel="stylesheet" href="bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" />
    <link rel="stylesheet" href="bower_components/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />
    <link rel="stylesheet" href="bower_components/blueimp-gallery/css/blueimp-gallery.min.css" />
    <!-- endbower -->
    <!-- endbuild -->

    <!-- build:css({.tmp,app}) styles/style.css -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/59ZRklaO5bWGqF5A9baEERJtnKITppOI_IvcXXDNrsc.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/cJZKeOuBrn4kERxqtaUH3VtXRa8TVwTICgirnJhmVJw.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTaaRobkAwv3vxw3jMhVENGA.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTa-j2U0lmluP9RWlSytm3ho.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTegdm0LZdjqr5-oayXSOefg.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTf8zf_FOSsgRmwsS7Aa9k2w.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTRWV49_lSm1NYrwo-zkhivY.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTT0LW-43aMEzIO6XUTLjad8.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/DXI1ORHCpsQm3Vp6mXoaTZX5f-9o1vgP2EXwfjgl7AY.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzBWV49_lSm1NYrwo-zkhivY.woff2" />

    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzD0LW-43aMEzIO6XUTLjad8.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzJX5f-9o1vgP2EXwfjgl7AY.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzKaRobkAwv3vxw3jMhVENGA.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzK-j2U0lmluP9RWlSytm3ho.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzOgdm0LZdjqr5-oayXSOefg.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/k3k702ZOKiLJc3WVjuplzP8zf_FOSsgRmwsS7Aa9k2w.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/K88pR3goAWT7BTt32Z01mxJtnKITppOI_IvcXXDNrsc.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/LWCjsQkB6EMdfHrEVqA1KRJtnKITppOI_IvcXXDNrsc.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNShWV49_lSm1NYrwo-zkhivY.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNSj0LW-43aMEzIO6XUTLjad8.woff2" />

    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNSpX5f-9o1vgP2EXwfjgl7AY.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNSqaRobkAwv3vxw3jMhVENGA.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNSq-j2U0lmluP9RWlSytm3ho.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNSugdm0LZdjqr5-oayXSOefg.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/MTP_ySUJH_bn48VBG8sNSv8zf_FOSsgRmwsS7Aa9k2w.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/RjgO7rYTmqiVp7vzi-Q5URJtnKITppOI_IvcXXDNrsc.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/u-WUoqrET9fUeobQW7jkRRJtnKITppOI_IvcXXDNrsc.woff2" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/fonts/xozscpT2726on7jbcb_pAhJtnKITppOI_IvcXXDNrsc.woff2" />

    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/css">
    <link rel="stylesheet" href="scripts/easyTree.css">
    <link rel="stylesheet" href="styles/custom-style.css">
    <!-- endbuild -->

</head>

<!-- Body -->
<!-- appCtrl controller with serveral data used in theme on diferent view -->
<!-- landing-scrollspy is directive for scrollspy used in landing page -->
<body ng-controller="appCtrl" class="{{$state.current.data.specialClass}}"  landing-scrollspy tour backdrop="true">
<!-- Simple splash screen-->
<div class="splash loading-screen"> <div class="splash-title"><h1>Panda - Admin Console</h1><p>Cloud Management Portal</p><img src="images/loading-bars.svg" width="64" height="64" /> </div> </div>
<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

	<fmt:setBundle basename="i18n/messages_${lang}" var="msg" />
    <c:set var="msg" scope="session" value="${msg}"/>

    <!-- Page view wrapper -->
    <div ui-view autoscroll="true"></div>

<!-- build:js(.) scripts/vendor.js -->

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="bower_components/slimScroll/jquery.slimscroll.min.js"></script>
<script src="bower_components/angular/angular.min.js"></script>
<script src="bower_components/angular/angular-cookies.js"></script>
<script src="bower_components/angular-sanitize/angular-sanitize.min.js"></script>
<script src="bower_components/angular-animate/angular-animate.min.js"></script>
<script src="bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
<script src="bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/jquery-flot/jquery.flot.js"></script>
<script src="bower_components/jquery-flot/jquery.flot.resize.js"></script>
<script src="bower_components/jquery-flot/jquery.flot.pie.js"></script>
<script src="bower_components/flot.curvedlines/curvedLines.js"></script>
<script src="bower_components/jquery.flot.spline/index.js"></script>
<script src="bower_components/angular-flot/angular-flot.js"></script>
<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
<script src="bower_components/iCheck/icheck.min.js"></script>
<script src="bower_components/sparkline/index.js"></script>
<script src="bower_components/chartjs/Chart.min.js"></script>
<script src="bower_components/angles/angles.js"></script>
<script src="bower_components/peity/jquery.peity.min.js"></script>
<script src="bower_components/angular-peity/angular-peity.js"></script>
<script src="bower_components/sweetalert/lib/sweet-alert.min.js"></script>
<script src="bower_components/angular-notify/dist/angular-notify.js"></script>
<script src="bower_components/angular-ui-utils/ui-utils.js"></script>
<script src="bower_components/angular-ui-map/ui-map.js"></script>
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="bower_components/angular-ui-calendar/src/calendar.js"></script>
<script src="bower_components/summernote/dist/summernote.min.js"></script>
<script src="bower_components/angular-summernote/dist/angular-summernote.min.js"></script>
<script src="bower_components/ng-grid/ng-grid-2.0.14.min.js"></script>
<script src="bower_components/angular-ui-tree/dist/angular-ui-tree.min.js"></script>
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<script src="bower_components/angular-bootstrap-tour/dist/angular-bootstrap-tour.min.js"></script>
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables_plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script src="bower_components/angular-datatables/dist/angular-datatables.min.js"></script>
<script src="bower_components/angular-xeditable/dist/js/xeditable.min.js"></script>
<script src="bower_components/ui-select/dist/select.min.js"></script>
<script src="bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<script src="bower_components/blueimp-gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="bower_components/angular-ui-sortable/sortable.min.js"></script>
<script src="bower_components/angular-local-storage/dist/angular-local-storage.js"></script>
<script src="bower_components/angularjs-slider/rzslider.js"></script>

<!-- endbuild -->

<!--
 You need to include this script on any page that has a Google Map.
 When using Google Maps on your own site you MUST signup for your own API key at:
 https://developers.google.com/maps/documentation/javascript/tutorial#api_key
 After your sign up replace the key in the URL below..
-->

<!-- build:js({.tmp,app}) scripts/scripts.js -->
<script src="scripts/angular-momentjs.js"></script>
<script src="scripts/moment-timezone.js"></script>
<script src="scripts/admin.js"></script>
<script src="scripts/app.js"></script>
<script src="scripts/config.js"></script>
<script src="scripts/js"></script>

<script src="scripts/filters/props.js"></script>
<script src="scripts/directives/directives.js"></script>
<script src="scripts/controllers/main.js"></script>
<script src="scripts/factories/sweet-alert.js"></script>
<script src="bower_components/iCheck/icheck.min.js"></script>
<script src="scripts/directives/touchSpin.js"></script>

<script src="scripts/controllers/client/client.js"></script>
<script src="scripts/controllers/client/application.js"></script>
<script src="scripts/controllers/client/project.js"></script>
<script src="scripts/controllers/client/user.js"></script>
<script src="scripts/controllers/service.js"></script>
<script src="scripts/controllers/support.js"></script>
<script src="scripts/controllers/activity.js"></script>
<script src="scripts/controllers/cloud.js"></script>
<script src="scripts/controllers/reportCtrl.js"></script>
<script src="scripts/controllers/configuration.js"></script>
<script src="scripts/controllers/configuration/taxController.js"></script>
<script src="scripts/controllers/configuration/billableItemController.js"></script>
<script src="scripts/controllers/configuration/emailConfigController.js"></script>
<script src="scripts/controllers/configuration/organizationController.js"></script>
<script src="scripts/controllers/configuration/paymentGatewayController.js"></script>
<script src="scripts/controllers/configuration/paymentController.js"></script>
<script src="scripts/controllers/resourceAllocation.js"></script>
<script src="scripts/controllers/domainController.js"></script>

<script src="scripts/factories/appService.js"></script>
<script src="scripts/factories/utilService.js"></script>
<script src="scripts/factories/loginService.js"></script>
<script src="scripts/factories/interceptor.js"></script>
<script src="scripts/factories/promiseAjax.js"></script>
<script src="scripts/factories/globalConfig.js"></script>
<script src="scripts/factories/modalService.js"></script>
<script src="scripts/factories/dialogService.js"></script>
<script src="scripts/factories/crudService.js"></script>


<!-- Resource Usage Tree Structure -->
<script src="scripts/easyTree.js"></script>
<script src="scripts/panda-script.js"></script>
</body>
</html>
