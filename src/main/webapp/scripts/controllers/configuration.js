/*
 * Configuration Controller for estalishing connectivity with cloud Stack
 */
angular
        .module('panda-ui-admin')
        .controller('cloudStackCtrl', cloudStackCtrl)
        .controller('configurationCtrl', configurationCtrl)
        .controller('importCtrl', importCtrl)
        .controller('retailManagementCtrl', retailManagementCtrl)

function cloudStackCtrl($scope, $state,crudService, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify) {

	var VIEW_URL = "app/";
	$scope.zoneList = {};
    $scope.configList = {};
    $scope.paginationObject = {};
    $scope.configForm = {};
    $scope.global = crudService.globalConfig;

    /**
     * Save the configuration details.
     */
    $scope.save = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var config = $scope.config;
            console.log($scope.config);
            var hasConfig = crudService.add("cloudconfiguration", config);
            hasConfig.then(function (result) {  // this is only run after $http
												// completes
                notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
            }).catch(function (result) {
                angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                    $scope.computeForm[key].$invalid = true;
                    $scope.computeForm[key].errorMessage = errorMessage;
                });
            });
        }
    }

    // Zone List
    $scope.list = function (pageNumber) {
       var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
       var hasZones = crudService.list("zones", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
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


function configurationCtrl($scope, $window, $modal, $log, $state,crudService, $stateParams, promiseAjax, notify, localStorageService, modalService) {

	$scope.adminUserList = {};
    $scope.paginationObject = {};
    $scope.configForm = {};
    $scope.domainList = {};
    $scope.global = crudService.globalConfig;

    // Admin User List
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasUsers = promiseAjax.httpTokenRequest( crudService.globalConfig.HTTP_GET, crudService.globalConfig.APP_URL + "users/listbydomainandrole");
    hasUsers.then(function (result) {  // this is only run after $http completes0
    	$scope.adminUserList = result;
    });

	    // Compute Offer List
	    $scope.list = function (pageNumber) {
	        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
	        var hasDomains = crudService.list("domains", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
	        hasDomains.then(function (result) {  // this is only run after $http
													// completes0

	        	$scope.domainList = result;
	            $scope.stateid =$stateParams.id;
	            $scope.type = $stateParams.quotaType;
console.log($scope.type);
	            // For pagination
	            $scope.paginationObject.limit = limit;
	            $scope.paginationObject.currentPage = pageNumber;
	            $scope.paginationObject.totalItems = result.totalItems;

	            console.log($scope.domain );


	        });

	    };
	    $scope.list(1);


/*		angular.forEach($scope.domainList, function(obj, key) {
    		if(obj.id == $scope.domain.id) {
    			$scope.domain = obj;
    			console.log($scope.domain );
    		}
    	});
*/





//	var VIEW_URL = "app/";
//	var hasServer = promiseAjax.httpRequest("GET", "api/resource-allocation.json");
//    hasServer.then(function (result) {  // this is only run after $http completes
//        $scope.config = result;
//
//    });
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




    localStorageService.set("billingList", null);
    if (localStorageService.get("billingList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/billing.json");
        hasServer.then(function (result) {  // this is only run after $http
											// completes
            $scope.billingList = result;
            localStorageService.set("billingList", result);
        });
    } else {
        $scope.billingList = localStorageService.get("billingList");
    }
    if ($state.current.data.pageTitle == 'ConfigCategory' || $state.current.data.pageTitle == 'General' || $state.current.data.pageTitle == 'Chargeback'
            || $state.current.data.pageTitle == 'Cloudstack') {
        $state.current.data.pageTitle = $stateParams.category.substring(0, 1).toUpperCase() + $stateParams.category.substring(1).toLowerCase();
    }

    if ($state.$current.parent.data.pageTitle == 'ConfigCategory') {
        $state.$current.parent.data.pageTitle = $stateParams.category.substring(0, 1).toUpperCase() + $stateParams.category.substring(1).toLowerCase();
    }

    localStorageService.set("taxList", null);
    if (localStorageService.get("taxList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/tax.json");
        hasServer.then(function (result) {  // this is only run after $http
											// completes
            $scope.taxList = result;
            localStorageService.set("taxList", result);
        });
    } else {
        $scope.taxList = localStorageService.get("taxList");
    }

        var hasServer = promiseAjax.httpRequest("GET", "api/paymentGateway.json");
        hasServer.then(function (result) {  // this is only run after $http
											// completes
            $scope.paymentGateList = result;
            localStorageService.set("paymentGateList", result);
        });


    localStorageService.set("promotionList", null);
    if (localStorageService.get("promotionList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/promotion.json");
        hasServer.then(function (result) {  // this is only run after $http
											// completes
            $scope.promotionList = result;
            localStorageService.set("promotionList", result);
        });
    } else {
        $scope.promotionList = localStorageService.get("promotionList");
    }

    localStorageService.set("discountList", null);
    if (localStorageService.get("discountList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/discount.json");
        hasServer.then(function (result) {  // this is only run after $http
											// completes
            $scope.discountList = result;
            localStorageService.set("discountList", result);
        });
    } else {
        $scope.discountList = localStorageService.get("discountList");
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
            {id: 1, name: 'Chinese'},
            {id: 2, name: 'English'}

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
        dateFormatList: [
            {id: 1, name: 'DD/MM/YYYY'},
            {id: 2, name: 'MM/DD/YYYY'},
            {id: 3, name: 'YYYY/MM/DD'},
            {id: 3, name: 'YYYY/DD/MM'}
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
        ]


    };


    $scope.validateDomain = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateDeleteTax = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validatePromotion = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateInvoice = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validatePaymentGateway = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateBilling = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };


    $scope.validateLanguage = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.formSubmitted = false;


    $scope.validateDepartment = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateEditTax = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Saved successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateLogin = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.validateSignUP = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        }
    };
    $scope.formSubmitted = false;


    $scope.validateAdd = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            // $window.location.href='#/configuration/chargeback/tax';
        }
    };

    $scope.formSubmitted = false;


    $scope.validateReset = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Password changed successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

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

}
;

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

}
;

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
}
;



