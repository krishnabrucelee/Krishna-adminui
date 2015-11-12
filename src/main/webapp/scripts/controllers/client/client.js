/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('clientListCtrl', clientListCtrl)

function clientListCtrl($scope, promiseAjax,$modal,modalService, notify) {

	var VIEW_URL = "app/";
	var hasServer = promiseAjax.httpRequest("GET", "api/client.json");
    hasServer.then(function (result) {  // this is only run after $http completes
        $scope.client = result;

    });

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

 };

