

/**
 *
 * applicationListCtrl
 *
 */

angular
        .module('panda-ui-admin')
        .controller('applicationListCtrl', applicationListCtrl)

function applicationListCtrl($scope, notify, promiseAjax, dialogService,appService, crudService) {
    $scope.applicationList = {};
    $scope.paginationObject = {};
    $scope.applicationForm = {};
    $scope.global = crudService.globalConfig;
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;

    // Application List
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasApplications = {};
        if ($scope.domainView == null) {
        	hasApplications = appService.crudService.list("applications", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        } else {
        	hasApplications =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "applications/listByDomain"
				+"?lang=" +appService.localStorageService.cookie.get('language')
				+ "&domainId="+$scope.domainView.id+"&sortBy=ASC"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
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
};

