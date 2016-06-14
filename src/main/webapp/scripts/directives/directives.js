/**
 * HOMER - Responsive Admin Theme
 * Copyright 2015 Webapplayers.com
 *
 */

angular
        .module('panda-ui-admin')
        .directive('pageTitle', pageTitle)
        .directive('sideNavigation', sideNavigation)
        .directive('minimalizaMenu', minimalizaMenu)
        .directive('sparkline', sparkline)
        .directive('icheck', icheck)
        .directive('panelTools', panelTools)
        .directive('smallHeader', smallHeader)
        .directive('animatePanel', animatePanel)
        .directive('landingScrollspy', landingScrollspy)
        .directive('validNumber', validNumber)
        .directive('validDecimal', validDecimal)
        .directive('validCidr', validCidr)
        .directive('pandaModalHeader', pandaModalHeader)
        .directive('appCurrency', appCurrency)
        .directive('appCurrencyLabel', appCurrencyLabel)
        .directive('appClock', appClock)
        .directive('paginationContent', paginationContent)
        .directive('paginationContentIso', paginationContentIso)
        .directive('getLoaderImage', getLoaderImage)
        .directive('getCustomLoaderImage', getCustomLoaderImage)
        .directive('getLoginLoaderImage', getLoginLoaderImage)
        .directive('validInteger', validInteger)
        .directive('hasPermission', hasPermission)
        .directive('pandaQuickSearch', pandaQuickSearch)
        .directive('validPrice', validPrice)
        .directive('validCharacters', validCharacters)
        .directive('fileModel', fileModel)
        .directive('splash', splash)

/**
 * pageTitle - Directive for set Page title - mata title
 */
function pageTitle($rootScope, $timeout, localStorageService) {
    return {
        link: function (scope, element) {

            var listener = function (event, toState, toParams, fromState, fromParams) {
                var themeSettings = localStorageService.get('themeSettings');
                // Default title
                if(themeSettings == null || typeof(themeSettings) == "undefined") {
                    headerTitle = "Panda";
                } else {
                    headerTitle = themeSettings.data.headerTitle;
                }
                var title = headerTitle;

                // Create your own title pattern
                if (toState.data && toState.data.pageTitle)
                    title = headerTitle + ' | ' + toState.data.pageTitle;
                $timeout(function () {
                    element.text(title);
                });
            };

            $rootScope.$on('$stateChangeStart', listener);
        }
    }
}
;

/**
 * sideNavigation - Directive for run metsiMenu on sidebar navigation
 */
function sideNavigation($timeout) {
    return {
        restrict: 'A',
        link: function (scope, element) {
            // Call the metsiMenu plugin and plug it to sidebar navigation
            element.metisMenu();

            // Colapse menu in mobile mode after click on element
            var menuElement = $('#side-menu a:not([href$="\\#"])');
            menuElement.click(function () {

                if ($(window).width() < 769) {
                    $("body").toggleClass("show-sidebar");
                }
            });


        }
    };
}
;

/**
 * minimalizaSidebar - Directive for minimalize sidebar
 */
function minimalizaMenu($rootScope) {
    return {
        restrict: 'EA',
        template: '<div class="header-link hide-menu" ng-click="minimalize()"><a class="nav-icons" ><i class="fa fa-bars"></a></i></div>',
        controller: function ($scope, $element) {

            $scope.minimalize = function () {
                if ($(window).width() < 769) {
                    $("body").toggleClass("show-sidebar");
                } else {
                    $("body").toggleClass("hide-sidebar");
                }
            }
        }
    };
}
;

/**
 * minimalizaSidebar - Directive for minimalize sidebar
 */
function splash() {
    return {
        restrict: 'EA',
        controller: function ($scope, localStorageService) {
           $scope.splashTitle = localStorageService.get('splashTitle');
        }
    };
};

/**
 * sparkline - Directive for Sparkline chart
 */
function sparkline() {
    return {
        restrict: 'A',
        scope: {
            sparkData: '=',
            sparkOptions: '=',
        },
        link: function (scope, element, attrs) {
            scope.$watch(scope.sparkData, function () {
                render();
            });
            scope.$watch(scope.sparkOptions, function () {
                render();
            });
            var render = function () {
                $(element).sparkline(scope.sparkData, scope.sparkOptions);
            };
        }
    }
}
;

/**
 * icheck - Directive for custom checkbox icheck
 */
function icheck($timeout) {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function ($scope, element, $attrs, ngModel) {
            return $timeout(function () {
                var value;
                value = $attrs['value'];

                $scope.$watch($attrs['ngModel'], function (newValue) {
                    $(element).iCheck('update');
                })

                return $(element).iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green'

                }).on('ifChanged', function (event) {
                    if ($(element).attr('type') === 'checkbox' && $attrs['ngModel']) {
                        $scope.$apply(function () {
                            return ngModel.$setViewValue(event.target.checked);
                        });
                    }
                    if ($(element).attr('type') === 'radio' && $attrs['ngModel']) {
                        return $scope.$apply(function () {
                            return ngModel.$setViewValue(value);
                        });
                    }
                });
            });
        }
    };
}


/**
 * panelTools - Directive for panel tools elements in right corner of panel
 */
function panelTools($timeout) {
    return {
        restrict: 'A',
        scope: true,
        templateUrl: 'views/common/panel_tools.html',
        controller: function ($scope, $element) {
            // Function for collapse ibox
            $scope.showhide = function () {
                var hpanel = $element.closest('div.hpanel');
                var icon = $element.find('i:first');
                var body = hpanel.find('div.panel-body');
                var footer = hpanel.find('div.panel-footer');
                body.slideToggle(300);
                footer.slideToggle(200);
                // Toggle icon from up to down
                icon.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
                hpanel.toggleClass('').toggleClass('panel-collapse');
                $timeout(function () {
                    hpanel.resize();
                    hpanel.find('[id^=map-]').resize();
                }, 50);
            },
                    // Function for close ibox
                    $scope.closebox = function () {
                        var hpanel = $element.closest('div.hpanel');
                        hpanel.remove();
                    }

        }
    };
}
;


/**
 * smallHeader - Directive for page title panel
 */
function smallHeader() {
    return {
        restrict: 'A',
        scope: true,
        controller: function ($scope, $element) {
            $scope.small = function () {
                var icon = $element.find('i:first');
                var breadcrumb = $element.find('#hbreadcrumb');
                $element.toggleClass('small-header');
                breadcrumb.toggleClass('m-t-lg');
                icon.toggleClass('fa-arrow-up').toggleClass('fa-arrow-down');
            }
        }
    }
}

function animatePanel($timeout, $state) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {

            //Set defaul values for start animation and delay
            var startAnimation = 0;
            var delay = 0.06;   // secunds
            var start = Math.abs(delay) + startAnimation;

            // Store current state where directive was start
            var currentState = $state.current.name;

            // Set default values for attrs
            if (!attrs.effect) {
                attrs.effect = 'zoomIn'
            }
            ;
            if (attrs.delay) {
                delay = attrs.delay / 10
            } else {
                delay = 0.06
            }
            ;
            if (!attrs.child) {
                attrs.child = '.row > div'
            } else {
                attrs.child = "." + attrs.child
            }
            ;

            // Get all visible element and set opactiy to 0
            var panel = element.find(attrs.child);
            panel.addClass('opacity-0');

            // Count render time
            var renderTime = panel.length * delay * 1000 + 700;

            // Wrap to $timeout to execute after ng-repeat
            $timeout(function () {

                // Get all elements and add effect class
                panel = element.find(attrs.child);
                panel.addClass('animated-panel').addClass(attrs.effect);

                // Add delay for each child elements
                panel.each(function (i, elm) {
                    start += delay;
                    var rounded = Math.round(start * 10) / 10;
                    $(elm).css('animation-delay', rounded + 's')
                    // Remove opacity 0 after finish
                    $(elm).removeClass('opacity-0');
                });

                // Clear animate class after finish render
                $timeout(function () {

                    // Check if user change state and only run renderTime on current state
                    if (currentState == $state.current.name) {
                        // Remove effect class - fix for any backdrop plgins (e.g. Tour)
                        $('.animated-panel:not([ng-repeat]').removeClass(attrs.effect);
                    }
                }, renderTime)

            });

        }
    }
}

function landingScrollspy() {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            element.scrollspy({
                target: '.navbar-fixed-top',
                offset: 80
            });
        }
    }
}

function validNumber() {
    return {
        require: '?ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function (val) {
                if (angular.isUndefined(val)) {
                    var val = '';
                }
                var clean = val.replace(/[^0-9]/g, '');


                if (clean < parseInt(attrs.ngMin)) {
                    clean = clean.substring(1, clean.length);
                }

                if (clean > parseInt(attrs.ngMax)) {
                    clean = clean.substring(0, clean.length - 1);
                }

                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function (event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
}

function validInteger() {
    return {
        require : '?ngModel',
        link : function(scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function(val) {
                if (angular.isUndefined(val)) {
                    var val = '';
                }

                var clean = val.replace(/[^-0-9]/g, '');
                var negativeCheck = clean.split('-');
                if (!angular.isUndefined(negativeCheck[1])) {
                    negativeCheck[1] = negativeCheck[1].slice(0,
                            negativeCheck[1].length);
                    clean = negativeCheck[0] + '-' + negativeCheck[1];
                    if (negativeCheck[0].length > 0) {
                        clean = negativeCheck[0];
                    }

                }

                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function(event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
}

function validInteger() {
    return {
        require : '?ngModel',
        link : function(scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function(val) {
                if (angular.isUndefined(val)) {
                    var val = '';
                }

                var clean = val.replace(/[^-0-9]/g, '');
                var negativeCheck = clean.split('-');
                if (!angular.isUndefined(negativeCheck[1])) {
                    negativeCheck[1] = negativeCheck[1].slice(0,
                            negativeCheck[1].length);
                    clean = negativeCheck[0] + '-' + negativeCheck[1];
                    if (negativeCheck[0].length > 0) {
                        clean = negativeCheck[0];
                    }

                }

                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function(event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
}

function validCidr() {
    return {
        require: '?ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function (val) {
                if (angular.isUndefined(val)) {
                    var val = '';
                }
                var clean = val.replace(/[^0-9./\/]/g, '');


                if (clean < parseInt(attrs.ngMin)) {
                    clean = clean.substring(1, clean.length);
                }

                if (clean > parseInt(attrs.ngMax)) {
                    clean = clean.substring(0, clean.length - 1);
                }

                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function (event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
}

function validDecimal() {
    return {
        require: '?ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            if (!ngModelCtrl) {
                return;
            }


            ngModelCtrl.$parsers.push(function (val) {
                if (angular.isUndefined(val)) {
                    var val = '';
                }
                var clean = val.replace(/[^-0-9\.]./g, '');
                var decimalCheck = clean.split('.');

                if (!angular.isUndefined(decimalCheck[1])) {
                    decimalCheck[1] = decimalCheck[1].slice(0, 2);
                    clean = decimalCheck[0] + '.' + decimalCheck[1];
                }

                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function (event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
}

function pandaModalHeader() {
    return {
        restrict: 'E',
        link: function (scope, element, attrs) {
            scope.pageTitle = attrs["pageTitle"];
            scope.pageIcon = attrs["pageIcon"];
            if(attrs["pageCustomIcon"] != null && !angular.isUndefined(attrs["pageCustomIcon"])) {
                scope.pageCustomIcon = attrs["pageCustomIcon"];
            } else {
                scope.pageCustomIcon = false;
            }
            scope.hideZone = attrs["hideZone"];
        },
        templateUrl: "app/views/common/modal-header.jsp",
    };
}

function appCurrency() {
    return {
        restrict: 'E',
        template: "{{ global.settings.currency }}",
    };
}

function appCurrencyLabel() {
    return {
        restrict: 'E',
        template: "{{ global.settings.currencyLabel }}",
    };
}

function appClock(dateFilter, $timeout) {
    return {
        restrict: 'E',
        scope: {
            format: '@'
        },
        link: function (scope, element, attrs) {
            var updateTime = function () {
                var now = Date.now();

                element.html(dateFilter(now, scope.format));
                $timeout(updateTime, now % 1000);
            };

            updateTime();
        }
    };
}

function pandaQuickSearch() {
    return {
        restrict: 'E',
        link: function (scope, element, attrs) {
        },
        templateUrl: "app/views/common/quick-search.jsp",
    };
}

function paginationContent() {
    return {
        restrict: 'E',
        link: function (scope, element, attrs) {

        },
        templateUrl: "app/views/common/pagination-content.jsp",
    };
}

function paginationContentIso() {
    return {
        restrict: 'E',
        link: function (scope, element, attrs) {

        },
        templateUrl: "app/views/common/pagination-content-iso.jsp",
    };
}

function getLoaderImage() {
    return {
        restrict: 'E',
        link: function (scope, element, attrs) {
        },
        templateUrl: "app/views/common/loader-image.jsp",
    }
}

function getCustomLoaderImage() {
    return {
        restrict: 'E',
        scope: {},
        link: function (scope, element, attrs) {
            scope.showLoader = attrs["customLoader"];
        },
        templateUrl: "app/views/common/loader-image.jsp",
    }
}

function getLoginLoaderImage() {
    return {
        restrict: 'E',
        link: function (scope, element, attrs) {

        },
        templateUrl: "app/views/common/login-loader-image.jsp",
    }
}

/**
 * Check the User has permission or not
 */
function hasPermission() {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {

            var permission=false;
            for(var i=0;i<scope.global.sessionValues.permissionList.length;i++){
                if(scope.global.sessionValues.permissionList[i].action_key === attrs["hasPermission"]){
                    permission = true;
                    break;
                }
            }
            if(!permission) {
                element.hide();
            }
        }
    }
}

/**
 * Directive for Valid Price
 */
function validPrice() {
       return {
            require: '?ngModel',
            link: function(scope, element, attrs, ngModelCtrl) {
              if(!ngModelCtrl) {
                return;
              }

              ngModelCtrl.$parsers.push(function(val) {
                if (angular.isUndefined(val)) {
                    var val = '';
                }

                var clean = val.replace(/[^-0-9\.]/g, '');
                var negativeCheck = clean.split('-');
                var decimalCheck = clean.split('.');
                if(!angular.isUndefined(negativeCheck[1])) {
                    negativeCheck[1] = negativeCheck[1].slice(0, negativeCheck[1].length);
                    clean =negativeCheck[0] + '-' + negativeCheck[1];
                    if(negativeCheck[0].length > 0) {
                        clean =negativeCheck[0];
                    }

                }

                if(!angular.isUndefined(decimalCheck[1])) {
                    decimalCheck[1] = decimalCheck[1].slice(0,4);
                    clean =decimalCheck[0] + '.' + decimalCheck[1];
                }

                if (val !== clean) {
                  ngModelCtrl.$setViewValue(clean);
                  ngModelCtrl.$render();
                }
                return clean;
              });

              element.bind('keypress', function(event) {
                if(event.keyCode === 32) {
                  event.preventDefault();
                }
              });
            }
          };
}

// Directive for valid character
function validCharacters() {
    return {
        require: '?ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
              if (!ngModelCtrl) {
                return;
            }

            ngModelCtrl.$parsers.push(function (val) {
                if (angular.isUndefined(val)) {
                    var val = 0;
                }
                var clean = val.replace(/[^0-9.*!@$A-Za-z-_\s\u4e00-\u9fa5]/g, '');
                if (clean < parseInt(attrs.ngMin)) {
                     clean = clean.substring(1, clean.length);
                }


                if (clean > parseInt(attrs.ngMax)) {
                     clean = clean.substring(0, clean.length - 1);
                }

                if (val !== clean) {
                    ngModelCtrl.$setViewValue(clean);
                    ngModelCtrl.$render();
                }
                return clean;
            });

            element.bind('keypress', function (event) {
                if (event.keyCode === 32) {
                    event.preventDefault();
                }
            });
        }
    };
}
 function fileModel($parse) {
    return {
        restrict : 'A',
        link : function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            element.bind('change', function() {
                scope.$apply(function() {
            modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
};

