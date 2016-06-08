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
	$scope.resourceAllocationField = {};
	    $scope.resourceAllocationError = true;

       Math.round = (function() {
    	  var originalRound = Math.round;
    	  return function(number, precision) {
    	    precision = Math.abs(parseInt(precision)) || 0;
    	    var multiplier = Math.pow(10, precision);
    	    return (originalRound(number * multiplier) / multiplier);
    	  };
    	})();

    // Domain List
    var hasDomains = crudService.listAll("domains/list");
    hasDomains.then(function (result) {
    	$scope.domainList = result;
    	$state.current.data.pageName = result.name;
    });

    if($stateParams.id > 0) {
    	 var hasDomains = crudService.read("domains",$stateParams.id);
    	    hasDomains.then(function (result) {
    	    	 $scope.resourceQuota.domain = result;
    	    	$state.current.data.pageName = result.name;
    	    	$scope.domainName = $state.current.data.pageName;
    	    	$scope.type = "domain-quota";
    	    	$scope.getDomain($scope.resourceQuota.domain);
    	    });


    		var hasResourceDepartmentsId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/domainId/"+$stateParams.id);
    		hasResourceDepartmentsId.then(function (result) {  // this is only run after $http completes
    			$scope.resourceDepartmentCount = result;
            });

    		var hasResourceProjectsId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/domainId/"+$stateParams.id);
    		hasResourceProjectsId.then(function (result) {  // this is only run after $http completes
    			$scope.resourceProjectCount = result;
            });


    }

	$scope.getDomain = function(domain) {
		$scope.isResourceDefined = 'defined';
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domain/"+ domain.id);
		var hasSumOfDomainMin = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domainmin/"+$scope.resourceQuota.domain.id);
		hasSumOfDomainMin.then(function (result) {  // this is only run after $http completes
			$scope.hasSumOfDomainMin = result;
                        angular.forEach(result, function(object, key) {
		            if (key == "Memory") {
                                $scope.hasSumOfDomainMin.Memory = object/1024;
		            }
                        });
        });
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
                                if (object.resourceType == "Memory" && object.max != -1) {
                    			$scope.resourceQuota[object.resourceType] = Math.round(((object.max)/1024),1);
               			 } else {
                    			$scope.resourceQuota[object.resourceType] = object.max;
                		}
				$scope.resourceQuota[object.resourceType+"id"] = object.id;
			});
        })
	};

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
                                if(i == 5) {
					var resourceObject = {};
					resourceObject.domainId = $scope.resourceQuota.domain.id;
					resourceObject.domain = $scope.resourceQuota.domain;
					resourceObject.resourceType = $scope.resourceTypeList[i];
					resourceObject.max = -1;
					resourceObject.id = $scope.resourceQuota[$scope.resourceTypeList[i]+"id"];
					quotaList.push(resourceObject);
				}
                                $scope.validateRange('domain', resourceObject.max, resourceObject.resourceType);
                                if ( resourceObject.resourceType == "Memory" && resourceObject.max != -1) {
				     resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]] * 1024;
		                 } else {
		            	     resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]];
                                     $scope.validateRange('domain', resourceObject.max, resourceObject.resourceType);
				 }
                                 quotaList.push(resourceObject);
			}
			if ($scope.resourceAllocationError) {
	                        $scope.showLoader = true;
			var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_POST , globalConfig.APP_URL + "resourceDomains/create" , '', quotaList);
			hasResource.then(function (result) {  // this is only run after $http completes
				angular.forEach(result, function(obj, key) {
					$scope.resourceQuota[$scope.resourceTypeList[i]+"id"] = obj.id;
				});
				$scope.showLoader = false;
				$scope.formSubmitted = false;
				$scope.isDisabledDepartment = false;
				$scope.isDisabledProject = false;
	            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
	            $scope.resourceAllocationError = true;
	            $state.reload();
	        }).catch(function (result) {
	            if (!angular.isUndefined(result.data)) {
	            	if (result.data.fieldErrors != null) {
	                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
	                    	  $scope.showLoader = false;
	                        $scope.resourceAllocationForm[key].$invalid = true;
	                        $scope.resourceAllocationForm[key].errorMessage = errorMessage;
	                    });
	            	}
	            }
	        });
		} else {
		    $scope.resourceAllocationError = true;
		}
		}
	};

	 $scope.validateRange = function(resource, valueObj, key) {
	        if (key !== 'Project') {
	            var value = valueObj;
	            var min = 0;
	            var max = 0;
	            switch (resource) {
	                case "domain":
	                    min = $scope.hasSumOfDomainMin[key];
	                    max = value;
	                    break;
	                case "department":
	                    min = $scope.hasSumOfDepartmentMin[key];
	                    max = $scope.hasSumOfDepartmentMax[key];
	                    break;
	                case "project":
	                    min = $scope.hasSumOfProjectMin[key];
	                    max = $scope.hasSumOfProjectMax[key];
	                    break;

	            }

	            if (angular.isUndefined($scope.resourceAllocationField[key])) {
	                $scope.resourceAllocationField[key] = {};
	            }
                    if (angular.isUndefined($scope.resourceAllocationForm[key])) {
	                $scope.resourceAllocationForm[key] = {};
	            }
	            if (value >= min && value <= max) {
	                $scope.resourceAllocationField[key].$invalid = false;
	            } else {
	                if (max == -1) {
	                    if(max != value){
	                        if(value >= 0) {
	                            $scope.resourceAllocationField[key].$invalid = false;
	                        } else {
	                            $scope.resourceAllocationField[key].$invalid = true;
	                            $scope.resourceAllocationError = false;
	                            if (max == -1) {
	                                $scope.resourceAllocationForm[key].errorMessage = key + ' limit should be ' + min + ' to unlimited';
	                            } else {
	                                $scope.resourceAllocationForm[key].errorMessage = key + ' limit should be between ' + Math.round((min),1) + ' and ' + Math.round((max),1);
	                            }
	                        }
	                    } else {
	                        $scope.resourceAllocationField[key].$invalid = false;
	                    }
	                } else {
	                    $scope.resourceAllocationField[key].$invalid = true;
	                    $scope.resourceAllocationError = false;
	                    if (max == -1) {
	                        $scope.resourceAllocationForm[key].errorMessage = key + ' limit should be ' + min + ' to unlimited';
	                    } else {
	                        $scope.resourceAllocationForm[key].errorMessage = key + ' limit should be between ' + Math.round((min),1) + ' and ' + Math.round((max),1);
	                    }

	                }
	           }
	        }
	    }


	// Save resource limit for department.
	$scope.saveDepartmentQuota = function(form) {
		$scope.formSubmitted = true;
		if(form.$valid) {
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
                    if(i == 5) {
					var resourceObject = {};
					resourceObject.domainId = $scope.resourceQuota.domain.id;
					resourceObject.domain = $scope.resourceQuota.domain;
					resourceObject.departmentId = $scope.resourceQuota.department.id;
					resourceObject.department = $scope.resourceQuota.department;
					resourceObject.resourceType = $scope.resourceTypeList[i];
					resourceObject.max = -1;
					resourceObject.id = $scope.resourceQuota[$scope.resourceTypeList[i]+"id"];
					quotaList.push(resourceObject);
				}
                                $scope.validateRange('department', resourceObject.max, resourceObject.resourceType);
                                if ( resourceObject.resourceType == "Memory" && resourceObject.max != -1 ) {
				     resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]] * 1024;
		                 } else {
		            	     resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]];
                                     $scope.validateRange('department', resourceObject.max, resourceObject.resourceType);
				 }
                                 quotaList.push(resourceObject);
			}
			if ($scope.resourceAllocationError) {
                        $scope.showLoader = true;
			var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_POST , globalConfig.APP_URL + "resourceDepartments/create" , '', quotaList);
			hasResource.then(function (result) {  // this is only run after $http completes
				angular.forEach(result, function(obj, key) {
					$scope.resourceQuota[$scope.resourceTypeList[i]+"id"] = obj.id;
				});
				$scope.showLoader = false;
				$scope.isDisabledProject = false;
				$scope.formSubmitted = false;
	            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
	            $scope.resourceAllocationError = true;
	            $state.reload();
	        }).catch(function (result) {
	            if (!angular.isUndefined(result.data)) {
	            	 if (result.data.fieldErrors != null) {
	                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
	                    	  $scope.showLoader = false;
	                        $scope.resourceAllocationForm[key].$invalid = true;
	                        $scope.resourceAllocationForm[key].errorMessage = errorMessage;
	                    });
	            	}
	            }
	        });
		} else {
		    $scope.resourceAllocationError = true;
		}
		}
	};


	// Save resource limit for project.
	$scope.saveProjectQuota = function(form) {
		$scope.formSubmitted = true;
		if(form.$valid) {
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
                                if(i == 5) {
					var resourceObject = {};
					resourceObject.domainId = $scope.resourceQuota.domain.id;
					resourceObject.domain = $scope.resourceQuota.domain;
					resourceObject.departmentId = $scope.resourceQuota.department.id;
					resourceObject.department = $scope.resourceQuota.department;
					resourceObject.projectId = $scope.resourceQuota.project.id;
					resourceObject.project = $scope.resourceQuota.project;
					resourceObject.resourceType = $scope.resourceTypeList[i];
					resourceObject.max = -1;
					resourceObject.id = $scope.resourceQuota[$scope.resourceTypeList[i]+"id"];
					quotaList.push(resourceObject);
				}
                                $scope.validateRange('project', resourceObject.max, resourceObject.resourceType);
				if ( resourceObject.resourceType == "Memory" && resourceObject.max != -1) {
				     resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]] * 1024;
		                } else {
		            	     resourceObject.max = $scope.resourceQuota[$scope.resourceTypeList[i]];
                                     $scope.validateRange('project', resourceObject.max, resourceObject.resourceType);
				}
                                quotaList.push(resourceObject);
			}
			if ($scope.resourceAllocationError) {
	                        $scope.showLoader = true;
			var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_POST , globalConfig.APP_URL + "resourceProjects/create" , '', quotaList);
			hasResource.then(function (result) {  // this is only run after $http completes
				angular.forEach(result, function(obj, key) {
					$scope.resourceQuota[$scope.resourceTypeList[i]+"id"] = obj.id;
				});
				$scope.formSubmitted = false;
				$scope.showLoader = false;
	            notify({message: 'Updated successfully', classes: 'alert-success', templateUrl: $scope.global.NOTIFICATION_TEMPLATE});
	            $state.reload();
	            $scope.resourceAllocationError = true;
	        }).catch(function (result) {
	            if (!angular.isUndefined(result.data)) {
	            	 if (result.data.fieldErrors != null) {
	                    angular.forEach(result.data.fieldErrors, function (errorMessage, key) {
	                    	  $scope.showLoader = false;
	                        $scope.resourceAllocationForm[key].$invalid = true;
	                        $scope.resourceAllocationForm[key].errorMessage = errorMessage;
	                    });
	            	}
	            }
	        });
		} else {
		    $scope.resourceAllocationError = true;
		}
		}
	};

	$scope.isDisabledDepartment = false;
	$scope.isDisabledProject = false;

	// Get the departments by domain.
	$scope.getDepartmentsByDomain = function() {

		$scope.resource ='domain';
		$scope.isResourceDefined = 'defined';


		$scope.showLoader = true;
		$scope.resourceQuota.department = "";
		$scope.resourceQuota.project = "";
		if(angular.isUndefined($scope.resourceQuota.domain)) {
			$state.reload();
			$scope.showLoader = false;
			$scope.isResourceDefined = 'undefined';
		}
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domain/"+$scope.resourceQuota.domain.id);
		var hasSumOfDomainMin = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/domainmin/"+$scope.resourceQuota.domain.id);
		hasSumOfDomainMin.then(function (result) {  // this is only run after $http completes
			$scope.hasSumOfDomainMin = result;
                        angular.forEach(result, function(object, key) {
		            if (key == "Memory") {
                                $scope.hasSumOfDomainMin.Memory = object/1024;
		            }
                        });
        });
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
				if (object.resourceType == "Memory" && object.max != -1) {
                    			$scope.resourceQuota[object.resourceType] = Math.round(((object.max)/1024),1);
               			 } else {
                    			$scope.resourceQuota[object.resourceType] = object.max;
                		}
				$scope.resourceQuota[object.resourceType+"id"] = object.id;
			});
        })

		var hasdomainId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "departments/domain/"+$scope.resourceQuota.domain.id);
		hasdomainId.then(function (result) {  // this is only run after $http completes
			$scope.departmentList = result;
        });

		var hasResourceDepartmentsId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/domainId/"+$scope.resourceQuota.domain.id);
		hasResourceDepartmentsId.then(function (result) {  // this is only run after $http completes
			$scope.resourceDepartmentCount = result;
        });

		var hasResourceProjectsId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/domainId/"+$scope.resourceQuota.domain.id);
		hasResourceProjectsId.then(function (result) {  // this is only run after $http completes
			$scope.resourceProjectCount = result;
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
		$scope.resource ='department';
		$scope.isResourceDefined = 'defined';
		$scope.showLoader = true;
		$scope.resourceQuota.project= "";
		if(angular.isUndefined($scope.resourceQuota.department) || $scope.resourceQuota.department == null) {
			$scope.resourceQuota.department = {id:0};
			$scope.isResourceDefined = 'undefined';
		}
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/department/"+$scope.resourceQuota.department.id);
		var hasSumOfDepartmentMin = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/departmentmin/"+$scope.resourceQuota.department.id);
		hasSumOfDepartmentMin.then(function (result) {  // this is only run after $http completes
			$scope.hasSumOfDepartmentMin = result;
                        angular.forEach(result, function(object, key) {
		            if (key == "Memory") {
                                $scope.hasSumOfDepartmentMin.Memory = object/1024;
		            }
                        });
        });
		var hasSumOfDepartmentMax = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/departmentmax/"+$scope.resourceQuota.department.id);
		hasSumOfDepartmentMax.then(function (result) {  // this is only run after $http completes
			$scope.hasSumOfDepartmentMax = result;
                        angular.forEach(result, function(object, key) {
		            if (key == "Memory" && object != -1) {
                                $scope.hasSumOfDepartmentMax.Memory = object/1024;
		            }
                        });
        });
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
                                if (object.resourceType == "Memory" && object.max != -1) {
                    			$scope.resourceQuota[object.resourceType] = Math.round(((object.max)/1024),1);
                		} else {
                   			 $scope.resourceQuota[object.resourceType] = object.max;
                		}
				$scope.resourceQuota[object.resourceType+"id"] = object.id;
			});
        });


		var hasDepartmentId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "projects/department/"+$scope.resourceQuota.department.id);
		hasDepartmentId.then(function (result) {  // this is only run after $http completes
			$scope.projectList = result;
        });


		var hasResourceDomainId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/departmentId/"+$scope.resourceQuota.department.domain.id);
		hasResourceDomainId.then(function (result) {  // this is only run after $http completes
			$scope.resourceDomainCount = result;
        });

		var hasResourceProjectsId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/departmentId/"+$scope.resourceQuota.department.id);
		hasResourceProjectsId.then(function (result) {  // this is only run after $http completes
			$scope.resourceProjectCount = result;
        });


	};

	$scope.getProjectResourceLimits = function() {
		$scope.resourceQuota.department.type = "";
		$scope.resource ='project';
		$scope.isResourceDefined = 'defined';

		$scope.showLoader = true;
		if(angular.isUndefined($scope.resourceQuota.project) || $scope.resourceQuota.project == null) {
			$scope.resourceQuota.project = {id:0};
			$scope.showLoader = false;
			$scope.isResourceDefined = 'undefined';
		}
		var hasResource = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/project/"+$scope.resourceQuota.project.id);
		var hasSumOfProjectMin = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/projectmin/"+$scope.resourceQuota.project.id);
		hasSumOfProjectMin.then(function (result) {  // this is only run after $http completes
			$scope.hasSumOfProjectMin = result;
                        angular.forEach(result, function(object, key) {
		            if (key == "Memory") {
                                $scope.hasSumOfProjectMin.Memory = object/1024;
		            }
                        });
        });
		var hasSumOfProjectMax = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceProjects/projectmax/"+$scope.resourceQuota.project.id);
		hasSumOfProjectMax.then(function (result) {  // this is only run after $http completes
			$scope.hasSumOfProjectMax = result;
                        angular.forEach(result, function(object, key) {
		            if (key == "Memory" && object != -1) {
                                $scope.hasSumOfProjectMax.Memory = object/1024;
		            }
                        });
        });
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
				if (object.resourceType == "Memory" && object.max != -1) {
                    			$scope.resourceQuota[object.resourceType] = Math.round(((object.max)/1024),1);
                		} else {
                   			 $scope.resourceQuota[object.resourceType] = object.max;
                		}
				$scope.resourceQuota[object.resourceType+"id"] = object.id;
			});
			$scope.showLoader = false;
        });

		var hasResourceDomainId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDomains/projectId/"+$scope.resourceQuota.project.domain.id);
		hasResourceDomainId.then(function (result) {  // this is only run after $http completes
			$scope.resourceDomainCount = result;
        });

		var hasResourceDepartmentsId = promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + "resourceDepartments/projectId/"+$scope.resourceQuota.project.department.id);
		hasResourceDepartmentsId.then(function (result) {  // this is only run after $http completes
			$scope.resourceDepartmentCount = result;
        });
	}
	$scope.type = $stateParams.view;
//	if($stateParams.quotaType == 'domain-quota') {
//		$scope.
//;
//	}
};
