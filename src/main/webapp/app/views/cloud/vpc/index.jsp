<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ui-view >

    <div class="row" data-ng-controller="vpcCtrl" >

        <div class="col-md-12 col-sm-12" >
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12  ">
                            <div class="quick-search pull-right">
                                <div class="input-group">
                                    <input data-ng-model="vpcSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="white-content">
                    <div class="table-responsive">
                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th><fmt:message key="common.name" bundle="${msg}" /></th>
                                    <th><fmt:message key="common.description" bundle="${msg}" /></th>
                                    <th><fmt:message key="common.user" bundle="${msg}" /></th>
                                    <th><fmt:message key="iso.zone" bundle="${msg}" /></th>
                                    <th><fmt:message key="cidr" bundle="${msg}" /></th>
                                    <th><fmt:message key="common.status" bundle="${msg}" /></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-ng-repeat="vpc in vpcList| filter: vpcSearch">
                                    <td><a class="text-info" ui-sref="cloud.vpc.view({pageId: {{ vpc.id }}})">{{ vpc.name}}</a></td>
                                    <td>{{ vpc.description}}</td>
                                    <td>{{ vpc.username}}</td>
                                    <td>{{ vpc.zone.name}}</td>
                                    <td>{{ vpc.cidr}}</td>
                                    <td>
                                        <label class="icon-button btn btn-success btn-sm" data-ng-show="vpc.state=='Enabled'" title="Enabled"  >Enabled</label>
                                        <label class="icon-button btn btn-danger btn-sm" data-ng-hide="vpc.state=='Enabled'" title="Disabled"  >Disabled</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>