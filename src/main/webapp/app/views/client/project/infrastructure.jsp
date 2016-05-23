<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div ng-controller="projectInfrastructureCtrl">


    <div class="dashboard-grid-areas" >

        <div class="row">
            <div class="col-md-2 col-sm-4 infrastructure-box p-xxs">
                <div class="dashboard-box">
                    <span class="pull-left m-t-xs"><img src="images/instance-icon.png"></span>
                    <div class="text-right">Usage Cost</div>
                    <b class="text-right"><app-currency></app-currency> 0.00</b>
                    <div class="clearfix"></div>
                    <div class="text-right"><small>02/SEP/2015</small></div>
                </div>
                <div class="dashboard-box">
                    <span class="pull-left m-t-xs"><img src="images/instance-icon.png"></span>
                    <div class="text-right">Current Usage</div>
                    <b class="pull-right"><app-currency></app-currency> 58.19</b>
                    <div class="clearfix"></div>
                    <div class="text-right"><small>02/SEP/2015 - 01/OCT/2015</small></div>
                </div>
                <div class="dashboard-box">
                    <span class="pull-left m-t-xs"><img src="images/instance-icon.png"></span>
                    <div class="text-right">Payments</div>
                    <b class="pull-right"><app-currency></app-currency> 0.00</b>
                    <div class="clearfix"></div>
                    <div class="text-right"><small>02/SEP/2015 - 01/OCT/2015</small></div>
                </div>
            </div>
            <div  class="col-md-2 col-sm-4 p-xxs">
                <div class="hpanel hbgblue">
                    <div class="panel-body p-xs">
                        <div class="text-center">
                            <h5>Running Instances</h5>
                            <p class="text-big font-light">
                                07
                            </p>
                            <hr class="no-margins">
                            <h4>
                               <app-currency></app-currency> 4.18
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

             <div  class="col-md-2 col-sm-4 p-xxs">
                <div class="hpanel hbgblue">
                    <div class="panel-body p-xs">
                        <div class="text-center">
                            <h5>Stopped Instances</h5>
                            <p class="text-big font-light">
                                00
                            </p>
                            <hr class="no-margins">
                            <h4>
                                <app-currency></app-currency> 0.00
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-2 col-sm-4 p-xxs">
                <div class="hpanel hbgblue">
                    <div class="panel-body p-xs">
                        <div class="text-center">
                            <h5>Storage Disk</h5>
                            <p class="text-big font-light">
                                02
                            </p>
                            <hr class="no-margins">
                             <h4>
                                <app-currency></app-currency> 10.80
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

             <div  class="col-md-2 col-sm-4 p-xxs">
                <div class="hpanel hbgblue">
                    <div class="panel-body p-xs">
                        <div class="text-center">
                            <h5>Snapshot</h5>
                            <p class="text-big font-light">
                                01
                            </p>
                            <hr class="no-margins">
                            <h4>
                                <app-currency></app-currency> 1.00
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-2 col-sm-4 p-xxs">
                <div class="hpanel hbgblue">
                    <div class="panel-body p-xs">
                        <div class="text-center">
                            <h5>Bandwidth</h5>
                            <p class="text-big font-light">
                                0GB
                            </p>
                            <hr class="no-margins">
                            <h4>
                                <app-currency></app-currency> 0.00
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>