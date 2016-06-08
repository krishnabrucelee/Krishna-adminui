<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<form name="configForm" data-ng-submit="validateThemeSettings(configForm,themeSettingsList, headerChoices, footerChoices)" method="post" novalidate="" data-ng-controller="configurationCtrl">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <span class="pull-left">
                                <a class="btn btn-info" href="#/configuration/general"  title="<fmt:message key="common.back" bundle="${msg}" />" ><span class="fa fa-arrow-circle-left fa-lg "></span> <fmt:message key="common.back" bundle="${msg}" /></a>
                            </span>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="panel-body"><div class="col-md-12 col-sm-12">

                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-2 col-sm-3 control-label"><fmt:message key="upload.background.image" bundle="${msg}" />:
                                </label>
                                <div class="col-md-10 col-sm-4">
                                <div class="pull-left panel-border">
                                	<img src={{backgroundImage}} alt="" height="100" width="150">
                                </div>
								<div class="pull-left m-l-md">
                                <input type="file" name="background" accept=".jpg, .jpeg" class="custom-file-input" file-model="themeSettingsList.backgroundImgFile"/>
                               <span><label><fmt:message key="image.resolution.size" bundle="${msg}" /><br><fmt:message key="file.size" bundle="${msg}" /></label></span>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-2 col-sm-3 control-label"><fmt:message key="upload.logo.image" bundle="${msg}" />:
                                </label>
                                <div class="col-md-10 col-sm-4">
                                <div class="pull-left panel-border">
                                	<img src={{logoImage}} alt="" height="100" width="150" />
                                </div>
                                <div class="pull-left m-l-md">
                                    <input type="file" name="logo" accept=".jpg, .jpeg" class="custom-file-input" file-model="themeSettingsList.logoImgFile" />
                                <span>
                                	<label><fmt:message key="resolution.size" bundle="${msg}" />) <br><fmt:message key="file.size" bundle="${msg}" /></label>
                                </span>
                                </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group theme-settings">
                            <div class="row">
                                <label class="col-md-2 col-sm-5 control-label"><fmt:message key="add.header" bundle="${msg}" />:
                                </label>
                               <div class="col-md-5 col-sm-7" data-ng-if="themeSettingsList.headers == '' || themeSettingsList.headers == null" >
									<fieldset data-ng-repeat="headerChoice in headerChoices" class="bg-light p-xs m-b-xs">
									<div class="row" >
										<div class="col-md-5"><input type="text" data-ng-model="headerChoice.name" name="" placeholder="Header name" class="form-control"></div>
										<div class="col-md-5"><input type="text" data-ng-model="headerChoice.url" name="" placeholder="Header url" class="form-control"></div>
										<div class="col-md-2"><button class="btn btn-danger"  data-ng-click="removeHeaderChoice()">-</button></div>
									<div class="col-md-5"><input type="hidden"  data-ng-init="headerChoice.headerType = 'HEADER'" data-ng-model="headerChoice.headerType" name="" value="HEADER" class="form-control"></div>
									</div>
									</fieldset>
									<button type="button" class="addfields btn btn-info m-t-sm" data-ng-click="addNewHeaderChoice()" ><fmt:message key="add.header" bundle="${msg}" /></button>
								</div>
								 <div class="col-md-5 col-sm-7" data-ng-if="themeSettingsList.headers != '' || themeSettingsList.headers != null">
									<fieldset data-ng-repeat="headerChoice in themeSettingsList.headers" class="bg-light p-xs m-b-xs">
									<div class="row">
										<div class="col-md-5"><input type="text" data-ng-model="headerChoice.name" name="" placeholder="Header name" class="form-control"></div>
										<div class="col-md-5"><input type="text" data-ng-model="headerChoice.url" name="" placeholder="Header url" class="form-control"></div>
										<div class="col-md-2"><button class="btn btn-danger"  data-ng-click="removeThemeHeaderChoice()">-</button></div>
									<div class="col-md-5"><input type="hidden" data-ng-init="headerChoice.headerType = 'HEADER'" data-ng-model="headerChoice.headerType" name="" value="HEADER" class="form-control"></div>
									</div>
									</fieldset>
									<button type="button" data-ng-if=" themeSettingsList.headers != '' && themeSettingsList.headers != null" class="addfields btn btn-info m-t-sm" data-ng-click="addNewThemeHeaderChoice()" ><fmt:message key="add.header" bundle="${msg}" /></button>
								</div>
                            </div>
                        </div>
                        <div class="form-group theme-settings">
                            <div class="row" >
                                <label class="col-md-2 col-sm-5 control-label"><fmt:message key="add.footer" bundle="${msg}" />:
                                </label>
                                <div class="col-md-5 col-sm-7" data-ng-if="themeSettingsList.footers == '' || themeSettingsList.footers == null">
                                <fieldset data-ng-repeat="footerChoice in footerChoices" class="bg-light p-xs m-b-xs">
										<div class="row">
										<div class="col-md-5"><input type="text" data-ng-model="footerChoice.name" name="" placeholder="Footer name" class="form-control"></div>
										<div class="col-md-5"><input type="text" data-ng-model="footerChoice.url" name="" placeholder="Footer url" class="form-control"></div>
										<div class="col-md-2"><button class="btn btn-danger"  data-ng-click="removeFooterChoice()">-</button></div>
									<div class="col-md-5"><input type="hidden" data-ng-init= "footerChoice.footerType = 'FOOTER'" data-ng-model="footerChoice.footerType" name="" value="FOOTER" class="form-control"></div>
									</div>
									</fieldset>
									<button type="button" class="addfields btn btn-info m-t-sm" data-ng-click="addNewFooterChoice()"><fmt:message key="add.footer" bundle="${msg}" /></button>
								</div>
								<div class="col-md-5 col-sm-7" data-ng-if="themeSettingsList.footers != '' || themeSettingsList.footers != null">
								 <fieldset data-ng-repeat="footerChoice in themeSettingsList.footers" class="bg-light p-xs m-b-xs">
										<div class="row">
										<div class="col-md-5"><input type="text" data-ng-model="footerChoice.name" name="" placeholder="Footer name" class="form-control"></div>
										<div class="col-md-5"><input type="text" data-ng-model="footerChoice.url" name="" placeholder="Footer url" class="form-control"></div>
										<div class="col-md-2"><button class="btn btn-danger"  data-ng-click="removeThemeFooterChoice()">-</button></div>
									<div class="col-md-5"><input type="hidden" data-ng-init= "footerChoice.footerType = 'FOOTER'" data-ng-model="footerChoice.footerType" name="" value="FOOTER" class="form-control"></div>
									</div>
									</fieldset>
									<button type="button" data-ng-if="themeSettingsList.footers != '' && themeSettingsList.footers != null" class="addfields btn btn-info m-t-sm" data-ng-click="addNewThemeFooterChoice()"><fmt:message key="add.footer" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" >
                                <label class="col-md-2 col-sm-3 control-label "><fmt:message key="theme.welcome.content.admin" bundle="${msg}" />:</label>
                                <div class="col-md-5 col-sm-7">
                                    <summernote class=""  name="summernoteTextThree" required="true" height="150"  data-ng-model="themeSettingsList.welcomeContent"  config="summernoteOption"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="theme.welcome.tooltip" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" >
                                <label class="col-md-2 col-sm-3 control-label "><fmt:message key="theme.welcome.content.user" bundle="${msg}" />:</label>
                                <div class="col-md-5 col-sm-7">
                                    <summernote class=""  name="summernoteTextThree" required="true" height="150"  data-ng-model="themeSettingsList.welcomeContentUser"  config="summernoteOption"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="theme.welcome.tooltip" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row" >
                                <label class="col-md-2 col-sm-3 control-label "><fmt:message key="splash.title.admin.panel" bundle="${msg}" />:</label>
                                <div class="col-md-5 col-sm-7">
                                    <summernote class=""  name="summernoteTextThree"  height="150"  data-ng-model="themeSettingsList.splashTitle"  config="summernoteOption"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="theme.welcome.tooltip" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" >
                                <label class="col-md-2 col-sm-3 control-label "><fmt:message key="splash.title.user.panel" bundle="${msg}" />:</label>
                                <div class="col-md-5 col-sm-7">
                                    <summernote class=""  name="summernoteTextThree"  height="150"  data-ng-model="themeSettingsList.splashTitleUser"  config="summernoteOption"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="theme.welcome.tooltip" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" >
                                <label class="col-md-2 col-sm-3 control-label "><fmt:message key="theme.footer.content" bundle="${msg}" />:</label>
                                <div class="col-md-5 col-sm-7">
                                    <summernote  class=""  name="summernoteTextThree" required="true" height="150"  data-ng-model="themeSettingsList.footerContent"  config="summernoteOption"></summernote>
                                    <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon " tooltip="<fmt:message key="theme.footer.tooltip" bundle="${msg}" />" ></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <a class="btn btn-default" href="#/configuration/general"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                                <button class="btn btn-info" type="submit"><fmt:message key="common.save" bundle="${msg}" /></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>