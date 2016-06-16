/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular
        .module('panda-ui-admin')
        .controller('clientListCtrl', clientListCtrl)

function clientListCtrl($scope, $state, $stateParams,appService, modalService, $log, promiseAjax, globalConfig, localStorageService, $window, sweetAlert, notify, dialogService, crudService) {

     $scope.domains = {
                category: "domains",
                oneItemSelected: {},
                selectedAll: {},
                totalcount: 0
            };
            $scope.status={};
             $scope.status.basic = true;
            $scope.default_option = true
            $scope.domainList = {};
            $scope.revokes = false;
            $scope.paginationObject = {};
            $scope.domainForm = {};
            $scope.global = crudService.globalConfig;
            $scope.domain = {};
            $scope.sort = appService.globalConfig.sort;
            $scope.changeSorting = appService.utilService.changeSorting;
            $scope.domainElements={

            };
    $scope.paginationObject = {};
    $scope.global = crudService.globalConfig;
    $scope.domainList = {};
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
                    var hasDomainList =  appService.promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + "domains" +"?lang=" + localStorageService.cookie.get('language') +"&sortBy="+sortOrder+sortBy+"&limit="+limit, $scope.global.paginationHeaders(pageNumber, limit), {"limit" : limit});

                    hasDomainList.then(function(result) { // this is only run after $http
            // completes0
            $scope.domainList = result;
            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.paginationObject.sortOrder = sortOrder;
            $scope.paginationObject.sortBy = sortBy;
            $scope.showLoader = false;
        });
    };

    // Compute Offer List
    $scope.list = function (pageNumber) {
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasDomains = crudService.list("domains", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasDomains.then(function (result) {  // this is only run after $http
                                                // completes0

            $scope.domainList = result;


            // For pagination
            $scope.paginationObject.limit = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
        });
    };
    $scope.list(1);



    $scope.clientList = {};
    var hasServer = promiseAjax.httpRequest("GET", "api/clients.json");
    hasServer.then(function (result) {  // this is only run after $http completes
        $scope.clientList = result;
    });

    $scope.delete = function(size) {
        modalService.trigger('app/views/client/clients/delete.jsp', size);
    };

    // Opened user add window
    $scope.addDomain = function (size,domain) {
        dialogService.openDialog("app/views/domain/add-domain.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
            $scope.save = function (form) {
                $scope.formSubmitted = true;
                if (form.$valid) {

                    $scope.formSubmitted = true;
                    if (form.$valid) {
                        var user = angular.copy($scope.user);
                            var hasServer = crudService.add("domains", domain);
                            hasServer.then(function (result) {  // this is only run after $http completes
                                $scope.list(1);
                                notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                                $modalInstance.close();
                                $scope.domain.name = "";
                                $scope.domain.companyNameAbbreviation = "";
                                $scope.domain.portalUserName = "";
                                $scope.domain.password = "";
                                $scope.domain.confirmPassword = "";
                                $scope.domain.cityHeadquarter = "";
                                $scope.domain.companyAddress = "";
                                $scope.domain.primaryFirstName = "";
                                $scope.domain.lastName = "";
                                $scope.domain.email = "";
                                $scope.domain.phone = "";
                                $scope.domain.secondaryContact = "";
                            }).catch(function (result) {
                                if(!angular.isUndefined(result) && result.data != null) {
                                    angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                                       $scope.domainForm[key].$invalid = true;
                                       $scope.domainForm[key].errorMessage = errorMessage;
                                    });
                                }
                            });
                    }
                }
            },
            $scope.cancel = function () {
                $modalInstance.close();
            };
         }]);
    };


     $scope.validateEdit = function (form) {
         $scope.formSubmitted = true;
         if (form.$valid) {

             $scope.homerTemplate = 'app/views/notification/notify.jsp';
             notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});

         }
     };

     $scope.quota = {

                 };
     $scope.paginationObject = {};
     $scope.global = crudService.globalConfig;



        $scope.edit = function (quotaId) {
         var hasQuota = crudService.read("quota", quotaId);
         hasQuota.then(function (result) {
             $scope.quota = result;
         });

     };


     if (!angular.isUndefined($stateParams.id) && $stateParams.id != '' && $stateParams.view != 'dashboard') {
         $scope.edit($stateParams.id)
     }


     // Edit the Compute Offer
     $scope.update = function (form) {
         // Update Compute Offer
         $scope.formSubmitted = true;
         if (form.$valid) {
             var quota = $scope.quota;
             var hasStorage = crudService.update("quota", quota);
             hasStorage.then(function (result) {

                 $scope.homerTemplate = 'app/views/notification/notify.jsp';
                 notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.homerTemplate});
             });
         }
     };

     $scope.getDomainDetailsById = function(domainId) {
       var hasDomain = appService.crudService.read("domains", domainId);
       hasDomain.then(function(result) {
          $scope.domain = result;
          $scope.getInvoiceListByType($scope.domain, "invoice");
          $scope.getInvoiceListByType($scope.domain, "payment");
          $scope.getCostByMonthGraphAndDomainId(result.uuid);
       });
     }
     $scope.invoiceList = {};
     $scope.getInvoiceListByType = function(domain, type) {
       var hasConfigList =  appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "usage/invoice/listByDomain"
             +"?type="+ type +"&lang=" +appService.localStorageService.cookie.get('language')
             + "&domainUuid=" + domain.companyNameAbbreviation + "&status=null");

       hasConfigList.then(function(result) {
          $scope.invoiceList[type] = result;
       });
     }

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
                         $scope.getInvoiceListByType($scope.domain, "payment");
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

     $scope.viewInvoice = function(invoice, language) {
         var filePath = invoice.fullPath + "/" + language + "/" + invoice.fileName + ".pdf";
         window.open(appService.globalConfig.PING_APP_URL + "invoice/viewPdf?invoiceNumber="+ invoice.invoiceNumber +"&language="+language,
                 invoice.domain.name + "-" + invoice.invoiceNumber, "");
     }

       /**
       * Data for Usage Line chart
       */
      $scope.usageLineData = appService.utilService.getSharpLineData();

      /**
       * Options for Usage Line chart
       */
      $scope.usageLineOptions = appService.utilService.getSharpLineOptions();


        $scope.showCostByMonthLoader = false;
        $scope.getCostByMonthGraphAndDomainId = function(domainUuId) {
            $scope.showCostByMonthLoader = true;
            var hasProjects = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "usage/usageTotal/domain/" + domainUuId);
            hasProjects.then(function (result) {  // this is only run after $http completes
              $scope.domainUsageCost = result;
              $scope.showCostByMonthLoader = false;
              var usageData = [];
              var usageLabels = [];
              var i=0;
              angular.forEach($scope.domainUsageCost, function(obj, key) {
                  i++;
                  usageData.push(obj.cost);
                  usageLabels.push(obj.month);
              });
              $scope.usageLineData.labels = usageLabels.reverse();
              $scope.usageLineData.datasets[0].data = usageData.reverse();

            });
        }

     if (!angular.isUndefined($stateParams.id) && $stateParams.id != '' && $stateParams.view == 'dashboard') {
       $scope.getDomainDetailsById($stateParams.id);
       $scope.infrastructure = {};
       $scope.showInfrastructureLoader = true;
       var hasResult = appService.promiseAjax.httpTokenRequest(appService.globalConfig.HTTP_GET, appService.globalConfig.APP_URL + "dashboard/infrastructure/domain/"+$stateParams.id);
       hasResult.then(function(result) {  // this is only run after;
           $scope.infrastructure  = result;
           $scope.showInfrastructureLoader = false;
       });

       // Suspend the user
       $scope.showUserListLoader = {};
       $scope.suspensionObject = {};
       $scope.suspendDomain = function(domain) {
         $scope.showUserListLoader[domain.id] = true;
           appService.dialogService.openDialog("app/views/common/confirm-suspension.jsp", 'md',
           $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
       $scope.suspensionObject.status = "SUSPENDED";
       $scope.suspensionObject.id = domain.id;
       suspensionObject = $scope.suspensionObject;
             $scope.ok = function (suspensionObject) {
               var hasServer = appService.crudService.update("domains/suspend",suspensionObject);
               hasServer.then(function (result) {
                 appService.notify({message: 'Company suspended  successfully ',
                 classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                 $modalInstance.close();
                 $scope.list(1);
               });
               $scope.showUserListLoader[suspensionObject.id] = false;

             },

             $modalInstance.close();
             $scope.cancel = function () {
               $modalInstance.close();
               $scope.showUserListLoader[account.id] = false;
             };
         }]);

       };

       $scope.enableDomain = function(domain) {
           $scope.showUserListLoader[domain.id] = true;

             appService.dialogService.openDialog("app/views/common/confirm-activation.jsp", 'md',
             $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
               $scope.suspensionObject = domain;
               $scope.ok = function (suspensionObject) {
                 suspensionObject.status = "ACTIVE";
                 var hasServer = appService.crudService.update("domains", suspensionObject);
                 hasServer.then(function (result) {
                   appService.notify({message: 'Company enabled  successfully ',
                   classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                   $modalInstance.close();
                 });
                 $scope.showUserListLoader[suspensionObject.id] = false;
               },
               $modalInstance.close();
               $scope.cancel = function () {
                 $modalInstance.close();
                 $scope.showUserListLoader[domain.id] = false;
               };
           }]);
         };

     $scope.quotaLimits = {
       "CPU": {label: "vCPU"}, "Memory": {label: "Memory"}, "Volume": {label: "Volume"}, "Network": {label: "Network"},
       "IP": {label: "IP"}, "PrimaryStorage": {label: "PrimaryStorage"}, "SecondaryStorage": {label: "SecondaryStorage"},
       "Snapshot": {label: "Snapshot"}
     };

     $scope.showLoader = true;
     var resourceArr = ["CPU", "Memory", "Volume", "Network", "IP", "PrimaryStorage", "SecondaryStorage", "Snapshot"];
     var hasResourceDomainId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domain/" + $stateParams.id);
     hasResourceDomainId.then(function (result) {  // this is only run after $http completes
       $scope.showLoader = false;
         angular.forEach(result, function(obj, key) {
              if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                  obj.usedLimit = 0;
              }
             if(resourceArr.indexOf(obj.resourceType) > -1) {
               if(angular.isUndefined($scope.quotaLimits[obj.resourceType])) {
                   $scope.quotaLimits[obj.resourceType] = {};
               }

               if(obj.resourceType == "Memory") {
                 obj.usedLimit = Math.round( obj.usedLimit / 1024);
                     if (obj.max != -1) {
                                 obj.max = Math.round(obj.max / 1024);
                                 $scope.quotaLimits[obj.resourceType].label = $scope.quotaLimits[obj.resourceType].label + " " + "(GiB)";
                     }
               }

               if (obj.max == -1 && obj.resourceType == "PrimaryStorage" || obj.max == -1 && obj.resourceType == "SecondaryStorage") {
                            // obj.usedLimit = Math.round( obj.usedLimit / (1024 * 1024 * 1024));
                   $scope.quotaLimits[obj.resourceType].label = $scope.quotaLimits[obj.resourceType].label + " " + "(GiB)";
                }

               $scope.quotaLimits[obj.resourceType].max = parseInt(obj.max);
               $scope.quotaLimits[obj.resourceType].usedLimit = parseInt(obj.usedLimit);
               $scope.quotaLimits[obj.resourceType].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

               if(isNaN($scope.quotaLimits[obj.resourceType].percentage)) {
                   $scope.quotaLimits[obj.resourceType].percentage = 0;
               }

               var unUsed = $scope.quotaLimits[obj.resourceType].max - $scope.quotaLimits[obj.resourceType].usedLimit;


               var usedColor = "#48a9da";
               if($scope.quotaLimits[obj.resourceType].percentage > 79 && $scope.quotaLimits[obj.resourceType].percentage < 90) {
                   usedColor = "#f0ad4e";
               } else if($scope.quotaLimits[obj.resourceType].percentage > 89){
                   usedColor = "#df6457";
               }
               $scope.quotaLimits[obj.resourceType].doughnutData = [
                   {
                       value: parseInt(obj.usedLimit),
                       color: usedColor,
                       highlight: usedColor,
                       label: "Used"

                   },
                   {
                       value: unUsed,
                       color: "#ebf1f4",
                       highlight: "#ebf1f4",
                       label: "UnUsed"
                   }
               ];
             }
         });
     });

   }

 };
