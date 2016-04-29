function utilService(globalConfig, $http, $window, $cookies, localStorageService) {

    var object = {};

    object.getReferenceObjet = function(reference) {
    	referenceObject  = {
    			"id": reference.id,
    			"uuid": reference.uuid
    	};
    	return referenceObject;
    };

    object.changeSorting = function(column) {
		var sort = globalConfig.sort;

		if (sort.column == column) {
			sort.descending = !sort.descending;
		} else {
			sort.column = column;
			sort.descending = false;
		}
		return sort.descending;
	};

	object.getBillablTypes = function() {

	};

	// Logout application
    object.logoutApplication = function(type) {
    	if (localStorageService.get('id') != 'undefined' && !angular.isUndefined(localStorageService.get('id'))
        		&& localStorageService.get('id') != null && localStorageService.get('id') != 'null') {
    	    $http({method:globalConfig.HTTP_GET, url:globalConfig.APP_URL + 'loginHistory/logoutSession?id=' + localStorageService.get('id') + '&type=' + type,
			    "headers": {'x-auth-token': localStorageService.get('token'), 'x-requested-with': '', 'Content-Type': 'application/json', 'Range': "items=0-9", 'x-auth-login-token': '-1',
				'x-auth-remember': localStorageService.get('rememberMe'), 'x-auth-user-id': localStorageService.get('id'), 'x-auth-login-time': localStorageService.get('loginTime')}})
			.success(function(result){
				$window.sessionStorage.removeItem("loginSession")
				localStorageService.set('rememberMe', "false");
				$cookies.rememberMe = "false";
				localStorageService.set('loginToken', "0");
				localStorageService.set('loginTime', "0");
		        window.location.href = "login";
          });
    	} else {
    		$window.sessionStorage.removeItem("loginSession")
			localStorageService.set('rememberMe', "false");
			$cookies.rememberMe = "false";
			localStorageService.set('loginToken', "0");
			localStorageService.set('loginTime', "0");
	        window.location.href = "login";
    	}
    }

	object.getMonthList = function() {
        return [ {
            'id' : 1,
            'name' : 'January'
        }, {
            'id' : 2,
            'name' : 'February'
        }, {
            'id' : 3,
            'name' : 'March'
        }, {
            'id' : 4,
            'name' : 'April'
        }, {
            'id' : 5,
            'name' : 'May'
        }, {
            'id' : 6,
            'name' : 'June'
        }, {
            'id' : 7,
            'name' : 'July'
        }, {
            'id' : 8,
            'name' : 'August'
        }, {
            'id' : 9,
            'name' : 'September'
        }, {
            'id' : 10,
            'name' : 'October'
        }, {
            'id' : 11,
            'name' : 'November'
        }, {
            'id' : 12,
            'name' : 'December'
        }
        ]
    }

    return object;
};


/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('utilService', utilService);
