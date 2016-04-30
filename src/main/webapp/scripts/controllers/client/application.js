

/**
 *
 * applicationListCtrl
 *
 */

angular
        .module('panda-ui-admin')
        .controller('applicationListCtrl', applicationListCtrl)

function applicationListCtrl($scope, notify, promiseAjax, dialogService,appService, crudService, localStorageService, globalConfig) {
    $scope.applicationList = {};
    $scope.paginationObject = {};
    $scope.applicationForm = {};
    $scope.global = crudService.globalConfig;
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'type';

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

            var hasApplicationsLists = {};           
            if ($scope.domainView == null && $scope.applicationSearch == null) {
            	hasApplicationsLists = appService.crudService.list("applications", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            }  else {
                $scope.filter = "";
            	if ($scope.domainView != null && $scope.applicationSearch == null) {
                	$scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            	} else if ($scope.domainView == null && $scope.applicationSearch != null) {
                	$scope.filter = "&domainId=0" + "&searchText=" + $scope.applicationSearch;
            	} else {
                	$scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.applicationSearch;
            	}
            hasApplicationsLists =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "applications/listByFilter"
				+"?lang=" +appService.localStorageService.cookie.get('language')+ $scope.filter+"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
        }
            hasApplicationsLists.then(function(result) { // this is only run after $http
			// completes0
			$scope.applicationList = result;
			$scope.applicationList.Count = 0;
            if (result.length != 0) {
                $scope.applicationList.Count = result.totalItems;
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

    // Application List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasApplications = {};
        $scope.filter = "";
        if ($scope.domainView == null && $scope.applicationSearch == null) {
            hasApplications = appService.crudService.list("applications", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        } else {
            if ($scope.domainView != null && $scope.applicationSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            } else if ($scope.domainView == null && $scope.applicationSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.applicationSearch;
            } else {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.applicationSearch;
            }
            hasApplications =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "applications/listByFilter"
				+"?lang=" +appService.localStorageService.cookie.get('language')+ $scope.filter+"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
        }
        hasApplications.then(function (result) {  // this is only run after $http completes0
            $scope.applicationList = result;
            $scope.applicationList.Count = 0;
            if (result.length != 0) {
                $scope.applicationList.Count = result.totalItems;
            }

            // For pagination
            $scope.paginationObject.limit = limit;
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

    // Get domain list
    var hasdomainListView = appService.crudService.listAll("domains/list");
    hasdomainListView.then(function (result) {
    	$scope.domainListView = result;
    });

    // Get application list based on domain selection
    $scope.selectDomainView = function(pageNumber) {
    	$scope.list(1);
    };

    // Get instance list based on quick search
    $scope.applicationSearch = null;
    $scope.searchList = function(applicationSearch) {
        $scope.applicationSearch = applicationSearch;
        $scope.list(1);
    };

};
