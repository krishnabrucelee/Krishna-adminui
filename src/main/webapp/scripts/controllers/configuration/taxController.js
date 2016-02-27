/*
 * Tax Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('taxCtrl', taxCtrl)

function taxCtrl($scope, appService) {

	// Tax List
	$scope.paginationObject = {};
    $scope.global = appService.globalConfig;
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
    	$scope.tax = {}
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasDepartments = appService.crudService.list("tax", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasDepartments.then(function (result) {  // this is only run after $http completes0

            $scope.taxList = result;

            // For pagination
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

    // Add New tax
    $scope.createTax = function (size) {
        appService.dialogService.openDialog("app/views/configuration/chargeback/addTax.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
			// Create a new tax
		    $scope.saveTax = function (form) {
		        $scope.formSubmitted = true;
		        if (form.$valid) {
		        	$scope.showLoader = true;
		            var tax = angular.copy($scope.tax);

		            var hasServer = appService.crudService.add("tax", tax);
		            hasServer.then(function (result) {  // this is only run after $http completes
		            	//$rootScope.department={};
		            	$scope.formSubmitted = false;
		                $scope.showLoader = false;
		                appService.notify({message: 'Tax added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
		                $scope.list(1);
		                $modalInstance.close();
		            }).catch(function (result) {
		            	if(!angular.isUndefined(result) && result.data != null) {
		            	$scope.showLoader = false;
		            	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
		                   	    var msg = result.data.globalError[0];
		                 	    appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
		                     } else {
		                    	 angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
		                    		 $scope.taxForm[key].$invalid = true;
		                    		 $scope.taxForm[key].errorMessage = errorMessage;
		                    	 });
		                     }
		            	}
		            });
		        }
		    },
		    $scope.cancel = function () {
                $modalInstance.close();
            };
        }]);
    };

    // Edit the existing tax
    $scope.edit = function (size, tax) {
        appService.dialogService.openDialog("app/views/configuration/chargeback/editTax.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {

    	$scope.tax = angular.copy(tax);
    	// update tax
	    $scope.updateTax = function (form) {
	        $scope.formSubmitted = true;
	        if (form.$valid) {
	        	$scope.showLoader = true;
	            var tax = angular.copy($scope.tax);
	            var hasServer = appService.crudService.update("tax", tax);
	            hasServer.then(function (result) {
	            	$scope.formSubmitted = false;
	                $scope.showLoader = false;
	                $scope.list(1);
	                $modalInstance.close();
	                appService.notify({message: 'Tax updated successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
	            }).catch(function (result) {
	            	if(!angular.isUndefined(result) && result.data != null) {
	            	$scope.showLoader = false;
	            	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
	                   	    var msg = result.data.globalError[0];
	                 	    appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
	                     } else {
	                    	 angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
	                    		 $scope.taxForm[key].$invalid = true;
	                    		 $scope.taxForm[key].errorMessage = errorMessage;
	                    	 });
	                     }
	            	}
	            });
	        }
	    }
	    ,
        $scope.cancel = function () {
            $modalInstance.close();
        };
    }]);
};


//Delete the tax
$scope.delete = function (size, tax) {
    appService.dialogService.openDialog("app/views/common/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
            $scope.deleteObject = tax;
            $scope.ok = function (deleteObject) {
            	$scope.showLoader = true;
                var hasServer = appService.crudService.softDelete("tax", tax);
                hasServer.then(function (result) {
                    $scope.list(1);
                    $scope.showLoader = false;
                    appService.notify({message: 'Tax deleted successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                }).catch(function (result) {

              	 if(!angular.isUndefined(result) && result.data != null) {
      		 		   if(result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])){
                      	 var msg = result.data.globalError[0];
                      	 appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                       }
                       angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                      	$scope.taxForm[key].$invalid = true;
                       	$scope.taxForm[key].errorMessage = errorMessage;
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
