function crudService($window, localStorageService, globalConfig, $stateParams, promiseAjax) {
    
    var object = {};
    
    object.globalConfig = globalConfig;
 
    // List all the objects    object.setModuleName = function(moduleName) {
    object.list = function(moduleName, headers, data) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + moduleName +"?sortBy=ASC&limit="+data.limit, headers, data);
    };
    
    object.add = function(moduleName, object) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_POST, globalConfig.APP_URL + moduleName, '', object);
    };
    
    object.read = function(moduleName, id) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_GET , globalConfig.APP_URL + moduleName  +"/"+id, '');
    };
    
    object.update = function(moduleName, object) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_PUT , globalConfig.APP_URL + moduleName  +"/"+object.id, '', object);
    };
    
    object.delete = function(moduleName, id) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_DELETE , globalConfig.APP_URL + moduleName  +"/"+id, '');
    };
    
    return object;
};


/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('crudService', crudService);