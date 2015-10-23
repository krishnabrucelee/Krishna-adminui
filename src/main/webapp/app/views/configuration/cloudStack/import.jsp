<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm"  method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/cloudstack" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                    <div class="row">
                         <div class="col-md-12 col-sm-12 col-xs-12 m-b-sm">
                             <h2>Import Data From CloudStack</h2>
                         </div></div>
                    <div class="row">
                    <div class="col-md-12 col-sm-12">

                        <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">

                        <tbody>
                         <tr data-ng-repeat="import in formElements.importList">
                                <td class="col-md-9 col-sm-9">
                               {{import.name}}

                                </td>


                                <td class="col-md-3 col-sm-3">
                                    <span>
                               <a class="btn btn-info" data-ng-click="openImportContainer('sm',import.name)"> Import</a>
                            <a class="btn btn-info" > Check</a>
                            </span>

                                </td>
                            </tr>

                        </tbody>
                    </table>


                    </div></div>


                </div>
            </div>


        </div>
    </div>
</form>