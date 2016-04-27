<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<ng-include id="header" src="global.getViewPageUrl('common/header.jsp')"></ng-include>
<ng-include id="menu" src="global.getViewPageUrl('common/navigation.jsp')"></ng-include>


<!-- Main Wrapper -->
<div id="wrapper">

<div class="content">
	<div class="row">
	    <div class="col-md-12">
	        <div class="panel panel-white no-border-radious">
	            <div class="panel-body no-padding">
	                <div class="p-sm company-title-bg pull-left">Company</div>
	                <div class="pull-left m-r-sm p-sm text-info font-bold">Company name goes here</div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="row">
	    <div class="col-md-4 col-sm-4 col-xs-12">
	        <div class="panel panel-white no-border-radious">
	            <div class="panel-body company-dashboard-panel">
	                <div class="row">
	                	<div class="col-md-12">
			                <div class="company-panel-title-area">
			                	<div class="pull-left">
			                		<div class="company-panel-icon label-danger text-center"><i class="fa fa-phone"></i></div>
			                	</div>
			                	<div class="pull-left company-panel-title font-bold m-l-sm">
			                		Contact <span>Contact Person Details</span>
			                	</div>
			                </div>
		                </div>
	                </div>
	                <div class="row">
		                <div class="col-md-12 m-t-md company-panel-content">
			                <accordion close-others="oneAtATime" class="company-dashboard-accordion">
			                    <accordion-group heading="Primary Contact" is-open="true">
			                        <ul class="list-group no-border">
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">F.Name</div>
		                						<div class="col-md-8">Jamseer</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item ">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">L.Name</div>
		                						<div class="col-md-8">Noorden</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Email</div>
		                						<div class="col-md-8">jamseer@company.com</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Phone</div>
		                						<div class="col-md-8">+91 9595656566</div>
	                						</div>
					                    </li>
					                </ul>
			                    </accordion-group>
			                    <accordion-group heading="Secondary Contact">
			                        <ul class="list-group no-border">
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">F.Name</div>
		                						<div class="col-md-8">Ibrahim</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item ">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">L.Name</div>
		                						<div class="col-md-8">Hassan</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Email</div>
		                						<div class="col-md-8">ibrahim@company.com</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Phone</div>
		                						<div class="col-md-8">+91 8554212121</div>
	                						</div>
					                    </li>
					                </ul>
			                    </accordion-group>
			                </accordion>
		                </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-4 col-sm-4 col-xs-12">
	        <div class="panel panel-white no-border-radious">
	            <div class="panel-body company-dashboard-panel">
	                <div class="row">
	                	<div class="col-md-12">
			                <div class="company-panel-title-area">
			                	<div class="pull-left">
			                		<div class="company-panel-icon label-info text-center"><i class="fa fa-building"></i></div>
			                	</div>
			                	<div class="pull-left company-panel-title font-bold m-l-sm">
			                		Company <span>Company Location Details</span>
			                	</div>
			                </div>
		                </div>
	                </div>
	                <div class="row">
		                <div class="col-md-12 m-t-md company-panel-content">
			                <ul class="list-group no-border">
			                    <li class="list-group-item">
			                        <div class="row">
                						<div class="col-md-5 font-bold">Company</div>
                						<div class="col-md-7">Company Name</div>
               						</div>
			                    </li>
			                    <li class="list-group-item ">
			                        <div class="row">
                						<div class="col-md-5 font-bold">Domain Name<span class="sub-text">(Login Name)</span></div>
                						<div class="col-md-7">cn.domain</div>
               						</div>
			                    </li>
			                    <li class="list-group-item">
			                        <div class="row">
                						<div class="col-md-5 font-bold">H.Q</div>
                						<div class="col-md-7">Coimbatore</div>
               						</div>
			                    </li>
			                    <li class="list-group-item">
			                        <div class="row">
                						<div class="col-md-5 font-bold">Address</div>
                						<div class="col-md-7">1136 Sample Plazaa, Dr. Lorem ipsum road, LA, Coimbatore</div>
               						</div>
			                    </li>
			                </ul>
		                </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-4 col-sm-4 col-xs-12">
	        <div class="panel panel-white no-border-radious">
	            <div class="panel-body company-dashboard-panel">
	                <div class="row">
	                	<div class="col-md-12">
			                <div class="company-panel-title-area">
			                	<div class="pull-left">
			                		<div class="company-panel-icon label-warning text-center"><i class="fa fa-user"></i></div>
			                	</div>
			                	<div class="pull-left company-panel-title font-bold m-l-sm">
			                		Account <span>Account History Details</span>
			                	</div>
			                </div>
		                </div>
	                </div>
	                <div class="row">
		                <div class="col-md-12 m-t-md company-panel-content">
		                	<ul class="list-group no-border">
			                    <li class="list-group-item">
			                        <div class="row">
                						<div class="col-md-5 font-bold">Member Since</div>
                						<div class="col-md-7">05-08-2014</div>
               						</div>
			                    </li>
			                    <li class="list-group-item ">
			                        <div class="row">
                						<div class="col-md-5 font-bold">A/C Status</div>
                						<div class="col-md-7 font-bold text-success">Active</div>
               						</div>
			                    </li>
			                </ul>
			                <a href="#" class="btn btn-info m-t-md">Suspend Account</a>
		                </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="row">
	    <div class="col-md-12">
	        <div class="panel panel-white no-border-radious">
	            <div class="panel-body">
					<tabset>
		                <tab>
		                    <tab-heading>
		                        <i class="fa fa-line-chart"></i> Billing Summary
		                    </tab-heading>
		                    <div class="panel-body">
		                        <div class="row">
		                        	<div class="col-md-8 col-sm-6 col-xsmd-12">
		                        		<img src="images/revenue-graph.jpg">
		                        	</div>
		                        	<div class="col-md-4 col-sm-6 col-xsmd-12">
		                        		<div class="table-responsive">
							                <table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
							                    <tr>
							                        <td class="font-bold">Total Income</td>
							                        <td>
														 <div class="pull-right font-bold m-l-md">(¥)</div>
														 <div class="pull-right">15,000.00</div>
													</td>
							                    </tr>
							                    <tr>
							                        <td class="font-bold">Overdue</td>
							                        <td>
														 <div class="pull-right font-bold m-l-md">(¥)</div>
														 <div class="pull-right">0.00</div>
													</td>
							                    <tr>
							                        <td class="font-bold">Due</td>
							                        <td>
														 <div class="pull-right font-bold m-l-md">(¥)</div>
														 <div class="pull-right">650.00</div>
													</td>
							                    </tr>
							                    <tr>
							                        <td class="font-bold">Last Payment</td>
							                        <td>
														 <div class="pull-right font-bold m-l-md">(¥)</div>
														 <div class="pull-right">525.00</div>
													</td>
							                    </tr>
							                    <tr>
							                        <td class="font-bold">Paid On</td>
							                        <td>
														 <div class="pull-right font-bold m-l-md"></div>
														 <div class="pull-right">30-03-2015</div>
													</td>
							                    </tr>
							                    </tbody>
							                </table>
						                </div>
		                        	</div>
		                        </div>
		                    </div>
		                </tab>
		                <tab>
		                    <tab-heading>
		                        <i class="fa fa-area-chart"></i> Resource Usage
		                    </tab-heading>
		                    <div class="panel-body">
		                        <div class="row">
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details running-vm">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">09</div>
		            					</div>
		            					<div class="quick-view-title text-center">Running VM</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details stopped-vm">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">06</div>
		            					</div>
		            					<div class="quick-view-title text-center">Stopped VM</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details total-vm">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">15</div>
		            					</div>
		            					<div class="quick-view-title text-center">Total VM</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details vcpu">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">03</div>
		            					</div>
		            					<div class="quick-view-title text-center">vCpu</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details vcpu">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">15<small>(GB)</small></div>
		            					</div>
		            					<div class="quick-view-title text-center">RAM</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details vcpu">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">18<small>(GB)</small></div>
		            					</div>
		            					<div class="quick-view-title text-center">Storage Allocation</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details networks">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">12</div>
		            					</div>
		            					<div class="quick-view-title text-center">Public IP</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details networks">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">04</div>
		            					</div>
		            					<div class="quick-view-title text-center">Networks</div>
		            				</div>
		            				<div class="col-md-2 col-sm-3 col-xs-6">
		            					<div class="quick-view-details private-template">
		            						<div class="quick-view-icon pull-right"></div>
		            						<div class="quick-view-count pull-right">07</div>
		            					</div>
		            					<div class="quick-view-title text-center">Private Template</div>
		            				</div>
		           				</div>
		                    </div>
		                </tab>
		                <tab>
		                    <tab-heading>
		                        <i class="fa  fa-pie-chart"></i> Quota Limit
		                    </tab-heading>
		                    <div class="panel-body">
		                        <div class="row">
		                        	<div class="col-md-6 col-sm-12 col-xsmd-12">
		                        		<div class="row dashboard-quota-area" ng-controller="appCtrl">
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">42%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData1" height="140" responsive=true></canvas>
				            					vCpu<span>Using 4 of 10</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">73%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData2" height="140" responsive=true></canvas>
				            					Memory<span>Using 730 of 1000</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">22%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData3" height="140" responsive=true></canvas>
				            					Volume<span>Using 2 of 10</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">88%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData4" height="140" responsive=true></canvas>
				            					Network<span>Using 8 of 10</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">88%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData4" height="140" responsive=true></canvas>
				            					IP Address<span>Using 8 of 10</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">73%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData2" height="140" responsive=true></canvas>
				            					Primary Storage<span>Using 73 of 100</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">22%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData3" height="140" responsive=true></canvas>
				            					Secondary Storage<span>Using 22 of 100</span>
				            				</div>
				            				<div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota">
				            					<div class="doughnutchart-value">42%</div>
				            					<canvas doughnutchart options="doughnutOptions" data="doughnutData1" height="140" responsive=true></canvas>
				            					Snapshots<span>Using 4 of 10</span>
				            				</div>
				           				</div>
		                        	</div>
		                        	<div class="col-md-6 col-sm-12 col-xsmd-12">
										<div class="">
			                				<table cellspacing="1" cellpadding="1" class="table table-bordered table-striped">
											    <thead class="bg-info">
											        <tr  class="ng-scope">
											            <th class="text-center p-xxs">
											                <label> Quota Type</label></th>
											            <th class="text-center p-xxs">Company Limit</th>
											            <th class="text-center p-xxs">
											                <label> Min</label>
											            </th>
											            <th class="text-center p-xxs">
											                <label> Max</label>
											            </th>
											        </tr>
											    </thead>
											    <tbody>
											        <tr>
											            <td class="p-xxs">
											                <label>Volume limits:
											                    <span class="text-danger">*</span></label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.Volume.$invalid & amp; & amp; formSubmitted || resourceAllocationField.Volume.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.Volume" name="Volume" valid-integer="" required="true">
											                    <i tooltip="Maximum volumes to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.Volume.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.Volume.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.Volume.errorMessage || 'Volume limits are required' }}" tooltip="Volume limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label><span class="ng-binding">424</span></label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span>
											                    </label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>User VM limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.Instance.$invalid & amp; & amp; formSubmitted || resourceAllocationField.Instance.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.Instance" name="Instance" is-number="" valid-integer="" required="true">
											                    <i tooltip="Maximum user VMs to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.Instance.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.Instance.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.Instance.errorMessage || 'User VM limits are required' }}" tooltip="User VM limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">401</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span>
											                    </label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>Template limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.Template.$invalid & amp; & amp; formSubmitted || resourceAllocationField.Template.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.Template" name="Template" valid-integer="" required="true">
											                    <i tooltip="Maximum templates to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.Template.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.Template.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.Template.errorMessage || 'Template limits are required' }}" tooltip="Template limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">400</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span>
											                    </label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>Network limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.Network.$invalid & amp; & amp; formSubmitted || resourceAllocationField.Network.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.Network" name="Network" valid-integer="" required="true">
											                    <i tooltip="Maximum networks to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.Network.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.Network.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.Network.errorMessage || 'Network limits are required' }}" tooltip="Network limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">411</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span>
											                    </label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											
											                <label>Snapshot limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.Snapshot.$invalid & amp; & amp; formSubmitted || resourceAllocationField.Snapshot.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.Snapshot" name="Snapshot" valid-integer="" required="true">
											                    <i tooltip="Maximum snapshots to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.Snapshot.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.Snapshot.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.Snapshot.errorMessage || 'Snapshot limits are required' }}" tooltip="Snapshot limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">400</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span>
											                    </label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>Public IP limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.IP.$invalid & amp; & amp; formSubmitted || resourceAllocationField.IP.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.IP" name="IP" valid-integer="" required="true">
											                    <i tooltip="Maximum public IPs to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.IP.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.IP.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.IP.errorMessage || 'Public IP limits are required' }}" tooltip="Public IP limits are required"></i>
											                    </div>
											                </div></td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">401</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span></label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>VPC limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.VPC.$invalid & amp; & amp; formSubmitted || resourceAllocationField.VPC.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.VPC" name="VPC" valid-integer="" required="true">
											                    <i tooltip="Maximum VPCs to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.VPC.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.VPC.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.VPC.errorMessage || 'VPC limits are required' }}" tooltip="VPC limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">400</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span></label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>CPU core limits:
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.CPU.$invalid & amp; & amp; formSubmitted || resourceAllocationField.CPU.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.CPU" name="CPU" valid-integer="" required="true">
											                    <i tooltip="Maximum CPU cores to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.CPU.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.CPU.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.CPU.errorMessage || 'CPU core limits are required' }}" tooltip="CPU core limits are required"></i></div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">781</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span></label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>Memory limits (MiB):
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.Memory.$invalid & amp; & amp; formSubmitted || resourceAllocationField.Memory.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.Memory" name="Memory" valid-integer="" required="true">
											                    <i tooltip="Maximum memory to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.Memory.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.Memory.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.Memory.errorMessage || 'Memory limits are required' }}" tooltip="Memory limits are required"></i></div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">784752</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span></label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>Primary Storage limits (GiB):
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.PrimaryStorage.$invalid & amp; & amp; formSubmitted || resourceAllocationField.PrimaryStorage.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.PrimaryStorage" name="PrimaryStorage" valid-integer="" required="true">
											                    <i tooltip="Maximum primary storage to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.PrimaryStorage.$invalid & amp; & amp; formSubmitted) || resourceAllocationField.PrimaryStorage.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.PrimaryStorage.errorMessage || 'Primary Storage limits are required' }}" tooltip="Primary Storage limits are required"></i>
											                    </div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">3970</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span></label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td class="p-xxs">
											                <label>Secondary Storage limits (GiB):
											                    <span class="text-danger">*</span>
											                </label>
											            </td>
											            <td class="p-xxs">
											                <div class="col-md-10 col-sm-10">
											                    <input type="text" data-ng-class="{'error': (resourceAllocationForm.SecondaryStorage.$invalid & amp; & amp; formSubmitted || resourceAllocationField.SecondaryStorage.$invalid)}" class="form-control ng-pristine ng-untouched ng-valid ng-valid-required" data-ng-model="resourceQuota.SecondaryStorage" data-ng-blur="validateRange(resource, resourceQuota, type, 'SecondaryStorage')" name="SecondaryStorage" valid-integer="" required="true">
											                    <i tooltip="Maximum secondary storage to be allocated" class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon"></i>
											                    <div data-ng-show="((resourceAllocationForm.SecondaryStorage.$invalid) & amp; & amp; formSubmitted || resourceAllocationField.SecondaryStorage.$invalid)" class="error-area ng-hide">
											                        <i class="fa fa-warning error-icon" ng-attr-tooltip="{{ resourceAllocationForm.SecondaryStorage.errorMessage || 'Secondary Storage limits is required' }}" tooltip="Secondary Storage limits is required"></i></div>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">7750</span>
											                    </label>
											                </div>
											            </td>
											            <td class="p-xxs">
											                <div  class="ng-scope">
											                    <label>
											                        <span class="ng-binding">-1</span></label>
											                </div>
											            </td>
											        </tr>
											        <tr>
											            <td colspan="4">
											                <div class="ng-scope">
											                    <div class="row">
											                        <get-loader-image data-ng-show="showLoader" class="ng-hide"><div data-ng-show="showLoader" class="row ng-hide">
											                                <div class="col-md-12 text-center">
											                                    <img width="64" height="64" src="images/loading-bars.svg">
											                                </div>
											                            </div></get-loader-image>
											                        <div data-ng-hide="showLoader" class="text-center">
											                            <a href="#/client/company" class="btn btn-default btn-outline ng-scope">Cancel</a><!-- end ngIf: type == 'domain-quota' -->
											                            <button type="submit" data-ng-hide="showLoader" has-permission="DOMAIN_QUOTA" class="btn btn-info">Update</button>
											                        </div>
											                    </div>
											                </div>
											            </td>
											        </tr>
											    </tbody>
											</table>
										</div>	
									</div>
	                        	</div>
		                    </div>
		                </tab>
		                <tab>
		                    <tab-heading>
		                        <i class="fa fa-file-text-o"></i> Invoice
		                    </tab-heading>
		                    <div class="panel-body">
		                        <strong>Invoice</strong>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		                    </div>
		                </tab>
		                <tab>
		                    <tab-heading>
		                        <i class="fa fa-money"></i> Payments
		                    </tab-heading>
		                    <div class="panel-body">
		                        <strong>Payments</strong>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		                    </div>
		                </tab>
		            </tabset>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<div class="row"><div id="footer" class="m-t-md" ng-include="'app/views/common/footer.jsp'"></div></div>
</div>

<script type="text/javascript">
        $(document).ready(function() {
        $('.slimScroll').slimScroll();
                $('.slimScroll-175').slimScroll({
        height:'176px'
        });
                $('.slimScroll-220').slimScroll({
        height:'234px'
        });
                $('.slimScroll-500').slimScroll({
                    height:'500px'
                    });
        });
    </script>