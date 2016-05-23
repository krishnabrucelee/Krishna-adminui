<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

   <div class="row">


    <div class="col-md-12 col-sm-12" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                     <div class="col-md-9 col-sm-9 col-xs-9 pull-right">
                            <span class="pull-right">
                                <a class="btn btn-info" data-ng-click="addPrivateGateway('md')"><span class="pe-7s-plus pe-lg font-bold m-r-xs"></span>Add Private Gateway</a>
                                <a class="btn btn-info" ui-sref="cloud.vpc.view({id:{{vpc.id}}})" title="Refresh"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                            </span>
                         <div class="quick-search pull-right m-r-xs">
                            <div class="input-group">
                                <input data-ng-model="ipSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
                                <span class="input-group-addon" id="quicksearch-go"><span class="pe-7s-search pe-lg font-bold"></span></span>
                            </div>
                        </div>
                        </div>


                </div>
               <div class="clearfix"></div>
            </div>

            <div class="white-content">
                <div class="table-responsive">
                    <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Physical Network</th>
                        <th>VLAN</th>
                        <th>IPs</th>
                        <th>Gateway</th>
                        <th>Netmask</th>
                        <th>Source NAT</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-ng-repeat="vpn in SSVPNs| filter: ipSearch">
                        <td>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
</div>
