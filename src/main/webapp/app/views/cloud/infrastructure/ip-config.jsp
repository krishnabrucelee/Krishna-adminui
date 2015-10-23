<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <div class="row p-sm" data-ng-controller="infraCtrl"  >


    <div class="col-md-12 col-sm-12" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12  ">
                        <div class="quick-search pull-right">
                            <div class="input-group">
                                <input data-ng-model="ipSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
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
                        <th>IP</th>
                        <th>Project</th>
                        <th>Zone</th>
                        <th>Network</th>
                        <th>Network Type</th>
                        <th>Instance</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-ng-repeat="ip in ipList | filter: ipSearch">
                        <td>
                          {{ ip.address }}
                        </td>
                        <td>{{ ip.project.name }}</td>
                        <td>{{ ip.zone.name }}</td>
                        <td>{{ ip.network.name }}</td>
                        <td>{{ ip.network.type }} </td>
                        <td>
                            {{ ip.instancename }}
                        </td>

                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
</div>
