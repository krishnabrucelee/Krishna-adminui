/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('servicecategoryCtrl', servicecategoryCtrl)

function servicecategoryCtrl($scope, promiseAjax, crudService, appService, globalConfig, localStorageService) {

	$scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;

    $scope.default_option = true
    $scope.servicecategoryList = {};
    $scope.servicecategoryCopy = {};
    $scope.revokes = false;
    $scope.paginationObject = {};
    $scope.global = crudService.globalConfig;
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'category';

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
        var hasServicecategoryList = {};
        $scope.filter = "";
        if ($scope.quickSearchText == null) {
        	hasServicecategoryList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "serviceCategory" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
        } else {
            $scope.filter = "&searchText=" + $scope.quickSearchText;
            hasServicecategoryList = promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "serviceCategory/listByFilter"
            		+ "?lang=" + appService.localStorageService.cookie.get('language') + $scope.filter + "&sortBy=" + $scope.paginationObject.sortOrder + $scope.paginationObject.sortBy + "&limit=" + limit, $scope.global.paginationHeaders(pageNumber, limit), {
                "limit": limit});
        }
        hasServicecategoryList.then(function(result) { // this is only run after $http
			// completes0
			$scope.servicecategoryList = result;
			$scope.servicecategoryList.Count = 0;
            if (result.length != 0) {
                $scope.servicecategoryList.Count = result.totalItems;
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
        var hasServicecategoryList = {};
        $scope.filter = "";
        if ($scope.quickSearchText == null) {
        	hasServicecategoryList = crudService.list("serviceCategory", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        } else {
            $scope.filter = "&searchText=" + $scope.quickSearchText;
            hasServicecategoryList = promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "serviceCategory/listByFilter"
            		+ "?lang=" + appService.localStorageService.cookie.get('language') +  encodeURI($scope.filter) + "&sortBy=" + globalConfig.sort.sortOrder + globalConfig.sort.sortBy + "&limit=" + limit, $scope.global.paginationHeaders(pageNumber, limit), {
                "limit": limit
            });
        }
        hasServicecategoryList.then(function (result) {  // this is only run after $http completes0
            $scope.servicecategoryList = result;
            $scope.servicecategoryList.Count = 0;
            if (result.length != 0) {
                $scope.servicecategoryList.Count = result.totalItems;
            }

            // For pagination
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);
//   	 $scope.servicecategoryList = [
//                {"category":"Managed services",
//                 "description":"Managed description"
//    			},
//    			{"category":"Other Services",
//                    "description":"Other description"
//       			},
//       			{"category":"Network services",
//                    "description":"Network description"
//       			},
//       			{"category":"Account services",
//                    "description":"Account description"
//       			}
//            ];

    $scope.addServicecategory = function (size) {
    $scope.servicecategory = {};

	appService.dialogService.openDialog($scope.global.VIEW_URL + "servicecatalog/servicecategoryCreate.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope',
                                                                                             function ($scope, $modalInstance, $rootScope) {

            // Create a new application
            $scope.save = function (form, servicecategory) {
            	$scope.formSubmitted = true;
            	$scope.duplicateCheck = true;
            	angular.forEach($scope.servicecategoryList, function(obj, key) {
	                if (obj.category == servicecategory.category) {
	                	$scope.duplicateCheck = false;
	                	$scope.servicecategoryForm["category"].$invalid = true;
                    	$scope.servicecategoryForm["category"].errorMessage = "Category name already exist";
	                }
                });
                if (form.$valid && $scope.duplicateCheck) {
                	$scope.showLoader = true;
                	var hasServicecategory = appService.crudService.add("serviceCategory", servicecategory);
                    hasServicecategory.then(function (result) {
                    	$scope.showLoader = false;
                    	$modalInstance.close();
                    	$scope.list(1);
                    	$scope.homerTemplate = 'app/views/notification/notify.jsp';
                        appService.notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                    }).catch(function (result) {
                    	$scope.showLoader = false;
            		    if (!angular.isUndefined(result.data)) {
                		 if (result.data.fieldErrors != null) {
                       	$scope.showLoader = false;
                        	angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                            	$scope.servicecategoryForm[key].$invalid = true;
                            	$scope.servicecategoryForm[key].errorMessage = errorMessage;
                        	});
                		}
                	}
            		    appService.globalConfig.webSocketLoaders.volumeLoader = false;
            	});
                }
            },
            $scope.cancel = function () {
                $modalInstance.close();
            };
        }]);
};


$scope.editServicecategory = function (size, servicecategory) {
    $scope.servicecategory = {};
	var hasServicecategory = appService.crudService.read("serviceCategory", servicecategory.id);
	hasServicecategory.then(function (result) {
        $scope.servicecategory = result;
        $scope.servicecategoryCopy = angular.copy(result);
    });
	appService.dialogService.openDialog($scope.global.VIEW_URL + "servicecatalog/servicecategoryEdit.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope',
                                                                                             function ($scope, $modalInstance, $rootScope) {


            // Create a new application
            $scope.edit = function (form, servicecategory) {
                $scope.formSubmitted = true;
                $scope.duplicateCheck = true;
            	angular.forEach($scope.servicecategoryList, function(obj, key) {
	                if (obj.category == servicecategory.category && $scope.servicecategoryCopy.category != servicecategory.category) {
	                	$scope.duplicateCheck = false;
	                	$scope.servicecategoryForm["category"].$invalid = true;
                    	$scope.servicecategoryForm["category"].errorMessage = "Category name already exist";
	                }
                });
                if (form.$valid && $scope.duplicateCheck) {
                	$scope.showLoader = true;
                    var hasServicecategory = appService.crudService.update("serviceCategory", servicecategory);
                    hasServicecategory.then(function (result) {
                    $scope.showLoader = false;
                    $modalInstance.close();
                	$scope.list(1);
                    $scope.homerTemplate = 'app/views/notification/notify.jsp';
                    appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                    }).catch(function (result) {
                        if (!angular.isUndefined(result.data)) {
                        	$scope.showLoader = false;
                            if (result.data.fieldErrors != null) {
                                angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                    $scope.servicecategoryForm[key].$invalid = true;
                                    $scope.servicecategoryForm[key].errorMessage = errorMessage;
                                });
                            }
                        }

                    });
                }
            };


            $scope.cancel = function () {
                $modalInstance.close();
            };
        }]);
};


$scope.delete = function (size, servicecategory) {
    $scope.servicecategory = {};

	appService.dialogService.openDialog($scope.global.VIEW_URL + "servicecatalog/delete-storage.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope',
                                                                                             function ($scope, $modalInstance, $rootScope) {
	    // Delete the Storage Offer
				$scope.ok = function (servicecategoryId) {
	                    $scope.showLoader = true;
	                    var hasServicecategory = appService.crudService.softDelete("serviceCategory", servicecategory);
	                    hasServicecategory.then(function (result) {
	                        $scope.list(1);
	                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
	                        $scope.showLoader = false;
	                        appService.notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
	                    });
	                    $modalInstance.close();
					},
	                        $scope.cancel = function () {
	                            $modalInstance.close();
	                        };

            $scope.cancel = function () {
                $modalInstance.close();
            };
        }]);
};
};