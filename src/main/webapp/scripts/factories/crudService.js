function crudService($window, localStorageService, globalConfig, $stateParams, promiseAjax) {

    var object = {};

    object.globalConfig = globalConfig;

     object.list = function(moduleName, headers, data) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + moduleName +"?lang=" + localStorageService.cookie.get('language') + "&sortBy="+globalConfig.sort.sortOrder+globalConfig.sort.sortBy+"&limit="+data.limit, headers, data);
    };

    object.listAll = function(moduleName) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + moduleName +"?lang=" + localStorageService.cookie.get('language')+"&sortBy=-id");
    };

    object.listByQuery = function(moduleNameWithQuery) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + moduleNameWithQuery);
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

    object.filterList = function(moduleName, data) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_GET, globalConfig.APP_URL + moduleName +"?filter="+data);
    };

    object.softDelete = function(moduleName, object) {
        return promiseAjax.httpTokenRequest( globalConfig.HTTP_DELETE , globalConfig.APP_URL + moduleName  +"/delete/"+object.id+"?lang=" + localStorageService.cookie.get('language'), '', object);
    };

    return object;
};


/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('crudService', crudService);
