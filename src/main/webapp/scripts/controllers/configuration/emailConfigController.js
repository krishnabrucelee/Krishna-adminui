/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('emailConfigCtrl', emailConfigCtrl)

function emailConfigCtrl($scope, $window, appService, $state) {

    $scope.global = appService.globalConfig;
    $scope.formElements = {};
    $scope.formSubmitted = false;

    // Volume List
    $scope.list = function (pageNumber) {
         $scope.showLoader = true;
        var hasEmail = {};
        if ($scope.domainView == null) {
            hasEmail = appService.crudService.listAll("email-configuration/list");
        }
        hasEmail.then(function (result) {
            $scope.email = result;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);


    // Create a new application
    $scope.save = function (form, email) {
    if (email.id == null) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.showLoader = true;
            var email = angular.copy($scope.email);
            var hasEmail = appService.crudService.add("email-configuration", email);
            hasEmail.then(function (result) {
                $scope.showLoader = false;
                $state.reload();
                appService.notify({message: 'Added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
            }).catch(function (result) {
                $scope.showLoader = false;
                if (!angular.isUndefined(result.data)) {
                 if (result.data.fieldErrors != null) {
                   $scope.showLoader = false;
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.volumeForm[key].$invalid = true;
                        $scope.volumeForm[key].errorMessage = errorMessage;
                    });
                }
            }
        });
        }
    } else {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.showLoader = true;
            var email = angular.copy($scope.email);
            var hasEmail = appService.crudService.update("email-configuration", email);
            hasEmail.then(function (result) {
                $scope.showLoader = false;
                $state.reload();
                appService.notify({message: 'updated successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
            }).catch(function (result) {
                $scope.showLoader = false;
                if (!angular.isUndefined(result.data)) {
                 if (result.data.fieldErrors != null) {
                   $scope.showLoader = false;
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.volumeForm[key].$invalid = true;
                        $scope.volumeForm[key].errorMessage = errorMessage;
                    });
                }
            }
        });
        }
    }
   }

    $scope.formElements = {
            LanguageList: {
                "0":"English",
                "1":"Chinese"
            }
    };

};