/*
 * Domain dashboard controller contains the domain related quota stufffs.
 */

angular
.module('panda-ui-admin')
.controller('domainDashboardCtrl', domainDashboardCtrl)


// Load list page of user
function domainDashboardCtrl($scope, appService) {

    var hasServer = appService.crudService.read("domains", id);
    hasServer.then(function(result) {
    });


};
