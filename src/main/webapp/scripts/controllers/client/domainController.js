/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular
.module('panda-ui-admin')
.controller('domainListCtrl', domainListCtrl)


// Load list page of user
function domainListCtrl($scope,$state, promiseAjax, $log,appService, notify, crudService, dialogService, $timeout, localStorageService, globalConfig) {

	$scope.sort = appService.globalConfig.sort;
    $scope.changeSorting = appService.utilService.changeSorting;

   $scope.domains = {
        category: "domains",
        oneItemSelected: {},
        selectedAll: {},
        totalcount: 0
    };

    $scope.default_option = true
    $scope.domainList = {};
    $scope.revokes = false;
    $scope.paginationObject = {};
    $scope.domainForm = {};
    $scope.global = crudService.globalConfig;
    $scope.domain = {};
    $scope.domainElements={

    };
    $scope.paginationObject.sortOrder = '+';
    $scope.paginationObject.sortBy = 'name';    

    // User List
    $scope.list = function (pageNumber) {
        appService.globalConfig.sort.sortOrder = $scope.paginationObject.sortOrder;
        appService.globalConfig.sort.sortBy = $scope.paginationObject.sortBy;
    	$scope.showLoader = true;
        var limit = (angular.isUndefined($scope.paginationObject.limit)) ? $scope.global.CONTENT_LIMIT : $scope.paginationObject.limit;
        var hasDomain = crudService.list("domains", $scope.global.paginationHeaders(pageNumber, limit), {"limit": limit});
        hasDomain.then(function (result) {  // this is only run after $http completes0
        	$scope.showLoader = true;
            $scope.domainList = result;
            // For pagination
            $scope.paginationObject.limit  = limit;
            $scope.paginationObject.currentPage = pageNumber;
            $scope.paginationObject.totalItems = result.totalItems;
            $scope.showLoader = false;
        });
    };
    $scope.list(1);
    $scope.editList = {};
    $scope.activate = false;
    $scope.revoke = false;
    $scope.disabled = false;
    localStorageService.set("edit", null);


    // Opened user add window
    $scope.addDomain = function (size,domain) {
        dialogService.openDialog("app/views/client/clients/add-domain.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
        	$scope.save = function (form) {
                $scope.formSubmitted = true;
                if (form.$valid) {

                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
                        var domain = angular.copy($scope.domain);
                           if (domain.password == $scope.account.confirmPassword) {
                        	var hasServer = crudService.add("domains", domain);
                        	hasServer.then(function (result) {  // this is only run after $http completes
                        		$scope.list(1);
                        		$scope.showLoader = false;
                        		notify({message: 'Added successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                        		$modalInstance.close();
                        		$scope.domain.name = "";
                        		$scope.domain.companyNameAbb = "";
                        		$scope.domain.portalUserName = "";
                        		$scope.domain.password = "";
                        		$scope.domain.confirmPassword = "";
                        		$scope.domain.cityHeadquarter = "";
                        		$scope.domain.companyAddress = "";
                        		$scope.domain.primaryFirstName = "";
                        		$scope.domain.lastName = "";
                        		$scope.domain.email = "";
                        		$scope.domain.phone = "";
                        		$scope.domain.secondaryContactName = "";
                        		$scope.domain.secondaryContactLastName = "";
                        		$scope.domain.secondaryContactEmail = "";
                        		$scope.domain.secondaryContactPhone = "";
                        	}).catch(function (result) {
                        		if(!angular.isUndefined(result) && result.data != null) {
                        			$scope.showLoader = false;
                        			angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                                	   $scope.domainForm[key].$invalid = true;
                                	   $scope.domainForm[key].errorMessage = errorMessage;
                        			});
                        		}
                        	});
                        }
                        else {  // Add tool tip message for confirmation password in add-user
                        	var key = 'confirmpassword';
                        	$scope.domainForm[key].$invalid = true;
                        	$scope.domainForm[key].errorMessage = document.getElementById("passwordErrorMessage").value;
                        }
                    }
                }
            },
            $scope.cancel = function () {
                $modalInstance.close();
            };
         }]);
    };


    // Edit the Domain
    $scope.edit = function (size, domain) {
        dialogService.openDialog("app/views/client/clients/edit-domain.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                // Update department
                $scope.domain = angular.copy(domain);
                $scope.update = function (form) {
                    $scope.showLoader = true;
                    $scope.formSubmitted = true;
                    if (form.$valid) {
                    	$scope.showLoader = true;
                        var domain = $scope.domain;
                        var hasServer = crudService.update("domains", domain);
                        hasServer.then(function (result) {
                            $scope.domain={};
                            $scope.list(1);
                            $scope.showLoader = false;
                            notify({message: 'Updated successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                            $modalInstance.close();
                        }).catch(function (result) {
                        	if(!angular.isUndefined(result) && result.data != null) {
                        		$scope.showLoader = false;
	                            angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
	                            	$scope.domainForm[key].$invalid = true;
	                                $scope.domainForm[key].errorMessage = errorMessage;
	                            });
                        	}

                        });
                    }
                },
                        $scope.cancel = function () {
                            $modalInstance.close();
                        };
            }]);
    };

	// Get the departments by domain.
	$scope.getDepartmentsByDomain = function(resourceQuota.domain) {
		alert(resourceQuota.domain);
		$scope.resource ='domain';

		$scope.showLoader = true;
		if(angular.isUndefined($scope.resourceQuota.domain)) {
			$scope.resourceQuota.domain = {id:0};

		}
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domain/"+$scope.resourceQuota.domain.id);
		hasResource.then(function (result) {
			$scope.showLoader = false;
			var i=0;
			if(result.length == 0) {
				var resourceQuota = $scope.resourceQuota;
				$scope.resourceQuota = {};
				$scope.resourceQuota.domain = resourceQuota.domain;
				$scope.showLoader = false;
				notify({message: "Please add the resource limit for company", classes: 'alert-info', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
			}

			angular.forEach(result, function(object, key) {
				i++;
				if(i == 1) {
					$scope.loadEditOption($scope.domainList, $scope.resourceQuota.domain, object.domain);
				}
				$scope.resourceQuota[object.resourceType] = object.max;
				$scope.resourceQuota[object.resourceType+"id"] = object.id;
			});
        })

		var hasdomainId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "departments/domain/"+$scope.resourceQuota.domain.id);
		hasdomainId.then(function (result) {  // this is only run after $http completes
			$scope.departmentList = result;
        });




	};

	$scope.loadEditOption = function(list, scopeObject, object) {
		angular.forEach(list, function(domainObject, domainKey) {
			 if(domainObject.id == object.id) {
				 scopeObject = domainObject;
			 }
		 });
	};



    // Delete the Domain
    $scope.delete = function (size, domain) {
        dialogService.openDialog("app/views/common/confirm-delete.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
                $scope.deleteObject = domain;
                $scope.ok = function (deleteObject) {
                	$scope.showLoader = true;
                    var hasServer = crudService.softDelete("domains", deleteObject);
                    hasServer.then(function (result) {

                        $scope.list(1);
                        $scope.showLoader = false;
                        notify({message: 'Deleted successfully ', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
                    }).catch(function (result) {

                   	 if(!angular.isUndefined(result) && result.data != null) {
                    		if(result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])){
                               	 var msg = result.data.globalError[0];
                               	$scope.showLoader = false;
                               	 notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
                            }
                            angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                           	$scope.domainForm[key].$invalid = true;
                            	$scope.domainForm[key].errorMessage = errorMessage;
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





/*
    // Delete user data from database
    $scope.deleteUser = function (size) {
     var user = {};
   	 angular.forEach($scope.accountList, function (item, key) {

            if (item['isSelected']) {
           	 user = item;
            }
   	 });

     var hasServer = crudService.delete("users", user.id);
     hasServer.then(function (result) {
         $scope.list(1);
         notify({message: 'Deleted successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
         $modalInstance.close();
     });

    modalService.trigger('app/views/account/delete-user.jsp', size);
    };*/

/*    $scope.deleteUsers = function () {
        $scope.cancel();
    }*/

    // Edit user data
   /* $scope.editUser = function (size) {
    	var user = {};
    	 angular.forEach($scope.accountList, function (item, key) {

             if (item['isSelected']) {
            	 user = item;
             }
    	 });

    	// dialogService.openDialog("app/views/account/edit-user.jsp", size, $scope, ['$scope', '$modalInstance', function ($scope, $modalInstance) {
    	dialogService.openDialog("app/views/account/edit-user.jsp", size, $scope, ['$scope', '$modalInstance', '$rootScope', function ($scope, $modalInstance, $rootScope) {
    	$scope.user = angular.copy(user);
    	$scope.userForm = {};
    	$scope.saveUser = function (form) {
    		var user = $scope.user;
    		$scope.formSubmitted = true;
    		if (form.$valid) {
    		var hasServer = crudService.update("users",user);
    		hasServer.then(function (result) {
    			$scope.list(1);
    		    notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
    		    $scope.cancel();
    		}).catch(function (result) {
        		if(!angular.isUndefined(result) && result.data != null) {
        			angular.forEach(result.data.fieldErrors, function(errorMessage, key) {
                	    $scope.userForm[key].$invalid = true;
                	    $scope.userForm[key].errorMessage = errorMessage;
        			});
        		}
        	});
    		}
    		},
            $scope.cancel = function () {
                 $modalInstance.close();
             };
         }]);
    };*/

    /*$scope.ok = function () {
        $timeout($scope.generateLoad, 3000);

    };
    $scope.generateLoad = function () {
        $scope.activates = true;
        $scope.revokes=false;
        $scope.cancel();
        $state.reload();

    }

    $scope.generateRevoke = function () {
        $scope.revokes = true;
        $scope.activates = false;

        $scope.cancel();
        $state.reload();
    }

    $scope.revok = function () {
        $timeout($scope.generateRevoke, 3000);
    };

    $scope.revoking = function () {
        modalService.trigger('views/account/revoke.html', 'md');
    }

    $scope.activating = function () {
        modalService.trigger('views/account/activate.html', 'md');
    }*/
}
