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
        .controller('templateEditCtrl', templateEditCtrl)

function templateListCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, crudService, dialogService) {

    $scope.templateList = {};
    $scope.paginationObject = {};
    $scope.templateForm = {};
    $scope.global = crudService.globalConfig;
    $scope.test = "test";
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

    //Template list
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasTemplates = crudService.list("templates", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasTemplates.then(function (result) {  // this is only run after $http completes0

            $scope.templateList = result;

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);

     // OS Categorys list from server
    $scope.oscategorys = {};
    var hasOsCategoryList = crudService.listAll("oscategorys/list");
    hasOsCategoryList.then(function (result) {
    	$scope.formElements.osCategoryList = result;
    });

    // OS Type list from server
    $scope.categoryChange = function() {
        $scope.ostypes = {};
        var hasosTypeList = crudService.filterList("ostypes/list", $scope.template.osCategory.name);
        hasosTypeList.then(function (result) {
    	    $scope.formElements.osTypeList = result;
        });
    };

    // Zone list from server
    $scope.zones = {};
    var haszoneList = crudService.listAll("zones/list");
    haszoneList.then(function (result) {
    	$scope.formElements.zoneList = result;
    });

    // Hypervisors list from server
    $scope.hypervisors = {};
    var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
    var hashypervisorList = crudService.list("hypervisors", $scope.global.paginationHeaders(1, limit), {"limit": limit});
    hashypervisorList.then(function (result) {
    	$scope.formElements.hypervisorList = result;
    });

    // Open dialogue box to create templates
    $scope.template = {};

    $scope.save = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var template = $scope.template;

            var hasTemplate = crudService.add("templates", template);
            hasTemplate.then(function (result) {  // this is only run after $http completes
                $scope.list(1);
                notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                $window.location.href = '#/templatestore/list';

            }).catch(function (result) {
                if (!angular.isUndefined(result.data)) {
                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                        $scope.template[key].$invalid = true;
                        $scope.template[key].errorMessage = errorMessage;
                    });
                }
            });
        }
    };

    // Delete the template
    $scope.delete = function (size, templateId) {
        dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = templateId;
                $scope.ok = function (templateId) {
                    var hasStorage = crudService.delete("templates", templateId);
                    hasStorage.then(function (result) {
                        $scope.list(1);
                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
                        notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
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
            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            $window.location.href = '#/templatestore/list';
        }
    };

    $scope.formElements = {
          rootDiskControllerList: {
              "0":"scsi",
              "1":"ide"
          },
          nicTypeList: {
        	  "0":"E1000",
        	  "1":"PCNET32",
        	  "2":"VMXNET2",
        	  "3":"VMXNET3"
          },
          keyboardTypeList: {
        	  "0":"US_Keyboard",
        	  "1":"UK_Keyboard",
        	  "2":"Japanese_Keyboard",
        	  "3":"Simplified_Chinese"
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
			        	  "0":"BareMetal",
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

function templateEditCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {

	$scope.formElements = {
	        rootDiskControllerList: {
	          "0":"scsi",
	          "1":"ide"
	        },
	        nicTypeList: {
	      	  "0":"E1000",
	      	  "1":"PCNET32",
	      	  "2":"VMXNET2",
	      	  "3":"VMXNET3"
	        },
	        keyboardTypeList: {
	      	  "0":"US_Keyboard",
	      	  "1":"UK_Keyboard",
	      	  "2":"Japanese_Keyboard",
	      	  "3":"Simplified_Chinese"
	        }
	    }

	$scope.edit = function (templateId) {
        var hasTemplates = crudService.read("templates", templateId);
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
	    var hasOsCategoryList = crudService.listAll("oscategorys/list");
	    hasOsCategoryList.then(function (result) {
	    	$scope.formElements.osCategoryList = result;
	    	angular.forEach($scope.formElements.osCategoryList, function(obj, key) {
	    		if(obj.id == $scope.template.osCategory.id) {
	    			$scope.template.osCategory = obj;
	    		}
	    	});
	    });
    }

    // Edit the Template
    $scope.update = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var template = $scope.template;
            var hasTemplates = crudService.update("templates", template);
            hasTemplates.then(function (result) {
                $scope.homerTemplate = 'views/notification/notify.jsp';
                notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                $window.location.href = '#/templatestore/list';
            });
        }
    };

};


function storageListCtrl($scope, crudService, dialogService, modalService, $log, promiseAjax, $state, $stateParams, localStorageService, $window, notify) {



    $scope.storageList = {};
    $scope.paginationObject = {};
    $scope.storageForm = {};
    $scope.global = crudService.globalConfig;


    // Storage Offer List
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasStorage = crudService.list("storages", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasStorage.then(function (result) {  // this is only run after $http completes0

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

    $scope.save = function (form) {
        alert("test");
        console.log(form);
        $scope.formSubmitted = true;

        if (form.$valid) {
            var storage = $scope.storage;
            var hasStorage = crudService.add("storages", storage);
            hasStorage.then(function (result) {  // this is only run after $http completes
                $scope.list(1);
                notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
//                $window.location.href = '#/templatestore/list';

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
        dialogService.openDialog("views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
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
    $scope.formElements = {
        qosList: [
            {
                id: 1,
                name: 'Hypervisor'
            },
            {
                id: 2,
                name: 'Storage'
            }
        ]
    };


}

function storageEditCtrl($scope, $state, $stateParams, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {
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
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.networkList = result;
            localStorageService.set("networkList", result);
        });
    } else {
        $scope.networkList = localStorageService.get("networkList");
    }


    $scope.showDescription = function (network) {
        //modalService.trigger('views/servicecatalog/viewnetwork.jsp', 'md', 'View Network Offering');
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
    hasServer.then(function (result) {  // this is only run after $http completes
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
        hasComputes.then(function (result) {  // this is only run after $http completes0

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
            hasComputes.then(function (result) {  // this is only run after $http completes
                $scope.list(1);
                notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
//                $window.location.href = '#/templatestore/list';

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
