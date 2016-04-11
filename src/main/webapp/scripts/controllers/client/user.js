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
        $scope.paginationObject.sortOrder = '+';
        $scope.paginationObject.sortBy = 'userName';

        $scope.changeSort = function(sortBy, pageNumber) {
		var sort = appService.globalConfig.sort;
		if (sort.column == sortBy) {
			sort.descending = !sort.descending;
		} else {
			sort.column = sortBy;
			sort.descending = false;
		}
		var sortOrder = '-';
		if(!sort.descending){
			sortOrder = '+';
		}
		$scope.paginationObject.sortOrder = sortOrder;
		$scope.paginationObject.sortBy = sortBy;
		$scope.showLoader = true;
		var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;

            var hasUserList = {};
            if ($scope.domainView == null) {
            	hasUserList =  appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "users" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            } else {
            	hasUserList =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "users/listByUserDomain"
    				+"?lang=" +appService.localStorageService.cookie.get('language')+"&flag=pandaAdminPanel"
    				+ "&domainId="+$scope.domainView.id+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }

            hasUserList.then(function(result) { // this is only run after $http
			// completes0
			$scope.accountList = result;
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};

    // User List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasUsers = {};
        if ($scope.domainView == null) {
        	hasUsers = crudService.list("users/listall", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        } else {
        	hasUsers =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "users/listByUserDomain"
				+"?lang=" +appService.localStorageService.cookie.get('language')+"&flag=pandaAdminPanel"
				+ "&domainId="+$scope.domainView.id+"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
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

    // Suspend the user
    $scope.showUserListLoader = {};
    $scope.suspendUserAccount = function(account) {
      $scope.showUserListLoader[account.id] = true;

        appService.dialogService.openDialog("app/views/common/confirm-suspension.jsp", 'sm',
        $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
          $scope.suspensionObject = account;
          $scope.ok = function (suspensionObject) {
            suspensionObject.status = "SUSPENDED";
            var hasServer = appService.crudService.update("users/suspend", suspensionObject);
            hasServer.then(function (result) {
              appService.notify({message: 'Account suspended  successfully ',
              classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
              $modalInstance.close();
            });
            $scope.showUserListLoader[suspensionObject.id] = false;
          },
          $modalInstance.close();
          $scope.cancel = function () {
            $modalInstance.close();
            $scope.showUserListLoader[account.id] = false;
          };
      }]);

      // var hasServer = appService.crudService.update("users/suspend", account);
      // hasServer.then(function (result) {
      //     $scope.list(1);
      //     $scope.showUserListLoader[account.user_name] = false;
      //     appService.notify({message: 'User suspended successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
      //     $modalInstance.close();
      // }).catch(function (result) {
      //   if(!angular.isUndefined(result) && result.data != null) {
      //     $scope.showUserListLoader[account.userName] = false;
      // });
    };
};
