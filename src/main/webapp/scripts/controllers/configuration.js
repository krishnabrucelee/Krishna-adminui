/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('cloudStackCtrl', cloudStackCtrl)
        .controller('configurationCtrl', configurationCtrl)
        .controller('importCtrl', importCtrl)
        .controller('retailManagementCtrl', retailManagementCtrl)
        .controller('billingCtrl', billingCtrl)
        .controller('loginSecurityCtrl', loginSecurityCtrl)
        .controller('importCsDataCtrl', importCsDataCtrl)
        .controller('usageCsDataCtrl', usageCsDataCtrl)
        .controller('languageCtrl', languageCtrl)

function cloudStackCtrl($scope, $window, appService) {

    var VIEW_URL = "app/";
    $scope.zoneList = {};
    $scope.configList = {};
    $scope.paginationObject = {};
    $scope.configForm = {};

    var hasConfigs = appService.crudService.listAll("cloudconfiguration/configlist");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.config = result[0];
    });

    /**
     * Save the configuration details.
     */
    $scope.save = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var config = $scope.config;
            $scope.showLoader = true;
            var hasConfig = appService.crudService.add("cloudconfiguration", config);
            hasConfig.then(function (result) {  // this is only run after $http
                $scope.showLoader = false;
                appService.notify({message: 'System configured successfully. Please login again to continue.', classes: 'alert-success', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                    setTimeout(function() {
                    $window.sessionStorage.removeItem("pandaUserSession");
                    window.location.href = "login";
                }, 4000);

            }).catch(function (result) {
                $scope.showLoader = false;
                if (!angular.isUndefined(result.data)) {
                    if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                        var msg = result.data.globalError[0];
                        $scope.showLoader = false;
                        appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                    } else if (result.data.fieldErrors != null) {
                        angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                            $scope.configForm[key].$invalid = true;
                            $scope.configForm[key].errorMessage = errorMessage;
                        });
                    }
                }
            });
        }
    }

    // Zone List
    $scope.list = function (pageNumber) {
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? appService.globalConfig.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasZones = appService.crudService.list("zones", appService.globalConfig.paginationHeaders(pageNumber, limit), {"limit": limit});
    hasZones.then(function (result) {  // this is only run after $http completes0
        $scope.zoneList = result;

        // For pagination
        $scope.paginationObject.limit = limit;
        $scope.paginationObject.currentPage = pageNumber;
        $scope.paginationObject.totalItems = result.totalItems;
    });
    };
    $scope.list(1);
    };

function configurationCtrl($scope, $http, $window, $modal, $log, $state, $stateParams, appService,globalConfig, $cookies, localStorageService) {

    //$scope.adminUserList = {};
    $scope.paginationObject = {};
    $scope.configForm = {};
    $scope.domainList = {};
    $scope.eventsList = {};
    $scope.hasConfigList = {};
    $scope.themeSettingsList = {};
    $scope.global = appService.globalConfig;
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';

    // Admin User List
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasUsers = appService.promiseAjax.httpTokenRequest( appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "users/listbyrootadmin");
    hasUsers.then(function (result) {  // this is only run after $http completes0
        $scope.adminUserList = result;
    });

        // Domain List
        $scope.list = function (pageNumber) {
                appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
                appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
            var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
            var hasDomains = appService.crudService.list("domains", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            hasDomains.then(function (result) {
                $scope.domainList = result;
                $scope.stateid =$stateParams.id;
                $scope.type = $stateParams.quotaType;
                // For pagination
                $scope.paginationObject.limit = limit;
                $scope.paginationObject.currentPage = pageNumber;
                $scope.paginationObject.totalItems = result.totalItems;
            });
        };
        $scope.list(1);

    $scope.global = globalConfig;
    $scope.activity = {};
    $scope.paymentList = {};

    $scope.updatePaymentDefault = function (payment, index) {
        $scope.paymentGateList[index].enabledPayment = true;
        $scope.updateDisabled(payment, index);
    };

    $scope.updateDisabled = function (payment, index) {
        $scope.paymentGateList[index].isDefault = true;
        angular.forEach($scope.paymentGateList, function (item, key) {
            if (index != key)
                $scope.paymentGateList[key].isDefault = false;
        });
    };

    appService.localStorageService.set("billingList", null);
    if (appService.localStorageService.get("billingList") == null) {
        var hasServer = appService.promiseAjax.httpRequest("GET", "api/billing.json");
        hasServer.then(function (result) {  // this is only run after $http
                                            // completes
            $scope.billingList = result;
            appService.localStorageService.set("billingList", result);
        });
    } else {
        $scope.billingList = appService.localStorageService.get("billingList");
    }
    if ($state.current.data.pageTitle == 'ConfigCategory' || $state.current.data.pageTitle == 'General' || $state.current.data.pageTitle == 'Chargeback'
            || $state.current.data.pageTitle == 'Cloudstack') {
        $state.current.data.pageTitle = $stateParams.category.substring(0, 1).toUpperCase() + $stateParams.category.substring(1).toLowerCase();
    }

    if ($state.$current.parent.data.pageTitle == 'ConfigCategory') {
        $state.$current.parent.data.pageTitle = $stateParams.category.substring(0, 1).toUpperCase() + $stateParams.category.substring(1).toLowerCase();
    }

    appService.localStorageService.set("taxList", null);
    if (appService.localStorageService.get("taxList") == null) {
        var hasServer = appService.promiseAjax.httpRequest("GET", "api/tax.json");
        hasServer.then(function (result) {
            $scope.taxList = result;
            appService.localStorageService.set("taxList", result);
        });
    } else {
        $scope.taxList = appService.localStorageService.get("taxList");
    }

        var hasServer = appService.promiseAjax.httpRequest("GET", "api/paymentGateway.json");
        hasServer.then(function (result) {
            $scope.paymentGateList = result;
            appService.localStorageService.set("paymentGateList", result);
        });


    appService.localStorageService.set("promotionList", null);
    if (appService.localStorageService.get("promotionList") == null) {
        var hasServer = appService.promiseAjax.httpRequest("GET", "api/promotion.json");
        hasServer.then(function (result) {
            $scope.promotionList = result;
            appService.localStorageService.set("promotionList", result);
        });
    } else {
        $scope.promotionList = appService.localStorageService.get("promotionList");
    }

    appService.localStorageService.set("discountList", null);
    if (appService.localStorageService.get("discountList") == null) {
        var hasServer = appService.promiseAjax.httpRequest("GET", "api/discount.json");
        hasServer.then(function (result) {
            $scope.discountList = result;
            appService.localStorageService.set("discountList", result);
        });
    } else {
        $scope.discountList = appService.localStorageService.get("discountList");
    }

    $scope.summernoteTextTwo = {}
    $scope.summernoteOpt = {
        toolbar: [
            ['headline', ['style']],
            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
            ['textsize', ['fontsize']],
            ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
        ],
        disableResizeEditor: true,
    };

    $scope.summernoteTextThree = {}
    $scope.summernoteOption = {
        toolbar: [
            ['headline', ['style']],
            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
            ['textsize', ['fontsize']],
            ['alignment', ['paragraph', 'lineheight']],
            ['color', ['color']]
        ],
        disableResizeEditor: true,
    };

    $scope.configElements = {
        category: $stateParams.category,
        oneItemSelected: {},
        selectedAll: {}
    };

    $scope.language = {
    };
    $scope.formSubmitted = false;

    $scope.formElements = {
        languageList: [
            {id: 1, name: 'English'},
            {id: 2, name: 'Chinese'}
        ],
        departmentList: [
            {id: 1, name: 'Developing'},
            {id: 2, name: 'Testing'}
        ],
        taxList: [
            {id: 1, name: 'N/A'},
            {id: 2, name: 'vat'}
        ],
        typeDiscountList: [
            {id: 1, name: 'User Based'},
            {id: 2, name: 'Plan Based'}
        ],
        typeList: [
            {id: 1, name: 'Fixed'},
        ],
        countryList: [
            {id: 1, name: 'AMERICA'},
            {id: 2, name: 'INDIA'},
            {id: 3, name: 'CHINA'}
        ],
        applyUserList: [
            {id: 1, name: 'All'},
            {id: 2, name: 'Selective'}
        ],
        applyPlanList: [
            {id: 1, name: 'All'},
            {id: 2, name: 'Selective'}
        ],
        userList: [
            {id: 1, name: 'Panda'},
            {id: 2, name: 'Logistics'}
        ],
        planList: [
            {id: 1, name: 'Small'},
            {id: 2, name: 'Medium'},
            {id: 2, name: 'Large'}
        ],
        importList: [
            {id: 1, name: 'Domains'},
            {id: 2, name: 'Zones'},
            {id: 3, name: 'Compute Offer'},
            {id: 4, name: 'Disk Offer'},
            {id: 5, name: 'Os Templates'},
            {id: 6, name: 'VPCOfferings'},
            {id: 7, name: 'Network Offerings'},
            {id: 8, name: 'Network'},
            {id: 9, name: 'Project'}
        ],
        dateList: [
            {id: 1},
            {id: 2},
            {id: 3},
            {id: 4},
            {id: 5},
            {id: 6},
            {id: 7},
            {id: 8},
            {id: 9},
            {id: 10},
            {id: 11},
            {id: 12},
            {id: 13},
            {id: 14},
            {id: 15},
            {id: 16},
            {id: 17},
            {id: 18},
            {id: 19},
            {id: 20},
            {id: 21},
            {id: 22},
            {id: 23},
            {id: 24},
            {id: 25},
            {id: 26},
            {id: 27},
            {id: 28},
            {id: 29},
            {id: 30},
            {id: 31}
        ],
        domainList: [
            {id: 1, name: 'Root'},
            {id: 2, name: 'Admin'},
            {id: 3, name: 'Domain'}
        ],
        recipientTypeList: {
            "0":"USER",
            "1":"ROOT_ADMIN",
            "2":"DOMAIN_ADMIN"
        },
        recipientList: {
            "0":"ROOT_ADMIN"
        },
        dateFormatList: {
            "0":"DD/MM/YYYY",
            "1":"MM/DD/YYYY",
            "2":"YYYY/MM/DD",
            "3":"YYYY/DD/MM"
        }
    };

    $scope.validateDomain = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.validateDeleteTax = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.validatePromotion = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

   $scope.eventList = function () {
             var hasEvent = crudService.listAll("literals/listall");
             hasEvent.then(function (result) {  // this is only run after $http completes0
                     $scope.eventList = result;
                  });
              };



$scope.eventLists = function () {
             var hasEvent = appService.crudService.listAll("literals/list");
             hasEvent.then(function (result) {  // this is only run after $http completes0
                     $scope.eventList = result;
                  });
              };
$scope.eventLists();


$scope.files = [];
$scope.test = 0;

 $scope.emailEventList = function (eventName) {
    var hasEventList = appService.crudService.listByQuery("literals/listbyevent?eventName="+eventName.eventName);
        hasEventList.then(function (result) {
            $scope.eventsList = result;
        });
    var hasEventTestList = appService.crudService.listByQuery("emails/listbyeventname?eventName="+eventName.eventName);
        hasEventTestList.then(function (result) {
            $scope.eventsTemplateList = result;
        });

    };


      $scope.validateEmailTemplate = function (form,emails,file,file1) {
var arrayTest = [file, file1];
          $scope.formSubmitted = true;

if( angular.isUndefined(file) && angular.isUndefined($scope.eventsTemplateList[0]))
{

   appService.notify({message: 'Please select a file for English Template', classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
}

$scope.checkfile = function(file) {
if( (angular.isUndefined(file) || angular.isUndefined(file1)) && !angular.isUndefined($scope.eventsTemplateList[0]))
{
            if (emails.subject && emails.eventName !=null) {
            if(file != null) {
               emails.englishLanguage = "ENGLISH";
            }
              if(file1 != null) {
                  emails.chineseLanguage = "CHINESE";
              }
              emails.recipientType = "USER";
              emails.eventName = emails.eventName.eventName;
                appService.uploadFile.upload(arrayTest,emails,appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                    appService.notify({message: 'Added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        $state.reload();
          }
}

else if( !angular.isUndefined(file))
{
      if ((file.type != "text/html") ||  (!angular.isUndefined(file) && (file.type != "text/html"))) {
      appService.notify({message: 'Please upload HTML files ', classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
      return false;
    }
    else {
                    if (emails.subject && emails.eventName !=null) {
            if(file != null) {
               emails.englishLanguage = "ENGLISH";
            }
              if(file1 != null) {
                  emails.chineseLanguage = "CHINESE";
              }
              emails.recipientType = "USER";
              emails.eventName = emails.eventName.eventName;
                appService.uploadFile.upload(arrayTest,emails,appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                    appService.notify({message: 'Added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        $state.reload();
          }

}
}

}
 $scope.checkfile(file);


      };


    $scope.themeSettingList = function () {
        $scope.themeSettingsList = {};
//		if (angular.isUndefined($scope.themeSettingsList.id) || $scope.themeSettingsList.id == null) {
//			var hasThemeList = appService.crudService.listAll("themesettings/listq");
//		} else {
//			var hasThemeList = appService.crudService.listAll("themesettings/listAll");
//		}
//	    hasThemeList.then(function (result) {
//	    	$scope.themeSettingsList = result;
//	    	if ($scope.themeSettingsList.customisation != null  || !angular.isUndefined($scope.themeSettingsList.customisation)) {
//	    		$scope.footerChoices = $scope.themeSettingsList.footers;
//	    		$scope.headerChoices = $scope.themeSettingsList.headers;
//	    	}
//	    });

            var hasThemeList = appService.crudService.listAll("themesettings/listAll");
            hasThemeList.then(function (result) {
                $scope.themeSettingsList = result[0];
                if (!angular.isUndefined($scope.themeSettingsList) && $scope.themeSettingsList != null) {
                    if ($scope.themeSettingsList.customisation != null  || !angular.isUndefined($scope.themeSettingsList.customisation)) {
                        $scope.footerChoices = $scope.themeSettingsList.footers;
                        $scope.headerChoices = $scope.themeSettingsList.headers;
                    }
                    if ($scope.themeSettingsList.headerTitle != null) {
                        document.getElementById("pandaAppPageTitle").innerHTML = $scope.themeSettingsList.headerTitle;                    }
                }
            });
             // Header footer
            $scope.themeSettingsList.footers = [{id: 'choice1'}];
            $scope.themeSettingsList.headers = [{id: 'choice1'}];
        $scope.addNewThemeHeaderChoice = function() {
            var newItemNo = $scope.themeSettingsList.headers.length+1;
            $scope.themeSettingsList.headers.push({'id':'choice'+ " " + newItemNo});
        };

        $scope.removeThemeHeaderChoice = function() {
            var lastItem = $scope.themeSettingsList.headers.length-1;
            $scope.themeSettingsList.headers.splice(lastItem);
        };

        $scope.addNewThemeFooterChoice = function() {
            var newItemNo = $scope.themeSettingsList.footers.length+1;
            $scope.themeSettingsList.footers.push({'id':'choice'+ " " + newItemNo});
        };

        $scope.removeThemeFooterChoice = function() {
            var lastItem = $scope.themeSettingsList.footers.length-1;
            $scope.themeSettingsList.footers.splice(lastItem);
        };


         // Header footer
                $scope.footerChoices = [{id: 'choice1'}];
                $scope.headerChoices = [{id: 'choice1'}];
            $scope.addNewHeaderChoice = function() {
                var newItemNo = $scope.headerChoices.length+1;
                $scope.headerChoices.push({'id':'choice'+ " " + newItemNo});
            };

            $scope.removeHeaderChoice = function() {
                var lastItem = $scope.headerChoices.length-1;
                $scope.headerChoices.splice(lastItem);
            };

            $scope.addNewFooterChoice = function() {
                var newItemNo = $scope.footerChoices.length+1;
                $scope.footerChoices.push({'id':'choice'+ " " + newItemNo});
            };

            $scope.removeFooterChoice = function() {
                var lastItem = $scope.footerChoices.length-1;
                $scope.footerChoices.splice(lastItem);
            };
      // Theme Settings
};

$scope.showImage = function() {
    $scope.backgroundImage =  'http://'+ $window.location.hostname +':8080/'  + 'resources/' + 'theme_background.jpg';
    $scope.logoImage =  'http://'+ $window.location.hostname +':8080/'  + 'resources/' + 'theme_logo.jpg';
    $scope.favIconImage = 'http://'+ $window.location.hostname +':8080/'  + 'resources/' + 'favicon.ico';
}
$scope.showImage();

$scope.themeSettingList();
      $scope.validateThemeSettings = function (form,themeSettingsList, headerChoices, footerChoices) {
          if ((themeSettingsList.backgroundImgFile.size >= 1048576) || (themeSettingsList.logoImgFile.size >= 1048576)) {
              $state.reload();
              return appService.notify({message: "File size should not be larger than 1 Mb", classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
          }
          if (JSON.stringify(headerChoices[0].name)) {
              themeSettingsList.headers = headerChoices;
          }
          if (JSON.stringify(footerChoices[0].name)) {
              themeSettingsList.footers = footerChoices;
          }

          if(themeSettingsList.headerTitle == null || angular.isUndefined(themeSettingsList.headerTitle)) {
              themeSettingsList.headerTitle = "";
          }
          var theme = [];
              $scope.formSubmitted = true;
              $scope.checkfile = function(themeSettingsList) {
                  if((angular.isUndefined(themeSettingsList.backgroundImgFile) || angular.isUndefined(themeSettingsList.logoImgFile) || (angular.isUndefined(themeSettingsList.favIconFile)))) {

                      if (themeSettingsList.headers != "" || themeSettingsList.footers != "") {
                          //Dynamic
                          var hasUpload = appService.uploadThemeImage.uploadTheme(themeSettingsList.backgroundImgFile,themeSettingsList.logoImgFile,themeSettingsList.favIconFile, JSON.stringify(themeSettingsList.headers),JSON.stringify(themeSettingsList.footers), themeSettingsList.welcomeContent,themeSettingsList.welcomeContentUser,themeSettingsList.splashTitle,themeSettingsList.splashTitleUser, themeSettingsList.footerContent, themeSettingsList.headerTitle, appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies,localStorageService);
                           hasUpload.then(function (result) {
                                 appService.notify({message: 'Add successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                              $window.location.reload();
                            }).catch(function (result) {
                                $scope.showLoader = false;
                                if (!angular.isUndefined(result.data)) {
                                  $state.reload();
                                    if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                                        var msg = result.data.globalError[0];
                                        $scope.showLoader = false;
                                        appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                                    } else if (result.data.fieldErrors != null) {
                                        angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                            $scope.configForm[key].$invalid = true;
                                            $scope.configForm[key].errorMessage = errorMessage;
                                        });
                                    }
                                }
                            });
                      } else {
                          //starting
                          console.log("2",themeSettingsList);
                          var hasUpload = appService.uploadThemeImage.uploadTheme(themeSettingsList.backgroundImgFile,themeSettingsList.logoImgFile,themeSettingsList.favIconFile,JSON.stringify(headerChoices),JSON.stringify(footerChoices), themeSettingsList.welcomeContent, themeSettingsList.welcomeContentUser,themeSettingsList.splashTitle,themeSettingsList.splashTitleUser, themeSettingsList.footerContent, themeSettingsList.headerTitle, appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                           hasUpload.then(function (result) {
                                 appService.notify({message: 'Add successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                              $window.location.reload();
                            }).catch(function (result) {
                                $scope.showLoader = false;
                                if (!angular.isUndefined(result.data)) {
                                  $state.reload();
                                    if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                                        var msg = result.data.globalError[0];
                                        $scope.showLoader = false;
                                        appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                                    } else if (result.data.fieldErrors != null) {
                                        angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                            $scope.configForm[key].$invalid = true;
                                            $scope.configForm[key].errorMessage = errorMessage;
                                        });
                                    }
                                }
                            });
                      }
                  }

                  else if( (!angular.isUndefined(themeSettingsList.backgroundImgFile) && (themeSettingsList.backgroundImgFile != null)) || (!angular.isUndefined(themeSettingsList.logoImgFile) && (themeSettingsList.logoImgFile != null)) || (!angular.isUndefined(themeSettingsList.favIconFile) &(themeSettingsList.favIconFile != null))) {
                        if (((themeSettingsList.backgroundImgFile.type != "image/jpeg") && (!angular.isUndefined(themeSettingsList.backgroundImgFile.type)) && (themeSettingsList.backgroundImgFile != null))
                                || ((themeSettingsList.logoImgFile.type != "image/jpeg") && (!angular.isUndefined(themeSettingsList.logoImgFile.type) && (themeSettingsList.logoImgFile != null)))) {
                        appService.notify({message: 'Please upload jpeg files ', classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        return false;
                      }
                        if((themeSettingsList.favIconFile.type != "image/vnd.microsoft.icon") && (!angular.isUndefined(themeSettingsList.favIconFile.type)) && (themeSettingsList.favIconFile != null)) {
                	  appService.notify({message: 'Please upload fav icon files ', classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                      return false;
                  		}
                      else {
                          if (((themeSettingsList.headers != "") && (!angular.isUndefined(themeSettingsList.headers)))  || ((themeSettingsList.footers != "") && (!angular.isUndefined(themeSettingsList.footers)))) {
                              //last
                        	  console.log("1",themeSettingsList);
                              var hasUpload = appService.uploadThemeImage.uploadTheme(themeSettingsList.backgroundImgFile, themeSettingsList.logoImgFile,themeSettingsList.favIconFile,JSON.stringify(themeSettingsList.headers),JSON.stringify(themeSettingsList.footers), themeSettingsList.welcomeContent,themeSettingsList.welcomeContentUser,themeSettingsList.splashTitle,themeSettingsList.splashTitleUser, themeSettingsList.footerContent, themeSettingsList.headerTitle, appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                               hasUpload.then(function (result) {
                                     appService.notify({message: 'Add successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                                  $window.location.reload();
                                }).catch(function (result) {
                                    $scope.showLoader = false;
                                    if (!angular.isUndefined(result.data)) {
                                      $state.reload();
                                        if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                                            var msg = result.data.globalError[0];
                                            $scope.showLoader = false;
                                            appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                                        } else if (result.data.fieldErrors != null) {
                                            angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                                $scope.configForm[key].$invalid = true;
                                                $scope.configForm[key].errorMessage = errorMessage;
                                            });
                                        }
                                    }
                                });
                          } else {
                              //end
                              console.log("3",themeSettingsList.favIconFile);

                              var hasUpload = appService.uploadThemeImage.uploadTheme(themeSettingsList.backgroundImgFile,themeSettingsList.logoImgFile, themeSettingsList.favIconFile, JSON.stringify(headerChoices),JSON.stringify(footerChoices), themeSettingsList.welcomeContent, themeSettingsList.welcomeContentUser,themeSettingsList.splashTitle,themeSettingsList.splashTitleUser, themeSettingsList.footerContent, themeSettingsList.headerTitle, appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                               hasUpload.then(function (result) {
                                     appService.notify({message: 'Add successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                                  $window.location.reload();
//			  	              }).catch(function (result) {
                                    $scope.showLoader = false;
                                    if (!angular.isUndefined(result.data)) {
                                      $state.reload();
                                        if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                                            var msg = result.data.globalError[0];
                                            $scope.showLoader = false;
                                            appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                                        } else if (result.data.fieldErrors != null) {
                                            angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                                $scope.configForm[key].$invalid = true;
                                                $scope.configForm[key].errorMessage = errorMessage;
                                            });
                                        }
                                    }
                                });
                          }
                            }

                          } else {
                          //last
                              if (((themeSettingsList.headers != "") && (!angular.isUndefined(themeSettingsList.headers))) || ((themeSettingsList.footers != "") && (!angular.isUndefined(themeSettingsList.footers)))) {
                              var hasUpload = appService.uploadThemeImage.uploadTheme(themeSettingsList.backgroundImgFile, themeSettingsList.logoImgFile,themeSettingsList.favIconFile,JSON.stringify(themeSettingsList.headers),JSON.stringify(themeSettingsList.footers), themeSettingsList.welcomeContent, themeSettingsList.welcomeContentUser,themeSettingsList.splashTitle,themeSettingsList.splashTitleUser, themeSettingsList.footerContent, themeSettingsList.headerTitle, appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                               hasUpload.then(function (result) {
                                     appService.notify({message: 'Add successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                                  $window.location.reload();
                                }).catch(function (result) {
                                    $scope.showLoader = false;
                                    if (!angular.isUndefined(result.data)) {
                                      $state.reload();
                                        if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                                            var msg = result.data.globalError[0];
                                            $scope.showLoader = false;
                                            appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                                        } else if (result.data.fieldErrors != null) {
                                            angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                                $scope.configForm[key].$invalid = true;
                                                $scope.configForm[key].errorMessage = errorMessage;
                                            });
                                        }
                                    }
                                });
                              } else {
                              //starting
                                  console.log("4",themeSettingsList);

                                  var hasUpload = appService.uploadThemeImage.uploadTheme(themeSettingsList.backgroundImgFile,themeSettingsList.logoImgFile, themeSettingsList.favIconFile,JSON.stringify(headerChoices),JSON.stringify(footerChoices), themeSettingsList.welcomeContent, themeSettingsList.welcomeContentUser,themeSettingsList.splashTitle,themeSettingsList.splashTitleUser, themeSettingsList.footerContent, themeSettingsList.headerTitle,  appService.promiseAjax.httpTokenRequest,appService.globalConfig, $cookies, localStorageService);
                                   hasUpload.then(function (result) {
                                         appService.notify({message: 'Add successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                                      $window.location.reload();
                                    }).catch(function (result) {
                                        $scope.showLoader = false;
                                        if (!angular.isUndefined(result.data)) {
                                          $state.reload();
                                            if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                                                var msg = result.data.globalError[0];
                                                $scope.showLoader = false;
                                                appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                                            } else if (result.data.fieldErrors != null) {
                                                angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                                                    $scope.configForm[key].$invalid = true;
                                                    $scope.configForm[key].errorMessage = errorMessage;
                                                });
                                            }
                                        }
                                    });
                              }
                          }
                      }

               $scope.checkfile(themeSettingsList);
      };

      $scope.config = {};
      $scope.configList = function (form) {
          var hasConfigList = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_GET, globalConfig.PING_APP_URL + "configuration/list");
          hasConfigList.then(function (result) {  // this is only run after $http completes0
               $scope.config.overDueDays = result[0].overDueDays;
               if (result[0].dateFormatType === "DDMMYYYY") {
                   $scope.config.dateFormatType = "DD/MM/YYYY";
               } else if (result[0].dateFormatType === "MMDDYYYY") {
                   $scope.config.dateFormatType = "MM/DD/YYYY";
               } else if (result[0].dateFormatType === "YYYYMMDD") {
                   $scope.config.dateFormatType = "YYYY/MM/DD";
               } else if (result[0].dateFormatType === "YYYYDDMM") {
                   $scope.config.dateFormatType = "YYYY/DD/MM";
               }

          });
      };
      $scope.configList();

      $scope.validateInvoice = function (form) {
          $scope.formSubmitted = true;
          if (form.$valid) {
              var config = $scope.config;
              if (config.dateFormatType === "DD/MM/YYYY") {
                     config.dateFormatType = "DDMMYYYY";
              } else if (config.dateFormatType === "MM/DD/YYYY") {
                     config.dateFormatType = "MMDDYYYY";
              } else if (config.dateFormatType === "YYYY/MM/DD") {
                     config.dateFormatType = "YYYYMMDD";
              } else if (config.dateFormatType === "YYYY/DD/MM") {
                     config.dateFormatType = "YYYYDDMM";
              }
              $scope.showLoader = true;
              var hasConfig = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_POST, globalConfig.PING_APP_URL + "configuration", config);
              hasConfig.then(function (result) {  // this is only run after $http
                  $scope.showLoader = false;
                  $scope.homerTemplate = 'app/views/notification/notify.jsp';
                  appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                  $scope.configList();

              }).catch(function (result) {
                  $scope.showLoader = false;
                  if (!angular.isUndefined(result.data)) {
                      if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                          var msg = result.data.globalError[0];
                          $scope.showLoader = false;
                          appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                      } else if (result.data.fieldErrors != null) {
                          angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                              $scope.configForm[key].$invalid = true;
                              $scope.configForm[key].errorMessage = errorMessage;
                          });
                      }
                  }
              });
          }
      };

    $scope.validatePaymentGateway = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateBilling = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };


    $scope.validateLanguage = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.formSubmitted = false;
    $scope.validateDepartment = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.validateEditTax = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.validateLogin = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.validateSignUP = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.formSubmitted = false;
    $scope.validateAdd = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.formSubmitted = false;


    $scope.validateReset = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Password changed successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.formSubmitted = false;
    $scope.validateGrant = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Permission granted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.formSubmitted = false;
    $scope.validatePredefined = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };

    $scope.openDeleteContainer = function (size) {
        modalService.trigger('app/views/configuration/chargeback/deleteTax.jsp', size);
    };

    $scope.openAddContainer = function (size) {
        modalService.trigger('app/views/configuration/general/add.jsp', size);
    };

    $scope.openResetContainer = function (size) {
        modalService.trigger('app/views/configuration/general/reset.jsp', size);
    };
    $scope.openGrantAPIContainer = function (size) {
        modalService.trigger('app/views/configuration/general/grant-api.jsp', size);
    };

    $scope.openImportContainer = function (size, name) {
        $scope.name = name;
        var modalInstance = $modal.open({
            templateUrl: VIEW_URL+  'views/configuration/cloudStack/importData.jsp',
            controller: 'importCtrl',
            size: size,
            backdrop: 'static',
            windowClass: "hmodal-info",
            resolve: {
                name: function () {
                    return $scope.name;
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };
    $scope.open = function ($event, currentDateField) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.activity[currentDateField] = true;
    };

};

function importCtrl($scope, name, notify, $modalInstance) {

    var VIEW_URL = "app/";
    $scope.name = name;
    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
    $scope.validateImport = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Imported successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            $scope.cancel();
        }
    }
};

function retailManagementCtrl($scope, globalConfig, notify) {

    var VIEW_URL = "app/";
    $scope.global = globalConfig;
    $scope.validateRetailManagementLimit = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', "timeOut": "1000", templateUrl: $scope.homerTemplate});
        } else {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Please fill all the fields', classes: 'alert-danger', "timeOut": "1000", templateUrl: $scope.homerTemplate});
        }
    };
};

function billingCtrl($scope, appService, globalConfig, localStorageService, $window, notify) {

    $scope.global = globalConfig;
    $scope.paginationObject = {};
    $scope.billableItemDiscountList = {};
    var dateTimeStamp=new Date();
    dateTimeStamp.setHours(0,0,0,0);
    $scope.today= dateTimeStamp.getTime();
    $scope.billingSettingsObj = {};
    $scope.billableList = {};

    $scope.showLoader = true;
    $scope.open = function ($event, currentDateField) {
        $event.preventDefault();
        $event.stopPropagation();
        $scope.billingSettingsObj[currentDateField] = true;
    };

    // Domain List
    var hasDomains = appService.crudService.listAll("domains/list");
    hasDomains.then(function (result) {  // this is only run after $http completes0
        $scope.domainList = result;
    });

    // Billable List
    var hasBillableList = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_GET, globalConfig.PING_APP_URL + "billableItem/list");
    hasBillableList.then(function (result) {  // this is only run after $http completes0
        $scope.billableList = result;
        $scope.billingSettingsObj.billableItems = [$scope.billableList[0], $scope.billableList[1],$scope.billableList[2],
                                                   $scope.billableList[3],$scope.billableList[4]];
    });

    Date.prototype.ddmmyyyy= function() {
       var yyyy = this.getFullYear().toString();
       var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
       var dd  = this.getDate().toString();
       return (dd[1]?dd:"0"+dd[0]) + "-"+ (mm[1]?mm:"0"+mm[0]) + "-" + yyyy; // padding
      };

    $scope.billingSettings = [];
    $scope.showLoader = false;
    $scope.billingSettingsObj.startDate = $scope.today;

    $scope.getBillingSettings = function() {
        if(angular.isUndefined($scope.billingSettingsObj.startDate)
                || $scope.billingSettingsObj.startDate == ""
                        || $scope.billingSettingsObj.domain == "" || $scope.billingSettingsObj.domain == null
                        || $scope.billingSettingsObj.discountPercentage == "" || $scope.billingSettingsObj.discountPercentage == null
                        || angular.isUndefined($scope.billingSettingsObj.billableItems) || $scope.billingSettingsObj.billableItems == null) {
            alert("Please select all the mandatory fields");
            return false;
        }
        if($scope.billingSettingsObj.discountPercentage > 100 || $scope.billingSettingsObj.discountPercentage < -100) {
            alert("Adjustment percentage must be between -100 and 100");
            return false;
        }

        $scope.showLoader = false;
        if (typeof $scope.billingSettingsObj.startDate.ddmmyyyy !== 'undefined' && $.isFunction($scope.billingSettingsObj.startDate.ddmmyyyy)) {
            $scope.billingSettingsObj.fromDate = $scope.billingSettingsObj.startDate.ddmmyyyy();
        } else {
            $scope.billingSettingsObj.startDate = new Date();
            $scope.billingSettingsObj.fromDate = $scope.billingSettingsObj.startDate.ddmmyyyy();
        }
        if (!angular.isUndefined($scope.billingSettingsObj.endDate)
                && $scope.billingSettingsObj.endDate != "") {
            $scope.billingSettingsObj.toDate = $scope.billingSettingsObj.endDate.ddmmyyyy();
        }
        $scope.billingSettingsObj.domainUuid = $scope.billingSettingsObj.domain.uuid;
        var billingSettingsTempObj = {};
        billingSettingsTempObj = angular.copy($scope.billingSettingsObj);
        $scope.paginationObject = {};
        //delete $scope.billingSettingsObj.startDate;
        //delete $scope.billingSettingsObj.endDate;
        $scope.billingSettingsObj.domain.status = "ENABLED";
        var billingSettingsObj = $scope.billingSettingsObj;
        var hasConfig = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_POST, globalConfig.PING_APP_URL + "billableItemDiscount", billingSettingsObj);
        hasConfig.then(function (result) {  // this is only run after $http
            $scope.showLoader = false;
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Adjustment added successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            $scope.billingSettingsObj = {};
            $scope.billingSettingsObj.billableItems = [$scope.billableList[0], $scope.billableList[1],$scope.billableList[2],
                                                       $scope.billableList[3],$scope.billableList[4]];
            $scope.billingSettingsObj.startDate = $scope.today;
            $scope.list(1, "all");
        }).catch(function (result) {
            $scope.billingSettingsObj.startDate = $scope.today;
            $scope.showLoader = false;
            if (!angular.isUndefined(result.data)) {
                if (result.data.globalError != '' && !angular.isUndefined(result.data.globalError)) {
                    var msg = result.data.globalError[0];
                    $scope.showLoader = false;
                    appService.notify({message: msg, classes: 'alert-danger', templateUrl: appService.globalConfig.NOTIFICATION_TEMPLATE});
                }
            }
        });
        }

        // Discount List
        $scope.list = function (pageNumber, domainUuid) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? appService.globalConfig.CONTENT_LIMIT : $scope.paginationObject.limit;
        hasServer = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "billableItemDiscount/listDiscountByDomain?domainUuid="+domainUuid+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});

        hasServer.then(function (result) {  // this is only run after $http completes0
            if (!angular.isUndefined(result._embedded)) {
                $scope.billableItemDiscountList = result['_embedded'].billableItemDiscountList;
            } else {
                $scope.billableItemDiscountList = {};
            }

            $scope.showLoader = false;
            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
        };
        $scope.list(1, "all");

        $scope.domainChange = function (domainObj) {
            if (domainObj == null) {
                $scope.list(1, "all");
            } else {
                $scope.list(1, domainObj.uuid);
            }
        }

        // Delete the template
        $scope.delete = function (size, discount) {
            appService.dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                    $scope.deleteId = discount.id;
                    $scope.ok = function (deleteId) {
                        $scope.showLoader = true;
                        hasServer = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_DELETE, appService.globalConfig.PING_APP_URL + "billableItemDiscount/"+deleteId);
                        hasServer.then(function (result) {
                            $scope.homerTemplate = 'app/views/notification/notify.jsp';
                            $scope.showLoader = false;
                            $modalInstance.close();
                            appService.notify({message: 'Adjustment deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                            $scope.list(1, "all");
                        }).catch(function (result) {
                            if (!angular.isUndefined(result.data)) {
                                if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                                      var msg = result.data.globalError[0];
                                      $scope.showLoader = false;
                                      appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                                }
                                $modalInstance.close();
                            }
                        });
                    },
                    $scope.cancel = function () {
                        $modalInstance.close();
                    };
                }]);
        };

};

function loginSecurityCtrl($scope, appService, globalConfig, localStorageService, $window, notify) {

    $scope.formElements = {};
    var hasConfigs = appService.crudService.listAll("generalconfiguration/configlist");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.generalconfiguration = result[0];
    });

    $scope.save = function (form,generalconfiguration) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.showLoader = true;
            var generalconfiguration = $scope.generalconfiguration;
            var hasServer = appService.crudService.add("generalconfiguration", generalconfiguration);
            hasServer.then(function (result) {  // this is only run after $http completes
                $scope.generalconfiguration = result;
                $scope.formSubmitted = false;
                $scope.showLoader = false;
                appService.notify({message: 'Login security updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
            }).catch(function (result) {
                   $scope.showLoader = false;
                   if (!angular.isUndefined(result.data)) {
                     if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                             var msg = result.data.globalError[0];
                             $scope.showLoader = false;
                            appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                       } else if (result.data.fieldErrors != null) {
                          $scope.showLoader = false;
                           angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                               $scope.TemplateForm[key].$invalid = true;
                               $scope.TemplateForm[key].errorMessage = errorMessage;
                           });
                       }
                   }
               });
        }
    };
};

function importCsDataCtrl($scope, appService, globalConfig, localStorageService, $window, notify) {

    $scope.paginationObject = {};
    $scope.formElements = {};

    // Manual sync type list from server
    $scope.manualCloudSync = {};
    $scope.list = function (pageNumber) {
    var hasImportList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL
            + "manualCloudSync" +"?lang=" + localStorageService.cookie.get('language') + "&sortBy=+id"
            + "&limit=" + 25, $scope.global.paginationHeaders(pageNumber, 25), {"limit" : 25});

    hasImportList.then(function (result) {
        $scope.formElements.importList = result;
    });
    };
    $scope.list(1);

    $scope.openImportContainer = function (keyName, type) {
        $scope.showLoader = true;
        var importData = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "cloudconfiguration/importData?keyName="+keyName+"&type="+type);
        importData.then(function (result) {
            $scope.list(1);
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            $scope.showLoader = false;
            if (type === 'import') {
                $scope.msg = 'Cloud stack data imported successfully';
            } else {
                $scope.msg = 'Cloud stack status checked successfully';
            }
            appService.notify({message: $scope.msg, classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }).catch(function (result) {
            if (!angular.isUndefined(result.data)) {
                if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                      var msg = result.data.globalError[0];
                      $scope.showLoader = false;
                    if (type === 'checkall') {
                      $scope.msg = 'Data dependency accoured so please use individual check option';
                  } else {
                      $scope.msg = 'Data dependency accoured so please import from top level hierarchy';
                  }
                      appService.notify({message: $scope.msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                }
            }
        });
    };
};

function usageCsDataCtrl($scope, appService, globalConfig, localStorageService, $window, notify) {

    $scope.paginationObject = {};
    $scope.formElements = {};

    // Manual sync type list from server
    $scope.list = function (pageNumber) {
        $scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? appService.globalConfig.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasDomainList = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL
                + "domain/listDomain?limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
        hasDomainList.then(function (result) {
            if (!angular.isUndefined(result._embedded)) {
                $scope.formElements.domainList = result['_embedded'].domainList;
            } else {
                $scope.formElements.domainList = {};
            }

            $scope.showLoader = false;
            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);

    $scope.updateDomainUsage = function (domain, type) {
        $scope.showLoader = true;
        var hasUsageData = {};
        if (type == 'import') {
            hasUsageData = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_POST, globalConfig.PING_APP_URL + "domain/updateDomainUsage", domain);
        } else {
            hasUsageData = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_GET, globalConfig.PING_APP_URL + "domain/updateAllDomainUsage");
        }
        hasUsageData.then(function (result) {
            $scope.list(1);
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            $scope.showLoader = false;
            $scope.msg = 'Domain usage updated successfully';
            appService.notify({message: $scope.msg, classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }).catch(function (result) {
            if (!angular.isUndefined(result.data)) {
                if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                      var msg = result.data.globalError[0];
                      $scope.showLoader = false;
                      appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                }
            }
        });
    };
};

function languageCtrl($scope, appService, globalConfig, localStorageService, $window, notify, $timeout) {

    $scope.formElements = {};
    var hasConfigs = appService.crudService.listAll("generalconfiguration/configlist");
    hasConfigs.then(function (result) {  // this is only run after $http completes0
        $scope.generalconfiguration = result[0];
    });

    $scope.save = function (form, generalconfiguration) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.showLoader = true;
            var generalconfiguration = $scope.generalconfiguration;
            var hasServer = appService.crudService.add("generalconfiguration", generalconfiguration);
            hasServer.then(function (result) {  // this is only run after $http completes
                $scope.generalconfiguration = result;
                if ($scope.generalconfiguration.defaultLanguage == 'Chinese') {
                    localStorageService.cookie.set('language', 'zh');
                } else {
                    localStorageService.cookie.set('language', 'en');
                }
                $scope.formSubmitted = false;
                $scope.showLoader = false;
                appService.notify({message: 'Default language updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                $window.location.reload();
            }).catch(function (result) {
                   $scope.showLoader = false;
                   if (!angular.isUndefined(result.data)) {
                     if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                             var msg = result.data.globalError[0];
                             $scope.showLoader = false;
                            appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                       } else if (result.data.fieldErrors != null) {
                          $scope.showLoader = false;
                           angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                               $scope.TemplateForm[key].$invalid = true;
                               $scope.TemplateForm[key].errorMessage = errorMessage;
                           });
                       }
                   }
               });
        }
    };

    $scope.formElements = {
            LanguageList: {
                "0":"English",
                "1":"Chinese"
            }
    };
};
