/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('userListCtrl', userListCtrl)

function userListCtrl($scope, crudService) {
	$scope.paginationObject = {};
    // User List
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasUsers = crudService.list("users", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasUsers.then(function (result) {  // this is only run after $http completes0
            $scope.accountList = result;
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.totalUser = result.totalItems;
        });
    };
    $scope.list(1);
    $scope.active = {};
	$scope.inActive = {};

    // User List for count active user
    $scope.list = function () {
    	var active = 0;
    	var inActive = 0;
        var hasUsers = crudService.listAll("users/list");
        hasUsers.then(function (result) {  // this is only run after $http completes0
        	angular.forEach(result, function(value, key) {
            	if (value.isActive)
            		active++;
            	else
            		inActive++;
            });
        	if (active == 0)
        		$scope.active = 0;
        	else
        		$scope.active = active;
        	if (inActive == 0)
        		$scope.inActive = 0;
        	else
        		$scope.inActive = inActive;
        });
    };
    $scope.list();
};
