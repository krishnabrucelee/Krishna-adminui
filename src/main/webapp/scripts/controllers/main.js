/**
 *
 * appCtrl
 *
 */

angular
    .module('panda-ui-admin')
    .controller('appCtrl', appCtrl);

function appCtrl($http, $scope, $timeout, $window, globalConfig, localStorageService, promiseAjax, $cookies, appService) {

    // For iCheck purpose only
    $scope.checkOne = true;

    $scope.appLanguage = function() {
        if(localStorageService.cookie.get('language') == null) {
        	var hasConfigs = appService.crudService.listAll("generalconfiguration/configlist");
            hasConfigs.then(function (result) {
                $scope.generalconfiguration = result[0];
                if ($scope.generalconfiguration.defaultLanguage == 'Chinese') {
                	localStorageService.cookie.set('language', 'zh');
                } else {
                	localStorageService.cookie.set('language', 'en');
                }
            });
        }
        return localStorageService.cookie.get('language');
    }();


    /**
     * Sparkline bar chart data and options used in under Profile image on left navigation panel
     */

    $scope.barProfileData = [5, 6, 7, 2, 0, 4, 2, 4, 5, 7, 2, 4, 12, 11, 4];
    $scope.barProfileOptions = {
        type: 'bar',
        barWidth: 7,
        height: '30px',
        barColor: '#62cb31',
        negBarColor: '#53ac2a'
    };
    $scope.chartIncomeData = [
        {
            label: "line",
            data: [ [1, 10], [2, 26], [3, 16], [4, 36], [5, 32], [6, 51] ]
        }
    ];

    $scope.chartIncomeOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 0,
                fill: true,
                fillColor: "#64cc34"

            }
        },
        colors: ["#62cb31"],
        grid: {
            show: false
        },
        legend: {
            show: false
        }
    };

    /**
     * Tooltips and Popover - used for tooltips in components view
     */
    $scope.dynamicTooltip = 'Hello, World!';
    $scope.htmlTooltip = "I\'ve been made <b>bold</b>!";
    $scope.dynamicTooltipText  = 'Dynamic';
    $scope.dynamicPopover = 'Hello, World!';
    $scope.dynamicPopoverTitle = 'Title';

    /**
     * Pagination - used for pagination in components view
     */
    $scope.totalItems = 64;
    $scope.currentPage = 4;

    $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
    };

    /**
     * Typehead - used for typehead in components view
     */
    $scope.states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Dakota', 'North Carolina', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'];
    // Any function returning a promise object can be used to load values asynchronously
    $scope.getLocation = function(val) {
        return $http.get('http://maps.googleapis.com/maps/api/geocode/json', {
            params: {
                address: val,
                sensor: false
            }
        }).then(function(response){
                return response.data.results.map(function(item){
                    return item.formatted_address;
                });
            });
    };

    /**
     * Rating - used for rating in components view
     */
    $scope.rate = 7;
    $scope.max = 10;

    $scope.hoveringOver = function(value) {
        $scope.overStar = value;
        $scope.percent = 100 * (value / this.max);
    };

    /**
     * groups - used for Collapse panels in Tabs and Panels view
     */
    $scope.groups = [
        {
            title: 'Dynamic Group Header - 1',
            content: 'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. '
        },
        {
            title: 'Dynamic Group Header - 2',
            content: 'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. '
        }
    ];

    $scope.oneAtATime = true;

    /**
     * Some Flot chart data and options used in Home
     */

    var data1 = [ [0, 55], [1, 48], [2, 40], [3, 36], [4, 40], [5, 60], [6, 50], [7, 51] ];
    var data2 = [ [0, 56], [1, 49], [2, 41], [3, 38], [4, 46], [5, 67], [6, 57], [7, 59] ];

    $scope.chartUsersData = [data1, data2];
    $scope.chartUsersOptions = {
        series: {
            splines: {
                show: true,
                tension: 0.4,
                lineWidth: 1,
                fill: 0.4
            },
        },
        grid: {
            tickColor: "#f0f0f0",
            borderWidth: 1,
            borderColor: 'f0f0f0',
            color: '#6a6c6f'
        },
        colors: [ "#62cb31", "#efefef"],
    };


    /**
     * Some Pie chart data and options
     */

    $scope.PieChart = {
        data: [1, 5],
        options: {
            fill: ["#62cb31", "#edf0f5"]
        }
    };

    $scope.PieChart2 = {
        data: [226, 360],
        options: {
            fill: ["#62cb31", "#edf0f5"]
        }
    };
    $scope.PieChart3 = {
        data: [0.52, 1.561],
        options: {
            fill: ["#62cb31", "#edf0f5"]
        }
    };
    $scope.PieChart4 = {
        data: [1, 4],
        options: {
            fill: ["#62cb31", "#edf0f5"]
        }
    };
    $scope.PieChart5 = {
        data: [226, 134],
        options: {
            fill: ["#62cb31", "#edf0f5"]
        }
    };
    $scope.PieChart6 = {
        data: [0.52, 1.041],
        options: {
            fill: ["#62cb31", "#edf0f5"]
        }
    };

    $scope.BarChart = {
        data: [5, 3, 9, 6, 5, 9, 7, 3, 5, 2],
        options: {
            fill: ["#dbdbdb", "#62cb31"],
        }
    };

    $scope.LineChart = {
        data: [5, 9, 7, 3, 5, 2, 5, 3, 9, 6, 5, 9, 4, 7, 3, 2, 9, 8, 7, 4, 5, 1, 2, 9, 5, 4, 7],
        options: {
            fill: '#62cb31',
            stroke: '#62cb31',
            width: 64
        }
    };


    $scope.stanimation = 'bounceIn';
    $scope.runIt = true;
    $scope.runAnimation = function(){

        $scope.runIt = false;
        $timeout(function(){
            $scope.runIt = true;
        }, 100)

    };

    // Update language
    $scope.updateLanguage = function(language) {
        if(localStorageService.cookie.get('language') == 'en') {
                localStorageService.cookie.set('language', 'zh');
        } else {
                localStorageService.cookie.set('language', 'en');
        }
        $window.location.reload();
    }

    /**
     *  Logout a user.
     */
    $scope.logout = function() {
    	appService.utilService.logoutApplication("LOGOUT");
    }


    /**
     *  Data for Doughnut chart
     */
    $scope.doughnutOptions = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 0,
        percentageInnerCutout: 85, // This is 0 for Pie charts
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: false,
        animateScale: false,

        customTooltips: function customTooltips(tooltip){
            // Tooltip Element
            var tooltipEl = $('#chartjs-customtooltip');
            // Make the element if not available
            if (!tooltipEl[0]) {
                $('body').append('<div id="chartjs-customtooltip"></div>');
                tooltipEl = $('#chartjs-customtooltip');
            }
            // Hide if no tooltip
            if (!tooltip) {
                tooltipEl.css({
                    opacity: 0
                });
                return;
            }
            // Set caret Position
            tooltipEl.removeClass('above below no-transform');
            if (tooltip.yAlign) {
                tooltipEl.addClass(tooltip.yAlign);
            } else {
                tooltipEl.addClass('no-transform');
            }
            // Set Text
            if (tooltip.text) {
                tooltipEl.html(tooltip.text);
            } else {
                var innerHtml = '<div class="title">' + tooltip.title + '</div>';
                for (var i = 0; i < tooltip.labels.length; i++) {
                    innerHtml += [
                        '<div class="section">',
                        '   <span class="key" style="background-color:' + tooltip.legendColors[i].fill + '"></span>',
                        '   <span class="value">' + tooltip.labels[i] + '</span>',
                        '</div>'
                    ].join('');
                }
                tooltipEl.html(innerHtml);
            }
            // Find Y Location on page
            var top = 0;
            if (tooltip.yAlign) {
                if (tooltip.yAlign == 'above') {
                    top = tooltip.y - tooltip.caretHeight - tooltip.caretPadding;
                } else {
                    top = tooltip.y + tooltip.caretHeight + tooltip.caretPadding;
                }
            }
            var offset = $(tooltip.chart.canvas).offset();

            // Display, position, and set styles for font
            tooltipEl.css({
                opacity: 1,
                width: tooltip.width ? (tooltip.width + 'px') : 'auto',
                left: offset.left + tooltip.x + 'px',
                top: offset.top + top + 'px',
                fontFamily: tooltip.fontFamily,
                fontSize: tooltip.fontSize,
                fontStyle: tooltip.fontStyle,
            });
        }
    };

    $scope.doughnutData1 = [
        {
            value: 42,
            color: "#f0ad4e",
            highlight: "#f0ad4e",
            label: "Used"

        },
        {
            value: 58,
            color: "#ebf1f4",
            highlight: "#ebf1f4",
            label: "UnUsed"
        }
    ];

    $scope.doughnutData2 = [
	{
            value: 73,
            color: "#f0ad4e",
            highlight: "#f0ad4e",
            label: "Used"
        },
        {
            value: 17,
            color: "#ebf1f4",
            highlight: "#ebf1f4",
            label: "UnUsed"
        }

    ];
    $scope.doughnutData3 = [
	{
            value: 22,
            color: "#48a9da",
            highlight: "#48a9da",
            label: "Used"
        },
        {
            value: 78,
            color: "#ebf1f4",
            highlight: "#ebf1f4",
            label: "UnUsed"
        }

    ];
    $scope.doughnutData4 = [
	{
            value: 88,
            color: "#df6457",
            highlight: "#df6457",
            label: "Used"
        },
        {
            value: 12,
            color: "#ebf1f4",
            highlight: "#ebf1f4",
            label: "UnUsed"
        }

    ];


    /**
     *  Global configuration goes here
     */
    $scope.global = globalConfig;


    $scope.regionList = [
        {
            name: "Region1",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,
                    id: 4,
                    id: 5,
                    id: 6,
                }
            ]
        },
        {
            name: "Region2",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,
                    id: 4,
                    id: 5,
                    id: 6,
                }
            ]
        },
        {
            name: "Region3",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,
                    id: 4,
                    id: 5,
                    id: 6,
                }
            ]
        },
        {
            name: "Region4",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,
                    id: 4,
                    id: 5,
                    id: 6,
                }
            ]
        },
        {
            name: "Region5",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,
                    id: 4,
                    id: 5,
                    id: 6,
                }
            ]
        },
        {
            name: "Region6",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,
                    id: 4,
                }
            ]
        },
        {
            name: "Region7",
            zoneList: [
                {
                    id: 1,
                    id: 2,
                    id: 3,

                }
            ]
        },
    ]

}
