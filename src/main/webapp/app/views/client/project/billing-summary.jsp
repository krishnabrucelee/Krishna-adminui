<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div ng-controller="billingSummaryCtrl">
<div class="row" >
    <div class="col-md-6 chart-area">
        <div class="hpanel">
            <div class="panel-heading">
                Invoice Summary
            </div>
            <div class="panel-body">
                <div>
                    <canvas barchart options="singleBarChartOptions" data="invoiceSummaryData" height="160" width="500"  ></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 chart-area">
        <div class="hpanel">
            <div class="panel-heading">
                Payment Summary
            </div>
            <div class="panel-body">
                <div>
                    <canvas barchart options="singleBarChartOptions" data="paymentSummaryData" height="160" width="500"  ></canvas>
                </div>
            </div>
        </div>
    </div>

</div>

    <div class="row" >
    <div class="col-md-6 chart-area">
        <div class="hpanel">
            <div class="panel-heading">
                Custom Item & Recurring Item Summary
            </div>
            <div class="panel-body">
                <div>
                    <canvas barchart options="singleBarChartOptions" data="reucrringItemSummaryData" height="160" width="500"  ></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6  chart-area">
        <div class="hpanel">
            <div class="panel-heading">
                Support Summary
            </div>
            <div class="panel-body">
                <div>
                    <canvas barchart options="singleBarChartOptions" data="supportSummaryData" height="160" width="500"  ></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
</div>