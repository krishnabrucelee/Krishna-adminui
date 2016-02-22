/**
 *
 * loginCtrl
 *
 */

angular.module('panda-ui-admin', []).controller("loginCtrl", function ($scope, $http, $window, globalConfig, $remember) {

    $scope.loginForm = function () {

    	if ($scope.remember) {
            $remember('username', $scope.username);
            $remember('password', $scope.password);
        }

        var headers = {
            "x-requested-with": 'BACKEND_ADMIN',
            "x-auth-username": $scope.username,
            "x-auth-password": $scope.password,
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

    //Set remember me option
    $scope.rememberMe = function() {
        if ($scope.remember) {
            $remember('username', $scope.username);
            $remember('password', $scope.password);
        } else {
            $remember('username', '');
            $remember('password', '');
        }
    };

    //Load cookie user name and password
    $scope.remember = false;
    if ($remember('username') && $remember('password') ) {
        $scope.remember = true;
        $scope.username = $remember('username');
        $scope.password = $remember('password');
    }

});
