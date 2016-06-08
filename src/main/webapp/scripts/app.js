/**
 * HOMER - Responsive Admin Theme
 * Copyright 2015 Webapplayers.com
 *
 */
(function () {
	var myApplication = angular.module('panda-ui-admin', [
        'ui.router',                // Angular flexible routing
        'ngSanitize',               // Angular-sanitize
        'ui.bootstrap',             // AngularJS native directives for Bootstrap
        'angular-flot',             // Flot chart
        'angles',                   // Chart.js
        'angular-peity',            // Peity (small) charts
        'cgNotify',                 // Angular notify
        'ngAnimate',                // Angular animations
        'ui.map',                   // Ui Map for Google maps
        'ui.calendar',              // UI Calendar
        'summernote',               // Summernote plugin
        'ngGrid',                   // Angular ng Grid
        'ui.tree',                  // Angular ui Tree
        'bm.bsTour',                // Angular bootstrap tour
        'datatables',               // Angular datatables plugin
        'xeditable',                // Angular-xeditable
        'ui.select',                // AngularJS ui-select
        'ui.sortable',              // AngularJS ui-sortable
        'LocalStorageModule',       // AngularJs LocalStorage
        'rzModule',                 // RZ
        'angular-momentjs',          // AngularJS moment
        'ngCookies'					// Angular cookie
    ]);
    fetchData().then(bootstrapApplication);

    function fetchData() {
        var initInjector = angular.injector(["ng"]);
        var initInjectors = angular.injector(["ngCookies"]);
        var initInjectorss = angular.injector(["ng", "LocalStorageModule"]);
        var $http = initInjector.get("$http");
        var $cookies = initInjectors.get("$cookies");
        var $q = initInjector.get("$q");
        var rootScope = initInjectorss.get("$rootScope");
        var localStorageService = initInjectorss.get("localStorageService");

        var splashTitle = localStorageService.get('splashTitle');

        myApplication.value('splashTitle', localStorageService.get('splashTitle'));

        if (localStorageService.get('id') != 'undefined' && !angular.isUndefined(localStorageService.get('id'))
        		&& localStorageService.get('id') != null && localStorageService.get('id') != 'null') {
        	return $http({method:'get', url: REQUEST_PROTOCOL + window.location.hostname +':8080/api/'  + 'users/usersessiondetails/'+localStorageService.get('id'),
    			"headers": {'x-auth-token': localStorageService.get('token'), 'x-requested-with': '', 'Content-Type': 'application/json', 'Range': "items=0-9", 'x-auth-login-token': localStorageService.get('loginToken'), 'x-auth-remember': localStorageService.get('rememberMe'), 'x-auth-user-id': localStorageService.get('id'), 'x-auth-login-time': localStorageService.get('loginTime')}})
    			.then(function(result){
    				myApplication.constant("tokens", result.data);
              }, function(errorResponse) {
            	  window.location.href = "login";
            });
        } else {
        	var d = $q.defer();
        	d.resolve("hi");
        	myApplication.constant("tokens", null);
        	return d.promise;
        }
    }


    function bootstrapApplication() {
        angular.element(document).ready(function() {
            angular.bootstrap(document, ["panda-ui-admin"]);
        });
    }
})();
