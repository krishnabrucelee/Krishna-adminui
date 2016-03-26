angular
        .module('panda-ui-admin')
        .controller('organizationCtrl', organizationCtrl)

function organizationCtrl($scope, $state, $stateParams, $log, $window, appService, promiseAjax, globalConfig, localStorageService) {






$scope.formElements = {};
	 var hasConfigs = appService.crudService.listAll("organization/orglist");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.organization = result[0];
    });


	  $scope.save = function (form,organization) {
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
 			var organization = $scope.organization;
                        var hasServer = appService.crudService.add("organization", organization);
                        hasServer.then(function (result) {  // this is only run after $http completes
                            $scope.formSubmitted = false;
                            $scope.showLoader = false;
                            appService.notify({message: 'Updated successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        }).catch(function (result) {
                        	$scope.showLoader = false;
            		    if (!angular.isUndefined(result.data)) {
                		if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                  	   	 var msg = result.data.globalError[0];
                  	   	 $scope.showLoader = false;
                	    	 appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                    	} else if (result.data.fieldErrors != null) {
                       	$scope.showLoader = false;
                        	angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                            	$scope.TemplateForm[key].$invalid = true;
                            	$scope.TemplateForm[key].errorMessage = errorMessage;
                        	});
                		}
                	}
            	});
                    	}
                	};


}
