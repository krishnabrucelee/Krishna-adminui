function appService(crudService, localStorageService, globalConfig, webSocket, promiseAjax, notify, utilService, dialogService, modalService, sweetAlert, uploadFile, uploadThemeImage) {

	var object = {};

	// Crud related functionalities goes here
	object.crudService = crudService;

	// Local storage service to store data in client side
	object.localStorageService = localStorageService;

	// Global configuration to add configuration vlaues
    object.globalConfig = globalConfig;

    // Application ajax calls goes here
    object.promiseAjax = promiseAjax

    // Application ajax calls goes here
    object.uploadFile = uploadFile

    // Application ajax calls goes here
    object.uploadThemeImage = uploadThemeImage

    // Application notification
    object.notify = notify

    // Applicaiton Utilities
    object.utilService = utilService

    // Application ajax calls goes here
    object.dialogService = dialogService

    // Model service calls goes here
    object.modalService = modalService

    // Sweet alert calls goes here
    object.sweetAlert = sweetAlert

   // WebSocket service call goes here
    object.webSocket = webSocket

    return object;

};


/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('appService', appService);
