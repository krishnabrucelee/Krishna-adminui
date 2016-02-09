/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


angular
.module('panda-ui-admin')
.controller('resourceAllocationCtrl', resourceAllocationCtrl);

function resourceAllocationCtrl($scope, crudService, globalConfig, notify, $state, $stateParams, promiseAjax) {

	$scope.resourceQuota = {};

	$scope.resourceTypeList = [
                            "Instance",
	                        /** Number of public IP addresses a user can own. */
	                        "IP",
	                        /**  Number of disk volumes a user can create. */
	                        "Volume",
	                        /** Number of snapshots a user can create. */
	                        "Snapshot",
	                        /** Number of templates that a user can register/create. */
	                        "Template",
	                        /** Number of projects an account can own. */
	                        "Project",
	                        /** Number of guest network a user can create. */
	                        "Network",
	                        /** Number of VPC a user can create. */
	                        "VPC",
	                        /** Total number of CPU cores a user can use. */
	                        "CPU",
	                        /** Total Memory (in MB) a user can use. */
	                        "Memory",
	                        /** Total primary storage space (in GiB) a user can use. */
	                        "PrimaryStorage",
	                        /** Total secondary storage space (in GiB) a user can use. */
	                        "SecondaryStorage"];

	$scope.paginationObject = {};
    $scope.global = crudService.globalConfig;
	$scope.domainList = {};

    // Domain List
    var hasDomains = crudService.listAll("domains");
    hasDomains.then(function (result) {
    	$scope.domainList = result;
    });


    // Save Resource limits based on the quota type.
	$scope.save = function(form) {
		//if(form.$valid) {
		if(!angular.isUndefined($scope.resourceQuota.project) && $scope.resourceQuota.project != "" && $scope.resourceQuota.project != null) {
			$scope.saveProjectQuota(form);
		} else if(!angular.isUndefined($scope.resourceQuota.department) && $scope.resourceQuota.department != "" && $scope.resourceQuota.department != null) {
			$scope.saveDepartmentQuota(form);
		} else {
			$scope.saveDomainQuota(form);
		}
		//}
	}

	// Save Resource limit for domain.
	$scope.saveDomainQuota = function(form) {
		$scope.formSubmitted = true;
		if(form.$valid) {
			$scope.showLoader = true;
			var quotaList = [];
			for(var i=0; i < $scope.resourceTypeList.length; i++) {
				if(i != 5) {
					var resourceObject = {};
					resourceObject.domainId = $scope.resourceQuota.domain.id;
					resourceObject.domain = $scope.resourceQuota.domain;
					resourceObject.resourceType = $scope.resourceTypeList[i];
					resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]];
					resourceObject.id = $scope.resourceQuota[$scope.resourceTypeList[i]+"id"];
					quotaList.push(resourceObject);
				}
			}

			var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_POST , globalConfig.APP_URL + "resourceDomains/create" , '', quotaList);
			hasResource.then(function (result) {  // this is only run after $http completes
				$scope.showLoader = false;
				$scope.formSubmitted = false;
				$scope.isDisabledDepartment = false;
				$scope.isDisabledProject = false;
	            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});

	        }).catch(function (result) {
	            if (!angular.isUndefined(result.data)) {
	            	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
	              	    var msg = result.data.globalError[0];
	              	  $scope.showLoader = false;
	            	    notify({message: msg, classes: 'alert-info', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
	                } else if (result.data.fieldErrors != null) {
	                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
	                    	  $scope.showLoader = false;
	                        $scope.resourceAllocationForm[key].$invalid = true;
	                        $scope.resourceAllocationForm[key].errorMessage = errorMessage;
	                        $scope.showLoader = false;
	                    });
	            	}
	            }
	        });
		}
	};

	// Save resource limit for department.
	$scope.saveDepartmentQuota = function(form) {
		$scope.formSubmitted = true;
		if(form.$valid) {
			$scope.showLoader = true;
			var quotaList = [];
			for(var i=0; i < $scope.resourceTypeList.length; i++) {
				if(i != 5) {
					var resourceObject = {};
					resourceObject.domainId = $scope.resourceQuota.domain.id;
					resourceObject.domain = $scope.resourceQuota.domain;
					resourceObject.departmentId = $scope.resourceQuota.department.id;
					resourceObject.department = $scope.resourceQuota.department;
					resourceObject.resourceType = $scope.resourceTypeList[i];
					resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]];
					resourceObject.id = $scope.resourceQuota[$scope.resourceTypeList[i]+"id"];
					quotaList.push(resourceObject);
				}
			}

			var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_POST , globalConfig.APP_URL + "resourceDepartments/create" , '', quotaList);
			hasResource.then(function (result) {  // this is only run after $http completes
				$scope.showLoader = false;
				$scope.isDisabledProject = false;
				$scope.formSubmitted = false;
	            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
	        }).catch(function (result) {
	            if (!angular.isUndefined(result.data)) {
	            	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
	              	    var msg = result.data.globalError[0];
	              	  $scope.showLoader = false;
	            	    notify({message: msg, classes: 'alert-info', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
	                } else if (result.data.fieldErrors != null) {
	                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
	                    	  $scope.showLoader = false;
	                        $scope.resourceAllocationForm[key].$invalid = true;
	                        $scope.resourceAllocationForm[key].errorMessage = errorMessage;
	                        $scope.showLoader = false;
	                    });
	            	}
	            }
	        });
		}
	};


	// Save resource limit for project.
	$scope.saveProjectQuota = function(form) {
		$scope.formSubmitted = true;
		if(form.$valid) {
			$scope.showLoader = true;
			var quotaList = [];
			for(var i=0; i < $scope.resourceTypeList.length; i++) {
				if(i != 5) {
					var resourceObject = {};
					resourceObject.domainId = $scope.resourceQuota.domain.id;
					resourceObject.domain = $scope.resourceQuota.domain;
					resourceObject.departmentId = $scope.resourceQuota.department.id;
					resourceObject.department = $scope.resourceQuota.department;
					resourceObject.projectId = $scope.resourceQuota.project.id;
					resourceObject.project = $scope.resourceQuota.project;
					resourceObject.resourceType = $scope.resourceTypeList[i];
					resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]];
					resourceObject.id = $scope.resourceQuota[$scope.resourceTypeList[i]+"id"];
					quotaList.push(resourceObject);
				}
			}

			var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_POST , globalConfig.APP_URL + "resourceProjects/create" , '', quotaList);
			hasResource.then(function (result) {  // this is only run after $http completes
				$scope.formSubmitted = false;
				$scope.showLoader = false;
	            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});

	        }).catch(function (result) {
	            if (!angular.isUndefined(result.data)) {
	            	if (result.data.globalError[0] != '' && !angular.isUndefined(result.data.globalError[0])) {
	              	    var msg = result.data.globalError[0];
	              	  $scope.showLoader = false;
	            	    notify({message: msg, classes: 'alert-info', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
	                } else if (result.data.fieldErrors != null) {
	                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
	                    	  $scope.showLoader = false;
	                        $scope.resourceAllocationForm[key].$invalid = true;
	                        $scope.resourceAllocationForm[key].errorMessage = errorMessage;
	                        $scope.showLoader = false;
	                    });
	            	}
	            }
	        });
		}
	};

	$scope.isDisabledDepartment = false;
	$scope.isDisabledProject = false;

	// Get the departments by domain.
	$scope.getDepartmentsByDomain = function() {
		$scope.showLoader = true;
		$scope.resourceQuota.department = "";
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
				$scope.isDisabledDepartment = true;
				$scope.isDisabledProject = true;
				$scope.resourceQuota.domain = resourceQuota.domain;
				  $scope.showLoader = false;
				notify({message: "Please add the resource limit for company", classes: 'alert-info', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
			}

			angular.forEach(result, function(object, key) {
				i++;
				if(i == 1) {
					$scope.isDisabledDepartment = false;
					$scope.isDisabledProject = false;
					$scope.loadEditOption($scope.domainList, $scope.resourceQuota.domain, object.domain);
				}
				$scope.resourceQuota[object.resourceType] = object.max;
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

	// Get the projects by department.
	$scope.getProjectsByDepartment = function() {
		$scope.showLoader = true;
		$scope.resourceQuota.project="";
		if(angular.isUndefined($scope.resourceQuota.department) || $scope.resourceQuota.department == null) {
			$scope.resourceQuota.department = {id:0};
		}
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/department/"+$scope.resourceQuota.department.id);
		hasResource.then(function (result) {
			$scope.showLoader = false;
			var i=0;
			if(result.length == 0) {
				var resourceQuota = $scope.resourceQuota;
				$scope.resourceQuota = {};
				$scope.isDisabledProject = true;
				$scope.resourceQuota.domain = resourceQuota.domain;
				$scope.resourceQuota.department = resourceQuota.department;
				  $scope.showLoader = false;
				notify({message: "Please add the resource limit for department", classes: 'alert-info', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });
			}

			angular.forEach(result, function(object, key) {
				i++;
				if(i == 1) {
					$scope.isDisabledProject = false;
					$scope.loadEditOption($scope.departmentList, $scope.resourceQuota.department, object.department);
				}
				$scope.resourceQuota[object.resourceType] = object.max;
			});
        });


		var hasDepartmentId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "projects/department/"+$scope.resourceQuota.department.id);
		hasDepartmentId.then(function (result) {  // this is only run after $http completes
			$scope.projectList = result;
        });
	};

	$scope.getProjectResourceLimits = function() {
		$scope.showLoader = true;
		if(angular.isUndefined($scope.resourceQuota.project) || $scope.resourceQuota.project == null) {
			$scope.resourceQuota.project = {id:0};
		}
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/project/"+$scope.resourceQuota.project.id);
		hasResource.then(function (result) {
			$scope.showLoader = false;
			var i=0;
			if(result.length == 0) {
				var resourceQuota = $scope.resourceQuota;
				$scope.resourceQuota = {};
				$scope.resourceQuota.domain = resourceQuota.domain;
				$scope.resourceQuota.department = resourceQuota.department;
				$scope.resourceQuota.project = resourceQuota.project;

			}

			angular.forEach(result, function(object, key) {
				i++;
				if(i == 1) {
					$scope.loadEditOption($scope.projectList, $scope.resourceQuota.project, object.project);
				}
				$scope.resourceQuota[object.resourceType] = object.max;
			});
			$scope.showLoader = false;
        });
	}
};
