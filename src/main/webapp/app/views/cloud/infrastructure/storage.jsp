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
                                <span class="pull-right">Total Volumes</span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">13</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right">Attached Volumes</span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
                                <b class="pull-right">13</b>
                                <div class="clearfix"></div>
                            </div>
                            <div class="dashboard-box pull-left">
                                <span class="pull-right"> Detached Volumes</span>
                                <div class="clearfix"></div>
                                <span class="pull-right m-t-xs"><img src="images/volume-icon.png"></span>
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
                        <th>Disk Name</th>
                        <th>Size</th>
                        <th>Plan</th>
                        <th>Instance Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-ng-repeat="volume in volumeList | filter: volumeSearch">
                        <td>
                          {{ volume.username }}
                        </td>
                        <td>{{ volume.name }}</td>
                        <td>{{ volume.plan.size }}</td>
                        <td>{{ volume.plan.name }}</td>
                        <td>{{ volume.instancename }}</td>

                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>

