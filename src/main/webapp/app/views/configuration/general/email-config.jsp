<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <span class="pull-left">
                            <a class="btn btn-info" ui-sref="configuration.home({category:'general'})"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body">
                <div class="col-md-6 col-sm-6 border-right">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Application URL:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input type="text" name="applicationURL" value="http://localhost:8383/jade-art-admin/app/index.html" readonly   class="form-control" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The URL of this panel" ></i>



                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Username:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input type="text" name="host" value="assistanz.test@gmail.com" readonly class="form-control" >
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Username" ></i>

                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Port:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="port" value="465" readonly  class="form-control">
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Port no of the email server" ></i>

                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">From:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input type="text" name="from" value="panda@assistanz.com" readonly class="form-control" >
                                 <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The from address of the email server" ></i>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Host:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input type="text" name="host" value="smtp.gmail.com" readonly class="form-control" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Host of the email server" ></i>


                            </div>

                        </div>
                    </div>
                <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Password:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="password" value="l3m3in" readonly class="form-control">
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Admin Password" ></i>

                            </div>

                        </div>
                    </div>
                     <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">SSL:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">

                                <input icheck  data-ng-model="ssl" name="ssl"  type="checkbox" />

                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="SSL is enabled or not" ></i>

                            </div>

                        </div>
                    </div>
                     <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Sender Name:
                                <span class="text-danger">*</span>
                            </label>

                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="senderName" value="panda" readonly  class="form-control" >

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
