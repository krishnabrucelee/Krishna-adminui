<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row p-sm" data-ng-controller="infraCtrl" >

    <div class="hpanel">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="pull-left">
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Total Instance</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/instance-icon.png"></span>
                            <b class="pull-right">13</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Running Instance</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/instance-icon.png"></span>
                            <b class="pull-right">13</b>
                            <div class="clearfix"></div>
                        </div>
                        <div class="dashboard-box pull-left">
                            <span class="pull-right">Stopped Instance</span>
                            <div class="clearfix"></div>
                            <span class="pull-right m-t-xs"><img src="images/instance-icon.png"></span>
                            <b class="pull-right">13</b>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="pull-right m-t-lg">
                        <div class="quick-search">
                            <div class="input-group">
                                <input data-ng-model="instanceSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                            </div>
                        </div>
                        <div class="clearfix"></div>

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
                            <th>Username</th>
                            <th>Zone</th>
                            <th>Instance IP</th>
                            <th>Display Name</th>
                            <th>Plan</th>
                            <th>State</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="instance in instanceList| filter:quickSearch">

                            <!--<tr data-ng-repeat="instance in instanceList | filter: instanceSearch">-->
                            <td>
                                {{ instance.name}}
                            </td>
                            <td>{{ instance.zonename}}</td>
                            <td>{{ instance.nic[0].ipaddress}}</td>
                            <td>{{ instance.displayname}}</td>
                            <td>{{ instance.serviceofferingname}}</td>
                            <td>
                                <label class="icon-button btn btn-small btn-success" data-ng-if="instance.state == 'Running'">{{ instance.state}}</label>
                                <label class="icon-button btn btn-small btn-danger" data-ng-if="instance.state == 'Stopped'">{{ instance.state}}</label>
                            </td>
                            <td>
                                <a class="icon-button" title="Start" data-ng-hide="instance.state == 'Running'">
                                    <span class="fa fa-play m-r" ></span>
                                </a>
                                <a class="icon-button" title="Stop" data-ng-show="instance.state == 'Running'">
                                    <span class="fa fa-ban m-r" ></span>
                                </a>
                                <a class="icon-button" title="Reboot"  ><span class="fa-rotate-left fa"></span></a>
                                <!--                            <a class="icon-button" title="Delete"  ><span class="fa fa-trash"></span></a>-->
                                <a class="icon-button" title="Migrate Host"><span class="fa-arrows fa m-xs"></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

