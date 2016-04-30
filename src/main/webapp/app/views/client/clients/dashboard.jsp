<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row" data-ng-controller="clientListCtrl">
	<div class="col-md-12">
	
	<div class="row">
    	<div class="col-md-12">
	        <div class="panel panel-white no-border-radious">
	            <div class="panel-body no-padding">
	                <div class="p-sm company-title-bg pull-left">Company</div>
	                <div class="pull-left m-r-sm p-sm text-info font-bold">{{ domain.name }}</div>
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
		                						<div class="col-md-8">{{ domain.primaryFirstName }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item ">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">L.Name</div>
		                						<div class="col-md-8">{{ domain.lastName }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Email</div>
		                						<div class="col-md-8">{{ domain.email }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Phone</div>
		                						<div class="col-md-8">{{ domain.phone }}</div>
	                						</div>
					                    </li>
					                </ul>
			                    </accordion-group>
			                    <accordion-group heading="Secondary Contact">
			                        <ul class="list-group no-border">
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">F.Name</div>
		                						<div class="col-md-8">{{ domain.secondaryContactName }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item ">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">L.Name</div>
		                						<div class="col-md-8">{{ domain.secondaryContactLastName }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Email</div>
		                						<div class="col-md-8">{{ domain.secondaryContactEmail }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Phone</div>
		                						<div class="col-md-8">{{ domain.secondaryContactPhone }}</div>
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
	               						<div class="col-md-7">{{ domain.name }}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item ">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">Domain Name<span class="sub-text">(Login Name)</span></div>
	               						<div class="col-md-7">{{ domain.companyNameAbbreviation }}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">H.Q</div>
	               						<div class="col-md-7">{{ domain.cityHeadquarter }}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">Address</div>
	               						<div class="col-md-7">{{ domain.companyAddress }}</div>
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
	               						<div class="col-md-7">{{ domain.createdDateTime }}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item ">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">A/C Status</div>
	               						<div class="col-md-7 font-bold text-success">{{ domain.status }}</div>
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
	                        	<div class="col-md-8 col-sm-8 col-xsmd-12">
	                        		<div class="flot-chart">
										<canvas linechart options="usageLineOptions" data="usageLineData" height="250" width="680"  ></canvas>
					                </div>
	                        	</div>
	                        	<div class="col-md-4 col-sm-4 col-xsmd-12">
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
	            						<div class="quick-view-count pull-right">{{ infrastructure.runningVmCount }}</div>
	            					</div>
	            					<div class="quick-view-title text-center">Running VM</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details stopped-vm">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.stoppedVmCount }}</div>
	            					</div>
	            					<div class="quick-view-title text-center">Stopped VM</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details total-vm">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.totalCount }}</div>
	            					</div>
	            					<div class="quick-view-title text-center">Total VM</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details vcpu">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.vcpu }}</div>
	            					</div>
	            					<div class="quick-view-title text-center">vCpu</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details vcpu">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.ram }}<small>(GB)</small></div>
	            					</div>
	            					<div class="quick-view-title text-center">RAM</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details vcpu">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.storage }}<small>(GB)</small></div>
	            					</div>
	            					<div class="quick-view-title text-center">Storage Allocation</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details networks">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.publicIp }}</div>
	            					</div>
	            					<div class="quick-view-title text-center">Public IP</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details networks">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.networks }}</div>
	            					</div>
	            					<div class="quick-view-title text-center">Networks</div>
	            				</div>
	            				<div class="col-md-2 col-sm-3 col-xs-6">
	            					<div class="quick-view-details private-template">
	            						<div class="quick-view-icon pull-right"></div>
	            						<div class="quick-view-count pull-right">{{ infrastructure.template }}</div>
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
	                   <div class="panel-body p-sm">
	                        
	                        <div class="text-center m-t-xxxl" data-ng-show="showQuotaLoader">
	                             <img src="images/loading-bars.svg" />
	                         </div>
	                        <div class="row dashboard-quota-area" data-ng-hide="showQuotaLoader">
	                            <div class="col-md-3 col-sm-4 col-xs-6 dashboard-quota" data-ng-repeat="quotaLimit in quotaLimits">
	                                <div class="doughnutchart-value">{{ quotaLimit.percentage }}%</div>
	                                <canvas doughnutchart options="doughnutOptions" data="quotaLimit.doughnutData" height="140" ></canvas>
	                                {{ quotaLimit.label }} <span>Using {{quotaLimit.usedLimit}} of {{quotaLimit.max}}</span>
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
</div>
