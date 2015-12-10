/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


angular
        .module('panda-ui-admin')
        .controller('reportCtrl', reportCtrl)


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
}

