/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('userListCtrl', userListCtrl)

function userListCtrl($scope, $state, $stateParams, modalService,appService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, crudService, dialogService) {
	$scope.paginationObject = {};
	$scope.activeUsers = [];
	$scope.sort = appService.globalConfig.sort;
	$scope.changeSorting = appService.utilService.changeSorting;

    // User List
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasUsers = {};
        if ($scope.domainView == null) {
        	hasUsers = crudService.list("users/listall", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        } else {
        	hasUsers =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "users/listByUserDomain"
				+"?lang=" +appService.localStorageService.cookie.get('language')
				+ "&domainId="+$scope.domainView.id+"&sortBy=ASC"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
        }
        hasUsers.then(function (result) {  // this is only run after $http completes0
            $scope.accountList = result;

            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        }).catch(function (result) {
            if(result.data.globalError[0] != null) {
        	    var msg = result.data.globalError[0];
        	    $scope.showLoader = false;
        	    notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
             }
        });
    };
    $scope.list(1);
    $scope.active = {};
	$scope.inActive = {};

	var hasUsers = crudService.listAll("users/list");
    	$scope.showLoader = true;
    hasUsers.then(function (result) {  // this is only run after $http completes0
    	$scope.activeUsers = result;
    });

    // Get domain list
    var hasdomainListView = appService.crudService.listAll("domains/list");
    hasdomainListView.then(function (result) {
    	$scope.domainListView = result;
    });

    // Get user list based on domain selection
    $scope.selectDomainView = function(pageNumber) {
    	$scope.list(1);
    };
};
