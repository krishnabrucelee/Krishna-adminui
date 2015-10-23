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
                            <a class="btn btn-info" href="#/configuration/cloudstack" title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">
                <form name="configForm" data-ng-submit="validateZone(configForm)" method="post" novalidate="" data-ng-controller="cloudStackCtrl">
                    <div class="row">
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
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-3 col-sm-3 control-label ">Name:
                                            </label>
                                            <div class="col-md-5 col-sm-6">{{value}}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row" >
                                            <label class="col-md-3 col-sm-3 control-label ">Description:
                                            </label>

                                            <div class="col-md-5 col-sm-6" >

                                                <summernote height="100"  data-ng-model="summernoteTextTwo" config="summernoteOpt"></summernote>


                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-3 col-sm-3 control-label ">
                                            </label>
                                            <div class="col-md-5 col-sm-6" >
                                                <button class="btn btn-info" type="submit">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    initResourceUsageTree();
</script>
