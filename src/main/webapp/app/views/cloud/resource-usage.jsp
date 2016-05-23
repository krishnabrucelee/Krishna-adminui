<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

<div class="row" data-ng-controller="resourceCtrl">
    <div class="col-md-4 col-sm-6 col-xs-12 resource-tree-area">
        <div class="hidden">
            <input type="text" data-ng-model="value" id="values"/>
            <input type="text" data-ng-model="title" id="titles"/>
        </div>

        <div class="easy-tree">
            <ul>
                <li id="Zone">Advanced
                    <ul>
                        <li id="Pod"> Pod 1
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host" class="tree-act" >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 2
                                    <ul>
                                        <li id="Host" >Host 1</li>
                                        <li id="Host" >Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="Pod" >Pod 2
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host"  >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 2
                                    <ul>
                                        <li id="Host" >Host 1</li>
                                        <li id="Host" >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 3
                                    <ul>
                                        <li >Host 1</li>
                                        <li >Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="Pod">Pod 3
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host"  >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="Pod">Pod 4
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host"  >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 2
                                    <ul>
                                        <li id="Host" >Host 1</li>
                                        <li id="Host" >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 3
                                    <ul>
                                        <li id="Host">Host 1</li>
                                        <li id="Host">Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li id="Zone">Beijing
                    <ul>
                        <li id="Pod"> Pod 1
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host" class="tree-act" >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 2
                                    <ul>
                                        <li id="Host" >Host 1</li>
                                        <li id="Host" >Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="Pod" >Pod 2
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host"  >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 2
                                    <ul>
                                        <li id="Host" >Host 1</li>
                                        <li id="Host" >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 3
                                    <ul>
                                        <li id="Host">Host 1</li>
                                        <li id="Host">Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="Pod">Pod 3
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host"  >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="Pod">Pod 4
                            <ul>
                                <li  id="Cluster">Cluster 1
                                    <ul>
                                        <li id="Host"  >Host 1</li>
                                        <li id="Host"  >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 2
                                    <ul>
                                        <li id="Host" >Host 1</li>
                                        <li id="Host" >Host 2</li>
                                    </ul>
                                </li>
                                <li id="Cluster">Cluster 3
                                    <ul>
                                        <li >Host 1</li>
                                        <li >Host 2</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-md-8 col-sm-6 col-xs-12 resource-progress-area">
        <div class="hpanel">
            <div class="panel-body m-l-n-lg main-border">
                <h3 class="pull-left">{{title}} : {{value}}</h3>
                <div class="clearfix"></div>
                <h5 class="pull-left">Memory</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 10.13 GB / 12.78 GB )</small>
                <div class="clearfix"></div>
                <progressbar value="79.22" type="danger" class="m-t-sm progress-striped full">79.22%</progressbar>
                <h5 class="pull-left">CPU</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 7.68 GHz / 26.4 GHz )</small>
                <div class="clearfix"></div>
                <progressbar value="55.08" type="warning" class="m-t-sm progress-striped full">55.08 %</progressbar>
                <h5 class="pull-left">Storage</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 41.29 / 1304.39 GB )</small>
                <div class="clearfix"></div>
                <progressbar value="15.17" type="success" class="m-t-sm progress-striped full">15.17 %</progressbar>
                <h5 class="pull-left">Primary Storage Allocated</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 361.25 GB / 1833.54 GB )</small>
                <div class="clearfix"></div>
                <progressbar value="26.70" type="info" class="m-t-sm progress-striped full">26.70 %</progressbar>
                <h5 class="pull-left">Public IP Addresses</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 0 / 0 )</small>
                <div class="clearfix"></div>
                <progressbar value="0.00" type="info" class="m-t-sm progress-striped full">0.00 %</progressbar>
                <h5 class="pull-left">Management IP Addresses</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 0 / 0 )</small>
                <div class="clearfix"></div>
                <progressbar value="0.00" type="info" class="m-t-sm progress-striped full">0.00 %</progressbar>
                <h5 class="pull-left">Shared Network IPs</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 0 / 0 )</small>
                <div class="clearfix"></div>
                <progressbar value="0.00" type="info" class="m-t-sm progress-striped full">0.00 %</progressbar>
                <h5 class="pull-left">Local Storage</h5>
                <small class="pull-left m-l-sm m-t-xs">( Allocated: 19.53 GB / 387.62 GB )</small>
                <div class="clearfix"></div>
                <progressbar value="8.04" type="success" class="m-t-sm progress-striped full">8.04 %</progressbar>
            </div>
        </div>
    </div>
</div>
<script>
    $(window).load(function () {
        $('.easy-tree').EasyTree({
            addable: true,
            editable: true,
            deletable: true
        });
    });

</script>