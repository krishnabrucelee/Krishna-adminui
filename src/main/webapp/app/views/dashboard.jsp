<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>
<ng-include id="menu" src="global.getViewPageUrl('common/navigation.jsp')"></ng-include>


<!-- Main Wrapper -->
<div id="wrapper">
<div class="content">



<!-- --------- Dashboard contents -->
        <div class="row">
            <div class="col-md-9 dashboard-resource-usage">
                <div class="panel panel-active no-border-radious system-summary">
                    <div class="panel-body" ng-controller="appCtrl">
                        <div id="myCarousel" class="carousel  slide" data-interval="false">
                            <!-- <div class="carousal-arw">
                                Navigation
                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                    <i class="fa fa-long-arrow-left" aria-hidden="true"></i>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                                </a>
                            </div> -->
                            <!-- Items -->
                            <div class="carousel-inner">
                                <div class="active item">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="company-panel-title-areas">
                                                <div class="pull-left">
                                                    <div class="company-panel-icon label-warning text-center"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                                                </div>
                                                <div class="pull-left company-panel-title font-bold m-l-sm">
                                                    {{ zoneName }} <span>Current Zone</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" data-ng-show="showZoneInfraLoader">
                                        <div class="col-md-12 text-center">
                                            <div class="loader-img-wrapper">
                                                <div class='uil-ripple-css' style='transform:scale(0.32);'><div></div><div></div></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div data-ng-hide="showZoneInfraLoader" class="row admin-dashboard dashboard-quota-area" data-ng-show="">

                                        <div class="col-md-3 col-sm-4 col-xs-6 admin-dashboard-quota" data-ng-repeat="resource in zoneResources | orderBy:'order'">
                                            <div class="doughnutchart-value">{{ resource.percentused }}%</div>
                                            <div class="doughnut-fixed-area">
                                            <canvas doughnutchart options="doughnutOptions" data="zoneResourceList[resource.type].doughnutData"  width="160" height="65"></canvas>
                                            {{ resource.label }}<span>Allocated {{ resource.capacityused}} of {{ resource.capacitytotal}}</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 dashboard-system-health-section">
                <div class="panel panel-active no-border-radious system-summary">
                    <div class="panel-body p-sm">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="company-panel-title-area">
                                    <div class="pull-left">
                                        <div class="company-panel-icon label-info text-center"><i class="fa fa-desktop" aria-hidden="true"></i></div>
                                    </div>
                                    <div class="pull-left company-panel-title font-bold m-l-sm">
                                        System Health <span>System Summary</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="row" data-ng-show="showHostsLoader">
                                <div class="col-md-12 text-center">
                                    <div class="loader-img-wrapper">
                                        <div class='uil-ripple-css' style='transform:scale(0.32);'><div></div><div></div></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-6" data-ng-hide="showHostsLoader">
                                <h6>Hypervisors</h6>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="quick-view-details offline">
                                        <div class="quick-view-icon pull-right"></div>
                                        <div class="clearfix"></div>
                                        <div class="quick-view-count pull-right">{{systemHealth.hostOfflineCount}}</div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="quick-view-title text-center">Offline</div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="quick-view-details online">
                                        <div class="quick-view-icon pull-right"></div>
                                        <div class="clearfix"></div>
                                        <div class="quick-view-count pull-right">{{ systemHealth.hostOnlineCount }}</div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="quick-view-title text-center">Online</div>
                                </div>
                            </div>


                            <div class="row" data-ng-show="showSystemVmsLoader">
                                <div class="col-md-12 text-center">
                                    <div class="loader-img-wrapper">
                                        <div class='uil-ripple-css' style='transform:scale(0.32);'><div></div><div></div></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-6" data-ng-hide="showSystemVmsLoader">
                                <div class="col-md-12"><h6>System VMs</h6></div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="quick-view-details offline">
                                        <div class="quick-view-icon pull-right"></div>
                                        <div class="clearfix"></div>
                                        <div class="quick-view-count pull-right">{{ systemHealth.systemVmOfflineCount }}</div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="quick-view-title text-center">Offline</div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="quick-view-details online">
                                        <div class="quick-view-icon pull-right"></div>
                                        <div class="clearfix"></div>
                                        <div class="quick-view-count pull-right">{{ systemHealth.systemVmOnlineCount }}</div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="quick-view-title text-center">Online</div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-active system-summary no-border-radious dashboard-accordian">
                <div class="panel-body">
                    <div class="row m-b-md">
                        <div class="col-md-12">
                            <div class="company-panel-title-area">
                                <div class="pull-left">
                                    <div class="company-panel-icon label-danger text-center"><i class="fa fa-users" aria-hidden="true"></i></div>
                                </div>
                                <div class="pull-left company-panel-title font-bold m-l-sm">
                                    Clients Overview <span>List of Clients & their Resources</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="slimScroll-175">
                    <div class="row" data-ng-show="showClientResourcesLoader">
                        <div class="col-md-12 text-center">
                            <div class="loader-img-wrapper">
                                <div class='uil-ripple-css' style='transform:scale(0.32);'><div></div><div></div></div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive" data-ng-hide="showClientResourcesLoader">
                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>Company Name</th>
                                <th>Total VMs</th>
                                <th>Total vCPUs</th>
                                <th>Total RAM</th>
                                <th>Total Primary Storage</th>
                                <th>Total Secondary Storage</th>
                                <th>Total Public IP</th>
                            </tr>
                            </thead>
                            <tbody data-ng-show="clientResourceList.length > 0" >
                            <tr data-ng-repeat="clientObj in clientResourceList">
                                <td>{{$index}}</td>
                                <td>{{clientObj.domainName}}</td>
                                <td>{{clientObj.totalCount}}</td>
                                <td>{{clientObj.vcpu}}</td>
                                <td>{{clientObj.ram}}</td>
                                <td>500 GB</td>
                                <td>{{clientObj.storage}}</td>
                                <td>{{clientObj.publicIp}}</td>
                            </tr>
                            </div>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>


</div>
<!-- --------- Dashboard contents ends here-->

<div class="row"><div id="footer" class="m-t-md" ng-include="'app/views/common/footer.jsp'"></div></div>
</div>

<script type="text/javascript">
        $(document).ready(function() {
        $('.slimScroll,.slimScroll-175').slimScroll();

        });
    </script>
