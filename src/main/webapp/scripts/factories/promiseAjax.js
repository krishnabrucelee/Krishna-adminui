/**
 * Panda - Cloud Management Portal
 * Copyright 2015 Assistanz.com
 *
 * Angularjs ajax request with promise.
 * @author - Jamseer N
 */

function promiseAjax($http, $window, globalConfig, notify, $cookies) {
     var global = globalConfig;
     var httpTokenRequest = function (method, url, headers, data) {

        if(angular.isUndefined(data)) {
            var data = {};
            data.limit = global.CONTENT_LIMIT;
        };


    	if ((angular.isUndefined($cookies.rememberMe) || $cookies.rememberMe == "false") &&
    			$cookies.loginToken == '0' && $cookies.loginTime == '0') {
    			window.location.href = "login";
    	}

        var config = {
            "method": method,
            "data": data,
            "url": url,
            "headers": {'x-auth-token': $cookies.token, 'x-requested-with': '', 'Content-Type': 'application/json', 'Range': "items=0-9", 'x-auth-login-token': $cookies.loginToken, 'x-auth-remember': $cookies.rememberMe, 'x-auth-user-id': $cookies.id, 'x-auth-login-time': $cookies.loginTime}
        };


        if(headers != null && !angular.isUndefined(headers) && headers != '') {
            angular.forEach(headers, (function(value, key) {
                config.headers[key] = '';
                config.headers[key] = value;
            }));
        }

        return $http(config).then(function (res) {
            var data = res.data;
            data.loginSession = loginSession;

            // For Pagination
            if(res.headers('Content-Range') && typeof(res.headers('Content-Range')) != 'undefined') {
                var contentRange = res.headers('Content-Range');
                if(!isNaN(contentRange.split("/")[1])) {
                    data.totalItems = contentRange.split("/")[1];

                    var itemsPerPage = contentRange.split("/")[0].split('-')[1];
                    data.itemsPerPage = global.CONTENT_LIMIT;
                }
            }
            return data;
        }).catch(function (result) {
            throw result;
        });
    };
    var httpRequest = function(method, url, data) {
        return $http({method:method, url:url}).then(function(result){
            return result.data;
        });
    };

    var httpRequestPing = function(method, url, data) {
    	var config = {
                "method": method,
                "data": data,
                "url": url,
                "headers": {'x-auth-token': $cookies.token, 'x-requested-with': '', 'Content-Type': 'application/json', 'Range': "items=0-9"}
            };
        return $http(config).then(function(result){
            return result.data;
        });
    };

    return { httpRequest: httpRequest, httpTokenRequest: httpTokenRequest, httpRequestPing: httpRequestPing };
}

function uploadFile($http){
	var upload = function(files,emails,httpTokenRequest,globalConfig) {
		 var fd = new FormData();
		/**angular.forEach(files,function(file){
		if(!angular.isUndefined(file)) {
		 fd.append('file',file);
		}

 		});**/
		var i = 0;
		angular.forEach(files,function(file){
            	if(!angular.isUndefined(file)) {
                	fd.append("file",file);
            	}
           	 if(!angular.isUndefined(file) && i==0) {
                	fd.append("hasEnglish",true);
            	} else {
                	fd.append("hasEnglish",false);
            	}
            	i++;
         	});
		fd.append("eventName",emails.eventName);
		fd.append("subject",emails.subject);
 		fd.append('englishLanguage',emails.englishLanguage);
 		fd.append('chineseLanguage',emails.chineseLanguage);
		fd.append("recipientType",emails.recipientType);
		return $http.post(globalConfig.APP_URL + "/emails/uploadFile", fd, {
			transformRequest : angular.identity,
			headers : {
				'Content-Type' : undefined,
				'x-auth-token' :globalConfig.sessionValues.token
			}
		});


	}
	return {upload: upload};
};

/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('promiseAjax', promiseAjax)
.factory('uploadFile', uploadFile)
