function utilService(globalConfig) {

    var object = {};

    object.getReferenceObjet = function(reference) {
    	referenceObject  = {
    			"id": reference.id,
    			"uuid": reference.uuid
    	};
    	return referenceObject;
    };

    object.changeSorting = function(column) {
		var sort = globalConfig.sort;

		if (sort.column == column) {
			sort.descending = !sort.descending;
		} else {
			sort.column = column;
			sort.descending = false;
		}
		return sort.descending;
	};

	object.getBillablTypes = function() {

	};
	
	object.getMonthList = function() {
        return [ {
            'id' : 1,
            'name' : 'January'
        }, {
            'id' : 2,
            'name' : 'February'
        }, {
            'id' : 3,
            'name' : 'March'
        }, {
            'id' : 4,
            'name' : 'April'
        }, {
            'id' : 5,
            'name' : 'May'
        }, {
            'id' : 6,
            'name' : 'June'
        }, {
            'id' : 7,
            'name' : 'July'
        }, {
            'id' : 8,
            'name' : 'August'
        }, {
            'id' : 9,
            'name' : 'September'
        }, {
            'id' : 10,
            'name' : 'October'
        }, {
            'id' : 11,
            'name' : 'November'
        }, {
            'id' : 12,
            'name' : 'December'
        }
        ]
    }

    return object;
};


/**
 * Pass function into module
 */
angular
    .module('panda-ui-admin')
    .factory('utilService', utilService);
