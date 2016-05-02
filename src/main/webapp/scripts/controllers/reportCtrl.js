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


function reportCtrl($scope, globalConfig, notify, $state, $stateParams, modalService, $timeout, promiseAjax,appService) {
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

	 $scope.monthList = appService.utilService.getMonthList();

    Date.prototype.ddmmyyyy= function() {
       var yyyy = this.getFullYear().toString();
       var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
       var dd  = this.getDate().toString();
       return (dd[1]?dd:"0"+dd[0]) + "-"+ (mm[1]?mm:"0"+mm[0]) + "-" + yyyy; // padding
      };

	$scope.clientUsage = {
		statusList: [{id: 1,root: 'Status', name: 'All', value: 'ALL'}, {id: 2,name: 'ENABLED', value: 'ENABLED'}, {id: 3, name: 'DISABLED', value: 'DISABLED'}]

	};

$scope.validateDateRange=function(report)
{
$scope.report.startDate = "";
$scope.report.endDate = "";
}


    $scope.validateClientUsage = function (form,report) {
        if ($scope.report.dateRange.value == 'period') {
        	if(angular.isUndefined($scope.report.startDate)|| $scope.report.startDate == ""|| (angular.isUndefined($scope.report.endDate)|| $scope.report.endDate == "")) {
        		$scope.homerTemplate = 'app/views/notification/notify.jsp';
	            appService.notify({
	                message: 'Please Select Start and End Date ',
	                classes: 'alert-danger',
	                templateUrl: $scope.homerTemplate
	            });
	            return false;
	        }

	 		var startDate = $scope.report.startDate.ddmmyyyy();
	 		var endDate = $scope.report.endDate.ddmmyyyy();
$scope.clientStartDate = $scope.report.startDate.ddmmyyyy();
$scope.clientEndDate = $scope.report.endDate.ddmmyyyy();

        }else {
        	var startDate = "01-01-1971";
	 		var endDate = new Date().ddmmyyyy();
$scope.clientStartDate = "01-01-1971";
$scope.clientEndDate = new Date().ddmmyyyy();

        }
 		$scope.formSubmitted = true;
        if (startDate && endDate) {

            if (form.$valid) {
                $scope.reports.dateRange = $scope.report.dateRange.value;
                $scope.reports.status = $scope.report.status.value;
                $scope.reports.startDate = $scope.report.startDate;
                $scope.reports.endDate = $scope.report.endDate;
                $scope.reportGenerating();
                $timeout($scope.loadingContent, 3000);

            }
        }
	$scope.myframe = true;
	$scope.reportUrl =  appService.globalConfig.PING_APP_URL + "usage/listClientUsage?fromDate="+ startDate +"&toDate=" + endDate
+ "&status=" + $scope.reports.status;
	document.getElementById('myframe').setAttribute('src', $scope.reportUrl + "&type=html"+ "&range=" + $scope.reports.dateRange);
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

    $scope.viewInvoice = function(invoice, language) {
        var filePath = invoice.fullPath + "/" + language + "/" + invoice.fileName + ".pdf";
        window.open(appService.globalConfig.PING_APP_URL + "invoice/viewPdf?invoiceNumber="+ invoice.invoiceNumber +"&language="+language,
                invoice.domain.name + "-" + invoice.invoiceNumber, "");
    }


    $scope.generateDueInvoice = function(invoice) {
        $scope.showLoader = true;
        var hasServer = appService.promiseAjax.httpRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL + "invoice/updateDue?domainUuid=" + invoice.domainUuid);
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.showLoader = false;
            $state.reload();
        });
    }

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
                hasConfigList = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice?type=invoice&lang="+ appService.localStorageService.cookie.get('language'));
            } else {
                if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
                      $scope.domainView = null;
                   }
                   if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
                      $scope.statusView = null;
                   }
$scope.pdf = function()
{

	 $scope.viewpdf =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=pdf&method=invoice";
}

$scope.excel = function()
{

	 $scope.viewexcel =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=xlsx&method=invoice";
}
                hasConfigList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice/listByDomain"
                    +"?type=invoice&lang=" +appService.localStorageService.cookie.get('language')
                    + "&domainUuid="+$scope.domainView+"&status="+$scope.statusView);
            }



            hasConfigList.then(function(result) { // this is only run after $http
                //if (!angular.isUndefined(result._embedded)) {
                  //  $scope.invoiceList = result['_embedded'].invoiceList;
                  //  } else {
                  //     $scope.invoiceList = {};
                  //  }
$scope.invoiceList = result;
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
 $scope.defaultView = true;
   $scope.configList = function (pageNumber) {
 $scope.defaultView = true;
      var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
      var hasConfigList = {};
      if (($scope.domainView == null || angular.isUndefined($scope.domainView))
              && ($scope.statusView == null || angular.isUndefined($scope.statusView))) {
          hasConfigList = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice?type=invoice&lang="+ appService.localStorageService.cookie.get('language'));
      } else {
 $scope.defaultView = false;
          if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
               $scope.domainView = null;
            }
            if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
               $scope.statusView = null;
            }

$scope.pdf = function()
{

	 $scope.viewpdf =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=pdf&method=invoice";
}

$scope.excel = function()
{

	 $scope.viewexcel =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=xlsx&method=invoice";
}
          hasConfigList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice/listByDomain"
                +"?type=invoice&lang=" +appService.localStorageService.cookie.get('language')
                + "&domainUuid="+$scope.domainView+"&status="+$scope.statusView);
      }
 $scope.showLoader = true;
      hasConfigList.then(function (result) {  // this is only run after $http completes0
     //    if (!angular.isUndefined(result._embedded)) {
     //         $scope.invoiceList = result['_embedded'].invoiceList;
     //    } else {
     //        $scope.invoiceList = {};
    //     }
$scope.invoiceList = result;
 $scope.showLoader = false;
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

 $scope.open = function ($event, currentDateField) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.usageStatisticsObj[currentDateField] = true;
    };

 $scope.monthList = appService.utilService.getMonthList();

    Date.prototype.ddmmyyyy= function() {
       var yyyy = this.getFullYear().toString();
       var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
       var dd  = this.getDate().toString();
       return (dd[1]?dd:"0"+dd[0]) + "-"+ (mm[1]?mm:"0"+mm[0]) + "-" + yyyy; // padding
      };
    $scope.usageStatisticsObj = {};
 $scope.getBillableTypeByUsageType = function(usageType) {
        var billableType = "";
        switch(usageType) {
        case 1:
            billableType = "VM";
            break;
        case 2:
            billableType = "Stopped VM";
            break;
        case 3:
            billableType = "IP";
            break;
        case 6:
            billableType = "Storage";
            break;
        case 7:
        case 8:
            billableType = "Template";
            break;
        case 9:
        case 15:
            billableType = "Snapshot";
            break;


        }
        return billableType;
    }

  $scope.getUsageReport = function() {
        if(angular.isUndefined($scope.usageStatisticsObj.startDate)
                || $scope.usageStatisticsObj.startDate == ""
                || (angular.isUndefined($scope.usageStatisticsObj.endDate)
                        || $scope.usageStatisticsObj.endDate == ""
                        || (($scope.usageStatisticsObj.domain == "" || $scope.usageStatisticsObj.domain == null)
                        && appService.globalConfig.sessionValues.type == "ROOT_ADMIN"))) {
            alert("Please select all the mandatory fields")
            return false;
        }


        var groupBy = $scope.groupBy;
        $scope.showLoader = false;
        $scope.usageStatisticsType = groupBy;
            var startDate = $scope.usageStatisticsObj.startDate.ddmmyyyy();
            var endDate = $scope.usageStatisticsObj.endDate.ddmmyyyy();
	    var usageType = $scope.usageStatisticsObj.usageType.id;
            if($scope.global.sessionValues.type != 'ROOT_ADMIN') {
                domainUuid = appService.globalConfig.sessionValues.domainAbbreviationName;
            } else {
                domainUuid = $scope.usageStatisticsObj.domain.companyNameAbbreviation;
            }

            var hasServer = appService.promiseAjax.httpRequestPing(appService.globalConfig.HTTP_GET, appService.globalConfig.PING_APP_URL
                    + "usage/listUsageByType?fromDate="+ startDate +"&toDate=" + endDate + "&usageType=" + usageType + "&domainUuid=" + domainUuid);
            hasServer.then(function (result) {  // this is only run after $http completes
                $scope.usageStatistics = result;
                $scope.showLoader = false;
        });
    }


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
                "0":"DRAFT",
                "2":"DUE",
                "3":"PAID",
                "4":"OVER_DUE"
            },
UsageTypeList: [{
            id: 1,
            name: 'VM'
        }, {
            id: 2,
            name: 'Stopped VM'
        }, {
            id: 3,
            name: 'IP'
        },{
            id: 6,
            name: 'Storage'
        },
	{
            id: 8,
            name: 'Template'
        },{
            id: 15,
            name: 'Snapshot'
        }]
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
                hasConfigList = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice?type=payment&lang="+ appService.localStorageService.cookie.get('language'));
            } else {
                if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
                      $scope.domainView = null;
                   }
                   if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
                      $scope.statusView = null;
                   }
$scope.pdf = function()
{
	 $scope.viewpdf =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=pdf&method=payment";
}

$scope.excel = function()
{
	 $scope.viewexcel =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=xlsx&method=payment";
}
                hasConfigList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice/listByDomain"
                    +"?type=payment&lang=" +appService.localStorageService.cookie.get('language')
                    + "&domainUuid="+$scope.domainView+"&status="+$scope.statusView);
            }

            hasConfigList.then(function(result) { // this is only run after $http
              //  if (!angular.isUndefined(result._embedded)) {
              //      $scope.invoiceList = result['_embedded'].invoiceList;
              //      } else {
              //          $scope.invoiceList = {};
              //      }
		$scope.invoiceList = result;

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
 $scope.defaultView = true;
   $scope.configList = function (pageNumber) {
 $scope.defaultView = true;
      var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
      var hasConfigList = {};
      if (($scope.domainView == null || angular.isUndefined($scope.domainView))
              && ($scope.statusView == null || angular.isUndefined($scope.statusView))) {
          hasConfigList = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice?type=payment&lang="+ appService.localStorageService.cookie.get('language'));
      } else {
 $scope.defaultView = false;
          if ($scope.domainView == null || angular.isUndefined($scope.domainView)) {
               $scope.domainView = null;
            }
            if ($scope.statusView == null || angular.isUndefined($scope.statusView)) {
               $scope.statusView = null;
            }

$scope.pdf = function()
{
	 $scope.viewpdf =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=pdf&method=payment";
}

$scope.excel = function()
{
	 $scope.viewexcel =appService.globalConfig.PING_APP_URL +"invoice/statistics/report?domainUuid="+$scope.domainView+"&status="+ $scope.statusView+"&type=xlsx&method=payment";
}
          hasConfigList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice/listByDomain"
                +"?type=payment&lang=" +appService.localStorageService.cookie.get('language')
                + "&domainUuid="+$scope.domainView+"&status="+$scope.statusView);
      }
 $scope.showLoader = true;
      hasConfigList.then(function (result) {  // this is only run after $http completes0
        // if (!angular.isUndefined(result._embedded)) {
       //      $scope.invoiceList = result['_embedded'].invoiceList;
        // } else {
        //     $scope.invoiceList = {};
        // }
$scope.invoiceList = result;
 $scope.showLoader = false;
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

    // Update payment status
    $scope.PayNow = function (size, invoice) {
       appService.dialogService.openDialog("app/views/common/confirm-payment.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
               $scope.invoiceNumber = invoice.invoiceNumber;
               $scope.ok = function (invoiceNumber) {
                   $scope.showLoader = true;
                   var hasPay = appService.promiseAjax.httpRequestPing(globalConfig.HTTP_POST, globalConfig.PING_APP_URL + "invoice/manualPayment", invoiceNumber);
                   hasPay.then(function (result) {
                       $scope.showLoader = false;
                       $scope.homerTemplate = 'app/views/notification/notify.jsp';
                       appService.notify({message: 'Invoice status changed as Paid', classes: 'alert-success', templateUrl: $scope.homerTemplate});
                       $modalInstance.close();
                       $scope.configList(1);
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

    $scope.formElements = {
            invoiceStatusList: {
                "3":"PAID",
                "5":"UNPAID"
            }
    }

};
