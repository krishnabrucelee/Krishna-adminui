<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form name="form.detachForsm" data-ng-controller="projectViewCtrl">
    <div class="inmodal" >
        <div class="modal-header">
            <panda-modal-header hide-zone="false" page-title="Suspend Project"></panda-modal-header>
            <!--<h2 class="modal-title" id="myModalLabel">Confirm Detach Volume</h2>-->
        </div>

        <div class="modal-body">
            <div class=" row" data-ng-hide="suspendingProject">
                <div class="form-group has-error col-md-3 col-sm-3  col-xs-3">

                    <span class="fa fa-3x fa-warning text-warning"></span>
                </div>
                <div class="form-group has-error col-md-9 col-sm-9  col-xs-9">
                    <p >Please confirm that you want to suspend this project?</p>
                    <div class=" row">
                        <div class="form-group has-error col-md-12 col-sm-12  col-xs-12">
                            <textarea class="form-control" rows="8" data-ng-model="description"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center" data-ng-show="suspendingProject">
                <img src="images/loading-bars.svg" />
            </div>


        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default " ng-click="cancel()" data-dismiss="modal">No</button>
            <button type="submit" class="btn btn-default btn-danger2" ng-click="suspendProject()" data-dismiss="modal">Yes</button>

        </div>
    </div>

</form>