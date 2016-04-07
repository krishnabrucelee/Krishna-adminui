/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('cloudStackCtrl', cloudStackCtrl)
        .controller('configurationCtrl', configurationCtrl)
        .controller('importCtrl', importCtrl)
        .controller('retailManagementCtrl', retailManagementCtrl)

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

function configurationCtrl($scope, $http, $window, $modal, $log, $state, $stateParams, appService,globalConfig) {

	//$scope.adminUserList = {};
    $scope.paginationObject = {};
    $scope.configForm = {};
    $scope.domainList = {};
    $scope.eventsList = {};
    $scope.hasConfigList = {};
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

console.log("events",$scope.eventsTemplateList[0]);

if( angular.isUndefined(file) && angular.isUndefined($scope.eventsTemplateList[0]))
{

   appService.notify({message: 'No file selected', classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
}




$scope.checkfile = function(file) {

console.log(file);

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
console.log("fileslisr",arrayTest);
 		       appService.uploadFile.upload(arrayTest,emails,appService.promiseAjax.httpTokenRequest,appService.globalConfig);
	                appService.notify({message: 'Added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        $state.reload();
          }
}

else if( !angular.isUndefined(file)) 
{
      if ((file.type != "text/html") ||  (!angular.isUndefined(file) && (file.type != "text/html"))) {
      appService.notify({message: 'Invalid file selected, valid files are HTML files ', classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
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
 		       appService.uploadFile.upload(arrayTest,emails,appService.promiseAjax.httpTokenRequest,appService.globalConfig);
	                appService.notify({message: 'Added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        $state.reload();
          }

}
}

}
 $scope.checkfile(file);
	

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



