<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row" data-ng-controller="resourceCtrl">
            <div class="col-md-12 dashboard-infra-wrapper">
                <div class="panel panel-white no-border-radious">
                    <div class="panel-body p-sm">
                        <h5 class="no-margins text-primary">
                            <fmt:message key="common.infrastructure" bundle="${msg}" />
                        </h5>
                        <div class="text-center m-t-xxxl" data-ng-show="showLoaderOffer">
<get-loader-image-offer></get-loader-image-offer>                         </div>
                        <div class="row" data-ng-hide="showLoaderOffer">
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details running-vm">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.runningVmCount }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="running.vm" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details stopped-vm">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.stoppedVmCount }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="stopped.vm" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details total-vm">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.totalCount }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="total.vm" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details vcpu">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.vcpu }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="vcpu" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details vcpu">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.ram }}<small>(GB)</small></div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="ram" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details vcpu">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.storage }}<small>(GB)</small></div>

                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="storage.allocation" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details networks">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.publicIp }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="public.ip" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details networks">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.networks }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="common.networks" bundle="${msg}" /></div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="quick-view-details private-template">
                                    <div class="quick-view-icon text-right pull-right"></div>
                                    <div class="clearfix"></div>
                                    <div class="quick-view-count text-right">{{ infrastructure.template }}</div>
                                </div>
                                <div class="quick-view-title text-center"><fmt:message key="private.template" bundle="${msg}" /></div>
                            </div>
                           </div>
                    </div>
                </div>
            </div>
</div>
<script>
    $(window).load(function () {
        $('.easy-tree').EasyTree({
            addable: true,
            editable: true,
            deletable: true
        });
    });

</script>