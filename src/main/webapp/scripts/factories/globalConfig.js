/**
 * Pass function into module
 */
angular.module('panda-ui-admin').factory('globalConfig', globalConfig);

function globalConfig($window) {
    var appGlobalConfig = {};

    /**
     *  Global configuration goes here
     */
    appGlobalConfig = {
        project : {
            id : 0,
            name : 'Projects'
        },
        projectList : [ {
            id : 0,
            name : 'Projects'
        }, {
            id : 1,
            name : 'IMS'
        }, {
            id : 2,
            name : 'Programming'
        }, {
            id : 3,
            name : 'Testing'
        } ],
        zone : {
            id : 1,
            name : 'Beijing'
        },
        zoneList : [ {
            id : 1,
            name : 'Beijing'
        }, {
            id : 2,
            name : 'Liaoning'
        }, {
            id : 3,
            name : 'Shanghai'
        }, {
            id : 4,
            name : 'Henan'
        } ],
        settings : {
            currency : "¥",
            currencyLabel : "CNY"
        },
        sort : {
            column : '',
            descending : false,
            sortBy : 'id',
            sortOrder : '+'
        },
        networks : {
            name : ''
        },
        rulesLB : [ {
            name : 'Test',
            'protocol' : 'tcp',
            publicPort : '90',
            privatePort : '90',
            publicEndPort : '120',
            privateEndPort : '120',
            algorithm : 'Round-robin',
            vms : [ {
                id : '',
                name : "NorthChina- Beijing",
                zone : "Beijing"
            } ],
            state : 'active'
        } ],
        Vms : [ '1', '2', '3', '4' ],
        selectedVms : [],
        date : {
            format : 'dd/MMM/yyyy',
            dateOptions : {
                formatYear : 'yy',
                startingDay : 1
            },
            minDate : new Date(),
        },

        HTTP_GET : 'GET',
        HTTP_POST : 'POST',
        HTTP_PUT : 'PUT',
        HTTP_DELETE : 'DELETE',
        CONTENT_LIMIT : 10,
        APP_URL : "http://" + window.location.hostname + ":8080/api/",
        PING_APP_URL : "http://" + window.location.hostname + ":8086/api/",
        BASE_UI_URL : "http://"+ window.location.hostname +":9080/ck-panda-admin-ui/",
        VIEW_URL : 'app/views/',
        NOTIFICATION_TEMPLATE : 'app/views/notification/notify.jsp',
        BILLABLE_ITEM : {
            BILLABLE_TYPE : {
                /** Infrastructure billable type is the default billable items of cloudstack. */
                INFRASTRUCTURE : "Infrastructure",

                /** Additional billable items for panda portal. */
                MANAGED : "Managed",

                /** Optional billable items for panda portal. */
                OPTIONAL : "Optional",
            },
            BILLABLE_UNIT : {
                /** Billable unit per Core per Hour. */
                PER_CORE_PER_HOUR : "Per Core Per Hour",

                /** Billable unit per GB per Hour. */
                PER_GB_PER_HOUR : "Per GB Per Hour",

                /** Billable unit per OS per Hour. */
                PER_OS_PER_HOUR : "Per OS PerHour",

                /** Billable unit per DB per Hour. */
                PER_DB_PER_HOUR : "Per DB Per Hour",

                /** Billable unit per APP per Hour. */
                PER_APP_PER_HOUR : "Per App Per Hour",
            }
        },

        paginationHeaders : function(pageNumber, limit) {
            var headers = {};
            var rangeStart = (pageNumber - 1) * limit;
            var rangeEnd = (pageNumber - 1) * limit + (limit - 1);
            headers.Range = "items=" + rangeStart + "-" + rangeEnd;
            return headers;
        },

        getViewPageUrl : function(url) {
            return appGlobalConfig.VIEW_URL + url;
        },
        sessionValues : JSON.parse($window.sessionStorage.getItem("pandaUserSession")),
        loginRemeberMeTimeout : 30 * 24 * 60 * 60 * 1000
    };

    return appGlobalConfig;

}
