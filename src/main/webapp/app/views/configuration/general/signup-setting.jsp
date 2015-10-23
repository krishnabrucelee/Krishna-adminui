<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="configForm" data-ng-submit="validateSignUP(configForm)" method="post" novalidate="" data-ng-controller="configurationCtrl">

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
                <div class="panel-body">
                    <div class="col-md-7 col-sm-8">


                        <div class="form-group" >
                            <div class="row">
                                <label class="col-md-3 col-sm-5 control-label">Sign up Setting:

                                </label>
                                <div class="col-md-9 col-sm-9">
                                <label class=" ">

                                    <input icheck type="radio" data-ng-model="public" value="Public" name="signUpSetting" data-ng-checked="true" > Public


                                </label>
                                    <label class="m-l-sm ">

                                    <input icheck type="radio" data-ng-model="invitation" value="Invitation only" name="signUpSetting"  > Invitation only


                                </label>
                                    <label class="m-l-sm ">

                                    <input  icheck type="radio" data-ng-model="disabled" value="Disabled" name="signUpSetting"  > Disabled


                                </label>
                                </div>
                            </div>
                        </div>

                       <div class="form-group" >
                             <div class="row">
                                <label class="col-md-3 col-sm-5 control-label">

                                </label>
                                  <div class="col-md-9 col-sm-9">
                        <button class="btn btn-info" type="submit">Update</button>
                                  </div>
                             </div>
                       </div>
                    </div>

                </div>
            </div>


        </div>
    </div></form>