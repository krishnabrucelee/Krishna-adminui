<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="gatewayForm" method="POST" data-ng-submit="addGateway(gatewayForm)" novalidate >
    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header page-custom-icon="images/network-icon-2.png"  page-title="Add Private Gateway"></panda-modal-header>

        </div>
        <div class="modal-body">

            <div class="row">


                <!--<div class="hr-line-dashed"></div>-->
                <div class="form-group" ng-class="{ 'text-danger' : gatewayForm.networkOffer.$invalid && formSubmitted}">

                    <div class="row" >
                        <label class="col-md-offset-1 col-sm-offset-1  col-md-2 col-xs-3 col-sm-1 control-label ">Physical Network<span class="text-danger">*</span>
                        </label>
                        <div class="col-md-5 col-xs-5 col-sm-5">
                            <select required="true" class="form-control input-group" name="networkOffer" data-ng-class="{'error': gatewayForm.networkOffer.$invalid && formSubmitted}"
                                    data-ng-model="network.networkOffers"
                                    data-ng-options="networkOffers.name for networkOffers in networkList.networkOffers" >
                                <option value="">Select</option>
                            </select>
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Select the network" ></i>
                            <div class="error-area" data-ng-show="gatewayForm.networkOffer.$invalid && formSubmitted" ><i  tooltip="Network is required." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>


                <div class="form-group" ng-class="{ 'text-danger' : gatewayForm.vlan.$invalid && formSubmitted}">

                    <div class="row" >
                        <label class="col-md-offset-1 col-sm-offset-1  col-md-2 col-xs-3 col-sm-1 control-label ">VLAN<span class="text-danger">*</span>
                        </label>
                        <div class="col-md-5 col-xs-5 col-sm-5">
                            <input required="true" type="text" class="form-control" data-ng-model="gateway.vlan" name="vlan" data-ng-class="{'error': gatewayForm.vlan.$invalid && formSubmitted}"/>
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter VLAN details" ></i>
                            <div class="error-area" data-ng-show="gatewayForm.vlan.$invalid && formSubmitted" ><i  tooltip="VLAN is required." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>

                <div class="form-group" ng-class="{ 'text-danger' : gatewayForm.ip.$invalid && formSubmitted}">
                    <div class="row" >
                        <label class="col-md-offset-1 col-sm-offset-1  col-md-2 col-xs-3 col-sm-1 control-label ">IP<span class="text-danger">*</span>
                        </label>
                        <div class="col-md-5 col-xs-5 col-sm-5">
                            <input required="true" type="text" class="form-control" data-ng-model="gateway.ip"  name="ip" data-ng-class="{'error': gatewayForm.ip.$invalid && formSubmitted}"/>
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter IP address" ></i>
                            <div class="error-area" data-ng-show="gatewayForm.ip.$invalid && formSubmitted" ><i  tooltip="IP is required." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>
                <div class="form-group" ng-class="{ 'text-danger' : gatewayForm.gatewayip.$invalid && formSubmitted}">
                    <div class="row" >
                        <label class="col-md-offset-1 col-sm-offset-1  col-md-2 col-xs-3 col-sm-1 control-label ">Gateway<span class="text-danger">*</span>
                        </label>
                        <div class="col-md-5 col-xs-5 col-sm-5">
                            <input required="true" type="text" class="form-control"  data-ng-model="gateway.gatewayip" name="gatewayip" data-ng-class="{'error': gatewayForm.gatewayip.$invalid && formSubmitted}"/>
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter network gateway" ></i>
                            <div class="error-area" data-ng-show="gatewayForm.gatewayip.$invalid && formSubmitted" ><i  tooltip="Gateway is required." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>
                <div class="form-group" ng-class="{ 'text-danger' : gatewayForm.netmask.$invalid && formSubmitted}">
                    <div class="row" >
                        <label class="col-md-offset-1 col-sm-offset-1  col-md-2 col-xs-3 col-sm-1 control-label ">Netmask<span class="text-danger">*</span>
                        </label>
                        <div class="col-md-5 col-xs-5 col-sm-5">
                            <input required="true" type="text" class="form-control"  data-ng-model="gateway.netmask" name="netmask" data-ng-class="{'error': gatewayForm.netmask.$invalid && formSubmitted}" />
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter netmask" ></i>
                            <div class="error-area" data-ng-show="gatewayForm.netmask.$invalid && formSubmitted" ><i  tooltip="Netmask is required." class="fa fa-warning error-icon"></i></div>
                        </div>
                    </div>
                </div>
                <div class="form-group" ng-class="{ 'text-danger' : gatewayForm.nat.$invalid && formSubmitted}">
                    <div class="row">
                        <label class="col-md-offset-1 col-sm-offset-1  col-md-2 col-xs-3 col-sm-1 control-label ">Source NAT<span class="text-danger">*</span>
                        </label>
                        <div class="col-md-5 col-xs-5 col-sm-5" data-ng-class="{'error': gatewayForm.nat.$invalid && formSubmitted}">
                            <input required="true" id="nat" icheck type="checkbox" name="nat" value="yes" class="input-mini p-md m-r-lg "  data-ng-model="nat" />
                            <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="Enter Source NAT" ></i>
                            <div class="error-area" data-ng-show="gatewayForm.nat.$invalid && formSubmitted" ></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">

            <a class="btn btn-default"  data-ng-click="cancel()">Cancel</a>
            <button class="btn btn-info" type="submit">Add</button>


        </div>
    </div>
</form>