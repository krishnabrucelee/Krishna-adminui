<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

    <div class="row p-sm" data-ng-controller="infraCtrl" >

    <div class="col-md-12 col-sm-12" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="quick-search pull-right">
                            <div class="input-group">
                                <input data-ng-model="snapshotSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
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
                        <th>Username</th>
                        <th>Snapshot Name</th>
                        <th>Disk Name</th>
                        <th>Type</th>
                        <th>Created Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-ng-repeat="snapshot in volumeList | filter: snapshotSearch">
                        <td>
                          {{ snapshot.username }}
                        </td>
                        <td>{{ snapshot.snapshots.name }}</td>
                        <td>{{ snapshot.name }}</td>
                        <td>{{ snapshot.snapshots.type}}</td>
                        <td>{{ snapshot.instancename }}</td>

                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
</div>
