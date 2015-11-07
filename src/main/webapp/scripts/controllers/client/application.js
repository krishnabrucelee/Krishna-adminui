

/**
 *
 * applicationListCtrl
 *
 */

angular
        .module('panda-ui-admin')
        .controller('applicationListCtrl', applicationListCtrl)

function applicationListCtrl($scope, notify, promiseAjax, dialogService, crudService) {
    $scope.applicationList = {};
    $scope.paginationObject = {};
    $scope.applicationForm = {};
    $scope.global = crudService.globalConfig;


    // Application List
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasApplications = crudService.list("applications", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasApplications.then(function (result) {  // this is only run after $http completes0

            $scope.applicationList = result;

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);
};

