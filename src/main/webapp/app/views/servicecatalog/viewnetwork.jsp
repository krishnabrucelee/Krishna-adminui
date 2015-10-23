<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="form.detachForm" ng-controller="networkListCtrl">
    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header hide-zone="false" page-custom-icon="images/network-icon-2.png" page-title="View Network Offer"></panda-modal-header>

        </div>

        <div class="modal-body" >
            <div class=" row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="table-responsive">
                        <table cellspacing="2" cellpadding="5"  class=" w-m table  table-hover table-striped table-mailbox table-bordered ">
                            <tr> <td><label>Zone</label></td><td>{{ network.zone.name}}</td></tr>
                            <tr>  <td><label>Name</label></td> <td>{{network.networkname}}</td></tr>
                            <tr> <td><label>Description</label></td> <td>{{ network.description}}</td></tr>
                            <tr> <td><label>Network Rate(MB)</label></td> <td>{{ network.networkrate}}</td></tr>
                            <tr> <td><label>Supported Services</label></td><td>{{ network.supportedservices}}</td></tr>
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <div class="modal-footer">
                    <button type="button" class="btn btn-info " ng-click="cancel()" data-dismiss="modal">Ok</button>
                </div>
    </div>

</form>