
angular
        .module('panda-ui-admin')
        .controller('paymentCtrl', paymentCtrl)

function paymentCtrl($scope, $state, $stateParams, $log, $window, appService, promiseAjax, globalConfig, localStorageService) {


	 var hasConfigs = appService.crudService.listAll("paymentgateway/paylist");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.payment = result[0];
    });

};
