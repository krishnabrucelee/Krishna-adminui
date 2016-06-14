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
        debug : WEBSOCKET_DEBUG,
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
        Math : window.Math,

        events : 2,
        webSocketLoaders : {
            instanceCreate : false,
            vmsshKey : false,
            computeOffer : false,
            viewLoader : false,
            vmnicLoader : false,
            vmsecondaryip : false,
            vmstorageLoader : false,
            vmlistLoader : false,
            volumeLoader : false,
            networkLoader : false,
            snapshotLoader : false,
            egressLoader : false,
            ingressLoader : false,
            ipLoader : false,
            loadBalancerLoader : false,
            vpnLoader : false,
            volumeBackupLoader : false,
            sshKey : false,
            templateLoader : false,
            projectLoader : false,
            applicationLoader : false,
            accountLoader : false,
            roleLoader : false,
            departmentLoader : false,
            projectAssign : false,
            networkAclLoader : false,
            networkDeleteAclLoader : false
        },
        webSocketEvents : {
            vmEvents : {
                stopVm : 'VM.STOP',
                rebootVm : 'VM.REBOOT',
                startVm : 'VM.START',
                vmresize : 'VM.UPGRADE',
                addNicToVm : 'NIC.CREATE',
                updateNicToVM : 'NIC.UPDATE',
                removeNicToVM : 'NIC.DELETE',
                deleteIP : 'NIC.SECONDARY.IP.UNASSIGN',
                acquireNewIP : 'NIC.SECONDARY.IP.ASSIGN',
                ipAssign : 'NET.IPASSIGN',
                vmCreate : 'VM.CREATE',
                reInstallVm : 'VM.CREATE',
                reDestroyVm : 'VM.DESTROY',
                expungeVM : 'VM.EXPUNGE',
                recoverVm : 'VM.RESTORE',
                updateVM : 'VM.UPDATE',
                AddAppVM : 'ADD.APPLICATION',
                attachISO : 'ISO.ATTACH',
                detachISO : 'ISO.DETACH',
                vmSSHKEY : 'VM.RESETSSHKEY',
                takeSnapshot : 'VMSNAPSHOT.CREATE',
                restoreVMSnapshot : 'VMSNAPSHOT.REVERTTO',
                removeVMSnapshot : 'VMSNAPSHOT.DELETE',
                hostMigrate : 'VM.MIGRATE',
                resetPassword : 'VM.RESETPASSWORD',
                attachVolume : 'VOLUME.ATTACH',
                detachVolume : 'VOLUME.DETACH',
                volumeresize : 'VOLUME.RESIZE',
                volumesave : 'VOLUME.CREATE',
                uploadVolume : 'VOLUME.UPLOAD',
                volumedelete : 'VOLUME.DELETE',
                createSnapshot : 'SNAPSHOT.CREATE'
            },
            volumeEvents : {
                attachVolume : 'VOLUME.ATTACH',
                detachVolume : 'VOLUME.DETACH',
                createSnapshot : 'SNAPSHOT.CREATE',
                volumeresize : 'VOLUME.RESIZE',
                volumesave : 'VOLUME.CREATE',
                uploadVolume : 'VOLUME.UPLOAD',
                deleteSnapshot : 'SNAPSHOT.DELETE',
                volumedelete : 'VOLUME.DELETE',
                recurringSnapshot : 'SNAPSHOTPOLICY.CREATE'
            },
            snapshotEvents : {
                createvmsnapshot : 'VMSNAPSHOT.CREATE',
                deleteSnapshots : 'VMSNAPSHOT.DELETE',
                deleteVolumeSnapshot : 'SNAPSHOT.DELETE',
                restoresnapshot : 'VMSNAPSHOT.REVERTTO',
                createsnapshot : 'SNAPSHOT.CREATE',
                createsnapshotvolume : 'VOLUME.CREATE',
                revertSnapshot : 'SNAPSHOT.REVERTTO'
            },
            networkEvents : {
                startVm : 'VM.START',
                stopVm : 'VM.STOP',
                rebootVm : 'VM.REBOOT',
                egressSave : 'FIREWALL.EGRESS.OPEN',
                ingressSave : 'FIREWALL.OPEN',
                deleteIngress : 'FIREWALL.CLOSE',
                deleteEgress : 'FIREWALL.EGRESS.CLOSE',
                createnetwork : 'NETWORK.CREATE',
                deletenetwork : 'NETWORK.DELETE',
                restartnetwork : 'NETWORK.RESTART',
                updatenetwork : 'NETWORK.UPDATE',
                loadbalancerSave : 'LB.CREATE',
                assignRule : 'LB.ASSIGN.TO.RULE',
                editrule : 'LB.UPDATE',
                deleteRules : 'LB.DELETE',
                ipAquire : 'NET.IPASSIGN',
                ipRelease : 'NET.IPRELEASE',
                vpnCreate : 'VPN.REMOTE.ACCESS.CREATE',
                vpnDestroy : 'VPN.REMOTE.ACCESS.DESTROY',
                vpnUserAdd : 'VPN.USER.ADD',
                vpnUserDelete : 'VPN.USER.REMOVE',
                enableStaticNat : 'STATICNAT.ENABLE',
                disableStaticNat : 'STATICNAT.DISABLE',
                saveAclList : 'NETWORK.ACL.ITEM.CREATE',
		editNetworkAcl : 'NETWORK.ACL.ITEM.UPDATE',
		deleteNetworkAcl : 'NETWORK.ACL.ITEM.DELETE',
                portforwardSave : 'NET.RULEADD',
                deletePortRules : 'NET.RULEDELETE',
                configureStickiness : 'LB.STICKINESSPOLICY.CREATE',
                editStickiness : 'LB.STICKINESSPOLICY.CREATE',
                addAcl : 'NETWORK.ACL.CREATE',
                deleteAclList : 'NETWORK.ACL.DELETE'
            },
            sshKeyEvents : {
                createSSHKey : 'REGISTER.SSH.KEYPAIR',
                deleteSSHKey : 'DELETE',
                assignSSH : 'REGISTER.SSH.KEYPAIR'
            },
            projectEvents : {
                createProject : 'PROJECT.CREATE',
                addUser : 'ADDUSER',
                removeUser : 'REMOVEUSER',
                editProject : 'PROJECT.UPDATE',
                suspendProject : 'PROJECT.SUSPEND',
                activateProject : 'PROJECT.ACTIVATE',
                deleteProject : 'PROJECT.DELETE'
            },
            applicationEvents : {
                createApplication : 'CREATEAPPLICATION',
                editApplication : 'EDIT',
                deleteApplication : 'DELETE'
            },
            accountEvents : {
                addUser : 'USER.CREATE',
                editUser : 'USER.UPDATE',
                disableUser : 'USER.DISABLE',
                enableUser : 'USER.ENABLE',
                deleteUser : 'USER.DELETE',
                apiKey : 'REGISTER.USER.KEY'
            },
            roleEvents : {
                createRole : 'CREATEROLE',
                updateRole : 'UPDATE',
                deleteRole : 'DELETE',
                assignRole : 'ASSIGNROLESAVE'
            },
            departmentEvents : {
                createDepartment : 'ACCOUNT.CREATE',
                editDepartment : 'ACCOUNT.UPDATE',
                disableDepartment : 'ACCOUNT.DISABLE',
                enableDepartment : 'ACCOUNT.ENABLE',
                deleteDepartment : 'ACCOUNT.DELETE'
            },
            domainEvents : {
                createDomain : 'DOMAIN.CREATE',
                updateDomain : 'DOMAIN.UPDATE',
                deleteDomain : 'DOMAIN.DELETE'
            },
            hostEvents : {
                hostReconnect : 'HOST.RECONNECT'
            },
            routerEvents : {
                routerStart : 'ROUTER.START',
                routerStop : 'ROUTER.STOP'
            },
            serviceOffers : {
                computeUpdate : 'SERVICE.OFFERING.EDIT',
                computeCreate : 'SERVICE.OFFERING.CREATE',
                computeDelete : 'SERVICE.OFFERING.DELETE'
            },
            diskOffering : {
                diskCreate : 'DISK.OFFERING.CREATE',
                diskDelete : 'DISK.OFFERING.DELETE',
                diskUpdate : 'DISK.OFFERING.EDIT'
            },
            templateEvents : {
                createTemplate : 'TEMPLATE.CREATE',
                deleteTemplate : 'TEMPLATE.DELETE',
                updateTemplate : 'TEMPLATE.UPDATE'
            },
            vpcEvents : {
                createVPC : 'VPC.CREATE',
                editVPC : 'VPC.UPDATE',
                deleteVPC : 'VPC.DELETE',
                restartVPC : 'VPC.RESTART'
            },
            configEvents : {
                updateConfig : 'CONFIGURATION.VALUE.EDIT'
            },
            alertEvents : {
                upload : 'ALERT.UPLOAD.FAILED',
                ssvm : 'ALERT.SERVICE.SSVM',
                cpvm : 'ALERT.SERVICE.CONSOLEPROXY'
            }
        },

        HTTP_GET : 'GET',
        HTTP_POST : 'POST',
        HTTP_PUT : 'PUT',
        HTTP_DELETE : 'DELETE',
        CONTENT_LIMIT : $window.sessionStorage.getItem("pandaUserSession") == null ? 10 : JSON.parse($window.sessionStorage.getItem("pandaUserSession")).paginationLimit,
        APP_URL : REQUEST_PROTOCOL  + window.location.hostname + ":8080/api/",
        SOCKET_URL : REQUEST_PROTOCOL + window.location.hostname + ":8080/",
        PING_APP_URL : REQUEST_PROTOCOL  + window.location.hostname + ":8086/api/",
        BASE_UI_URL : REQUEST_PROTOCOL + window.location.hostname + REQUEST_PORT + REQUEST_ADMIN_FOLDER,
        VIEW_URL : 'app/views/',
        NOTIFICATION_TEMPLATE : 'app/views/notification/notify.jsp',
        NOTIFICATIONS_TEMPLATE : 'app/views/common/notify1.jsp',
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
