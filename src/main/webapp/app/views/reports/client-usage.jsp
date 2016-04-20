<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ui-view data-ng-controller="reportCtrl">
    <div data-ng-include src="'app/views/reports/client-generator.jsp'"></div>
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="text-center m-t-xxxl" data-ng-show="showLoader">
            <img src="images/loading-bars.svg" />
        </div>
    </div>
	<div data-ng-hide="showLoader">
			<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 m-b-sm">
							<a
								href="{{ global.PING_APP_URL }}usage/listClientUsage/report?fromDate={{clientUsage.startDate}}&toDate={{clientUsage.endDate}}&status={{reports.status}}&type=pdf"
								class="btn btn-info  pull-right m-l-xs"><span
								class="fa fa-file-pdf-o "></span> PDF</a> <a
								href="{{global.PING_APP_URL }} usage/listClientUsage/report?fromDate={{clientUsage.startDate}}&toDate={{clientUsage.endDate}}&status={{reports.status}}&type=xlsx"
								class="btn btn-info pull-right m-r-xs"><span
								class=" fa fa-file-excel-o "></span> XLSX</a>
						</div>
					</div>
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="white-content">
				<div class="table-responsive">
					<div class="row" data-ng-show="myframe">
						<iframe width="500" height="200" id="myframe" name="myframe" class="embed-responsive-item col-md-12"></iframe>
					</div>
				</div>
			</div>
		</div>

	</div>



</div>