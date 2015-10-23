<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateLanguage(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/general"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body"><div class="col-md-7 col-sm-7">

                        <div class="form-group" ng-class="{
                                            'has-error'
                                            :configForm.language.$invalid && formSubmitted}">
                            <div class="row">
                                <label class="col-md-4 col-sm-5 control-label">Select Default Language:

                                </label>

                                <div class="col-md-6 col-sm-7">
                                    <select required="true" class="form-control input-group" name="language" data-ng-model="config.language" data-ng-init="config.language = formElements.languageList[1]" ng-options="language.name for language in formElements.languageList" >

                                    </select>
                                    <span class="help-block m-b-none" ng-show="configForm.language.$invalid && formSubmitted" >Language is required.</span>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Select default language for panel" ></i>



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