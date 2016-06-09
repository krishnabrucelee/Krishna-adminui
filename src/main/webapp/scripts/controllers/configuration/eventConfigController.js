/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('eventConfigCtrl', eventConfigCtrl)

function eventConfigCtrl($scope, $window, appService, $state) {

    $scope.global = appService.globalConfig;
    $scope.formElements = {};
    $scope.formSubmitted = false;

    $scope.formElements = {};
    var hasConfigs = appService.crudService.listAll("events/event-configuration/list");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.eventConfig = result[0];
        console.log("eventconf", $scope.eventConfig);
    });

    // Save event configuration
    $scope.save = function (form, event) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.showLoader = true;
            console.log($scope.eventConfig);
            var event = angular.copy($scope.eventConfig);
            var hasEvents = appService.crudService.add("events/event-configuration", event);
            hasEvents.then(function (result) {
                $scope.showLoader = false;
                $state.reload();
                appService.notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
            }).catch(function (result) {
                $scope.showLoader = false;
                if (!angular.isUndefined(result.data)) {
                 if (result.data.fieldErrors != null) {
                   $scope.showLoader = false;
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.eventConfigForm[key].$invalid = true;
                        $scope.eventConfigForm[key].errorMessage = errorMessage;
                    });
                 }
                }
            });
        }
    }
};