/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('panda-ui-admin').controller('projectListCtrl', projectListCtrl)
		.controller('projectInfraLimitCtrl', projectInfraLimitCtrl).controller(
				'projectInfrastructureCtrl', projectInfrastructureCtrl)
		.controller('invoiceCtrl', invoiceCtrl).controller(
				'addInvoiceItemCtrl', addInvoiceItemCtrl).controller(
				'projectPaymentCtrl', projectPaymentCtrl).controller(
				'projectAddPaymentCtrl', projectAddPaymentCtrl).controller(
				'billingSummaryCtrl', billingSummaryCtrl).controller(
				'projectViewCtrl', projectViewCtrl)

function projectViewCtrl($scope, $state, $stateParams, $window, promiseAjax,
		modalService, notify,appService, crudService) {
	
	 $scope.sort = appService.globalConfig.sort;
	    $scope.changeSorting = appService.utilService.changeSorting;

	if ($stateParams.id > 0) {
		var hasServer = promiseAjax.httpRequest("GET", "api/projects.json");
		hasServer.then(function(result) { // this is only run after $http
											// completes
			var viewId = $stateParams.id;

			var res = result.filter(function(obj) {
				if (obj.hasOwnProperty("id") && obj.id == viewId) {
					return obj;
				}
			}).shift();

			$scope.projectInfo = res;
			$state.current.data.pageTitle = res.firstName;
		});
	}

	$scope.project = {
		category : "billingSummary"
	};

	$scope.showInfraLimit = function() {
		$scope.project.category = "infraLimits";
	}

	$scope.confirmProjectCancellation = function() {
		modalService.trigger('views/client/project/confirm-cancellation.html',
				'sm');
	};

	$scope.cancelProject = function() {
		$scope.cancellingProject = true;
		setTimeout(function() {
			$scope.cancel();
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Project cancelled successfully',
				classes : 'alert-success',
				templateUrl : $scope.homerTemplate
			});
			$window.location.href = '#/client/project';
		}, 1000);
	};

	$scope.confirmProjectSuspension = function() {
		modalService.trigger('views/client/project/confirm-suspension.html',
				'md');
	};

	$scope.suspendProject = function() {
		$scope.suspendingProject = true;
		setTimeout(function() {
			$scope.cancel();
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Project suspended successfully',
				classes : 'alert-success',
				templateUrl : $scope.homerTemplate
			});
			$window.location.href = '#/client/project';
		}, 1000);
	};

};

function billingSummaryCtrl($scope) {

	/**
	 * Options for billingSummary
	 */
	$scope.singleBarChartOptions = {
		scaleBeginAtZero : true,
		scaleShowGridLines : true,
		scaleGridLineColor : "rgba(0,0,0,.05)",
		scaleGridLineWidth : 1,
		barShowStroke : true,
		barStrokeWidth : 1,
		barValueSpacing : 5,
		barDatasetSpacing : 1,
	};

	/**
	 * Data for Invoice Summary
	 */
	$scope.invoiceSummaryData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [ {
			label : "My Second dataset",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 100, 200, 300, 400, 300, 500, 600 ]
		} ]
	};

	/**
	 * Data for Payment Summary
	 */
	$scope.paymentSummaryData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [ {
			label : "Payment Summary",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 100, 200, 300, 400, 300, 500, 600 ]
		} ]
	};

	/**
	 * Custom Item Recurring Itemsummary
	 */
	$scope.reucrringItemSummaryData = {
		labels : [ "January", "February", "March", "April", "May", "June",
				"July" ],
		datasets : [ {
			label : "Recurring Item Summary",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 100, 200, 300, 400, 300, 500, 600 ]
		} ]
	};

	/**
	 * Data for Support Summary
	 */
	$scope.supportSummaryData = {
		labels : [ "Open", "In Progress", "On Hold", "Closed" ],
		datasets : [ {
			label : "Support Summary",
			fillColor : "rgba(72,169,218,0.5)",
			strokeColor : "rgba(72,169,218,0.8)",
			highlightFill : "rgba(72,169,218,0.75)",
			highlightStroke : "rgba(72,169,218,1)",
			data : [ 40, 15, 5, 50 ]
		} ]
	};
}

function projectPaymentCtrl($scope, globalConfig, $modal, promiseAjax) {
	$scope.global = globalConfig;
	$scope.paymentList = {};
	var hasServer = promiseAjax.httpRequest("GET", "api/project-payments.json");
	hasServer.then(function(result) { // this is only run after $http
										// completes
		$scope.paymentList = result;
	});

	$scope.getPaymentForm = function(size, projectInfo) {
		var modalInstance = $modal.open({
			animation : $scope.animationsEnabled,
			templateUrl : 'views/client/project/add-payment.html',
			controller : 'projectAddPaymentCtrl',
			size : size,
			backdrop : 'static',
			windowClass : "hmodal-info",
			resolve : {
				projectInfo : function() {
					return angular.copy(projectInfo);
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;

		}, function() {
		});
	};
};

function projectAddPaymentCtrl($scope, projectInfo, $modalInstance, notify) {
	$scope.projectInfo = projectInfo;
	$scope.payment = {};
	$scope.addPayment = function(form) {
		$scope.formSubmitted = true;
		if (form.$valid) {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Payment added successfully',
				classes : 'alert-success',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
			$scope.cancel();
		}
	};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};

	$scope.open = function($event, currentDateField) {
		$event.preventDefault();
		$event.stopPropagation();

		$scope.payment[currentDateField] = true;
	};

};

function invoiceCtrl($scope, promiseAjax, $modal) {
	$scope.invoiceList = {};
	var hasServer = promiseAjax.httpRequest("GET", "api/invoices.json");
	hasServer.then(function(result) { // this is only run after $http
										// completes
		$scope.invoiceList = result;
	});

	$scope.showDetails = false;
	$scope.currentDate = new Date();
	$scope.toggleInvoiceDetails = function(invoice) {
		$scope.showDetails = ($scope.showDetails) ? false : true;
		$scope.invoice = invoice;
	};

	$scope.breakUpObj = {};
	$scope.showBreakUps = false;
	$scope.breakUpDetailObj = {};
	$scope.showBreakUpDetail = false;
	$scope.showBreakUpPrice = function(obj) {
		$scope.showBreakUps = true;
		$scope.showBreakUpDetail = false;
		$scope.breakUpObj = obj;
	};

	$scope.showItemPrice = function(obj) {
		$scope.showBreakUpDetail = true;
		$scope.breakUpDetailObj = obj;
	};

	$scope.getInvoiceItemForm = function(size) {
		var modalInstance = $modal.open({
			animation : $scope.animationsEnabled,
			templateUrl : 'views/client/project/add-invoice-item.html',
			controller : 'addInvoiceItemCtrl',
			size : size,
			backdrop : 'static',
			windowClass : "hmodal-info",
			resolve : {
				projectInfo : function() {
					return null;
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;

		}, function() {
		});
	};
};

function addInvoiceItemCtrl($scope, $modalInstance, notify) {
	$scope.addPayment = function(form) {
		$scope.formSubmitted = true;
		if (form.$valid) {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Added successfully',
				classes : 'alert-success',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
			$scope.cancel();
		}
	};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};

	$scope.open = function($event, currentDateField) {
		$event.preventDefault();
		$event.stopPropagation();
		$scope.payment[currentDateField] = true;
	};

};

function projectInfrastructureCtrl($scope, globalConfig) {
	$scope.global = globalConfig;
};

function projectInfraLimitCtrl($scope, globalConfig, notify) {
	$scope.global = globalConfig;
	$scope.validateInfraLimit = function(form) {
		$scope.formSubmitted = true;
		if (form.$valid) {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Updated successfully',
				classes : 'alert-success',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
		} else {
			$scope.homerTemplate = 'views/notification/notify.html';
			notify({
				message : 'Please fill all the fields',
				classes : 'alert-danger',
				"timeOut" : "1000",
				templateUrl : $scope.homerTemplate
			});
		}
	};
};

function projectListCtrl($scope, promiseAjax,crudService,notify,appService) {
	 $scope.sort = appService.globalConfig.sort;
	    $scope.changeSorting = appService.utilService.changeSorting;
	$scope.showLoader = true;
	$scope.projectList = {};
	
		var hasUsers = crudService.listAll("projects/listall");
        hasUsers.then(function (result) {  // this is only run after $http completes0
       		$scope.projectList = result;
       		$scope.showLoader = false;
	}).catch(function (result) {
	         if(result.data.globalError[0] != null){
	        	 var msg = result.data.globalError[0];
	        	 $scope.showLoader = false;
	        	 notify({message: msg, classes: 'alert-danger', templateUrl: $scope.global.NOTIFICATION_TEMPLATE });

	             }
              });
};
