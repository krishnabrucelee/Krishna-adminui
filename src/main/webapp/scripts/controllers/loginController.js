/**
 *
 * loginCtrl
 *
 */

angular.module('panda-ui-admin', []).controller("loginCtrl", function ($scope, $http, $window, globalConfig) {

    $scope.loginForm = function () {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

             var headers = {
                "x-requested-with": 'BACKEND_ADMIN',
                "x-auth-username": username,
                "x-auth-password": password,
                'Content-Type': 'application/json'
            };

            $http({method: 'POST', url: globalConfig.APP_URL + 'authenticate', headers: headers})
            .success(function (result) {
                //$window.sessionStorage.token = result.token;
                $window.sessionStorage.setItem("pandaUserSession", JSON.stringify(result));
                window.location.href = "index#/dashboard";
            }).catch(function (result) {
            	$window.sessionStorage.removeItem("pandaUserSession")
                if (!angular.isUndefined(result.data)) {
                	var target = document.getElementById("errorMsg");
                    target.innerHTML = result.data.message;
                    target.style.display = 'block';
                    target.style["margin-bottom"] = '10px';
                }
            });

    }
});
