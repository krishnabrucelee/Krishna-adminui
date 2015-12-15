<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div ui-view >

    <div ng-controller="applicationListCtrl">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="pull-left">
                            <div class="pull-left">
                            </div>
                        </div>
                        <div class="pull-right">
                            <div class="quick-search">
                                <div class="input-group">
                                    <input data-ng-model="applicationSearch" type="text" class="form-control input-medium" placeholder="<fmt:message key="common.quick.search" bundle="${msg}" />" aria-describedby="quicksearch-go">
                                    <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">

                    <div class="white-content">
                    <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
                        <div data-ng-hide="showLoader" class="table-responsive">
                            <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th class="col-md-2 col-sm-3"><fmt:message key="common.type" bundle="${msg}" /></th>
                                        <th class="col-md-4 col-sm-5"><fmt:message key="common.description" bundle="${msg}" /></th>
                                        <th class="col-md-1 col-sm-2"><fmt:message key="common.status" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-ng-repeat=" application in applicationList| filter: applicationSearch">
                                        <td>{{ application.type}}</td>
                                        <td>{{ application.description}}</td>
                                        <td>{{ application.status}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
