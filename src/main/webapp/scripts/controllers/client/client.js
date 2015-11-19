/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('clientListCtrl', clientListCtrl)

function clientListCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {

/*	var VIEW_URL = "app/";
	var hasServer = promiseAjax.httpRequest("GET", "api/client.json");
    hasServer.then(function (result) {  // this is only run after $http completes
        $scope.client = result;

    });*/
    $scope.paginationObject = {};
    $scope.global = crudService.globalConfig;
	$scope.domainList = {};

    // Compute Offer List
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasDomains = crudService.list("domains", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasDomains.then(function (result) {  // this is only run after $http
												// completes0

            $scope.domainList = result;


            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);



    $scope.clientList = {};
    var hasServer = promiseAjax.httpRequest("GET", "api/clients.json");
    hasServer.then(function (result) {  // this is only run after $http completes
        $scope.clientList = result;
    });

    $scope.delete = function(size) {
        modalService.trigger('app/views/client/clients/delete.jsp', size);
    };

    $scope.validateAdd = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
     };

     $scope.validateEdit = function (form) {
         $scope.formSubmitted = true;
         if (form.$valid) {

             $scope.homerTemplate = 'app/views/notification/notify.jsp';
             notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

         }
     };

     $scope.quota = {

             	};
     $scope.paginationObject = {};
     $scope.global = crudService.globalConfig;



 	$scope.edit = function (quotaId) {
         var hasQuota = crudService.read("quota", quotaId);
         hasQuota.then(function (result) {
             $scope.quota = result;
         });

     };


     if (!angular.isUndefined($stateParams.id) && $stateParams.id != '') {
         $scope.edit($stateParams.id)
     }


     // Edit the Compute Offer
     $scope.update = function (form) {
         // Update Compute Offer
         $scope.formSubmitted = true;
         if (form.$valid) {
             var quota = $scope.quota;
             console.log(storage);
             var hasStorage = crudService.update("quota", quota);
             hasStorage.then(function (result) {

                 $scope.homerTemplate = 'app/views/notification/notify.jsp';
                 notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
             });
         }
     };



 };



