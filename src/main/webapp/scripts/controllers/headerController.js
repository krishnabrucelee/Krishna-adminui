/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('headerCtrl', headerCtrl)

function headerCtrl($scope, $http, $window, $modal, $log, $state, $stateParams, appService, globalConfig, localStorageService, $cookies) {

      $scope.showImage = function() {
            $scope.logoImage =  REQUEST_PROTOCOL + $window.location.hostname +':8080/'  + 'resources/' + 'theme_logo.jpg';
    }
    $scope.showImage();

    $scope.themeSettingList = function () {
        $scope.themeSettingsList = localStorageService.cookie.get('themeSettings');
        //$state.data.pageTitle = "testttt";
        console.log("State", $state);
    };
    $scope.themeSettingList();
};