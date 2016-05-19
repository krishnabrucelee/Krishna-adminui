<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm"  method="post" novalidate="" data-ng-controller="importCsDataCtrl">
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
                             <h2><fmt:message key="import.data.from.cloudStack" bundle="${msg}" /></h2>
                         </div>
                         <div class="col-md-2 col-sm-2 col-xs-2 m-t-sm">
                             <a data-ng-hide="showLoader" class="btn btn-info pull-right" data-ng-click="openImportContainer('checkall', 'checkall')"> <fmt:message key="check.all" bundle="${msg}" /></a>
                         </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <get-loader-image data-ng-show="showLoader"></get-loader-image>
                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                        <thead>
	                        <tr class="bg-primary">
	                            <th><fmt:message key="common.item" bundle="${msg}" /></th>
	                            <th colspan="2"><fmt:message key="common.status" bundle="${msg}" /></th>
	                            <th><fmt:message key="common.action" bundle="${msg}" /></th>
	                        </tr>
                        </thead>
                        <tbody>
                          <tr>
		                        <td width="60%" class=""><span class="m-l-lg"></span></td>
		                        <td width="8%" class="bg-info text-center font-bold"><fmt:message key="common.acs" bundle="${msg}" /></td>
		                        <td width="8%" class="bg-info text-center font-bold"><fmt:message key="common.panda" bundle="${msg}" /></td>
		                        <td width="24%" class="text-right"></td>
		                    </tr>

                        <tr data-ng-repeat="import in formElements.importList" data-ng-class="import.acsCount == import.pandaCount? 'text-normal' : 'text-danger'">
                             <td>
                                 {{import.name}}
                             </td>
                             <td class="text-center">
                                 {{import.acsCount}}
                             </td>
                             <td class="text-center">
                                 {{import.pandaCount}}
                             </td>
                             <td>
                                 <span>
                                     <a data-ng-hide="showLoader" class="btn btn-primary" data-ng-click="openImportContainer(import.keyName, 'check')"> <i class="fa fa-exchange"></i> <fmt:message key="common.check" bundle="${msg}" /></a>
                                     <a data-ng-hide="showLoader" class="btn btn-info" data-ng-click="openImportContainer(import.keyName, 'import')"><i class="fa fa-download"></i> <fmt:message key="common.import" bundle="${msg}" /></a>
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