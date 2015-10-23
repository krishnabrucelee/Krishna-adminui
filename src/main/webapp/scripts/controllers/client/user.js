/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('userListCtrl', userListCtrl)

function userListCtrl($scope, promiseAjax) {
    $scope.userList = {};
    var hasServer = promiseAjax.httpRequest("GET", "api/users.json");
    hasServer.then(function (result) {  // this is only run after $http completes
        $scope.userList = result;
    });
};

