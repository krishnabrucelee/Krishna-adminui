/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


angular
        .module('panda-ui-admin')
        .controller('reportCtrl', reportCtrl)
        .controller('invoiceListReport', invoiceListReport)
        .controller('paymentListReport', paymentListReport)


function reportCtrl($scope, globalConfig, notify, $state, $stateParams, modalService, $timeout, promiseAjax) {
    $scope.global = globalConfig;
    $scope.generatedList = [];
    $scope.formSubmitteds = false;
    $scope.report = {};
    $scope.reports = {};
    $scope.archive = function () {
        $scope.homerTemplate = 'views/notification/notify.jsp';
        notify({message: 'Archived successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
        $scope.cancel();
    };
    $scope.generatedReport = [];
    $scope.validateSignUp = function (form)
    {
        $scope.formSubmitted = true;

        if ($scope.report.dateRange.value == 'period') {

            if ($scope.report.startDate && $scope.report.endDate) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.projectType.value;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }
        else {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.projectType = $scope.report.projectType.value;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }

    }

    $scope.validatePayment = function (form)
    {
        $scope.formSubmitted = true;
        if ($scope.report.dateRange.value == 'period') {

            if ($scope.report.startDate && $scope.report.endDate) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }
        else {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.projectType = $scope.report.projectType.value;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }

    }


    $scope.validateDue = function (form)
    {
        $scope.formSubmitted = true;
        if ($scope.report.dateRange.value == 'period') {

            if ($scope.report.startDate && $scope.report.endDate) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }

        else {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }

    }

    $scope.validateClientUsage = function (form) {
        $scope.formSubmitted = true;
        if ($scope.report.dateRange.value == 'period') {

            if ($scope.report.startDate && $scope.report.endDate) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.status = $scope.report.status.value;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }
        else {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.status = $scope.report.status.value;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }
    }


    $scope.validateBillable = function (form) {
        $scope.formSubmitted = true;
        if ($scope.report.dateRange.value == 'period' && $scope.report.billable.value != 'selective') {

            if ($scope.report.startDate && $scope.report.endDate) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.zone = $scope.report.zone.value;
                    $scope.reports.billable = $scope.report.billable.value;
                    $scope.reports.selective = $scope.report.selective;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }

        else if ($scope.report.dateRange.value == 'period' && $scope.report.billable.value == 'selective') {

            if ($scope.report.startDate && $scope.report.endDate && $scope.report.selective) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.zone = $scope.report.zone.value;
                    $scope.reports.billable = $scope.report.billable.value;
                    $scope.reports.selective = $scope.report.selective;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }

        else if ($scope.report.billable.value == 'selective') {

            if ($scope.report.selective) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.zone = $scope.report.zone.value;
                    $scope.reports.billable = $scope.report.billable.value;
                    $scope.reports.selective = $scope.report.selective;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }
        else {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.projectType = $scope.report.project.value;
                $scope.reports.zone = $scope.report.zone.value;
                $scope.reports.billable = $scope.report.billable.value;
                $scope.reports.selective = $scope.report.selective;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }
    }


    $scope.validateBillableChart = function (form) {
        $scope.formSubmitted = true;
        if ($scope.report.dateRange.value == 'period' && $scope.report.billable.value != 'selective') {

            if ($scope.report.startDate && $scope.report.endDate) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.zone = $scope.report.zone.value;
                    $scope.reports.billable = $scope.report.billable.value;
                    $scope.reports.selective = $scope.report.selective;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }

        else if ($scope.report.dateRange.value == 'period' && $scope.report.billable.value == 'selective') {

            if ($scope.report.startDate && $scope.report.endDate && $scope.report.selective) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.zone = $scope.report.zone.value;
                    $scope.reports.billable = $scope.report.billable.value;
                    $scope.reports.selective = $scope.report.selective;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }

        else if ($scope.report.billable.value == 'selective') {

            if ($scope.report.selective) {

                if (form.$valid) {
                    $scope.reports.dateRange = $scope.report.dateRange.value;
                    $scope.reports.projectType = $scope.report.project.value;
                    $scope.reports.zone = $scope.report.zone.value;
                    $scope.reports.billable = $scope.report.billable.value;
                    $scope.reports.selective = $scope.report.selective;
                    $scope.reports.startDate = $scope.report.startDate;
                    $scope.reports.endDate = $scope.report.endDate;
                    $scope.reportGenerating();
                    $timeout($scope.loadingContent, 3000);

                }
            }
        }
        else {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.projectType = $scope.report.project.value;
                $scope.reports.zone = $scope.report.zone.value;
                $scope.reports.billable = $scope.report.billable.value;
                $scope.reports.selective = $scope.report.selective;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }
    }



    $scope.reset = function () {
        $state.reload();
    }

    $scope.loadingContent = function () {
        var hasServer = promiseAjax.httpRequest("GET", "api/reports/report.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.generatedList = result;
        });
        $scope.chartEnable = true;

        $scope.formSubmitteds = true;
    }

    $scope.amountSummaryData = {
        labels: ["January", "February", "March"],
        datasets: [
            {
                label: "My Second dataset",
                fillColor: "rgba(72,169,218,0.5)",
                strokeColor: "rgba(72,169,218,0.8)",
                highlightFill: "rgba(72,169,218,0.75)",
                highlightStroke: "rgba(72,169,218,1)",
                data: [700, 300, 200]
            }
        ]
    };

    /**
     * Data for Payment Summary
     */
    $scope.countSummaryData = {
        labels: ["January", "February", "March"],
        datasets: [
            {
                label: "Payment Summary",
                fillColor: "rgba(72,169,218,0.5)",
                strokeColor: "rgba(72,169,218,0.8)",
                highlightFill: "rgba(72,169,218,0.75)",
                highlightStroke: "rgba(72,169,218,1)",
                data: [7, 4, 2]
            }
        ]
    };
    $scope.chartEnable = false;



    $scope.ok = function () {
        $timeout($scope.generateLoad, 3000);

    };
    $scope.generateLoad = function () {
        $timeout(function () {
            $scope.alerts = true
        }, 5);
        $timeout(function () {
            $scope.alerts = true
        }, 5);

        $scope.cancel();

    }


    $scope.reportGenerating = function () {

        $scope.showLoader = true;
        $scope.formSubmitteds = true;
        $timeout(function () {
            $scope.showLoader = false;
            $scope.listView = !$scope.listView;

        }, 3000);

    }

    $scope.reportElements = {
        dateList: [{id: 1, root: 'Date Range', name: 'All', value: 'all'}, {id: 2, root: 'Date Range', name: 'Period', value: 'period'}],
        projectType: [{id: 1, root: 'Project Type', name: 'Retail', value: 'retail'}, {id: 2, root: 'Project Type', name: 'Trial', value: 'trial'}],
        projectList: [{id: 1, root: 'For Project', name: 'Panda-Demo', value: 'panda demo'}, {id: 2, root: 'For Project', name: 'Panda-Cloud', value: 'panda cloud'}, {id: 3, root: 'For Project', name: 'Panda-Test', value: 'panda test'}, {id: 4, root: 'For Project', name: 'Panda-Jade-Art', value: 'panda jadeart'}, {id: 5, root: 'For Project', name: 'All', value: 'all'}],
        statusList: [{id: 1, root: 'Status', name: 'Active', value: 'active'}, {id: 2, root: 'Status', name: 'All', value: 'all'}],
        zoneList: [{id: 1, root: 'Zone based', name: 'Non Zone', value: 'NonZone'}, {id: 2, root: 'Zone based', name: 'All Zone', value: 'all zone'}, {id: 3, root: 'Zone based', name: 'Advanced', value: 'advanced'}],
        billableList: [{id: 1, root: 'Billable Zone based', name: 'All', value: 'all'}, {id: 2, root: 'Billable Zone based', name: 'Selective', value: 'selective'}],
        selectiveList: [{id: 1, root: 'Selective item', name: 'Late Fee', value: 'late fee'}, {id: 2, root: 'Selective item', name: 'Compute Offer', value: 'compute offer'}, {id: 3, root: 'Selective item', name: 'Disk Offer', value: 'disk offer'}, {id: 4, root: 'Selective item', name: 'Snapshot', value: 'snapshot'}, {id: 5, root: 'Selective item', name: 'Template', value: 'template'}, {id: 6, root: 'Selective item', name: 'Bandwidth', value: 'bandwidth'}, {id: 7, root: 'Selective item', name: 'Stopped Instance', value: 'stopped instance'}]
    };
    $scope.open = function ($event, currentDateField) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.report[currentDateField] = true;
    };


    $scope.singleBarChartOptions = {
        scaleBeginAtZero: true,
        scaleShowGridLines: true,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 1,
        barShowStroke: true,
        barStrokeWidth: 1,
        barValueSpacing: 5,
        barDatasetSpacing: 1,
    };

    /**
     * Data for Invoice Summary
     */
};

function invoiceListReport($scope, $http, $window, $modal, $log, $state, $stateParams, appService, globalConfig) {

    $scope.paginationObject = {};
    $scope.configForm = {};
    $scope.domainList = {};
    $scope.invoiceList = {};
    $scope.hasConfigList = {};
    $scope.sort = appService.globalConfig.sort;
    $scope.global = appService.globalConfig;
    $scope.paginationObject.sortOrder = '-';
    $scope.paginationObject.sortBy = 'dueDate';

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
            var hasConfigList = {};
            if (($scope.domainView == null || angular.isUndefined($scope.domainView))
            		&& ($scope.statusView == null || angular.isUndefined($scope.statusView))) {
            	hasConfigList = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice?lang="+ appService.localStorageService.cookie.get('language')
            			+"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            } else {
            	if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
             		 $scope.domainView = null;
             	  }
             	  if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
             		 $scope.statusView = null;
             	  }
            	hasConfigList =  appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice/listByDomain"
    				+"?lang=" +appService.localStorageService.cookie.get('language')
    				+ "&domainUuid="+$scope.domainView+"&status="+$scope.statusView+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }

            hasConfigList.then(function(result) { // this is only run after $http
            	if (!angular.isUndefined(result._embedded)) {
                    $scope.invoiceList = result['_embedded'].invoiceList;
           	 	} else {
           	 		$scope.invoiceList = {};
           	 	}

			    // For pagination
			    $scope.paginationObject.limit = limit;
			    $scope.paginationObject.currentPage = pageNumber;
			    $scope.paginationObject.totalItems = $scope.invoiceList.totalItems;
			    $scope.paginationObject.sortOrder = sortOrder;
			    $scope.paginationObject.sortBy = sortBy;
			    $scope.showLoader = false;
		});
	};

	// Domain List
	var hasDomains = appService.crudService.listAll("domains/list");
	hasDomains.then(function (result) {  // this is only run after $http completes0
		$scope.domainList = result;
	});

   $scope.global = globalConfig;

   $scope.configList = function (pageNumber) {
	  var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
	  var hasConfigList = {};
	  if (($scope.domainView == null || angular.isUndefined($scope.domainView))
      		&& ($scope.statusView == null || angular.isUndefined($scope.statusView))) {
      	hasConfigList = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice?lang="+ appService.localStorageService.cookie.get('language')
      			+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
      } else {
    	  if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
      		 $scope.domainView = null;
      	  }
      	  if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
      		 $scope.statusView = null;
      	  }
      	hasConfigList =  appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice/listByDomain"
				+"?lang=" +appService.localStorageService.cookie.get('language')
				+ "&domainUuid="+$scope.domainView+"&status="+$scope.statusView+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
      }
      hasConfigList.then(function (result) {  // this is only run after $http completes0
    	 if (!angular.isUndefined(result._embedded)) {
             $scope.invoiceList = result['_embedded'].invoiceList;
    	 } else {
    		 $scope.invoiceList = {};
    	 }

         // For pagination
		 $scope.paginationObject.limit = limit;
		 $scope.paginationObject.currentPage = pageNumber;
		 $scope.paginationObject.totalItems = $scope.invoiceList.totalItems;
		 $scope.showLoader = false;
      });
 	  };
   $scope.configList(1);

   // Get application list based on domain selection
   $scope.selectDomainView = function(pageNumber, domainName, statusView) {
	   $scope.domainView = domainName;
	   $scope.statusView = statusView;
   	   $scope.configList(1);
   };

    $scope.validateInvoice = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var config = $scope.config;
            config.dateFormatType = config.dateFormatType.id;
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

    $scope.formElements = {
            invoiceStatusList: {
                "2":"DUE",
                "3":"PAID",
                "4":"OVER_DUE"
            }
    }

};

function paymentListReport($scope, $http, $window, $modal, $log, $state, $stateParams, appService, globalConfig) {

    $scope.paginationObject = {};
    $scope.configForm = {};
    $scope.domainList = {};
    $scope.invoiceList = {};
    $scope.hasConfigList = {};
    $scope.sort = appService.globalConfig.sort;
    $scope.global = appService.globalConfig;
    $scope.paginationObject.sortOrder = '-';
    $scope.paginationObject.sortBy = 'dueDate';

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
            var hasConfigList = {};
            if (($scope.domainView == null || angular.isUndefined($scope.domainView))
            		&& ($scope.statusView == null || angular.isUndefined($scope.statusView))) {
            	hasConfigList = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice?lang="+ appService.localStorageService.cookie.get('language')
            			+"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            } else {
            	if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
             		 $scope.domainView = null;
             	  }
             	  if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
             		 $scope.statusView = null;
             	  }
            	hasConfigList =  appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice/listByDomain"
    				+"?lang=" +appService.localStorageService.cookie.get('language')
    				+ "&domainUuid="+$scope.domainView+"&status="+$scope.statusView+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
            }

            hasConfigList.then(function(result) { // this is only run after $http
            	if (!angular.isUndefined(result._embedded)) {
                    $scope.invoiceList = result['_embedded'].invoiceList;
           	 	} else {
           	 		$scope.invoiceList = {};
           	 	}

			    // For pagination
			    $scope.paginationObject.limit = limit;
			    $scope.paginationObject.currentPage = pageNumber;
			    $scope.paginationObject.totalItems = $scope.invoiceList.totalItems;
			    $scope.paginationObject.sortOrder = sortOrder;
			    $scope.paginationObject.sortBy = sortBy;
			    $scope.showLoader = false;
		});
	};

	// Domain List
	var hasDomains = appService.crudService.listAll("domains/list");
	hasDomains.then(function (result) {  // this is only run after $http completes0
		$scope.domainList = result;
	});

   $scope.global = globalConfig;

   $scope.configList = function (pageNumber) {
	  var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
	  var hasConfigList = {};
	  if (($scope.domainView == null || angular.isUndefined($scope.domainView))
      		&& ($scope.statusView == null || angular.isUndefined($scope.statusView))) {
      	hasConfigList = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice?lang="+ appService.localStorageService.cookie.get('language')
      			+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
      } else {
    	  if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
      		 $scope.domainView = null;
      	  }
      	  if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
      		 $scope.statusView = null;
      	  }
      	hasConfigList =  appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice/listByDomain"
				+"?lang=" +appService.localStorageService.cookie.get('language')
				+ "&domainUuid="+$scope.domainView+"&status="+$scope.statusView+"&sortBy="+$scope.paginationObject.sortOrder+$scope.paginationObject.sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});
      }
      hasConfigList.then(function (result) {  // this is only run after $http completes0
    	 if (!angular.isUndefined(result._embedded)) {
             $scope.invoiceList = result['_embedded'].invoiceList;
    	 } else {
    		 $scope.invoiceList = {};
    	 }

         // For pagination
		 $scope.paginationObject.limit = limit;
		 $scope.paginationObject.currentPage = pageNumber;
		 $scope.paginationObject.totalItems = $scope.invoiceList.totalItems;
		 $scope.showLoader = false;
      });
 	  };
   $scope.configList(1);

   // Get application list based on domain selection
   $scope.selectDomainView = function(pageNumber, domainName, statusView) {
	   $scope.domainView = domainName;
	   $scope.statusView = statusView;
   	   $scope.configList(1);
   };

    $scope.validateInvoice = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            var config = $scope.config;
            config.dateFormatType = config.dateFormatType.id;
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

    $scope.formElements = {
            invoiceStatusList: {
                "3":"PAID",
                "5":"UNPAID"
            }
    }

};
