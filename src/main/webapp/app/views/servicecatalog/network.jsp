<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row" ng-controller="networkListCtrl">
    <div class="hpanel">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">
                    <span class="pull-right m-l-sm">
                        <a class="btn btn-info" ui-sref="servicecatalog.list-network" title="<fmt:message key="common.refresh" bundle="${msg}" />"  ui-sref-opts="{reload: true}"><span class="fa fa-refresh fa-lg "></span></a>
                    </span>
					<panda-quick-search></panda-quick-search>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>

        <div data-ng-show = "showLoader" style="margin: 1%">
    				  		<get-loader-image data-ng-show="showLoader"></get-loader-image>
      						</div>
              <div data-ng-hide = "showLoader" class="table-responsive">
                      <div class="white-content">

                <table cellspacing="1" cellpadding="1" class="table dataTable table-bordered table-striped">
                    <thead>
                        <tr>
                               <th data-ng-click="changeSorting('name')" data-ng-class="sort.descending && sort.column =='name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.name" bundle="${msg}" /></th>

                                <th><fmt:message key="common.action" bundle="${msg}" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-ng-repeat="network in filteredCount = (networkList| filter: quickSearch | orderBy:sort.column:sort.descending)">
                            <td>
                                {{ network.name}}
                            </td>
                            <td>
                                <a class="icon-button" data-ng-click="showDescription(network)" title="Edit"  ><span class="fa fa-eye"></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
