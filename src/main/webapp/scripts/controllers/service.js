/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular
        .module('panda-ui-admin')
        .controller('computeListCtrl', computeListCtrl)
        .controller('deleteCtrl', deleteCtrl)
        .controller('miscellaneousListCtrl', miscellaneousListCtrl)
        .controller('networkListCtrl', networkListCtrl)
        .controller('networkDetailsCtrl', networkDetailsCtrl)
        .controller('storageListCtrl', storageListCtrl)
        .controller('storageEditCtrl', storageEditCtrl)
        .controller('templateListCtrl', templateListCtrl)
        .controller('templateEditCtrl', templateEditCtrl)

function templateListCtrl($scope, $state, $stateParams, $log, $window, appService) {

    $scope.templateList = {};
//    $scope.isoList = {};
    $scope.paginationObject = {};
    $scope.templateForm = {};
    $scope.global = appService.globalConfig;
    $scope.test = "test";
    $scope.summernoteTextTwo = {}
    $scope.windowsTemplate = {};
    $scope.LinuxTemplate = {};
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;

    $scope.summernoteOpt = {
        toolbar: [
            ['headline', ['style']],
            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
            ['textsize', ['fontsize']],
            ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
        ],
        disableResizeEditor: true,
    };

    //Template list
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;

        var hasTemplates = appService.crudService.listAll("templates/category?type=template");
        hasTemplates.then(function (result) {  // this is only run after $http completes0

            $scope.templateList = result;

            $scope.windowsTemplate.Count = 0;
            for (i = 0; i < result.length; i++) {
            	if($scope.templateList[i].osType.description.indexOf("Windows") > -1) {
            		$scope.windowsTemplate.Count++;
            	}
            }
            $scope.LinuxTemplate.Count = 0;
            if(result.length != 0) {
            	$scope.LinuxTemplate.Count = result.length;
            }

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

    //Isolist
    $scope.isoList = function (pageNumber) {
    	$scope.showLoader = true;
        var hasIso = appService.crudService.listAll("templates/category?type=iso");
        hasIso.then(function (result) {  // this is only run after $http completes0

            $scope.isoList = result;

            $scope.windowsTemplate.Count = 0;
            for (i = 0; i < result.length; i++) {
            	if($scope.isoList[i].osType.description.indexOf("Windows") > -1) {
            		$scope.windowsTemplate.Count++;
            	}
            }
            $scope.LinuxTemplate.Count = 0;
            if(result.length != 0) {
            	$scope.LinuxTemplate.Count = result.length;
            }

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.isoList(1);

     // OS Categorys list from server
    $scope.oscategorys = {};
    var hasOsCategoryList = appService.crudService.listAll("oscategorys/list");
    hasOsCategoryList.then(function (result) {
    	$scope.formElements.osCategoryList = result;
    });

    // OS Type list from server
    $scope.categoryChange = function() {
        $scope.ostypes = {};
        var hasosTypeList = appService.crudService.filterList("ostypes/list", $scope.template.osCategory.name);
        hasosTypeList.then(function (result) {
    	    $scope.formElements.osTypeList = result;
        });
    };

    // Zone list from server
    $scope.zones = {};
    var haszoneList = appService.crudService.listAll("zones/list");
    haszoneList.then(function (result) {
    	$scope.formElements.zoneList = result;
    });

    // Hypervisors list from server
    $scope.hypervisors = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hashypervisorList = appService.crudService.list("hypervisors", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hashypervisorList.then(function (result) {
    	$scope.formElements.hypervisorList = result;
    });

    // Open dialogue box to create templates
    $scope.template = {
    		templateCost: []
    };

    $scope.save = function (form) {

        $scope.formSubmitted = true;
        if (form.$valid) {
        	$scope.showLoader = true;
            var template = angular.copy($scope.template);
            template.zoneId = template.zone.id;
            template.hypervisorId = template.hypervisor.id;
            template.osCategoryId = template.osCategory.id;
            template.osTypeId = template.osType.id;
            delete template.zone;
            delete template.hypervisor;
            delete template.osCategory;
            delete template.osType;
            var hasTemplate = appService.crudService.add("templates", template);
            hasTemplate.then(function (result) {  // this is only run after $http completes
                $scope.showLoader = false;
                appService.notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                if(template.format == "8") {
                	$window.location.href = '#/templatestore/apptemplatelist';
                } else {
                	$window.location.href = '#/templatestore/list';
                }

            }).catch(function (result) {
                if (!angular.isUndefined(result.data)) {
                	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                  	    var msg = result.data.globalError[0];
                  	  $scope.showLoader = false;
                  	appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                    } else if (result.data.fieldErrors != null) {
                        angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                            $scope.TemplateForm[key].$invalid = true;
                            $scope.TemplateForm[key].errorMessage = errorMessage;
                        });
                	}
                }
            });
        }
    };

    // Delete the template
    $scope.delete = function (size, template) {
    	appService.dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = template.id;
                $scope.ok = function (deleteId) {
                	$scope.showLoader = true;
                    var hasStorage = appService.crudService.delete("templates", deleteId);
                    hasStorage.then(function (result) {
                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
                        $scope.showLoader = false;
                        appService.notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                        if(template.format == "ISO") {
                        	$window.location.href = '#/templatestore/apptemplatelist';
                        } else {
                        	$scope.list(1);
                        }
                    }).catch(function (result) {
                        if (!angular.isUndefined(result.data)) {
                        	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                          	    var msg = result.data.globalError[0];
                          	  $scope.showLoader = false;
                          	appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                            }
                        }
                    });
                    $modalInstance.close();
                },
                $scope.cancel = function () {
                    $modalInstance.close();
                };
            }]);
    };

    $scope.update = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            if(template.flag == 'true') {
            	$window.location.href = '#/templatestore/apptemplatelist';
            } else {
            	$window.location.href = '#/templatestore/list';
            }
        }
    };

    $scope.formElements = {
          rootDiskControllerList: {
              "0":"SCSI",
              "1":"IDE"
          },
          nicTypeList: {
        	  "0":"E1000",
        	  "1":"PCNET32",
        	  "2":"VMXNET2",
        	  "3":"VMXNET3"
          },
          keyboardTypeList: {
        	  "0":"US_KEYBOARD",
        	  "1":"UK_KEYBOARD",
        	  "2":"JAPANESE_KEYBOARD",
        	  "3":"SIMPLIFIED_CHINESE"
          },
          formatList: {
                       "Hyperv" : {
			        	  "0":"VHD",
			        	  "1":"VHDX",
			           },
			           "VMware" :
			           {
			        	  "0":"OVA",
			           },
			           "KVM" :
			           {
			        	  "0":"QCOW2",
			        	  "1":"RAW",
			        	  "2":"VHD",
			        	  "3":"VMDK",
			           },
			           "XenServer" :
			           {
			        	  "0":"VHD",
			           },
			           "BareMetal" :
			           {
			        	  "0":"BAREMETAL",
			           },
			           "LXC" :
			           {
			        	  "0":"TAR",
			           },
			           "Ovm" :
			           {
			        	  "0":"RAW",
			          }
		          }
    }
}

function templateEditCtrl($scope, $state, $stateParams, $log, $window, appService) {

	$scope.templateForm = {};

	$scope.formElements = {
	        rootDiskControllerList: {
	          "0":"SCSI",
	          "1":"IDE"
	        },
	        nicTypeList: {
	      	  "0":"E1000",
	      	  "1":"PCNET32",
	      	  "2":"VMXNET2",
	      	  "3":"VMXNET3"
	        },
	        keyboardTypeList: {
	      	  "0":"US_KEYBOARD",
	      	  "1":"UK_KEYBOARD",
	      	  "2":"JAPANESE_KEYBOARD",
	      	  "3":"SIMPLIFIED_CHINESE"
	        }
	    }

	$scope.edit = function (templateId) {
        var hasTemplates = appService.crudService.read("templates", templateId);
        hasTemplates.then(function (result) {
            $scope.template = result;
        	$scope.getOsCategoryList();
        });
    };

    if (!angular.isUndefined($stateParams.id) && $stateParams.id != '') {
        $scope.edit($stateParams.id)
    }

    // OS Categorys list from server
    $scope.oscategorys = {};
    $scope.getOsCategoryList = function() {
	    var hasOsCategoryList = appService.crudService.listAll("oscategorys/list");
	    hasOsCategoryList.then(function (result) {
	    	$scope.formElements.osCategoryList = result;
	    	angular.forEach($scope.formElements.osCategoryList, function(obj, key) {
	    		if(obj.id == $scope.template.osCategory.id) {
	    			$scope.template.osCategory = obj;
	    		}
	    	});
	    });
    }

    $scope.template = {
    		templateCost: []
    };

    // Edit the Template
    $scope.update = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
        	$scope.showLoader = true;
            var template = angular.copy($scope.template);
            template.zoneId = template.zone.id;
            template.hypervisorId = template.hypervisor.id;
            template.osCategoryId = template.osCategory.id;
            template.osTypeId = template.osType.id;

            delete template.zone;
            delete template.hypervisor;
            delete template.osCategory;
            delete template.osType;
            var hasTemplates = appService.crudService.update("templates", template);
            hasTemplates.then(function (result) {
                $scope.homerTemplate = 'app/views/notification/notify.jsp';
                $scope.showLoader = false;
                appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                if(template.format == "ISO") {
                	$window.location.href = '#/templatestore/apptemplatelist';
                } else {
                	$window.location.href = '#/templatestore/list';
                }
            }).catch(function (result) {
                if (!angular.isUndefined(result.data)) {
                	if (result.data.fieldErrors != null) {
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


function storageListCtrl($scope, $log, $state, $stateParams, $window, appService) {



    $scope.storageList = {};
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;



    $scope.storage = {
    		zoneList: {},
            domainList:{},
            zone: {}
            	};
    $scope.paginationObject = {};
    $scope.storageForm = {};
    $scope.global = appService.globalConfig;

    $scope.storage.zoneList = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasZones = appService.crudService.list("zones", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hasZones.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.zoneList = result;
    	$scope.storage.zone = $scope.zoneList[0];
    });

    $scope.storage.domainList = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasDomains = appService.crudService.list("domains", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hasDomains.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.formElements.domainList = result;
    });

        // Network Offer List
        $scope.listNetworkOffer = function (pageNumber) {
            var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
            var hasNetworks = appService.crudService.list("networkoffer", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            hasNetworks.then(function (result) {  // this is only run after
													// $http
    												// completes0

            	$scope.instance.network.networkOfferList = result;

                // For pagination
                $scope.paginationObject.limit = limit;
                $scope.paginationObject.currentPage = pageNumber;
                $scope.paginationObject.totalItems = result.totalItems;
            });
        };
    // Storage Offer List
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasStorage = appService.crudService.list("storages", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasStorage.then(function (result) {  // this is only run after $http
												// completes0

            $scope.storageList = result;

            $scope.storageList.Count = 0;
            if(result.length != 0) {
            	$scope.storageList.Count = result.length;
            }

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);



    // Open dialogue box to create Storage Offer



    $scope.costPerHourGB = function() {

        var regexp = /^[0-9]+([,.][0-9]+)?$/g;
        $scope.costPerHourGBError = false;
        if(!regexp.test($scope.storage.storagePrice[0].costGbPerMonth)) {
        	$scope.costPerHourGBError = true;

            $scope.storage.storagePrice[0].costGbPerMonth = "";
            $scope.storage.costPerHourGB = "";
            return false;
        }


        var cost = parseFloat($scope.storage.storagePrice[0].costGbPerMonth);

        var costValue = cost / 720;

        $scope.storage.costPerHourGB = costValue.toFixed(4);
    };


$scope.costPerHourIOPS = function() {

        var regexp = /^[0-9]+([,.][0-9]+)?$/g;

        $scope.costPerHourIOPSError = false;
        if(!regexp.test($scope.storage.storagePrice[0].costIopsPerMonth)) {
            $scope.costPerHourIOPSError = true;

            $scope.storage.storagePrice[0].costIopsPerMonth = "";
            $scope.storage.costPerHourIOPS = "";
            return false;
        }


        var cost = parseFloat($scope.storage.storagePrice[0].costIopsPerMonth);

        var costValue = cost / 720;

        $scope.storage.costPerHourIOPS = costValue.toFixed(4);
    };

    $scope.storage = {
    		storagePrice: []
    };

    $scope.save = function (form) {
        $scope.formSubmitted = true;

        if (form.$valid) {
        	$scope.showLoader = true;
            var storage = angular.copy($scope.storage);
//            storage.storagePrice = [];
//            storage.storagePrice[0] = $scope.storage.storagePrice;
            var hasStorage = appService.crudService.add("storages", storage);
            hasStorage.then(function (result) {  // this is only run after
													// $http completes
                $scope.list(1);
                $scope.showLoader = false;
                appService.notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
// $window.location.href = '#/templatestore/list';

                $window.location.href = '#/storage/list';

            }).catch(function (result) {

            	if (!angular.isUndefined(result.data)) {
                	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                  	    var msg = result.data.globalError[0];
                  	  $scope.showLoader = false;
                  	appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                    } else if (result.data.fieldErrors != null) {
                        angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                            $scope.storageForm[key].$invalid = true;
                            $scope.storageForm[key].errorMessage = errorMessage;
                        });
                	}
                }
            });
        }
    };

    // Delete the Storage Offer
    $scope.delete = function (size, storageId) {
    	appService.dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = storageId;
                $scope.ok = function (storageId) {
                	$scope.showLoader = true;
                    var hasStorage = appService.crudService.delete("storages", storageId);
                    hasStorage.then(function (result) {
                        $scope.list(1);
                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
                        $scope.showLoader = false;
                        appService.notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                    });
                    $modalInstance.close();
                },
                        $scope.cancel = function () {
                            $modalInstance.close();
                        };
            }]);
    };


    $scope.domain = {
        domaintypeList: [
            {id: 1, name: 'ROOT'},
        ]
    };
    $scope.storageType = {
        storagetypeList: {
                 "0": "shared",
                 "1": "local"
        }
    };

  /*
	 * $scope.zone = { zoneList: [ {id: 1, name: 'Beijing'}, {id: 2, name:
	 * 'Liaoning'}, {id: 3, name: 'Shanghai'}, {id: 4, name: 'Henan'} ] };
	 */
    $scope.formElements = {
        qosList: {
                  "0": "Hypervisor",
                  "1": "Storage"
        }
    };


}

function storageEditCtrl($scope, $state, $stateParams, $log, $window, appService) {

    $scope.storage = {
    		zoneList: {},
            domainList:{}
            	};
    $scope.paginationObject = {};
    $scope.storageForm = {};
    $scope.global = appService.globalConfig;

    $scope.storage.zoneList = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasZones = appService.crudService.list("zones", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hasZones.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.zoneList = result;
    });


	$scope.edit = function (storageId) {
        var hasStorage = appService.crudService.read("storages", storageId);
        hasStorage.then(function (result) {
            $scope.storage = result;
        });

    };


    if (!angular.isUndefined($stateParams.id) && $stateParams.id != '') {
        $scope.edit($stateParams.id)
    }

    // Open dialogue box to create Storage Offer



    $scope.costPerHourGB = function() {

        var regexp = /^[0-9]+([,.][0-9]+)?$/g;
        $scope.costPerHourGBError = false;
        if(!regexp.test($scope.storage.storagePrice[0].costGbPerMonth)) {
        	$scope.costPerHourGBError = true;

            $scope.storage.storagePrice[0].costGbPerMonth = "";
            $scope.storage.costPerHourGB = "";
            return false;
        }


        var cost = parseFloat($scope.storage.storagePrice[0].costGbPerMonth);

        var costValue = cost / 720;

        $scope.storage.costPerHourGB = costValue.toFixed(4);
    };


$scope.costPerHourIOPS = function() {

        var regexp = /^[0-9]+([,.][0-9]+)?$/g;

        $scope.costPerHourIOPSError = false;
        if(!regexp.test($scope.storage.storagePrice[0].costIopsPerMonth)) {
            $scope.costPerHourIOPSError = true;

            $scope.storage.storagePrice[0].costIopsPerMonth = "";
            $scope.storage.costPerHourIOPS = "";
            return false;
        }


        var cost = parseFloat($scope.storage.storagePrice[0].costIopsPerMonth);

        var costValue = cost / 720;

        $scope.storage.costPerHourIOPS = costValue.toFixed(4);
    };



    $scope.storage = {
    		storagePrice: []
    };
    // Edit the Compute Offer
    $scope.update = function (form) {
        // Update Compute Offer
        $scope.formSubmitted = true;
        if (form.$valid) {
        	$scope.showLoader = true;
            var storage = $scope.storage;
            var hasStorage = appService.crudService.update("storages", storage);
            hasStorage.then(function (result) {

                $scope.homerTemplate = 'app/views/notification/notify.jsp';
                $scope.showLoader = false;
                appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                $window.location.href = '#/storage/list';
            });
        }
    };


}
;

function networkListCtrl($scope, $modal, modalService, $log, promiseAjax,appService, globalConfig, localStorageService, $window,crudService, notify) {

	$scope.networkList = {};
    $scope.paginationObject = {};
    $scope.networkForm = {};
    $scope.global = crudService.globalConfig;
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;
    // Network Offer List
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasNetworks = crudService.list("networkoffer", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasNetworks.then(function (result) {  // this is only run after $http completes0

											// completes
            $scope.networkList = result;

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);


//    localStorageService.set("networkList", null);
//    if (localStorageService.get("networkList") == null) {
//        var hasServer = promiseAjax.httpRequest("GET", "api/catalog-template.json");
//        hasServer.then(function (result) {  // this is only run after $http completes
//            $scope.networkList = result;
//            localStorageService.set("networkList", result);
//        });
//    } else {
//        $scope.networkList = localStorageService.get("networkList");
//    }


    $scope.showDescription = function (network) {
        // modalService.trigger('app/views/servicecatalog/viewnetwork.jsp', 'md',
		// 'View Network Offering');
        var modalInstance = $modal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'app/views/servicecatalog/viewnetwork.jsp',
            controller: 'networkDetailsCtrl',
            size: 'md',
            backdrop: 'static',
            windowClass: "hmodal-info",
            resolve: {
                network: function () {
                    return angular.copy(network);
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;

        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };



}


function networkDetailsCtrl($scope, network, $modalInstance) {
    $scope.network = network;
    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
}
;

function miscellaneousListCtrl($scope, modalService, $log, promiseAjax, $stateParams, globalConfig, localStorageService, $window, notify) {
    var hasServer = promiseAjax.httpRequest("GET", "api/catalog-miscellaneous.json");
    hasServer.then(function (result) {  // this is only run after $http
										// completes
        $scope.miscellaneousList = result;
        if (!angular.isUndefined($stateParams.id)) {
            var miscellaneousId = $stateParams.id - 1;
            $scope.miscellaneous = result[miscellaneousId];
        }
    });

    $scope.delete = function () {
        modalService.trigger('app/views/servicecatalog/confirm-delete.jsp', 'md', 'Delete Confirmation');
    };

    $scope.save = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});


        }
    };

//    $scope.networkType = {
//            networktypeList: {
//                     "0": "shared",
//                     "1": "isolated"
//            }
//        };

    $scope.qos = {
        qosList: [
            {id: 1, name: 'Hypervisor'},
            {id: 2, name: 'Storage'},
        ]
    };

    $scope.zone = {
        zoneList: [
            {id: 1, name: 'Beijing'},
            {id: 2, name: 'Liaoning'},
            {id: 3, name: 'Shanghai'},
            {id: 4, name: 'Henan'}
        ]
    };

}

function deleteCtrl($scope, $state, $stateParams, globalConfig, notify) {
    $scope.global = globalConfig;
    $scope.activity = {};
    $scope.delete = function () {
        $scope.homerTemplate = 'app/views/notification/notify.jsp';
        notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        $scope.cancel();
    };

    $scope.remove = function ()
    {
        if ($scope.activity.type == null && $scope.activity.startDate == null && $scope.activity.endDate == null) {
            alert("Please enter any Field ");
        } else {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            $scope.cancel();
        }
    }


    $scope.open = function ($event, currentDateField) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.activity[currentDateField] = true;
    };


}

function computeListCtrl($scope, $state, $stateParams,appService,$window) {

    $scope.computeList = {};
    $scope.paginationObject = {};
    $scope.computeForm = {};
    $scope.computeOffering = {};
    $scope.global = appService.crudService.globalConfig;
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;

    $scope.compute = {
    		zone: {}
     };


    // Compute Offer List
    $scope.list = function (pageNumber) {
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasComputes = appService.crudService.list("computes", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasComputes.then(function (result) {  // this is only run after $http
												// completes0

            $scope.computeList = result;

            $scope.computeOffering.Count = 0;
            if(result.length != 0) {
            	$scope.computeOffering.Count = result.length;
            }

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

    // Open dialogue box to create Compute Offer

    $scope.compute = {
    		computeCost: []
    };

    $scope.save = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
        	$scope.showLoader = true;
            var compute = angular.copy($scope.compute);
            if(!angular.isUndefined(compute.domain)) {
            	compute.domainId = compute.domain.id;
		delete compute.domain;
            }
            if(!angular.isUndefined(compute.computeCost.zone)) {
            	compute.computeCost.zoneId = compute.computeCost.zone.id;
            	delete compute.computeCost.zone;
            }
            compute.customized = (compute.customized == null) ? false : true;
            compute.customizedIops = (compute.customizedIops == null) ? false : true;
            compute.isHighAvailabilityEnabled = (compute.isHighAvailabilityEnabled == null) ? false : true;
            var hasComputes = appService.crudService.add("computes", compute);
            hasComputes.then(function (result) {  // this is only run after
													// $http completes
                $scope.list(1);
                $scope.showLoader = false;
                appService.notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});

                $window.location.href = '#/compute/list';

            }).catch(function (result) {

            	 if(!angular.isUndefined(result) && result.data != null) {
             		if(result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])){
                        	 var msg = result.data.globalError[0];
                        	 $scope.showLoader = false;
                        	 appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                     }
                     angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                    	 $scope.showLoader = false;
                    	$scope.computeForm[key].$invalid = true;
                     	$scope.computeForm[key].errorMessage = errorMessage;
                     });
             	}

          /*      if (!angular.isUndefined(result.data)) {
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.computeForm[key].$invalid = true;
                        $scope.computeForm[key].errorMessage = errorMessage;
                    });
                }*/
            });
        }
    };

    // Delete the Compute Offer
    $scope.delete = function (size, compute) {
        appService.dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = compute.id;
                $scope.ok = function (computeId) {
                	$scope.showLoader = true;
                    var hasComputes = appService.crudService.softDelete("computes", compute);
                    hasComputes.then(function (result) {
                        $scope.list(1);
                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
                        $scope.showLoader = false;
                        appService.notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                    }).catch(function (result) {
                    	if(!angular.isUndefined(result) && result.data != null) {
                    		if(result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])){
                        	 var msg = result.data.globalError[0];
                        	 $scope.showLoader = false;
                        	 appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                    		}
                    		angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                    			$scope.showLoader = false;
                    			$scope.computeForm[key].$invalid = true;
                    			$scope.computeForm[key].errorMessage = errorMessage;
                    		});
                    	}
                    });
                    	$modalInstance.close();
                	},
                	$scope.cancel = function () {
                		$modalInstance.close();
                	};
        }]);
    };

    $scope.formElements = {
    		storageTypeList :{
    			"0" : "shared",
    			"1"	: "local"
    		},
            qosList: {
            	"0" : "HYPERVISOR",
    			"1"	: "STORAGE"
            },
            diskioList:
            {
        		"0" :"AVERAGE",
            	"1" : "GOOD",
            	"2" : "EXCELLENT"
           }
        };
    $scope.domain = {
    };

    // Domain List
	var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
	var hasDomains = appService.crudService.list("domains", $scope.global.paginationHeaders(1, limit), {"limit": limit});
	hasDomains.then(function (result) {  // this is only run after $http completes0
		$scope.domain.domaintypeList = result;
	});

    $scope.storagetype = {
            storagetypeList: {
                     "0": "shared",
                     "1": "local"
            }
        };

    // Domain List
	var hasZones = appService.crudService.list("zones/list", '', {});
	hasZones.then(function (result) {  // this is only run after $http completes0
		$scope.formElements.zoneList = result;
		$scope.compute.computeCost.zone = $scope.formElements.zoneList[0];
	});

    $scope.diskio = {
        diskioList:
            {
        		"0" :"AVERAGE",
            	"1" : "GOOD",
            	"2" : "EXCELLENT"
           }

    };

    // Edit compute offerings
    $scope.edit = function (computeId) {
        var hasComputes = appService.crudService.read("computes", computeId);
        hasComputes.then(function (result) {
            $scope.compute = result;
    		$scope.compute.zone = $scope.formElements.zoneList[0];
        });
    };



    if (!angular.isUndefined($stateParams.id) && $stateParams.id != '') {
        $scope.edit($stateParams.id);
    }

    // Update the Compute Offer
    $scope.update = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
        	$scope.showLoader = true;
            var compute = $scope.compute;

            var hasComputes = appService.crudService.update("computes", compute);
            hasComputes.then(function (result) {

                $scope.homerTemplate = 'app/views/notification/notify.jsp';
                $scope.showLoader = false;
                appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                $window.location.href = '#/compute/list';
            }).catch(function (result) {

            	 if(!angular.isUndefined(result) && result.data != null) {
             		if(result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])){
                        	 var msg = result.data.globalError[0];
                        	 $scope.showLoader = false;
                        	 appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                     }
                     angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
			$scope.showLoader = false;
                    	$scope.computeForm[key].$invalid = true;
                     	$scope.computeForm[key].errorMessage = errorMessage;
                     });
             	}

          /*      if (!angular.isUndefined(result.data)) {
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.computeForm[key].$invalid = true;
                        $scope.computeForm[key].errorMessage = errorMessage;
                    });
                }*/
            });
        }
    };
}

