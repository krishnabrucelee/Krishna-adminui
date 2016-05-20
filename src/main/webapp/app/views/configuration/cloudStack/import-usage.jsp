<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm"  method="post" novalidate="" data-ng-controller="usageCsDataCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/cloudstack" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
                            </span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="row">
                         <div class="col-md-10 col-sm-10 col-xs-10 m-b-sm">
                             <h2><fmt:message key="manula.domain.usage.execution.from.cloud" bundle="${msg}" /></h2>
                         </div>
                         <div data-ng-show="formElements.domainList.length > 0" class="col-md-2 col-sm-2 col-xs-2 m-t-sm">
                             <a data-ng-hide="showLoader" class="btn btn-info pull-right" data-ng-click="updateDomainUsage('importall', 'importall')"> <fmt:message key="execute.all" bundle="${msg}" /></a>
                         </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <get-loader-image data-ng-show="showLoader"></get-loader-image>
                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
	                        <tr class="bg-primary">
	                            <th><fmt:message key="common.domain" bundle="${msg}" /></th>
	                            <th><fmt:message key="usage.last.executed.date" bundle="${msg}" /></th>
	                            <th><fmt:message key="common.action" bundle="${msg}" /></th>
	                        </tr>
                        </thead>
                        <tbody data-ng-hide="formElements.domainList.length > 0">
                       		 <tr>
                                 <td class="col-md-3 col-sm-3" colspan="3"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                  			 </tr>
               			</tbody>
                        <tbody data-ng-show="formElements.domainList.length > 0">
                        <tr data-ng-repeat="domain in formElements.domainList">
                             <td>
                                 {{domain.name}}
                             </td>
                             <td>{{domain.usageExecutedDate || " - " | date:'yyyy-MM-dd'}}</td>
                             <td>
                                 <span>
                                     <a class="btn btn-info" data-ng-click="updateDomainUsage(domain, 'import')"><i class="fa fa-download"></i> <fmt:message key="manual.execute" bundle="${msg}" /></a>
                                 </span>
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
</form>