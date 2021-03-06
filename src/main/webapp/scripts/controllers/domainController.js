/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular
.module('panda-ui-admin')
.controller('domainListCtrl', domainListCtrl)


// Load list page of user
function domainListCtrl($scope,$state, promiseAjax,appService, $log, notify, crudService, dialogService, $timeout, localStorageService, globalConfig) {

	$scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;

   $scope.domains = {
        category: "domains",
        oneItemSelected: {},
        selectedAll: {},
        totalcount: 0
    };

    $scope.default_option = true
    $scope.domainList = {};
    $scope.revokes = false;
    $scope.paginationObject = {};
    $scope.domainForm = {};
    $scope.domain = {};
    $scope.global = crudService.globalConfig;
    $scope.domainElements={

    };
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';

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
        var hasDomainList = {};
        $scope.filter = "";
        if ($scope.quickSearchText == null) {
        	hasDomainList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "domains" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
        } else {
            $scope.filter = "&searchText=" + $scope.quickSearchText;
            hasDomainList = promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "domains/listByFilter"
            		+ "?lang=" + appService.localStorageService.cookie.get('language') + $scope.filter + "&sortBy=" + $scope.paginationObject.sortOrder + $scope.paginationObject.sortBy + "&limit=" + limit, $scope.global.paginationHeaders(pageNumber, limit), {
                "limit": limit
            });
        }
        hasDomainList.then(function(result) { // this is only run after $http
			// completes0
			$scope.domainList = result;
			$scope.domainList.Count = 0;
            if (result.length != 0) {
                $scope.domainList.Count = result.totalItems;
            }
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};

	// Get domain list based on quick search
    $scope.quickSearchText = null;
    $scope.searchList = function(quickSearchText) {
        $scope.quickSearchText = quickSearchText;
        $scope.list(1);
    };

    // User List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasDomain = {};
        $scope.filter = "";
        if ($scope.quickSearchText == null) {
        	hasDomain = crudService.list("domains", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        } else {
            $scope.filter = "&searchText=" + $scope.quickSearchText;
            hasDomain = promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "domains/listByFilter"
            		+ "?lang=" + appService.localStorageService.cookie.get('language') +  encodeURI($scope.filter) + "&sortBy=" + globalConfig.sort.sortOrder + globalConfig.sort.sortBy + "&limit=" + limit, $scope.global.paginationHeaders(pageNumber, limit), {
                "limit": limit
            });
        }
        hasDomain.then(function (result) {  // this is only run after $http completes0
            $scope.domainList = result;
            $scope.domainList.Count = 0;
            if (result.length != 0) {
                $scope.domainList.Count = result.totalItems;
            }

            // For pagination
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);

    $scope.editList = {};
    $scope.activate = false;
    $scope.revoke = false;
    $scope.disabled = false;
    localStorageService.set("edit", null);

    // Opened user add window
    $scope.addDomain = function (size,domain) {
        dialogService.openDialog("app/views/client/clients/add-domain.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
        	$scope.save = function (form) {

                $scope.formSubmitted = true;
                if (form.$valid) {
			 $scope.showLoader = true;
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                        var domain = angular.copy($scope.domain);
                           if (domain.password == $scope.account.confirmPassword) {
                        	var hasServer = crudService.add("domains", domain);
                        	hasServer.then(function (result) {  // this is only run after $http completes
                        		$scope.list(1);
                        		notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        		$modalInstance.close();
                        		$scope.domain.name = "";
                        		$scope.domain.companyNameAbbreviation = "";
                        		$scope.domain.portalUserName = "";
                        		$scope.domain.password = "";
                        		$scope.domain.confirmPassword = "";
                        		$scope.domain.cityHeadquarter = "";
                        		$scope.domain.companyAddress = "";
                        		$scope.domain.primaryFirstName = "";
                        		$scope.domain.lastName = "";
                        		$scope.domain.email = "";
                        		$scope.domain.phone = "";
                        		$scope.domain.secondaryContactName = "";
                        		$scope.domain.secondaryContactLastName = "";
                        		$scope.domain.secondaryContactEmail = "";
                        		$scope.domain.secondaryContactPhone = "";
					$scope.showLoader = false;
                        	}).catch(function (result) {
                        		$scope.showLoader = false;
                        		if(!angular.isUndefined(result) && result.data != null) {
                        			angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
					                   $scope.showLoader = false;
                                	   $scope.domainForm[key].$invalid = true;
                                	   $scope.domainForm[key].errorMessage = errorMessage;
                        			});
                        		}
                                  $scope.showLoader = false;
                        	});
                        }
                        else {  // Add tool tip message for confirmation password in add-user
                        	var key = 'confirmPassword';
                        	$scope.domainForm[key].$invalid = true;
                        	$scope.domainForm[key].errorMessage = document.getElementById("passwordErrorMessage").value;
                        	$scope.showLoader = false;
                        }
                    }
                }
            },
            $scope.cancel = function () {
                $modalInstance.close();
            };
         }]);
    };


    // Edit the Domain
    $scope.edit = function (size, domain) {
    	$scope.domain.password = "";
		$scope.domain.confirmPassword = "";
        dialogService.openDialog("app/views/client/clients/edit-domain.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                // Update department
                $scope.domain = angular.copy(domain);
                $scope.update = function (form) {
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                        var domain = $scope.domain;
                        $scope.showLoader = true;
                        var hasServer = crudService.update("domains", domain);
                        hasServer.then(function (result) {
                            $scope.domain={};
                            $scope.list(1);
                            notify({message: 'Updated successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                            $modalInstance.close();
                            $scope.showLoader = false;
                        }).catch(function (result) {
                        	if(!angular.isUndefined(result) && result.data != null) {
	                            angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                                        $scope.showLoader = false;
	                            	$scope.domainForm[key].$invalid = true;
	                                $scope.domainForm[key].errorMessage = errorMessage;
	                            });
                        	}
                                $scope.showLoader = false;
                        });
                    }
                },
                        $scope.cancel = function () {
                            $modalInstance.close();
                        };
            }]);
    };

    // Delete the Domain
    $scope.delete = function (size, domain) {
        dialogService.openDialog("app/views/common/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteObject = domain;
                $scope.ok = function (deleteObject) {
                	$scope.showLoader = true;
                    var hasServer = crudService.softDelete("domains", deleteObject);
                    hasServer.then(function (result) {
                        $scope.list(1);
                        $scope.showLoader = false;
                        notify({message: 'Deleted successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                    }).catch(function (result) {

                   	 if(!angular.isUndefined(result) && result.data != null) {
                    		if(result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])){
                               	 var msg = result.data.globalError[0];
                               	 notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                            }
                            angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                           	$scope.domainForm[key].$invalid = true;
                            	$scope.domainForm[key].errorMessage = errorMessage;
                            });
                    	}

                    });
                    $modalInstance.close();
                },
                        $scope.cancel = function () {
                            $modalInstance.close();
                        };
            }]);
    };

   }
