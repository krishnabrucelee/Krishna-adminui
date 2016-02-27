/*
 * Tax Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('billableItemsCtrl', billableItemsCtrl)

function billableItemsCtrl($scope, appService) {

	// Billable Items List
	$scope.paginationObject = {};
    $scope.global = appService.globalConfig;
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
    	$scope.billableItem = {}
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasBillableItems = appService.crudService.list("billableItems", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasBillableItems.then(function (result) {  // this is only run after $http completes0
            $scope.billableItems = result;
            // For pagination
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

    $scope.formElements = {};
    // Tax List
	var hasTaxs = appService.crudService.listAll("tax/list");
	hasTaxs.then(function (result) {
	      $scope.formElements.taxList = result;
	});

	var itemType = appService.globalConfig.BILLABLE_ITEM.BILLABLE_TYPE;
	$scope.formElements.itemTypeList = {
        "Infrastructure": "INFRASTRUCTURE",
        "Managed": "MANAGED",
        "Optional": "OPTIONAL"
	};

	var itemUnit = appService.globalConfig.BILLABLE_ITEM.BILLABLE_UNIT;
	$scope.formElements.itemUnitList = {
	    "Per Core per Hour": "PER_CORE_PER_HOUR",
	    "Per GB per Hour": "PER_GB_PER_HOUR",
	    "Per OS per Hour": "PER_OS_PER_HOUR",
	    "Per DB per Hour":  "PER_DB_PER_HOUR",
	    "Per App per Hour": "PER_APP_PER_HOUR"
	};


    // Add New Billable Item
    $scope.createBillableItem = function (size) {
        appService.dialogService.openDialog("app/views/configuration/chargeback/billable-item/add.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
			// Create a new Billable Item
		    $scope.saveBillableItem = function (form) {
		        $scope.formSubmitted = true;
		        if (form.$valid) {
		        	$scope.showLoader = true;
		            var billableItem = angular.copy($scope.billableItem);
		            if(!angular.isUndefined(billableItem.tax) && billableItem.tax != "") {
			            var taxTemObj = billableItem.tax;
			            billableItem.taxId = taxTemObj.id;
	                	delete billableItem.tax;
		            }

		            var hasBillableItems = appService.crudService.add("billableItems", billableItem);
		            hasBillableItems.then(function (result) {  // this is only run after $http completes
		            	$scope.formSubmitted = false;
		                $scope.showLoader = false;
		                $modalInstance.close();
		                appService.notify({message: 'Billable item added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
		                $scope.list(1);
		            }).catch(function (result) {
		            	if(!angular.isUndefined(result) && result.data != null) {
		            	$scope.showLoader = false;
		            	$scope.billableItem.tax = taxTemObj;
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

    // Edit the existing Billable Item
    $scope.edit = function (size, billableItem) {
        appService.dialogService.openDialog("app/views/configuration/chargeback/billable-item/edit.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
    	$scope.billableItem = angular.copy(billableItem);
    	angular.forEach($scope.formElements.taxList, function(obj, key) {
    		if($scope.billableItem.taxId == obj.id) {
    			$scope.billableItem.tax = obj;
    		}
    	})
    	// Update Billable Item
	    $scope.updateBillableItem = function (form) {
	        $scope.formSubmitted = true;
	        if (form.$valid) {
	        	$scope.showLoader = true;
	            var billableItem = angular.copy($scope.billableItem);

	            var hasBillableItems = appService.crudService.update("billableItems", billableItem);
	            hasBillableItems.then(function (result) {  // this is only run after $http completes
	            	//$rootScope.department={};
	            	$scope.formSubmitted = false;
	                $scope.showLoader = false;
	                $scope.list(1);
	                $modalInstance.close();
	                appService.notify({message: 'Billable item updated successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
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


//Delete the Billable Item
$scope.delete = function (size, billableItem) {
    appService.dialogService.openDialog("app/views/common/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
            $scope.deleteObject = billableItem;
            $scope.ok = function (deleteObject) {
            	$scope.showLoader = true;
                var hasServer = appService.crudService.softDelete("billableItems", billableItem);
                hasServer.then(function (result) {
                    $scope.list(1);
                    $scope.showLoader = false;
                    appService.notify({message: 'Billable item deleted successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
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
