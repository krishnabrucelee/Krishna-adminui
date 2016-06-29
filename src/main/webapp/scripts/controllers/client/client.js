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

//     $scope.quotaLimits = {
//       "Instance":{label: "VM"},"CPU": {label: "vCPU"}, "Memory": {label: "Memory"},"Template":{label: "Template"},"Snapshot": {label: "Snapshot"}, "Network": {label: "Network"},
//       "IP": {label: "IP"}, "VPC": {label: "VPC"}, "Volume": {label: "Volume"},"PrimaryStorage": {label: "PrimaryStorage"}, "SecondaryStorage": {label: "SecondaryStorage"},
//
//     };

     $scope.quotaLimits = [];
     $scope.networkQuotaList = [];
     $scope.storageQuotaList = [];

     $scope.showLoader = true;
     var resourceArr = ["Instance","CPU", "Memory","Template","Snapshot", "Network", "IP", "VPC","Volume", "PrimaryStorage", "SecondaryStorage"];


     var hasResourceDomainId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domain/" + $stateParams.id);
     hasResourceDomainId.then(function (result) {  // this is only run after $http completes

       $scope.showLoader = false;
      // console.log("Result",result);
         angular.forEach(result, function(obj, key) {
        	 //console.log("Key-",key,"Resource-",obj.resourceType);
        	 if(obj.resourceType == "Instance"){
        		 $scope.addText = function() {
        		        $scope.quotaLimits[0] = obj;
        		        $scope.quotaLimits[0].label= "VM";
        		        $scope.quotaLimits[0].max = parseInt(obj.max);
                        $scope.quotaLimits[0].usedLimit = parseInt(obj.usedLimit);
                        $scope.quotaLimits[0].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);
                        if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                            obj.usedLimit = 0;
                        }
                       if(resourceArr.indexOf(obj.resourceType) > -1) {
                         if(angular.isUndefined($scope.quotaLimits[0])) {
                             $scope.quotaLimits[0] = {};

                         }
        		    }
                       if(isNaN($scope.quotaLimits[0].percentage)) {
                           $scope.quotaLimits[0].percentage = 0;
                       }

                       var unUsed = $scope.quotaLimits[0].max - $scope.quotaLimits[0].usedLimit;

                       var usedColor = "#48a9da";
                       if($scope.quotaLimits[0].percentage > 79 && $scope.quotaLimits[0].percentage < 90) {
                           usedColor = "#f0ad4e";
                       } else if($scope.quotaLimits[0].percentage > 89){
                           usedColor = "#df6457";
                       }

                       $scope.quotaLimits[0].doughnutData = [
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
                          }];
                       }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "CPU"){
        		 $scope.addText = function() {
     		        $scope.quotaLimits[1] = obj;
    		        $scope.quotaLimits[1].label= "vCPU";
    		        $scope.quotaLimits[1].max = parseInt(obj.max);
                    $scope.quotaLimits[1].usedLimit = parseInt(obj.usedLimit);
                    $scope.quotaLimits[1].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                    if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                        obj.usedLimit = 0;
                    }
                   if(resourceArr.indexOf(obj.resourceType) > -1) {
                     if(angular.isUndefined($scope.quotaLimits[1])) {
                         $scope.quotaLimits[1] = {};

                     }
    		    }
                    if(isNaN($scope.quotaLimits[1].percentage)) {
                        $scope.quotaLimits[1].percentage = 0;
                    }

                    var unUsed = $scope.quotaLimits[1].max - $scope.quotaLimits[1].usedLimit;

                    var usedColor = "#48a9da";
                    if($scope.quotaLimits[1].percentage > 79 && $scope.quotaLimits[1].percentage < 90) {
                        usedColor = "#f0ad4e";
                    } else if($scope.quotaLimits[1].percentage > 89){
                        usedColor = "#df6457";
                    }

                    $scope.quotaLimits[1].doughnutData = [
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
                       }];

        		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "Memory"){
        		 $scope.addText = function() {
     		        $scope.quotaLimits[2] = obj;
    		        $scope.quotaLimits[2].label= "Memory";

    		        obj.usedLimit = Math.round( obj.usedLimit / 1024);
                    if (obj.max != -1) {
                                obj.max = Math.round(obj.max / 1024);
                                $scope.quotaLimits[2].label = $scope.quotaLimits[2].label + " " + "(GiB)";
                    }

                    $scope.quotaLimits[2].max = parseInt(obj.max);
                    $scope.quotaLimits[2].usedLimit = parseInt(obj.usedLimit);
                    $scope.quotaLimits[2].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                    if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                        obj.usedLimit = 0;
                    }
                   if(resourceArr.indexOf(obj.resourceType) > -1) {
                     if(angular.isUndefined($scope.quotaLimits[2])) {
                         $scope.quotaLimits[2] = {};

                     }
    		    }
                    if(isNaN($scope.quotaLimits[2].percentage)) {
                        $scope.quotaLimits[2].percentage = 0;
                    }

                    var unUsed = $scope.quotaLimits[2].max - $scope.quotaLimits[2].usedLimit;

                    var usedColor = "#48a9da";
                    if($scope.quotaLimits[2].percentage > 79 && $scope.quotaLimits[2].percentage < 90) {
                        usedColor = "#f0ad4e";
                    } else if($scope.quotaLimits[2].percentage > 89){
                        usedColor = "#df6457";
                    }

                    $scope.quotaLimits[2].doughnutData = [
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
                       }];
        		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "Template"){
        		 $scope.addText = function() {
     		        $scope.quotaLimits[3] = obj;
    		        $scope.quotaLimits[3].label= "Template";
    		        $scope.quotaLimits[3].max = parseInt(obj.max);
                    $scope.quotaLimits[3].usedLimit = parseInt(obj.usedLimit);
                    $scope.quotaLimits[3].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                    if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                        obj.usedLimit = 0;
                    }
                   if(resourceArr.indexOf(obj.resourceType) > -1) {
                     if(angular.isUndefined($scope.quotaLimits[3])) {
                         $scope.quotaLimits[3] = {};

                     }
    		    }
                    if(isNaN($scope.quotaLimits[3].percentage)) {
                        $scope.quotaLimits[3].percentage = 0;
                    }

                    var unUsed = $scope.quotaLimits[3].max - $scope.quotaLimits[3].usedLimit;

                    var usedColor = "#48a9da";
                    if($scope.quotaLimits[3].percentage > 79 && $scope.quotaLimits[3].percentage < 90) {
                        usedColor = "#f0ad4e";
                    } else if($scope.quotaLimits[3].percentage > 89){
                        usedColor = "#df6457";
                    }

                    $scope.quotaLimits[3].doughnutData = [
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
                       }];

        		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "Snapshot"){
        		 $scope.addText = function() {
     		        $scope.quotaLimits[4] = obj;
    		        $scope.quotaLimits[4].label= "Snapshot";
    		        $scope.quotaLimits[4].max = parseInt(obj.max);
                    $scope.quotaLimits[4].usedLimit = parseInt(obj.usedLimit);
                    $scope.quotaLimits[4].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                    if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                        obj.usedLimit = 0;
                    }
                   if(resourceArr.indexOf(obj.resourceType) > -1) {
                     if(angular.isUndefined($scope.quotaLimits[4])) {
                         $scope.quotaLimits[4] = {};

                     }
    		    }
                    if(isNaN($scope.quotaLimits[4].percentage)) {
                        $scope.quotaLimits[4].percentage = 0;
                    }

                    var unUsed = $scope.quotaLimits[4].max - $scope.quotaLimits[4].usedLimit;

                    var usedColor = "#48a9da";
                    if($scope.quotaLimits[4].percentage > 79 && $scope.quotaLimits[4].percentage < 90) {
                        usedColor = "#f0ad4e";
                    } else if($scope.quotaLimits[4].percentage > 89){
                        usedColor = "#df6457";
                    }

                    $scope.quotaLimits[4].doughnutData = [
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
                       }];

        		    }
        		 $scope.addText();

        	 }

        	 if(obj.resourceType == "Network"){
        		 $scope.addText = function() {
     		        $scope.networkQuotaList[0] = obj;
    		        $scope.networkQuotaList[0].label= "Network";
    		        $scope.networkQuotaList[0].max = parseInt(obj.max);
                    $scope.networkQuotaList[0].usedLimit = parseInt(obj.usedLimit);
                    $scope.networkQuotaList[0].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                    if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                        obj.usedLimit = 0;
                    }
                   if(resourceArr.indexOf(obj.resourceType) > -1) {
                     if(angular.isUndefined($scope.networkQuotaList[0])) {
                         $scope.networkQuotaList[0] = {};

                     }
    		    }
                    if(isNaN($scope.networkQuotaList[0].percentage)) {
                        $scope.networkQuotaList[0].percentage = 0;
                    }

                    var unUsed = $scope.networkQuotaList[0].max - $scope.networkQuotaList[0].usedLimit;

                    var usedColor = "#48a9da";
                    if($scope.networkQuotaList[0].percentage > 79 && $scope.networkQuotaList[0].percentage < 90) {
                        usedColor = "#f0ad4e";
                    } else if($scope.networkQuotaList[0].percentage > 89){
                        usedColor = "#df6457";
                    }

                    $scope.networkQuotaList[0].doughnutData = [
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
                       }];

        		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "IP"){
        		 $scope.addText = function() {
      		        $scope.networkQuotaList[1] = obj;
      		      $scope.networkQuotaList[1].label= "IP";
  		        $scope.networkQuotaList[1].max = parseInt(obj.max);
                  $scope.networkQuotaList[1].usedLimit = parseInt(obj.usedLimit);
                  $scope.networkQuotaList[1].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                  if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                      obj.usedLimit = 0;
                  }
                 if(resourceArr.indexOf(obj.resourceType) > -1) {
                   if(angular.isUndefined($scope.networkQuotaList[1])) {
                       $scope.networkQuotaList[1] = {};

                   }
  		    }
                  if(isNaN($scope.networkQuotaList[1].percentage)) {
                      $scope.networkQuotaList[1].percentage = 0;
                  }

                  var unUsed = $scope.networkQuotaList[1].max - $scope.networkQuotaList[1].usedLimit;

                  var usedColor = "#48a9da";
                  if($scope.networkQuotaList[1].percentage > 79 && $scope.networkQuotaList[1].percentage < 90) {
                      usedColor = "#f0ad4e";
                  } else if($scope.networkQuotaList[1].percentage > 89){
                      usedColor = "#df6457";
                  }

                  $scope.networkQuotaList[1].doughnutData = [
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
                     }];
        		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "VPC"){
        		 $scope.addText = function() {
      		        $scope.networkQuotaList[2] = obj;
      		      $scope.networkQuotaList[2].label= "VPC";
  		        $scope.networkQuotaList[2].max = parseInt(obj.max);
                  $scope.networkQuotaList[2].usedLimit = parseInt(obj.usedLimit);
                  $scope.networkQuotaList[2].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                  if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                      obj.usedLimit = 0;
                  }
                 if(resourceArr.indexOf(obj.resourceType) > -1) {
                   if(angular.isUndefined($scope.networkQuotaList[2])) {
                       $scope.networkQuotaList[2] = {};

                   }
  		    }
                  if(isNaN($scope.networkQuotaList[2].percentage)) {
                      $scope.networkQuotaList[2].percentage = 0;
                  }

                  var unUsed = $scope.networkQuotaList[2].max - $scope.networkQuotaList[2].usedLimit;

                  var usedColor = "#48a9da";
                  if($scope.networkQuotaList[2].percentage > 79 && $scope.networkQuotaList[2].percentage < 90) {
                      usedColor = "#f0ad4e";
                  } else if($scope.networkQuotaList[2].percentage > 89){
                      usedColor = "#df6457";
                  }

                  $scope.networkQuotaList[2].doughnutData = [
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
                     }];
        		    }
        		 $scope.addText();

        	 }

        	 if(obj.resourceType == "Volume"){
        		 $scope.addText = function() {

      		        $scope.storageQuotaList[0] = obj;
     		        $scope.storageQuotaList[0].label= "Volume";
     		        $scope.storageQuotaList[0].max = parseInt(obj.max);
                     $scope.storageQuotaList[0].usedLimit = parseInt(obj.usedLimit);
                     $scope.storageQuotaList[0].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                     if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                         obj.usedLimit = 0;
                     }
                    if(resourceArr.indexOf(obj.resourceType) > -1) {
                      if(angular.isUndefined($scope.storageQuotaList[0])) {
                          $scope.storageQuotaList[0] = {};

                      }
     		    }
                     if(isNaN($scope.storageQuotaList[0].percentage)) {
                         $scope.storageQuotaList[0].percentage = 0;
                     }

                     var unUsed = $scope.storageQuotaList[0].max - $scope.storageQuotaList[0].usedLimit;

                     var usedColor = "#48a9da";
                     if($scope.storageQuotaList[0].percentage > 79 && $scope.storageQuotaList[0].percentage < 90) {
                         usedColor = "#f0ad4e";
                     } else if($scope.storageQuotaList[0].percentage > 89){
                         usedColor = "#df6457";
                     }

                     $scope.storageQuotaList[0].doughnutData = [
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
                        }];

         		            		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "PrimaryStorage"){
        		 $scope.addText = function() {
      		        $scope.storageQuotaList[1] = obj;
      		        $scope.storageQuotaList[1].label = "Primary Storage";
      		      if (obj.max == -1 && obj.resourceType == "PrimaryStorage" || obj.max == -1 && obj.resourceType == "SecondaryStorage") {
                      // obj.usedLimit = Math.round( obj.usedLimit / (1024 * 1024 * 1024));
             $scope.storageQuotaList[1].label = $scope.storageQuotaList[1].label + " " + "(GiB)";
          }

      		    $scope.storageQuotaList[1].max = parseInt(obj.max);
                $scope.storageQuotaList[1].usedLimit = parseInt(obj.usedLimit);
                $scope.storageQuotaList[1].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                    obj.usedLimit = 0;
                }
               if(resourceArr.indexOf(obj.resourceType) > -1) {
                 if(angular.isUndefined($scope.storageQuotaList[1])) {
                     $scope.storageQuotaList[1] = {};

                 }
		    }
                if(isNaN($scope.storageQuotaList[1].percentage)) {
                    $scope.storageQuotaList[1].percentage = 0;
                }

                var unUsed = $scope.storageQuotaList[1].max - $scope.storageQuotaList[1].usedLimit;

                var usedColor = "#48a9da";
                if($scope.storageQuotaList[1].percentage > 79 && $scope.storageQuotaList[1].percentage < 90) {
                    usedColor = "#f0ad4e";
                } else if($scope.storageQuotaList[1].percentage > 89){
                    usedColor = "#df6457";
                }

                $scope.storageQuotaList[1].doughnutData = [
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
                   }];
        		    }
        		 $scope.addText();

        	 }
        	 if(obj.resourceType == "SecondaryStorage"){
        		 $scope.addText = function() {
      		        $scope.storageQuotaList[2] = obj;
      		      $scope.storageQuotaList[2].label = "Secondary Storage";
      		      if (obj.max == -1 && obj.resourceType == "PrimaryStorage" || obj.max == -1 && obj.resourceType == "SecondaryStorage") {
                      // obj.usedLimit = Math.round( obj.usedLimit / (1024 * 1024 * 1024));
             $scope.storageQuotaList[2].label = $scope.storageQuotaList[2].label + " " + "(GiB)";
          }

      		    $scope.storageQuotaList[2].max = parseInt(obj.max);
                $scope.storageQuotaList[2].usedLimit = parseInt(obj.usedLimit);
                $scope.storageQuotaList[2].percentage = parseFloat(parseInt(obj.usedLimit) / parseInt(obj.max) * 100).toFixed(2);

                if(obj.usedLimit == null || obj.usedLimit == "null" || isNaN(obj.usedLimit)) {
                    obj.usedLimit = 0;
                }
               if(resourceArr.indexOf(obj.resourceType) > -1) {
                 if(angular.isUndefined($scope.storageQuotaList[2])) {
                     $scope.storageQuotaList[2] = {};

                 }
		    }
                if(isNaN($scope.storageQuotaList[2].percentage)) {
                    $scope.storageQuotaList[2].percentage = 0;
                }

                var unUsed = $scope.storageQuotaList[2].max - $scope.storageQuotaList[2].usedLimit;

                var usedColor = "#48a9da";
                if($scope.storageQuotaList[2].percentage > 79 && $scope.storageQuotaList[2].percentage < 90) {
                    usedColor = "#f0ad4e";
                } else if($scope.storageQuotaList[2].percentage > 89){
                    usedColor = "#df6457";
                }

                $scope.storageQuotaList[2].doughnutData = [
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
                   }];
        		    }
        		 $scope.addText();

        	 }
         });

     });

   }

 };
