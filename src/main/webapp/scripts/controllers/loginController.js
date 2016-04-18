/**
 *
 * loginCtrl
 *
 */

angular.module('panda-ui-admin', ['ngCookies']).controller("loginCtrl", function ($scope, $http, $window, globalConfig, $remember, $cookies) {

    $scope.loginForm = function () {
    	if (angular.isUndefined($scope.remember)) {
    		$scope.remember = "false";
    	}
        var headers = {
            "x-requested-with": 'BACKEND_ADMIN',
            "x-auth-username": $scope.username,
            "x-auth-password": $scope.password,
            "x-auth-remember": $scope.remember,
            "x-force-login" : "false",
            'Content-Type': 'application/json'
        };

        $http({method: 'POST', url: globalConfig.APP_URL + 'authenticate', headers: headers})
        .success(function (result) {
            $window.sessionStorage.setItem("pandaUserSession", JSON.stringify(result));
        	$cookies.token = result.token;
       		$cookies.loginToken = result.loginToken;
       		$cookies.id = result.id;
       		$cookies.rememberMe = result.rememberMe;
       		$cookies.loginTime = result.loginTime;
            if (!angular.isUndefined(result.rememberResponse)) {
        		$cookies.token = result.tokenResponse.token;
           		$cookies.loginToken = result.rememberResponse.loginToken;
           		$cookies.rememberMe = result.rememberResponse.rememberMe;
                $cookies.loginTime = result.rememberResponse.loginTime;
            }
            window.location.href = globalConfig.BASE_UI_URL + "index#/dashboard";
        }).catch(function (result) {
        	if (!angular.isUndefined(result.data)) {
      	      if(result.data.message == "error.already.exists") {
      		  $scope.forceLogin = function() {
      		      if (confirm("Already user is logged In. Are you sure want to do Force Login?") == true) {
      		    	var headers = {
      		              "x-requested-with": 'BACKEND_ADMIN',
      		              "x-auth-username": $scope.username,
      		              "x-auth-password": $scope.password,
      		              "x-auth-remember": $scope.remember,
      		              "x-force-login" : "true",
      		              'Content-Type': 'application/json'
      		          };
      		          $http({method: 'POST', url: globalConfig.APP_URL + 'authenticate', headers: headers})
      		              .success(function (result) {
      		            	$window.sessionStorage.setItem("pandaUserSession", JSON.stringify(result));
      		            	$cookies.token = result.token;
      		         		$cookies.loginToken = result.loginToken;
      		         		$cookies.id = result.id;
      		         		$cookies.rememberMe = result.rememberMe;
      		         		$cookies.loginTime = result.loginTime;
      		                if (!angular.isUndefined(result.rememberResponse)) {
      		          		    $cookies.token = result.tokenResponse.token;
      		             		$cookies.loginToken = result.rememberResponse.loginToken;
      		             		$cookies.rememberMe = result.rememberResponse.rememberMe;
      		                    $cookies.loginTime = result.rememberResponse.loginTime;
      		                }
      		                window.location.href = globalConfig.BASE_UI_URL + "index#/dashboard";
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
      		  }
      		  $scope.forceLogin();
      		  } else {
      			  $window.sessionStorage.removeItem("pandaUserSession")
      			  var target = document.getElementById("errorMsg");
                  target.innerHTML = result.data.message;
                  target.style.display = 'block';
                  target.style["margin-bottom"] = '10px';
                }
            }
        });
    }

});
