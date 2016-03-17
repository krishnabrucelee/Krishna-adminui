<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="hpanel">
    <div class="row m-l-sm m-r-sm panel-body">

        <ul class="nav nav-tabs" data-ng-init="miscellaneousCategory = 'template'">
            <li class="active"><a href="javascript:void(0)" data-ng-click="miscellaneousCategory = 'template'" data-toggle="tab"> <i class="fa fa-dashboard"></i> Template</a></li>
            <li class=""><a data-ng-click="miscellaneousCategory = 'snapshot'" data-toggle="tab"> <i class="fa fa-camera-retro"></i> Volume Snapshot</a></li>
            <li class=""><a  data-ng-click="miscellaneousCategory = 'ipcost'" data-toggle="tab"> <i class="custom-icon custom-icon-ip"></i> IP Cost</a></li>
            <li class=""><a data-ng-click="miscellaneousCategory = 'vmsnapshot'" data-toggle="tab"> <i class="fa fa-camera-retro"></i> VM Snapshot</a></li>

        </ul>

        <div class="tab-content">

            <div class="tab-pane" data-ng-class="{'active' : miscellaneousCategory == 'template'}" id="step1-template">
                <div data-ng-include src="'app/views/servicecatalog/miscellaneous/templatecost.jsp'"></div>
            </div>
            <div class="tab-pane"  data-ng-class="{'active' : miscellaneousCategory == 'snapshot'}" id="step1-snapshot">
                <div data-ng-include src="'app/views/servicecatalog/miscellaneous/snapshot.jsp'"></div>
            </div>
            <div class="tab-pane"  data-ng-class="{'active' : miscellaneousCategory == 'ipcost'}" id="step1-ipcost">
                <div data-ng-include src="'app/views/servicecatalog/miscellaneous/ip-cost.jsp'"></div>
            </div>
            <div class="tab-pane"  data-ng-class="{'active' : miscellaneousCategory == 'vmsnapshot'}" id="step1-vmsnapshot">
                <div data-ng-include src="'app/views/servicecatalog/miscellaneous/vmsnapshot.jsp'"></div>
            </div>
        </div>
    </div>
</div>
