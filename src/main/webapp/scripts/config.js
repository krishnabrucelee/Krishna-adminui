/**
 * Panda Admin Console UI
 * Assistanz.com
 *
 */

function configState($stateProvider, $urlRouterProvider, $compileProvider, localStorageServiceProvider) {

	var VIEW_URL = "app/";


    // Optimize load start with remove binding information inside the DOM element
    $compileProvider.debugInfoEnabled(true);

    // Set default state
    $urlRouterProvider.otherwise("/login");

    $stateProvider

            // Home - Main page
            .state('login', {
                url: "/login",
                templateUrl: VIEW_URL +  "login.jsp",
                data: {
                    pageTitle: 'Login',
                }
            })
            .state('dashboard', {
                url: "/dashboard",
                templateUrl: VIEW_URL +  "views/dashboard.jsp",
                data: {
                    pageTitle: 'Home',
                }
            })




            // Common views
            .state('common', {
                abstract: true,
                url: "/common",
                templateUrl: VIEW_URL +  "views/common/content_empty.jsp",
                data: {
                    pageTitle: 'Common'
                }
            })

            // App views
            .state('views', {
                abstract: true,
                url: "/views",
                templateUrl: VIEW_URL +  "views/common/content.jsp",
                data: {
                    pageTitle: 'App Views'
                }
            })

            // Clients
            .state('client', {
                abstract: true,
                url: "/",
                templateUrl: VIEW_URL +  "views/common/content.jsp",
                data: {
                    pageTitle: 'Clients'
                }
            })

            // Client-Projects
            .state('client.project', {
                url: "client/project",
                templateUrl: VIEW_URL +  "views/client/project/list.jsp",
                data: {
                    pageTitle: 'Projects'
                }
            })

            .state('client.project.view', {
                url: "/view/:id",
                templateUrl: VIEW_URL +  "views/client/project/view.jsp",
                data: {
                    pageTitle: 'View Project'
                }
            })

            // Client-Users
            .state('client.user', {
                url: "client/user",
                templateUrl: VIEW_URL +  "views/client/user/list.jsp",
                data: {
                    pageTitle: 'Users'
                }
            })

            //Configuration
             .state('configuration', {
            abstract: true,
            url: "/configuration",
            templateUrl: VIEW_URL +  "views/common/content.jsp",
            data: {
                pageTitle: 'configuration'
            }
        })

        .state('configuration.home', {
            url: "/:category",
            templateUrl: VIEW_URL +  "views/configuration/index.jsp",
            data: {
                pageTitle: 'ConfigCategory'
            }
        })


        .state('configuration.home.system', {
            url: "/dashboard/cloudConfig",
            templateUrl: VIEW_URL +  "views/configuration/cloudStack/system-config.jsp",
            data: {
                pageTitle: 'system.configuration'
            }
        })

        .state('configuration.home.domain', {
            url: "/domain",
            templateUrl: VIEW_URL +  "views/configuration/cloudStack/domain-config.jsp",
            data: {
                pageTitle: 'Domain Configuration'
            }
        })

        .state('configuration.home.import', {
            url: "/importData",
            templateUrl: VIEW_URL +  "views/configuration/cloudStack/import.jsp",
            data: {
                pageTitle: 'Import'
            }
        })

      .state('configuration.home.email', {
            url: "/email",
            templateUrl: VIEW_URL +  "views/configuration/general/email-config.jsp",
            data: {
                pageTitle: 'Email Configuration'
            }
        })

         .state('configuration.home.login-security', {
            url: "/loginSecurity",
            templateUrl: VIEW_URL +  "views/configuration/general/login-security.jsp",
            data: {
                pageTitle: 'Login Security'
            }
        })

         .state('configuration.home.language', {
            url: "/language",
            templateUrl: VIEW_URL +  "views/configuration/general/language.jsp",
            data: {
                pageTitle: 'Language'
            }
        })

         .state('configuration.home.signup', {
            url: "/signupSetting",
            templateUrl: VIEW_URL +  "views/configuration/general/signup-setting.jsp",
            data: {
                pageTitle: 'Sign up Setting'
            }
        })

        .state('configuration.home.admin-user', {
            url: "/adminUser",
            templateUrl: VIEW_URL +  "views/configuration/general/admin-user.jsp",
            data: {
                pageTitle: 'Admin User'
            }
        })

        .state('configuration.home.add-admin-user', {
            url: "/addAdmin",
            templateUrl: VIEW_URL +  "views/configuration/general/add.jsp",
            data: {
                pageTitle: 'Add Admin User'
            }
        })

        .state('configuration.home.support', {
            url: "/support",
            templateUrl: VIEW_URL +  "views/configuration/general/support.jsp",
            data: {
                pageTitle: 'Support'
            }
        })

         .state('configuration.home.organization-detail', {
            url: "/organizationDetails",
            templateUrl: VIEW_URL +  "views/configuration/general/organization-detail.jsp",
            data: {
                pageTitle: 'Organization Details'
            }
        })

        .state('configuration.home.currency', {
            url: "/currency",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/currency.jsp",
            data: {
                pageTitle: 'Currency'
            }
        })

            .state('configuration.home.billing', {
            url: "/billableItem",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/billable-items.jsp",
            data: {
                pageTitle: 'Billable Items'
            }
        })

        .state('configuration.home.edit', {
            url: "/billableItem/edit",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/edit.jsp",
            data: {
                pageTitle: 'Edit Billable Item'
            }
        })

         .state('configuration.home.late-fee', {
            url: "/lateFee",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/late-fee.jsp",
            data: {
                pageTitle: 'Late Fee'
            }
        })

        .state('configuration.home.invoice', {
            url: "/invoice",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/invoice.jsp",
            data: {
                pageTitle: 'Invoice'
            }
        })

        .state('configuration.home.billing-settings', {
            url: "/billingTypeConfig",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/billing-settings.jsp",
            data: {
                pageTitle: 'Billing Type Settings'
            }
        })

        .state('configuration.home.tax', {
            url: "/tax",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/tax.jsp",
            data: {
                pageTitle: 'Tax'
            }
        })

        .state('configuration.home.add-tax', {
            url: "/tax/add",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/addTax.jsp",
            data: {
                pageTitle: 'Add Tax'
            }
        })


        .state('configuration.home.edit-tax', {
            url: "/tax/edit",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/editTax.jsp",
            data: {
                pageTitle: 'Edit Tax'
            }
        })

         .state('configuration.home.paymentSettings', {
            url: "/payment",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/payment-settings.jsp",
            data: {
                pageTitle: 'Payment Settings'
            }
        })

        .state('configuration.home.promotional', {
            url: "/promotion",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/promotional-code.jsp",
            data: {
                pageTitle: 'Promotional Code'
            }
        })


        .state('configuration.home.add-promotional', {
            url: "/promotion/add",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/addPromotional-code.jsp",
            data: {
                pageTitle: 'Add Promotional Code'
            }
        })

        .state('configuration.home.discount', {
            url: "/discount",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/discount.jsp",
            data: {
                pageTitle: 'Discount'
            }
        })

        .state('configuration.home.addDiscount', {
            url: "/discount/add",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/addDiscount.jsp",
            data: {
                pageTitle: 'Add Discount'
            }
        })


        .state('configuration.home.credit', {
            url: "/credit",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/credit-threshold.jsp",
            data: {
                pageTitle: 'Credit and Resource Threshold'
            }
        })


        .state('configuration.home.paymentGateway', {
            url: "/paymentGateway",
            templateUrl: VIEW_URL +  "views/configuration/chargeback/payment-gateway.jsp",
            data: {
                pageTitle: 'Payment Gateway'
            }
        })

        .state('configuration.home.zone', {
            url: "/zoneDescription",
            templateUrl: VIEW_URL +  "views/configuration/cloudStack/zone-description.jsp",
            data: {
                pageTitle: 'Zone Description'
            }
        })

            //Cloud
            .state('cloud', {
                url: "/",
                templateUrl: VIEW_URL +  "views/common/content.jsp",
                data: {
                    pageTitle: 'Cloud'
                }
            })

            .state('cloud.infra-structure', {
                url: "cloud/infrastructure",
                templateUrl: VIEW_URL +  "views/cloud/infrastructure/index.jsp",
                data: {
                    pageTitle: 'Infrastructure'
                }
            })

            .state('cloud.vpc', {
                url: "cloud/vpc/list",
                templateUrl: VIEW_URL +  "views/cloud/vpc/index.jsp",
                data: {
                    pageTitle: 'VPC'
                }
            })

            .state('cloud.vpc.view', {
                url: "/:pageId",
                templateUrl: VIEW_URL +  "views/cloud/vpc/view.jsp",
                data: {
                    pageTitle: 'View'
                }
            })

            .state('cloud.vpc.view.tier', {
                url: "/:id",
                templateUrl: VIEW_URL +  "views/cloud/tier/view.jsp",
                data: {
                    pageTitle: 'View'
                }
            })




            .state('cloud.resource', {
                url: "cloud/resource-usage",
                templateUrl: VIEW_URL +  "views/cloud/resource-usage.jsp",
                data: {
                    pageTitle: 'Resource Usage'
                }
            })

            //Activity
            .state('activity', {
                url: "/activity",
                templateUrl: VIEW_URL +  "views/activity/index.jsp",
                data: {
                    pageTitle: 'Activity'
                }
            })

            //Service Catalog

            .state('servicecatalog', {
                abstract: true,
                url: "/",
                templateUrl: VIEW_URL +  "views/common/content.jsp",
                data: {
                    pageTitle: 'service'
                }
            })

            .state('servicecatalog.list-compute.view-catalog', {
                url: "view/:id",
                templateUrl: VIEW_URL +  "views/servicecatalog/view.jsp",
                data: {
                    pageTitle: 'View Catalog'
                }
            })
            .state('servicecatalog.list-compute', {
                url: "compute/list",
                templateUrl: VIEW_URL +  "views/servicecatalog/list.jsp",
                data: {
                    pageTitle: 'compute'
                }
            })
            .state('servicecatalog.list-compute.list-compute-offer', {
                url: "compute/offer",
                templateUrl: VIEW_URL +  "views/servicecatalog/compute-offer.jsp",
                data: {
                    pageTitle: 'compute.offer'
                }
            })
            .state('servicecatalog.list-compute.list-view-compute-offer', {
                url: "/view/:id",
                templateUrl: VIEW_URL +  "views/servicecatalog/view-compute-offer.jsp",
                data: {
                    pageTitle: 'View Compute Offer'
                }
            })
            .state('servicecatalog.list-storage', {
                url: "storage/list",
                templateUrl: VIEW_URL +  "views/servicecatalog/storage.jsp",
                data: {
                    pageTitle: 'storage'
                }
            })
            .state('servicecatalog.list-miscellaneous', {
                url: "miscellaneous/list",
                templateUrl: VIEW_URL +  "views/servicecatalog/miscellaneous/index.jsp",
                data: {
                    pageTitle: 'Miscellaneous'
                }
            })
            .state('servicecatalog.list-apptemplate', {
                url: "templatestore/AppTemplatelist",
                templateUrl: VIEW_URL +  "views/servicecatalog/apptemplate.jsp",
                data: {
                    pageTitle: 'App Templates'
                }
            })
            .state('servicecatalog.list-templatestore', {
                url: "templatestore/list",
                templateUrl: VIEW_URL +  "views/servicecatalog/templatehome.jsp",
                data: {
                    pageTitle: 'Template Store'
                }
            })
            .state('servicecatalog.list-templatestore.list-view-template-create', {
                url: "templatestore/create",
                templateUrl: VIEW_URL +  "views/servicecatalog/templateCreate.jsp",
                data: {
                    pageTitle: 'Create Template'
                }
            })
            .state('servicecatalog.list-templatestore.list-view-template-edit', {
                url: "view/:id",
                templateUrl: VIEW_URL +  "views/servicecatalog/view-template.jsp",
                data: {
                    pageTitle: 'Edit Template'
                }
            })
            .state('servicecatalog.list-network', {
                url: "network/list",
                templateUrl: VIEW_URL +  "views/servicecatalog/network.jsp",
                data: {
                    pageTitle: 'common.network'
                }
            })

            .state('servicecatalog.list-storage.list-storage-offer', {
                url: "storage/offer",
                templateUrl: VIEW_URL +  "views/servicecatalog/storage-offer.jsp",
                data: {
                    pageTitle: 'storage.offer'
                }
            })
            .state('servicecatalog.list-storage.list-view-storage-offer', {
                url: "view/:id",
                templateUrl: VIEW_URL +  "views/servicecatalog/view-storage-offer.jsp",
                data: {
                    pageTitle: 'View Storage Offer'
                }
            })

            //Reports

            .state('reports', {
                abstract: true,
                url: "/",
                templateUrl: VIEW_URL +  "views/common/content.jsp",
                data: {
                    pageTitle: 'Report'
                }
            })
            .state('reports.signup', {
                url: "report/signUp",
                templateUrl: VIEW_URL +  "views/reports/sign-up.jsp",
                data: {
                    pageTitle: 'Sign Up Report'
                }
            })
            .state('reports.billable-items', {
                url: "report/billableItems",
                templateUrl: VIEW_URL +  "views/reports/billable-item.jsp",
                data: {
                    pageTitle: 'Billable Item Report'
                }
            })
            .state('reports.payment-report', {
                url: "report/paymentReport",
                templateUrl: VIEW_URL +  "views/reports/payment-report.jsp",
                data: {
                    pageTitle: 'Payment Report'
                }
            })

            .state('reports.payment-due', {
                url: "report/paymentDue",
                templateUrl: VIEW_URL +  "views/reports/payment-due.jsp",
                data: {
                    pageTitle: 'Payment Due Report'
                }
            })

            .state('reports.client-usage', {
                url: "report/clientUsage",
                templateUrl: VIEW_URL +  "views/reports/client-usage.jsp",
                data: {
                    pageTitle: 'Client Usage Report'
                }
            })
            // Support


            .state('support', {
                abstract: true,
                url: "/",
                templateUrl: VIEW_URL +  "views/common/content.jsp",
                data: {
                    pageTitle: 'Support'
                }
            })
            .state('support.tickets', {
                url: "support/tickets",
                templateUrl: VIEW_URL +  "views/support/list.jsp",
                data: {
                    pageTitle: 'Tickets'
                }
            })


}

angular
        .module('panda-ui-admin')
         .constant("PANDA_CONFIG", {
			"VIEW_URL" : "app/views/",
		})
        .config(configState)
        .run(function ($rootScope, $state, editableOptions) {
            $rootScope.$state = $state;
            editableOptions.theme = 'bs3';
        });
