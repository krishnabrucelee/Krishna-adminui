
angular
        .module('panda-ui-admin')
        .controller('paymentGatewayCtrl', paymentGatewayCtrl)

function paymentGatewayCtrl($scope, $state, $stateParams, $log, $window, appService, promiseAjax, globalConfig, localStorageService) {

$scope.formElements = {};
	 var hasConfigs = appService.crudService.listAll("paymentgateway/paylist");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.payment = result[0];
    });

	  $scope.save = function (form,payment) {
                    $scope.formSubmitted = true;
                    if (form.$valid && !angular.isUndefined($scope.payment.serviceType) && !angular.isUndefined($scope.payment.currencyType) && $scope.payment.serviceType !=null && $scope.payment.currencyType !=null) {

                    	$scope.showLoader = true;
 			var payment = $scope.payment;
                        var hasServer = appService.crudService.add("paymentgateway", payment);
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

$scope.formElements = {
    		serviceTypeList: {
                "0":"create_direct_pay_by_user",
                "1":"trade_create_by_buyer",
                "2":"create_partner_trade_by_buyer",
                "3":"create_forex_trade",
            },
            currencyTypeList: {
                "0":"USD",
                "1":"CNY",
            }

    };

};
