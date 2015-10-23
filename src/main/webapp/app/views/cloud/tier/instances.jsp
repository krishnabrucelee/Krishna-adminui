<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view >

    <div class="row"  >


    <div class="col-md-12 col-sm-12" >
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12  ">
                        <div class="quick-search pull-right">
                            <div class="input-group">
                                <input data-ng-model="instanceSearch" type="text" class="form-control input-medium" placeholder="Quick Search" aria-describedby="quicksearch-go">
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
                        <th>Instance Name</th>
                        <th>User</th>
                        <th>Zone</th>
                        <th>State</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-ng-repeat="instance in instanceList | filter: instanceSearch">
                        <td>
                           {{ instance.instancename }}
                        </td>
                        <td>{{ instance.username }}</td>
                        <td>{{ instance.zone.name }}</td>
                        <td>
                            <label class="icon-button btn  btn-sm" data-ng-class="instance.state=='Stopped' ? 'btn-danger':'btn-success'"  title="{{ instance.state }}"  >{{ instance.state }}</label>
                            </td>

                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>