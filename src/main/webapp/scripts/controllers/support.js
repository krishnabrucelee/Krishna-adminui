/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('addTicketCtrl', addTicketCtrl)
        .controller('supportListCtrl', supportListCtrl)
        .controller('supportDetailsCtrl', supportDetailsCtrl)

function addTicketCtrl($scope, globalConfig, $window, notify) {

    $scope.global = globalConfig;

    // Form Field Decleration
    $scope.ticket = {
    };
    $scope.formSubmitted = false;

    $scope.formElements = {
        departmentList: [
            {id: 1, name: 'Testing'},
            {id: 2, name: 'Development'}


        ],
        priorityList: [
            {id: 1, name: 'High'},
            {id: 2, name: 'Normal'},
            {id: 3, name: 'Low'}

        ]

    };

    $scope.validateTicket = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'views/notification/notify.html';
            notify({message: 'Ticket added successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };
    $scope.validateDelete = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'views/notification/notify.html';
            notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };
    $scope.validateArchive = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.cancel();
            $scope.homerTemplate = 'views/notification/notify.html';
            notify({message: 'Ticket Archived', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };
}
;


function supportListCtrl($scope, $modal, $log, $timeout, promiseAjax, globalConfig,
        localStorageService, $window, modalService, notify) {
    localStorageService.set("supportList", null);
    if (localStorageService.get("supportList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/tickets.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.supportList = result;
            localStorageService.set("supportList", result);
        });
    } else {
        $scope.supportList = localStorageService.get("supportList");
    }

    $scope.selectedAll = {
        support: false
    };
    $scope.oneItemSelected = false;

    $scope.openAddTicketContainer = function (size) {
        modalService.trigger('views/support/add.html', size);
    };
    $scope.openDeleteTicketContainer = function (size) {
        modalService.trigger('views/support/delete.html', size);
    };
    $scope.openDeleteContainer = function (size) {
        modalService.trigger('views/support/confirm-delete.html', size);
    };
    $scope.delete = function (size) {
        modalService.trigger('views/support/delete.html', size);
    };
    $scope.archive = function (size) {
        modalService.trigger('views/support/archive.html', size);
    };

    $scope.checkAll = function () {
        $scope.oneItemSelected = false;
        if ($scope.selectedAll['support']) {
            $scope.selectedAll['support'] = true;
        } else {
            $scope.selectedAll['support'] = false;
        }


        angular.forEach($scope.supportList, function (item, key) {
            item['isSelected'] = $scope.selectedAll['support'];
            if (item['isSelected']) {
                $scope.oneItemSelected = true;
            }
        });
    };

    $scope.checkOne = function (item) {
        $scope.oneItemSelected = false;
        $scope.selectedAll['support'] = true;
        angular.forEach($scope.supportList, function (item, key) {
            if (item['isSelected']) {
                $scope.oneItemSelected = true;
            } else {
                $scope.selectedAll['support'] = false;
            }
        });
    };

    $scope.showDescription = function (support) {
        var modalInstance = $modal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'views/support/view-description.html',
            controller: 'supportDetailsCtrl',
            size: 'lg',
            backdrop: 'static',
            windowClass: "hmodal-info",
            resolve: {
                support: function () {
                    return angular.copy(support);
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


function supportDetailsCtrl($scope, support, $modalInstance) {
    $scope.support = support;
    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
}
;


