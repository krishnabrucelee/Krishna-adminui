/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('clientListCtrl', clientListCtrl)

function clientListCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {

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
		    $scope.global = crudService.globalConfig;
		    $scope.domain = {};
		    $scope.domainElements={

		    };
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

    // Opened user add window
    $scope.addDomain = function (size,domain) {
        dialogService.openDialog("app/views/domain/add-domain.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
        	$scope.save = function (form) {
                $scope.formSubmitted = true;
                if (form.$valid) {

                    $scope.formSubmitted = true;
                    if (form.$valid) {
                        var user = angular.copy($scope.user);
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
                        		$scope.domain.secondaryContact = "";
                        	}).catch(function (result) {
                        		if(!angular.isUndefined(result) && result.data != null) {
                        			angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                                	   $scope.domainForm[key].$invalid = true;
                                	   $scope.domainForm[key].errorMessage = errorMessage;
                        			});
                        		}
                        	});
                    }
                }
            },
            $scope.cancel = function () {
                $modalInstance.close();
            };
         }]);
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



