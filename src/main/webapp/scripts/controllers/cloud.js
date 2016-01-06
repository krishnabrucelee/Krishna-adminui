/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular
        .module('panda-ui-admin')
        .controller('infrastructureCtrl', infrastructureCtrl)
        .controller('infraCtrl', infraCtrl)
        .controller('resourceCtrl', resourceCtrl)
        .controller('tierviewCtrl', tierviewCtrl)
        .controller('vpcCtrl', vpcCtrl)
        .controller('vpcviewCtrl', vpcviewCtrl)
        .controller('modalCtrl', modalCtrl)

function infrastructureCtrl($scope, $modal, promiseAjax, localStorageService, modalService) {

    $scope.configElements = {
        category: "general",
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

        ]
    };




    $scope.validateLanguage = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Uploaded successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };

    $scope.formSubmitted = false;


    $scope.validateLogin = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {

            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Uploaded successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

        }
    };


}
;


function infraCtrl($scope, $modal, $log, promiseAjax, localStorageService, notify, crudService) {
    $scope.global = crudService.globalConfig;
     $scope.paginationObject = {};
    //$scope.list = function () {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasVms = crudService.list("vms/listVms", $scope.global.paginationHeaders(1, limit), {"limit": limit});
        hasVms.then(function (result) {  // this is only run after $http completes0

            $scope.instanceList = result.listvirtualmachinesresponse.virtualmachine;
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = 1;
        });


    //};

    localStorageService.set("volumes", null);
    if (localStorageService.get("volumes") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/volume.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.volumeList = result;
            localStorageService.set("volumes", result);
        });
    } else {
        $scope.volumeList = localStorageService.get("volumes");
    }

    localStorageService.set("bandwidthList", null);
    if (localStorageService.get("bandwidthList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/bandwidth.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.bandwidthList = result;
            localStorageService.set("bandwidthList", result);
        });
    } else {
        $scope.bandwidthList = localStorageService.get("bandwidthList");
    }

    localStorageService.set("ipaddress", null);
    if (localStorageService.get("ipaddress") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/staticIPs.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.ipList = result;
            localStorageService.set("ipaddress", result);
        });
    } else {
        $scope.ipList = localStorageService.get("ipaddress");
    }

    localStorageService.set("networks", null);
    if (localStorageService.get("networks") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/network.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.networkList = result;
            localStorageService.set("networks", result);
        });
    } else {
        $scope.networkList = localStorageService.get("networks");
    }
}

function resourceCtrl($scope, $modal, promiseAjax, localStorageService, modalService) {

    $scope.configElements = {
        category: "general",
        oneItemSelected: {},
        selectedAll: {}
    };

    $scope.language = {
    };
    $scope.formSubmitted = false;


    $scope.title = 'Zone';
    $scope.value = 'Advanced';
};


function tierviewCtrl($scope, $modal, $log, promiseAjax, $stateParams, $state, globalConfig, localStorageService, $window, sweetAlert, notify) {

    $scope.vpcList = [];
    $scope.tierList = [];
    $scope.ipList = [];
    $scope.SSVPN = [];

    if ($stateParams.id > 0) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/tiers.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            var Id = $stateParams.id - 1;
            $scope.tier = result[Id];
            $state.current.data.pageTitle = result[Id].name;
        });
    }

    localStorageService.set("instances", null);
    if (localStorageService.get("instances") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/instance.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.instanceList = result;
            localStorageService.set("instances", result);
        });
    } else {
        $scope.instanceList = localStorageService.get("instances");
    }


    localStorageService.set("portList", null);
    if (localStorageService.get("portList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/staticIPs.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.portList = result;
            localStorageService.set("portList", result);
        });
    } else {
        $scope.portList = localStorageService.get("portList");
    }



    localStorageService.set("LB", null);
    if (localStorageService.get("LB") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/ipaddress.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.lbList = result;
            localStorageService.set("LB", result);
        });
    } else {
        $scope.lbList = localStorageService.get("LB");
    }

    localStorageService.set("sourcenat", null);
    if (localStorageService.get("sourcenat") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/sorceNatIp.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.natList = result;
            localStorageService.set("sourcenat", result);
        });
    } else {
        $scope.natList = localStorageService.get("sourcenat");
    }
}


function vpcCtrl($scope, $modal, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify) {


    localStorageService.set("vpcList", null);
    if (localStorageService.get("vpcList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/vpc.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.vpcList = result;
            localStorageService.set("vpcList", result);
        });
    }
    else {
        $scope.vpcList = localStorageService.get("vpcList");
    }
}
function vpcviewCtrl($scope, $modal, $log, promiseAjax, $stateParams, $state, globalConfig, localStorageService, $window, sweetAlert, notify) {

    $scope.vpcList = [];
    $scope.tierList = [];
    $scope.ipList = [];
    $scope.SSVPN = [];
    $scope.vpcid = 0;
    if ($stateParams.pageId > 0) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/vpc.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            var instanceId = $stateParams.pageId - 1;
            $scope.vpc = result[instanceId];
            $scope.vpcid = $stateParams.pageId;
            $state.current.data.pageTitle = result[instanceId].name;
        });
    }

    localStorageService.set("tiers", null);
    if (localStorageService.get("tiers") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/tiers.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.tierList = result;
            localStorageService.set("tiers", result);
        });
    } else {
        $scope.tierList = localStorageService.get("tiers");
    }

    localStorageService.set("ipList", null);
    if (localStorageService.get("ipList") == null) {
        var hasServer = promiseAjax.httpRequest("GET", "api/cloud/ipaddress.json");
        hasServer.then(function (result) {  // this is only run after $http completes
            $scope.ipList = result;
            var ssn = [];
            for (ssn in $scope.ipList) {
                if ($scope.ipList[ssn].isSSVPN == true) {
                    $scope.SSVPN.push($scope.ipList[ssn]);
                }
            }
            localStorageService.set("ipList", result);
        });
    } else {
        $scope.ipList = localStorageService.get("ipList");
        var ssn = [];
        for (ssn in $scope.ipList) {
            if ($scope.ipList[ssn].isSSVPN == true) {
                $scope.SSVPN.push($scope.ipList[ssn]);
            }
        }

    }



    $scope.addPrivateGateway = function (size) {

        var modalInstance = $modal.open({
            templateUrl: 'views/cloud/vpc/gateway.jsp',
            controller: 'modalCtrl',
            size: size,
            backdrop: 'static',
            windowClass: "hmodal-info",
            resolve: {
                items: function () {
                    return $scope.items;
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

function modalCtrl($scope, notify, $modalInstance) {

    $scope.networkList = {
        networkOffers: [
            {
                "id": 1,
                "name": "Advanced Network",
                "networkID": "f6dfee50-690c-4210-b77c-c9bf3179b159",
                "networkType": {
                    "id": 2,
                    "name": "Isolated"
                },
                "ip": "10.1.10.92",
                "gateway": "10.1.1.1",
                "netmask": "255.255.255.0",
                "isDefault": "No"
            },
            {
                "id": 2,
                "name": "Custom Network",
                "networkID": "f6dfee50-690c-4210-b77c-c9bf31734e59",
                "networkType": {
                    "id": 1,
                    "name": "Shared Network"
                },
                "ip": "10.2.2.92",
                "gateway": "10.2.2.1",
                "netmask": "255.255.255.0",
                "isDefault": "NO"
            },
            {
                "id": 3,
                "name": "Default Network",
                "networkID": "f6dfee50-690c-4210-b77c-m4fd452321e3",
                "networkType": {
                    "id": 2,
                    "name": "Isolated"
                },
                "ip": "10.1.10.92",
                "gateway": "10.1.1.1",
                "netmask": "255.255.255.0",
                "isDefault": "NO"
            }
        ]

    };

    $scope.addGateway = function (form) {
        $scope.formSubmitted = true;
        if (form.$valid) {
            $scope.homerTemplate = 'views/notification/notify.jsp';
            notify({message: 'Created successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
            $scope.cancel();
        }

    }
    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');

    };
};