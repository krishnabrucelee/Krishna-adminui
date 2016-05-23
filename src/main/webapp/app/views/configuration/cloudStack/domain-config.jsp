<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateDomain(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
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
                <div class="panel-body"><div class="col-md-7 col-sm-7">

                        <div class="form-group" ng-class="{
                                            'has-error'
                                            :configForm.domain.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Default Domain:

                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="domain" data-ng-model="config.domain"  data-ng-init="config.domain = formElements.domainList[1]" ng-options="domain.name for domain in formElements.domainList" >

                                    </select>
                                    <span class="help-block m-b-none" ng-show="configForm.domain.$invalid && formSubmitted" >Domain is required.</span>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Choose a default domain for user creation" ></i>



                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">
                                </label>
                                <div class="col-md-6 col-sm-7">
                        <button class="btn btn-info" type="submit">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>


        </div>
    </div>
</form>