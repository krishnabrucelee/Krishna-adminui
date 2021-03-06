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

function templateListCtrl($scope, $state, $stateParams, $log, $window, appService, promiseAjax, globalConfig, localStorageService) {

    $scope.templateList = {};
    $scope.paginationObject = {};
    $scope.paginationObjectIso = {};
    $scope.templateForm = {};
    $scope.global = appService.globalConfig;
    $scope.test = "test";
    $scope.summernoteTextTwo = {}
    $scope.windowsTemplate = {};
    $scope.linuxTemplate = {};
    $scope.windowsIsoTemplate = {};
    $scope.linuxIsoTemplate = {};
    $scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';

        $scope.changeSort = function(sortBy, pageNumber) {
		var sort = appService.globalConfig.sort;
		if (sort.column == sortBy) {
			sort.descending = !sort.descending;
		} else {
			sort.column = sortBy;
			sort.descending = false;
		}
		var sortOrder = '-';
		if(!sort.descending){
			sortOrder = '+';
		}
		$scope.paginationObject.sortOrder = sortOrder;
		$scope.paginationObject.sortBy = sortBy;
		$scope.showLoader = true;
		var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;

if ($scope.vmSearch == null) {
         var hasTemplateList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalltemplateforadmin" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy +"&type=template"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
}
	if ($scope.vmSearch != null) {
	$scope.filter = "&searchText=" + $scope.vmSearch;
  	var hasTemplateList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalladminpanel" +"?lang=" + localStorageService.cookie.get('language')+ $scope.filter +"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy +"&type=template"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
	}


                    hasTemplateList.then(function(result) { // this is only run after $http
			// completes0
			$scope.templateList = result;
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};

    $scope.summernoteOpt = {
        toolbar: [
            ['headline', ['style']],
            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
            ['textsize', ['fontsize']],
            ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
        ],
        disableResizeEditor: true,
    };


 $scope.vmSearch = null;

    $scope.searchList = function(vmSearch) {
        $scope.vmSearch = vmSearch;
        $scope.list(1);
    };


    //Template list
    $scope.list = function (pageNumber) {

        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
    	$scope.showLoader = true;

    	var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
	if ($scope.vmSearch == null) {
         var hasTemplates = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalltemplateforadmin" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+appService.globalConfig.sort.sortOrder+appService.globalConfig.sort.sortBy +"&type=template"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
}
	if ($scope.vmSearch != null) {
	$scope.filter = "&searchText=" + $scope.vmSearch;
  	var hasTemplates = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalladminpanel" +"?lang=" + localStorageService.cookie.get('language')+  encodeURI($scope.filter) +"&sortBy="+appService.globalConfig.sort.sortOrder+appService.globalConfig.sort.sortBy +"&type=template"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
	}
        hasTemplates.then(function (result) {  // this is only run after $http completes0

            $scope.templateList = result;
            // Get the count of the listings
	if ($scope.domainView == null && $scope.vmSearch == null) {
       		hasTemplateCount =  appService.crudService.listAll("templates/templateCounts");
	}
 	else {
            	hasTemplateCount = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL +
            			"templates/templateCountsSearchText?lang="+
            			appService.localStorageService.cookie.get('language')+ $scope.filter +"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy);
            }
       		hasTemplateCount.then(function(result) {
       			$scope.windowsTemplate = result.windowsCount;
       			$scope.linuxTemplate = result.linuxCount;
       			$scope.totalCount = result.totalCount;
    		});

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

   $scope.changeSorts = function(sortBy, pageNumber) {
		var sort = appService.globalConfig.sort;
		if (sort.column == sortBy) {
			sort.descending = !sort.descending;
		} else {
			sort.column = sortBy;
			sort.descending = false;
		}
		var sortOrder = '-';
		if(!sort.descending){
			sortOrder = '+';
		}
		$scope.paginationObject.sortOrder = sortOrder;
		$scope.paginationObject.sortBy = sortBy;
		$scope.showLoader = true;
		var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
if ($scope.templatequickSearch == null) {
     var hasIsoList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalltemplateforadmin" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy +"&type=iso"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
}
	if ($scope.templatequickSearch != null) {
	$scope.filter = "&searchText=" + $scope.templatequickSearch;
  	var hasIsoList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalladminpanel" +"?lang=" + localStorageService.cookie.get('language')+ $scope.filter +"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy +"&type=iso"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
	}



                    hasIsoList.then(function(result) { // this is only run after $http
			// completes0
			$scope.isoList = result;
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};

$scope.templatequickSearch = null;
    $scope.searchListing = function(templatequickSearch) {
        $scope.templatequickSearch = templatequickSearch;
        $scope.isolist(1);
    };

    //Isolist
    $scope.isolist = function (pageNumber) {
    	appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
        $scope.showLoader = true;
    	var limit = (angular.isUndefined($scope.paginationObjectIso.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObjectIso.limit;
if ($scope.templatequickSearch == null) {
     var hasIso = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalltemplateforadmin" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+appService.globalConfig.sort.sortOrder+appService.globalConfig.sort.sortBy +"&type=iso"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
}
	if ($scope.templatequickSearch != null) {
	$scope.filter = "&searchText=" + $scope.templatequickSearch;
  	var hasIso = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "templates/listalladminpanel" +"?lang=" + localStorageService.cookie.get('language')+ encodeURI($scope.filter) +"&sortBy="+appService.globalConfig.sort.sortOrder+appService.globalConfig.sort.sortBy +"&type=iso"+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
	}


        hasIso.then(function (result) {  // this is only run after $http completes0
            $scope.isoList = result;

            // Get the count of the listings
       		//var hasIsoTemplateCount =  appService.crudService.listAll("templates/templateCounts");
if ($scope.domainView == null && $scope.templatequickSearch == null) {
       		hasIsoTemplateCount =  appService.crudService.listAll("templates/templateCounts");
	}
 	else {
            	hasIsoTemplateCount = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL +
            			"templates/templateCountsSearchText?lang="+
            			appService.localStorageService.cookie.get('language')+ encodeURI($scope.filter) +"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy);
            }
       		hasIsoTemplateCount.then(function(result) {
       			$scope.windowsIsoTemplate = result.windowsIsoCount;
       			$scope.linuxIsoTemplate = result.linuxIsoCount;
       			$scope.totalIsoCount = result.totalIsoCount;
    		});

            // For pagination
            $scope.paginationObjectIso.limit = limit;
            $scope.paginationObjectIso.currentPage = pageNumber;
            $scope.paginationObjectIso.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.isolist(1);

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


	  $scope.templateCostList = function () {
        $scope.showLoader = true;
        var hastemplateList = appService.crudService.listAll("miscellaneous/listtemplate");
        hastemplateList.then(function (result) {  // this is only run after $http completes0
            $scope.miscellaneousList = result;
            $scope.showLoader = false;
        });

    };
    $scope.templateCostList();

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
	     template.templateCreationType = false ;
            delete template.zone;
            delete template.hypervisor;
            delete template.osCategory;
            delete template.osType;
            var hasTemplate = appService.crudService.add("templates", template);
            hasTemplate.then(function (result) {  // this is only run after $http completes
                $scope.showLoader = false;
                appService.notify({message: 'Template created successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
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
    $scope.delete = function (size, templateId) {
    	var hasTemplateRead = appService.crudService.read("templates", templateId);
    	hasTemplateRead.then(function (template) {
    	appService.dialogService.openDialog("app/views/servicecatalog/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = template.id;
                $scope.ok = function (deleteId) {
                	$scope.showLoader = true;
                    var hasStorage = appService.crudService.delete("templates", deleteId);
                    hasStorage.then(function (result) {
                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
                        $scope.showLoader = false;
                        $modalInstance.close();
                        appService.notify({message: 'Template deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                        if(template.format == "ISO") {
                        	$scope.isolist(1);
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
                        	$modalInstance.close();
                        }
                    });
                },
                $scope.cancel = function () {
                    $modalInstance.close();
                };
            }]);
    	});
    };

    $scope.update = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'app/views/notification/notify.jsp';
            appService.notify({message: 'Template updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
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
            $state.current.data.pageName = result.name;
        	$scope.getOsCategoryList();
        });
    };

       // OS Type list from server
    $scope.categoryChange = function() {
        $scope.ostypes = {};
        var hasosTypeList = appService.crudService.filterList("ostypes/list", $scope.template.osCategory.name);
        hasosTypeList.then(function (result) {
    	    $scope.formElements.osTypeList = result;
    	    angular.forEach( $scope.formElements.osTypeList, function(obj, key) {
	    		if(obj.id == $scope.template.osType.id) {
	    			$scope.template.osType = obj;
	    		}
	    	});
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
	    			$scope.categoryChange();
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
	     template.templateCreationType = false ;
            delete template.zone;
            delete template.hypervisor;
            delete template.osCategory;
            delete template.osType;
            var hasTemplates = appService.crudService.update("templates", template);
            hasTemplates.then(function (result) {
                $scope.homerTemplate = 'app/views/notification/notify.jsp';
                $scope.showLoader = false;
                appService.notify({message: 'Template updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
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


function storageListCtrl($scope, $log, $state, $stateParams, $window, appService, globalConfig, localStorageService) {



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
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';

        $scope.changeSort = function(sortBy, pageNumber) {
		var sort = appService.globalConfig.sort;
		if (sort.column == sortBy) {
			sort.descending = !sort.descending;
		} else {
			sort.column = sortBy;
			sort.descending = false;
		}
		var sortOrder = '-';
		if(!sort.descending){
			sortOrder = '+';
		}
		$scope.paginationObject.sortOrder = sortOrder;
		$scope.paginationObject.sortBy = sortBy;
		$scope.showLoader = true;
		var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
            var hasStorageList = {};

if ($scope.domainView == null && $scope.vmSearch == null) {
            	hasStorageList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "storages" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }
		else {
	if ($scope.domainView != null && $scope.vmSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            }  else if ($scope.domainView == null && $scope.vmSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.vmSearch;
            } else  {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.vmSearch;
            }
    		    hasStorageList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "storages/listStorageByDomain"+"?lang=" +appService.localStorageService.cookie.get('language')+ $scope.filter +"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }
            hasStorageList.then(function(result) { // this is only run after $http
			// completes0
			$scope.storageList = result;
			$scope.storageList.Count = result.totalItems;
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};

    $scope.storage.zoneList = {};
    var hasZones = appService.crudService.listAll("zones/list");
    hasZones.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.zoneList = result;
    	$scope.storage.zone = $scope.zoneList[0];
    });

    $scope.storage.domainList = {};
    var hasDomains = appService.crudService.listAll("domains/list");
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

$scope.vmSearch = null;
    $scope.searchList = function(vmSearch) {
        $scope.vmSearch = vmSearch;
        $scope.list(1);
    };

    // Storage Offer List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasStorage = {};
 	if ($scope.domainView == null && $scope.vmSearch == null) {
            	hasStorage = appService.crudService.list("storages", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            }
		else {
	if ($scope.domainView != null && $scope.vmSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            }  else if ($scope.domainView == null && $scope.vmSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.vmSearch;
            } else  {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.vmSearch;
            }
    		    hasStorage =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "storages/listStorageByDomain"+"?lang=" +appService.localStorageService.cookie.get('language')+  encodeURI($scope.filter) +"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }
        hasStorage.then(function (result) {  // this is only run after $http
            $scope.storageList = result;
            $scope.storageList.Count = result.totalItems;

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

    // Get application list based on domain selection
    $scope.selectDomainView = function(pageNumber) {
    	$scope.list(1);
    };

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

        var costValue = cost / 24;

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

        var costValue = cost / 24;

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
            if(!angular.isUndefined($scope.storage.domain) && storage.domain != null) {
            	storage.domainId = storage.domain.id;
            	delete storage.domain;
            }
            if(!angular.isUndefined($scope.storage.zone) && storage.zone != null) {
            	storage.zoneId = storage.zone.id;
            	delete storage.zone;
            }
            if (!angular.isUndefined($scope.storage.qosType) && storage.qosType != null) {
            	if (storage.qosType == "Hypervisor") {
            		delete storage.diskMaxIops;
            		delete storage.diskMinIops;
            	}
            	if (storage.qosType == "Storage") {
            		delete storage.diskBytesReadRate;
            		delete storage.diskBytesWriteRate;
            		delete storage.diskIopsReadRate;
            		delete storage.diskIopsWriteRate;
            		if (storage.isCustomizedIops == true) {
                		delete storage.diskMaxIops;
                		delete storage.diskMinIops;
                	} else {
                		storage.isCustomizedIops = false;
                	}
            	}
            }
            if (!angular.isUndefined($scope.storage.isCustomDisk) && storage.isCustomDisk != null) {
            	if (storage.isCustomDisk == true) {
            		delete storage.diskSize;
            	}
            }
            if (storage.isPublic == true) {
            	delete storage.domainId;
            }
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

            	if (!angular.isUndefined(result.data) && result.data != null) {
                	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
                  	    var msg = result.data.globalError[0];
                  	  $scope.showLoader = false;
                  	appService.notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                    } else if (result.data.fieldErrors != null) {
                    	$scope.showLoader = false;
                        angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
                            $scope.storageForm[key].$invalid = true;
                            $scope.storageForm[key].errorMessage = errorMessage;
                            $scope.showLoader = false;
                        });
                	}
                }
            });
        }
    };

    // Delete the Storage Offer
    $scope.delete = function (size, storage) {
    	appService.dialogService.openDialog("app/views/servicecatalog/delete-storage.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteId = storage.id;
                $scope.ok = function (storageId) {
                    $scope.showLoader = true;
                    var hasStorage = appService.crudService.softDelete("storages", storage);
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

    $scope.provisioningTypes = {
            provisioningTypeList: {
                      "0": "thin",
                      "1": "sparse",
                      "2": "fat"
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
    var hasZones = appService.crudService.listAll("zones/list");
    hasZones.then(function (result) {  // this is only run after $http
										// completes0
    	$scope.zoneList = result;

    });

$scope.storage.zone= {};

	$scope.edit = function (storageId) {
        var hasStorage = appService.crudService.read("storages", storageId);
        hasStorage.then(function (result) {
            $scope.storage = result;
            $state.current.data.pageName = result.name;
  	     $scope.storage.zone = $scope.zoneList[0];
		var index;
		for (index = 0; index < $scope.storage.storagePrice.length; ++index) {
			$scope.storage.storagePrice[index].zoneId = $scope.storage.zone.id;
		}
	       angular.forEach($scope.storage.zoneList, function (obj, key) {
                	if (obj.id == $scope.storage.zone.id) {
                   	 $scope.storage.zoneId = obj;
                	}
            });

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

        var costValue = cost / 24;

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

        var costValue = cost / 24;

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
            if (!angular.isUndefined(storage.storagePrice[0])) {
            	storage.storagePrice[0].zoneId = storage.zone.id;
            }
            var hasStorage = appService.crudService.update("storages", storage);
            hasStorage.then(function (result) {

                $scope.homerTemplate = 'app/views/notification/notify.jsp';
                $scope.showLoader = false;
                appService.notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
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
                            $scope.showLoader = false;
                        });
                	}
                }
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
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';

        $scope.changeSort = function(sortBy, pageNumber) {
		var sort = appService.globalConfig.sort;
		if (sort.column == sortBy) {
			sort.descending = !sort.descending;
		} else {
			sort.column = sortBy;
			sort.descending = false;
		}
		var sortOrder = '-';
		if(!sort.descending){
			sortOrder = '+';
		}
		$scope.paginationObject.sortOrder = sortOrder;
		$scope.paginationObject.sortBy = sortBy;
		$scope.showLoader = true;
		var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
                var hasNetworkList = appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "networkoffer" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy +"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});


                    hasNetworkList.then(function(result) { // this is only run after $http
			// completes0
			$scope.networkList = result;
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};



    // Network Offer List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
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

function miscellaneousListCtrl($scope, modalService, $log, promiseAjax,appService, $stateParams, globalConfig, localStorageService, $window, notify) {

		$scope.formElements = {};
    $scope.delete = function () {
        modalService.trigger('app/views/servicecatalog/confirm-delete.jsp', 'md', 'Delete Confirmation');
    };

	  $scope.templateCostList = function () {
        $scope.showLoader = true;
        var hastemplateList = appService.crudService.listAll("miscellaneous/listtemplate");
        hastemplateList.then(function (result) {  // this is only run after $http completes0
            $scope.miscellaneousList = result;
            $scope.showLoader = false;
        });

    };
    $scope.templateCostList();

 // Zone list from server
    $scope.zones = {};
    var haszoneList = appService.crudService.listAll("zones/list");
    haszoneList.then(function (result) {
    	$scope.formElements.zoneList = result;
    });

                  $scope.save = function (form) {
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
                        var miscellaneous = angular.copy($scope.miscellaneous);
                        if(!angular.isUndefined($scope.miscellaneous.domain)) {
                        	miscellaneous.domainId = miscellaneous.zone.id;
                        	delete miscellaneous.zone;
                        }
			miscellaneous.costType = 'TEMPLATE';
                        var hasServer = appService.crudService.add("miscellaneous", miscellaneous);
                        hasServer.then(function (result) {  // this is only run after $http completes
                            $scope.formSubmitted = false;
                            $scope.showLoader = false;
                            appService.notify({message: 'Cost added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
    			$scope.templateCostList();
			$scope.miscellaneous = {};
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

  $scope.vmsnapshotCostList = function () {
        $scope.showLoader = true;
        var hasvmsnapshotCostList = appService.crudService.listAll("miscellaneous/listvmsnapshot");
        hasvmsnapshotCostList.then(function (result) {  // this is only run after $http completes0
            $scope.vmsnapshotList = result;
            $scope.showLoader = false;
        });

    };
    $scope.vmsnapshotCostList();

	  $scope.savevmsnapshot = function (form) {
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
                        var miscellaneous = angular.copy($scope.miscellaneous);
                        if(!angular.isUndefined($scope.miscellaneous.domain)) {
                        	miscellaneous.domainId = miscellaneous.zone.id;
                        	delete miscellaneous.zone;
                        }
			miscellaneous.costType = 'VMSNAPSHOT';
                        var hasServer = appService.crudService.add("miscellaneous", miscellaneous);
                        hasServer.then(function (result) {  // this is only run after $http completes
                            $scope.formSubmitted = false;
                            $scope.showLoader = false;
                            appService.notify({message: 'Cost added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
    			$scope.vmsnapshotCostList();
			$scope.miscellaneous = {};
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

	$scope.ipCostList = function () {
        $scope.showLoader = true;
        var hasipCostList = appService.crudService.listAll("miscellaneous/listbyipcost");
        hasipCostList.then(function (result) {  // this is only run after $http completes0
            $scope.ipList = result;
            $scope.showLoader = false;
        });

    };
    $scope.ipCostList();

			  $scope.saveip = function (form) {
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
                        var miscellaneous = angular.copy($scope.miscellaneous);
                        if(!angular.isUndefined($scope.miscellaneous.domain)) {
                        	miscellaneous.domainId = miscellaneous.zone.id;
                        	delete miscellaneous.zone;
                        }
			miscellaneous.costType = 'IPADDRESS';
                        var hasServer = appService.crudService.add("miscellaneous", miscellaneous);
                        hasServer.then(function (result) {  // this is only run after $http completes
                            $scope.formSubmitted = false;
                            $scope.showLoader = false;
                            appService.notify({message: 'Cost added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
    			$scope.ipCostList();
			$scope.miscellaneous = {};
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

	$scope.volumesnapList = function () {
        $scope.showLoader = true;
        var hasvolumesnapList = appService.crudService.listAll("miscellaneous/listvolumesnapshot");
        hasvolumesnapList.then(function (result) {  // this is only run after $http completes0
            $scope.volumeList = result;
            $scope.showLoader = false;
        });

    };
    $scope.volumesnapList();


		   $scope.saveVolumeSnapshot = function (form) {
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
                        var miscellaneous = angular.copy($scope.miscellaneous);
                        if(!angular.isUndefined($scope.miscellaneous.domain)) {
                        	miscellaneous.domainId = miscellaneous.zone.id;
                        	delete miscellaneous.zone;
                        }
			miscellaneous.costType = 'VOLUMESNAPSHOT';
                        var hasServer = appService.crudService.add("miscellaneous", miscellaneous);
                        hasServer.then(function (result) {  // this is only run after $http completes
                            $scope.formSubmitted = false;
                            $scope.showLoader = false;
                            appService.notify({message: 'Cost added successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
    			$scope.volumesnapList();
			$scope.miscellaneous = {};
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

function computeListCtrl($scope, $state, $stateParams, appService, $window, globalConfig, localStorageService) {

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
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';

        $scope.changeSort = function(sortBy, pageNumber) {
		var sort = appService.globalConfig.sort;
		if (sort.column == sortBy) {
			sort.descending = !sort.descending;
		} else {
			sort.column = sortBy;
			sort.descending = false;
		}
		var sortOrder = '-';
		if(!sort.descending){
			sortOrder = '+';
		}
		$scope.paginationObject.sortOrder = sortOrder;
		$scope.paginationObject.sortBy = sortBy;
		$scope.showLoader = true;
		var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
            var hasComputeList = {};
  if ($scope.domainView == null && $scope.vmSearch == null) {
            	hasComputeList = appService.crudService.list("computes", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            }
		else {
if ($scope.domainView != null && $scope.vmSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            }  else if ($scope.domainView == null && $scope.vmSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.vmSearch;
            } else  {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.vmSearch;
            }
    		    hasComputeList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "computes/listComputeByDomain"+"?lang=" +appService.localStorageService.cookie.get('language')+ $scope.filter +"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }

            hasComputeList.then(function(result) { // this is only run after $http
			// completes0
			$scope.computeList = result;
			$scope.computeOffering.Count = result.totalItems;

			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};


 $scope.vmSearch = null;
    $scope.searchList = function(vmSearch) {
        $scope.vmSearch = vmSearch;

        $scope.list(1);
    };

    // Compute Offer List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasComputes = {};
   if ($scope.domainView == null && $scope.vmSearch == null) {
            	hasComputes = appService.crudService.list("computes", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            }
		else {
if ($scope.domainView != null && $scope.vmSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            }  else if ($scope.domainView == null && $scope.vmSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.vmSearch;
            } else  {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.vmSearch;
            }
    		    hasComputes =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "computes/listComputeByDomain"+"?lang=" +appService.localStorageService.cookie.get('language')+  encodeURI($scope.filter) +"&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }
        hasComputes.then(function (result) {  // this is only run after $http

           $scope.computeList = result;
		   $scope.computeOffering.Count = result.totalItems;

            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);

 // Get domain list
        var hasdomainListView = appService.crudService.listAll("domains/list");
        hasdomainListView.then(function (result) {
        	$scope.domainListView = result;
        });


    // Get compute list based on domain selection
    $scope.selectDomainView = function(pageNumber) {
    	$scope.list(1);
    };


    // Open dialogue box to create Compute Offer

    $scope.compute = {
    		computeCost: []
    };

      $scope.customCheck = function(value) {
      if(value.customizedIops == true)
      {
      $scope.compute.customizedIops = true;
            $scope.compute.maxIops = null;
            $scope.compute.minIops = null;
      }
      else
      {
       $scope.compute.customizedIops = false;
      }
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
            if($scope.compute.customizedIops == null) {
                 compute.customizedIops = false;
            }
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

// Number validation
 $scope.validateNumbers = function() {

		$scope.number = parseInt($scope.compute.clockSpeed);

                    if($scope.number < 1000 ) {
 			submitError = true;
                        $scope.homerTemplate = 'app/views/notification/notify.jsp';
                        appService.notify({
                            message: 'Please enter a valid range',
                            classes: 'alert-danger',
                            templateUrl: $scope.homerTemplate
                        });
  			$scope.number = "";
                        return false;
                    }
                }

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
        var hasDomains = appService.crudService.listAll("domains/list");
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
	var hasZones = appService.crudService.listAll("zones/list", '', {});
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
            $state.current.data.pageName = result.name;
    		$scope.compute.zone = $scope.formElements.zoneList[0];
		var index;
		for (index = 0; index < $scope.compute.computeCost.length; ++index) {
			$scope.compute.computeCost[index].zoneId = $scope.compute.zone.id;
		}
	       angular.forEach($scope.formElements.zoneList, function (obj, key) {
                	if (obj.id == $scope.compute.zone.id) {
                   	 $scope.compute.zoneId = obj;
                	}
            });
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
            var compute = angular.copy($scope.compute);
            if(!angular.isUndefined(compute.domain) && $scope.compute.domain != null) {
            	compute.domainId = compute.domain.id;
		        delete compute.domain;
            }
            if (!angular.isUndefined(compute.computeCost[0])) {
            	compute.computeCost[0].zoneId = compute.zone.id;
            }
		delete compute.zone;
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

