<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

       <div class="col-md-12 col-sm-12" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12  ">
                        <div class="quick-search pull-right">
                            <div class="input-group">
                                <input data-ng-model="tierSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
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
                        <th>Name</th>
                        <th>User</th>
                        <th>CIDR</th>
                        <th>State</th>
                        <th>Type</th>
                        <th>Gateway</th>
                        <th>Supported Services</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-ng-repeat="tier in tierList | filter: tierSearch">
                        <td>
                            <a class="text-info" ui-sref="cloud.vpc.view.tier({pageId:{{vpcid}},id:{{ tier.id }}})">{{ tier.name }}</a>
                        </td>
                        <td>{{ tier.user }}</td>
                        <td>{{ tier.cidr }}</td>
                        <td>{{ tier.state }}</td>
                        <td>{{ tier.type }} </td>
                        <td>
                            {{ tier.gateway }}
                        </td>
                        <td>
                            <span data-ng-repeat="support in tier.supported">
                            {{ support.name}},
                            </span>
                        </td>

                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>


