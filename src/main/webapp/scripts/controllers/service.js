/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular
        .module('panda-ui-admin')
        .controller('computeListCtrl', computeListCtrl)
        .controller('computeEditCtrl', computeEditCtrl)
        .controller('deleteCtrl', deleteCtrl)
        .controller('miscellaneousListCtrl', miscellaneousListCtrl)
        .controller('networkListCtrl', networkListCtrl)
        .controller('networkDetailsCtrl', networkDetailsCtrl)
        .controller('storageListCtrl', storageListCtrl)
        .controller('storageEditCtrl', storageEditCtrl)
        .controller('templateListCtrl', templateListCtrl)

function templateListCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify) {


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
    var hasServer = promiseAjax.httpRequest("GET", "api/catalog-template.json");
    hasServer.then(function (result) {  // this is only run after $http
										// completes
        $scope.templateList = result;
        if (!angular.isUndefined($stateParams.id)) {
            var templateId = $stateParams.id - 1;
            $scope.template = result[templateId];
            // $state.current.data.pageTitle = result[templateId].name;

        }
    });


    $scope.delete = function () {
        modalService.trigger('views/servicecatalog/confirm-delete.jsp', 'md', 'Delete Confirmation');
    };

    $scope.save = function (form) {

        $scope.formSubmitted = true;

        if (form.$valid) {
            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

            $window.location.href = '#/templatestore/list';
        }
    };
    $scope.update = function (form) {

        $scope.formSubmitted = true;

        if (form.$valid) {
            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

            $window.location.href = '#/templatestore/list';
        }
    };

    $scope.formElements = {
        hypervisorList: [
            {
                id: 1,
                name: 'Hyperv',
                formatList: [
                    {id: 1, name: 'VHD'},
                    {id: 2, name: 'VHDX'},
                ]
            },
            {
                id: 2,
                name: 'KVM',
                formatList: [
                    {id: 1, name: 'QCOW2'},
                    {id: 2, name: 'RAW'},
                    {id: 3, name: 'VHD'},
                    {id: 4, name: 'VHDX'},
                ]
            },
            {
                id: 3,
                name: 'XenServer',
                formatList: [
                    {id: 1, name: 'VHD'},
                ]
            },
            {
                id: 4,
                name: 'VMware',
                formatList: [
                    {id: 1, name: 'OVA'},
                ],
                rootDiskControllerList: [
                    {id: 1, name: 'SCSI'},
                    {id: 2, name: 'IDE'},
                ],
                nicTypeList: [
                    {id: 1, name: 'E1000'},
                    {id: 2, name: 'PCNET32'},
                    {id: 3, name: 'VMXNET2'},
                    {id: 4, name: 'VMXNET3'},
                ],
                keyboardTypeList: [
                    {id: 1, name: 'US Keyboard'},
                    {id: 2, name: 'UK Keyboard'},
                    {id: 3, name: 'Japanese Keyboard'},
                    {id: 4, name: 'Simplified Chinese'},
                ],
            },
            {
                id: 5,
                name: 'BareMetal',
                formatList: [
                    {id: 1, name: 'BareMetal'},
                ]
            },
            {
                id: 6,
                name: 'Ovm',
                formatList: [
                    {id: 1, name: 'RAW'},
                ]
            },
            {
                id: 7,
                name: 'LXC',
                formatList: [
                    {id: 1, name: 'TAR'},
                ]
            },
        ],
        osCategoryList: [
            {
                id: 1,
                name: "MacOS",
                osTypeList: [
                    {id: 1, name: 'Apple Mac OS X 10.6 (32-bit)'},
                    {id: 2, name: 'Apple Mac OS X 10.6 (64-bit)'}
                ]
            },
            {
                id: 2,
                name: "Linux",
                osTypeList: [
                    {id: 3, name: 'CentOS 6.5 (32-bit)'},
                    {id: 4, name: 'CentOS 6.5 (64-bit)'}
                ]
            },
            {
                id: 3,
                name: "Windows",
                osTypeList: [
                    {id: 5, name: 'Windows Server 2008 (32-bit)'},
                    {id: 6, name: 'Windows Server 2008 (64-bit)'}
                ]
            }
        ],
        zoneList: [
            {id: 1, name: 'Beijing'},
            {id: 2, name: 'Liaoning'},
            {id: 3, name: 'Shanghai'},
            {id: 4, name: 'Henan'}
        ]
    }


}


function storageListCtrl($scope, crudService, dialogService, modalService, $log, promiseAjax, $state, $stateParams, localStorageService, $window, notify) {



    $scope.storageList = {};




    $scope.storage = {
    		zoneList: {},
            domainList:{}
            	};
    $scope.paginationObject = {};
    $scope.storageForm = {};
    $scope.global = crudService.globalConfig;

    $scope.storage.zoneList = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasZones = crudService.list("zones", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hasZones.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.formElements.zoneList = result;
    });

    $scope.storage.domainList = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasDomains = crudService.list("domains", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hasDomains.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.formElements.domainList = result;
    });

        // Network Offer List
        $scope.listNetworkOffer = function (pageNumber) {
            var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
            var hasNetworks = crudService.list("networkoffer", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
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
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasStorage = crudService.list("storages", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasStorage.then(function (result) {  // this is only run after $http
												// completes0

            $scope.storageList = result;
            console.log($scope.storageList);

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);



    // Open dialogue box to create Storage Offer
    $scope.storage = {};



    $scope.costPerHourGB = function() {

        var regexp = /^[0-9]+([,.][0-9]+)?$/g;
        $scope.costPerHourGBError = false;
        if(!regexp.test($scope.storage.costGbPerMonth)) {
        	$scope.costPerHourGBError = true;

            $scope.storage.costGbPerMonth = "";
            $scope.storage.costPerHourGB = "";
            return false;
        }


        var cost = parseFloat($scope.storage.costGbPerMonth);

        var costValue = cost / 720;

        $scope.storage.costPerHourGB = costValue.toFixed(4);
    };
$scope.costPerHourIOPS = function() {

        var regexp = /^[0-9]+([,.][0-9]+)?$/g;

        $scope.costPerHourIOPSError = false;
        if(!regexp.test($scope.storage.costIopsPerMonth)) {
            $scope.costPerHourIOPSError = true;

            $scope.storage.costIopsPerMonth = "";
            $scope.storage.costPerHourIOPS = "";
            return false;
        }


        var cost = parseFloat($scope.storage.costIopsPerMonth);

        var costValue = cost / 720;

        $scope.storage.costPerHourIOPS = costValue.toFixed(4);
    };


    $scope.save = function (form) {
        console.log(form);
        $scope.formSubmitted = true;

        if (form.$valid) {
            var storage = $scope.storage;
            var hasStorage = crudService.add("storages", storage);
            hasStorage.then(function (result) {  // this is only run after
													// $http completes
                $scope.list(1);
                notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
// $window.location.href = '#/templatestore/list';

                $window.location.href = '#/storage/list';

            }).catch(function (result) {
                alert("test");
                angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                    $scope.storageForm[key].$invalid = true;
                    $scope.storageForm[key].errorMessage = errorMessage;
                });
            });
        }
    };

    // Delete the Storage Offer
    $scope.delete = function (size, storageId) {
        dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = storageId;
                $scope.ok = function (storageId) {
                    var hasStorage = crudService.delete("storages", storageId);
                    hasStorage.then(function (result) {
                        $scope.list(1);
                        $scope.homerTemplate = 'views/notification/notify.jsp';
                        notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
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

function storageEditCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {

    $scope.storage = {
    		zoneList: {},
            domainList:{}
            	};
    $scope.paginationObject = {};
    $scope.storageForm = {};
    $scope.global = crudService.globalConfig;

    $scope.storage.zoneList = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hasZones = crudService.list("zones", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hasZones.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.formElements.zoneList = result;
    });


	$scope.edit = function (storageId) {
        var hasStorage = crudService.read("storages", storageId);
        hasStorage.then(function (result) {
            $scope.storage = result;
            console.log($scope.storage);
        });

    };


    if (!angular.isUndefined($stateParams.id) && $stateParams.id != '') {
        $scope.edit($stateParams.id)
    }

    // Edit the Compute Offer
    $scope.update = function (form) {
        // Update Compute Offer
        $scope.formSubmitted = true;
        if (form.$valid) {
            var storage = $scope.storage;
            console.log(storage);
            var hasStorage = crudService.update("storages", storage);
            hasStorage.then(function (result) {

                $scope.homerTemplate = 'views/notification/notify.jsp';
                notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                $window.location.href = '#/compute/list';
            });
        }
    };


}
;

function networkListCtrl($scope, $modal, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify) {


    localStorageService.set("networkList", null);
    if (localStorageService.get("networkList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/catalog-template.json");
        hasServer.then(function (result) {  // this is only run after $http
											// completes
            $scope.networkList = result;
            localStorageService.set("networkList", result);
        });
    } else {
        $scope.networkList = localStorageService.get("networkList");
    }


    $scope.showDescription = function (network) {
        // modalService.trigger('views/servicecatalog/viewnetwork.jsp', 'md',
		// 'View Network Offering');
        var modalInstance = $modal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'views/servicecatalog/viewnetwork.jsp',
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
            console.log($scope.miscellaneousList);
        }
    });

    $scope.delete = function () {
        modalService.trigger('views/servicecatalog/confirm-delete.jsp', 'md', 'Delete Confirmation');
    };

    $scope.save = function (form) {
        $scope.formSubmitted = true;
        console.log(form);
        if (form.$valid) {
            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});


        }
    };



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
        $scope.homerTemplate = 'views/notification/notify.jsp';
        notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        $scope.cancel();
    };

    $scope.remove = function ()
    {
        if ($scope.activity.type == null && $scope.activity.startDate == null && $scope.activity.endDate == null) {
            alert("Please enter any Field ");
        } else {
            $scope.homerTemplate = 'views/notification/notify.jsp';
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

function computeListCtrl($scope, $state, modalService, $window, notify, dialogService, crudService) {

    $scope.computeList = {};
    $scope.paginationObject = {};
    $scope.computeForm = {};
    $scope.global = crudService.globalConfig;
    $scope.test = "test";
    // Compute Offer List
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasComputes = crudService.list("computes", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasComputes.then(function (result) {  // this is only run after $http
												// completes0

            $scope.computeList = result;

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);

    // Open dialogue box to create Compute Offer
    $scope.compute = {};

    $scope.save = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var compute = $scope.compute;
            var hasComputes = crudService.add("computes", compute);
            hasComputes.then(function (result) {  // this is only run after
													// $http completes
                $scope.list(1);
                notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
// $window.location.href = '#/templatestore/list';

                $window.location.href = '#/compute/list';

            }).catch(function (result) {
                if (!angular.isUndefined(result.data)) {
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.computeForm[key].$invalid = true;
                        $scope.computeForm[key].errorMessage = errorMessage;
                    });
                }
            });
        }
    };

    // Delete the Compute Offer
    $scope.delete = function (size, computeId) {
        dialogService.openDialog("views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = computeId;
                $scope.ok = function (computeId) {
                    var hasComputes = crudService.delete("computes", computeId);
                    hasComputes.then(function (result) {
                        $scope.list(1);
                        $scope.homerTemplate = 'views/notification/notify.jsp';
                        notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                    });
                    $modalInstance.close();
                },
                        $scope.cancel = function () {
                            $modalInstance.close();
                        };
            }]);
    };

    $scope.formElements = {
        qosList: [
            {
                id: 1,
                name: 'Hypervisor',
            },
            {
                id: 2,
                name: 'Storage',
            },
        ],
    };
    $scope.domain = {
        domaintypeList: [
            {id: 1, name: 'ROOT'},
        ]
    };
    $scope.storagetype = {
        storagetypeList: [
            {id: 1, name: 'Shared'},
            {id: 2, name: 'Isolated'},
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
    $scope.diskio = {
        diskioList: [
            {id: 1, name: 'Average'},
            {id: 2, name: 'Good'},
            {id: 3, name: 'Excellent'},
        ]
    };
}


function computeEditCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {
    $scope.edit = function (computeId) {
        var hasComputes = crudService.read("computes", computeId);
        hasComputes.then(function (result) {
            $scope.compute = result;
            console.log($scope.compute);
        });

    };


    if (!angular.isUndefined($stateParams.id) && $stateParams.id != '') {
        $scope.edit($stateParams.id)
    }

    // Edit the Compute Offer
    $scope.update = function (form) {
        // Update Compute Offer
        $scope.formSubmitted = true;
        if (form.$valid) {
            var compute = $scope.compute;
            console.log(compute);
            var hasComputes = crudService.update("computes", compute);
            hasComputes.then(function (result) {

                $scope.homerTemplate = 'views/notification/notify.jsp';
                notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                $window.location.href = '#/compute/list';
            });
        }
    };

}
;