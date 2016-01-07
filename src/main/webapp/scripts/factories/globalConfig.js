/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('globalConfig', globalConfig);


function globalConfig($window) {
    var appGlobalConfig = {};

    /**
     *  Global configuration goes here
     */
    appGlobalConfig = {
        project:{id:0, name:'Projects'},
        projectList:[{id:0, name:'Projects'},{id:1, name:'IMS'},{id:2, name:'Programming'},{id:3, name:'Testing'}],
        zone:{id:1, name:'Beijing'},
        zoneList:[{id:1, name:'Beijing'},{id:2, name:'Liaoning'},{id:3, name:'Shanghai'},{id:4, name:'Henan'}],
        settings: {
            currency : "¥",
            currencyLabel:"CNY"
        },
        sort : {
    		column : '',
    		descending : false
    	},
        networks:{
            name:''
        },
        rulesLB:[{name:'Test','protocol':'tcp',publicPort:'90',privatePort:'90',publicEndPort:'120',privateEndPort:'120',algorithm:'Round-robin',vms:[{id:'',name: "NorthChina- Beijing",zone:"Beijing"}],state:'active'}],
        Vms:['1','2','3','4'],
        selectedVms:[],
        date: {
            format:'dd/MMM/yyyy',
            dateOptions: {
                formatYear: 'yy',
                startingDay: 1
            },
            minDate:  new Date(),
        },

        HTTP_GET: 'GET',
        HTTP_POST: 'POST',
        HTTP_PUT: 'PUT',
        HTTP_DELETE: 'DELETE',
        NOTIFICATION_TEMPLATE: 'views/notification/notify.html',
        CONTENT_LIMIT: 10,
        APP_URL: "http://localhost:8080/api/",
        CONTENT_LIMIT: 10,
        VIEW_URL : 'app/views/',
        NOTIFICATION_TEMPLATE: 'app/views/notification/notify.jsp',

        paginationHeaders: function(pageNumber, limit) {
            var headers = {};

            var rangeStart = (pageNumber - 1) * limit;
            var rangeEnd = (pageNumber - 1) * limit + (limit - 1);
            headers.Range = "items=" + rangeStart + "-" + rangeEnd;
            return headers;
        },

        getViewPageUrl: function(url) {
                return appGlobalConfig.VIEW_URL + url;
        },
        sessionValues:  JSON.parse($window.sessionStorage.getItem("pandaUserSession"))
    };

    return appGlobalConfig;

}
