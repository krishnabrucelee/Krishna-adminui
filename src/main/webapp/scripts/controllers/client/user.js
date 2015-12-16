/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('userListCtrl', userListCtrl)

function userListCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, crudService, dialogService) {
	$scope.paginationObject = {};
	$scope.activeUsers = [];
    // User List
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasUsers = crudService.list("users", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasUsers.then(function (result) {  // this is only run after $http completes0
            $scope.accountList = result;
            
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
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
};
