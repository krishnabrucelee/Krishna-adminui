/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('panda-ui-admin').controller('projectListCtrl', projectListCtrl)
		.controller('projectInfraLimitCtrl', projectInfraLimitCtrl).controller(
				'projectInfrastructureCtrl', projectInfrastructureCtrl)
		.controller('invoiceCtrl', invoiceCtrl).controller(
				'addInvoiceItemCtrl', addInvoiceItemCtrl).controller(
				'projectPaymentCtrl', projectPaymentCtrl).controller(
				'projectAddPaymentCtrl', projectAddPaymentCtrl).controller(
				'billingSummaryCtrl', billingSummaryCtrl).controller(
				'projectViewCtrl', projectViewCtrl)

function projectViewCtrl($scope, $state, $stateParams, $window, promiseAjax,
		modalService, notify,appService, crudService) {

	 $scope.sort = appService.globalConfig.sort;
	    $scope.changeSorting = appService.utilService.changeSorting;

	if ($stateParams.id > 0) {
		var hasServer = promiseAjax.httpRequest("GET", "api/projects.json");
		hasServer.then(function(result) { // this is only run after $http
											// completes
			var viewId = $stateParams.id;

			var res = result.filter(function(obj) {
				if (obj.hasOwnProperty("id") && obj.id == viewId) {
					return obj;
				}
			}).shift();

			$scope.projectInfo = res;
			$state.current.data.pageTitle = res.firstName;
		});
	}

	$scope.project = {
		category : "billingSummary"
	};

	$scope.showInfraLimit = function() {
		$scope.project.category = "infraLimits";
	}

	$scope.confirmProjectCancellation = function() {
		modalService.trigger('views/client/project/confirm-cancellation.html',
				'sm');
	};

	$scope.cancelProject = function() {
		$scope.showLoader = true;
		setTimeout(function() {
			$scope.cancel();
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Project cancelled successfully',
				classes : 'alert-success',
				templateUrl : $scope.homerTemplate
			});
			$window.location.href = '#/client/project';
		}, 1000);
	};

	$scope.confirmProjectSuspension = function() {
		modalService.trigger('views/client/project/confirm-suspension.html',
				'md');
	};

	$scope.suspendProject = function() {
		$scope.showLoader = true;
		setTimeout(function() {
			$scope.cancel();
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Project suspended successfully',
				classes : 'alert-success',
				templateUrl : $scope.homerTemplate
			});
			$window.location.href = '#/client/project';
		}, 1000);
	};

};

function billingSummaryCtrl($scope) {

	/**
	 * Options for billingSummary
	 */
	$scope.singleBarChartOptions = {
		scaleBeginAtZero : true,
		scaleShowGridLines : true,
		scaleGridLineColor : "rgba(0,0,0,.05)",
		scaleGridLineWidth : 1,
		barShowStroke : true,
		barStrokeWidth : 1,
		barValueSpacing : 5,
		barDatasetSpacing : 1,
	};

	/**
	 * Data for Invoice Summary
	 */
	$scope.invoiceSummaryData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [ {
			label : "My Second dataset",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 100, 200, 300, 400, 300, 500, 600 ]
		} ]
	};

	/**
	 * Data for Payment Summary
	 */
	$scope.paymentSummaryData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [ {
			label : "Payment Summary",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 100, 200, 300, 400, 300, 500, 600 ]
		} ]
	};

	/**
	 * Custom Item Recurring Itemsummary
	 */
	$scope.reucrringItemSummaryData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [ {
			label : "Recurring Item Summary",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 100, 200, 300, 400, 300, 500, 600 ]
		} ]
	};

	/**
	 * Data for Support Summary
	 */
	$scope.supportSummaryData = {
		labels : [ "Open", "In Progress", "On Hold", "Closed" ],
		datasets : [ {
			label : "Support Summary",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 40, 15, 5, 50 ]
		} ]
	};
}

function projectPaymentCtrl($scope, globalConfig, $modal, promiseAjax) {
	$scope.global = globalConfig;
	$scope.paymentList = {};
	var hasServer = promiseAjax.httpRequest("GET", "api/project-payments.json");
	hasServer.then(function(result) { // this is only run after $http
										// completes
		$scope.paymentList = result;
	});

	$scope.getPaymentForm = function(size, projectInfo) {
		var modalInstance = $modal.open({
			animation : $scope.animationsEnabled,
			templateUrl : 'views/client/project/add-payment.html',
			controller : 'projectAddPaymentCtrl',
			size : size,
			backdrop : 'static',
			windowClass : "hmodal-info",
			resolve : {
				projectInfo : function() {
					return angular.copy(projectInfo);
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;

		}, function() {
		});
	};
};

function projectAddPaymentCtrl($scope, projectInfo, $modalInstance, notify) {
	$scope.projectInfo = projectInfo;
	$scope.payment = {};
	$scope.addPayment = function(form) {
		$scope.formSubmitted = true;
		if (form.$valid) {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Payment added successfully',
				classes : 'alert-success',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
			$scope.cancel();
		}
	};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};

	$scope.open = function($event, currentDateField) {
		$event.preventDefault();
		$event.stopPropagation();

		$scope.payment[currentDateField] = true;
	};

};

function invoiceCtrl($scope, promiseAjax, $modal) {
	$scope.invoiceList = {};
	var hasServer = promiseAjax.httpRequest("GET", "api/invoices.json");
	hasServer.then(function(result) { // this is only run after $http
										// completes
		$scope.invoiceList = result;
	});

	$scope.showDetails = false;
	$scope.currentDate = new Date();
	$scope.toggleInvoiceDetails = function(invoice) {
		$scope.showDetails = ($scope.showDetails) ? false : true;
		$scope.invoice = invoice;
	};

	$scope.breakUpObj = {};
	$scope.showBreakUps = false;
	$scope.breakUpDetailObj = {};
	$scope.showBreakUpDetail = false;
	$scope.showBreakUpPrice = function(obj) {
		$scope.showBreakUps = true;
		$scope.showBreakUpDetail = false;
		$scope.breakUpObj = obj;
	};

	$scope.showItemPrice = function(obj) {
		$scope.showBreakUpDetail = true;
		$scope.breakUpDetailObj = obj;
	};

	$scope.getInvoiceItemForm = function(size) {
		var modalInstance = $modal.open({
			animation : $scope.animationsEnabled,
			templateUrl : 'views/client/project/add-invoice-item.html',
			controller : 'addInvoiceItemCtrl',
			size : size,
			backdrop : 'static',
			windowClass : "hmodal-info",
			resolve : {
				projectInfo : function() {
					return null;
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;

		}, function() {
		});
	};
};

function addInvoiceItemCtrl($scope, $modalInstance, notify) {
	$scope.addPayment = function(form) {
		$scope.formSubmitted = true;
		if (form.$valid) {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Added successfully',
				classes : 'alert-success',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
			$scope.cancel();
		}
	};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};

	$scope.open = function($event, currentDateField) {
		$event.preventDefault();
		$event.stopPropagation();
		$scope.payment[currentDateField] = true;
	};

};

function projectInfrastructureCtrl($scope, globalConfig) {
	$scope.global = globalConfig;
};

function projectInfraLimitCtrl($scope, globalConfig, notify) {
	$scope.global = globalConfig;
	$scope.validateInfraLimit = function(form) {
		$scope.formSubmitted = true;
		if (form.$valid) {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Updated successfully',
				classes : 'alert-success',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
		} else {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Please fill all the fields',
				classes : 'alert-danger',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
		}
	};
};

function projectListCtrl($scope, promiseAjax,crudService,notify,appService, localStorageService, globalConfig) {
	 $scope.sort = appService.globalConfig.sort;
	 $scope.changeSorting = appService.utilService.changeSorting;
	 $scope.showLoader = true;
	 $scope.projectList = {};
	 $scope.paginationObject = {};
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

            var hasProjectList = {};
           /** if ($scope.domainView == null) {
            	hasProjectList =  appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "projects" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            } else {
            	hasProjectList =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "projects/listByDomain"
    				+"?lang=" +appService.localStorageService.cookie.get('language')
    				+ "&domainId="+$scope.domainView.id+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }**/
 if ($scope.domainView == null && $scope.vmSearch == null) {
            	hasProjectList = appService.crudService.list("projects", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            } else {
		if ($scope.domainView != null && $scope.vmSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            }  if ($scope.domainView == null && $scope.vmSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.vmSearch;
            } else  {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.vmSearch;
            }
    		    hasProjectList =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "projects/listByDomainAndOwner"+"?lang=" +appService.localStorageService.cookie.get('language')
    				+ $scope.filter + "&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }

            hasProjectList.then(function(result) { // this is only run after $http
			// completes0
			$scope.projectList = result;
			$scope.projectList.Count = 0;
            if (result.length != 0) {
                $scope.projectList.Count = result.totalItems;
            }
			// For pagination
			$scope.paginationObject.limit = limit;
			$scope.paginationObject.currentPage = pageNumber;
			$scope.paginationObject.totalItems = result.totalItems;
			$scope.paginationObject.sortOrder = sortOrder;
			$scope.paginationObject.sortBy = sortBy;
			$scope.showLoader = false;
		});
	};
    // Get domain list
        var hasdomainListView = appService.crudService.listAll("domains/list");
        hasdomainListView.then(function (result) {
        	$scope.domainListView = result;
        });

        // Get project list based on domain selection
        $scope.selectDomainView = function(pageNumber) {
        	$scope.list(1);
        };
  // Get instance list based on quick search
    $scope.vmSearch = null;
    $scope.searchList = function(vmSearch) {
        $scope.vmSearch = vmSearch;

        $scope.list(1);
    };
        $scope.list = function (pageNumber) {
                appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
                appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
        	$scope.showLoader = true;
            var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
            var hasProjects = {};
            if ($scope.domainView == null && $scope.vmSearch == null) {
            	hasProjects = appService.crudService.list("projects", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
            }
		else {
if ($scope.domainView != null && $scope.vmSearch == null) {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=";
            }  else if ($scope.domainView == null && $scope.vmSearch != null) {
                $scope.filter = "&domainId=0" + "&searchText=" + $scope.vmSearch;
            } else  {
                $scope.filter = "&domainId=" + $scope.domainView.id + "&searchText=" + $scope.vmSearch;
            }
    		    hasProjects =  promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "projects/listByDomainAndOwner"+"?lang=" +appService.localStorageService.cookie.get('language')
    				+  encodeURI($scope.filter) + "&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }
            hasProjects.then(function (result) {  // this is only run after $http completes0
                $scope.projectList = result;
                $scope.projectList.Count = 0;
                if (result.length != 0) {
                    $scope.projectList.Count = result.totalItems;
                }
                // For pagination
                $scope.paginationObject.limit  = limit;
                $scope.paginationObject.currentPage = pageNumber;
                $scope.paginationObject.totalItems = result.totalItems;
                $scope.showLoader = false;
            }).catch(function (result) {
	         if(result.data.globalError[0] != null){
	        	 var msg = result.data.globalError[0];
	        	 $scope.showLoader = false;
	        	 notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
	             }
              });
        };
        $scope.list(1);


};
