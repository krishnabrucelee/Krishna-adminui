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
		                						<div class="col-md-8">{{ domain.lastName || '-' }}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Email</div>
		                						<div class="col-md-8">{{ domain.email || '-'}}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Phone</div>
		                						<div class="col-md-8">{{ domain.phone || '-'}}</div>
	                						</div>
					                    </li>
					                </ul>
			                    </accordion-group>
			                    <accordion-group heading="Secondary Contact">
			                        <ul class="list-group no-border">
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">F.Name</div>
		                						<div class="col-md-8">{{ domain.secondaryContactName || '-'}}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item ">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">L.Name</div>
		                						<div class="col-md-8">{{ domain.secondaryContactLastName || '-'}}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Email</div>
		                						<div class="col-md-8">{{ domain.secondaryContactEmail || '-'}}</div>
	                						</div>
					                    </li>
					                    <li class="list-group-item">
					                        <div class="row">
		                						<div class="col-md-4 font-bold">Phone</div>
		                						<div class="col-md-8">{{ domain.secondaryContactPhone || '-'}}</div>
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
	               						<div class="col-md-7">{{ domain.name || '-'}}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item ">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">Domain Name<span class="sub-text">(Login Name)</span></div>
	               						<div class="col-md-7">{{ domain.companyNameAbbreviation || '-'}}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">H.Q</div>
	               						<div class="col-md-7">{{ domain.cityHeadquarter || '-'}}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">Address</div>
	               						<div class="col-md-7">{{ domain.companyAddress || '-'}}</div>
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
	               						<div class="col-md-7">{{ domain.createdDateTime || '-'}}</div>
	              						</div>
			                    </li>
			                    <li class="list-group-item ">
			                        <div class="row">
	               						<div class="col-md-5 font-bold">A/C Status</div>
	               						<div class="col-md-7 font-bold text-success">{{ domain.status || '-'}}</div>
	              						</div>
			                    </li>
			                </ul>
			                <button class="btn btn-default suspend-btn" title="<fmt:message key="common.suspend" bundle="${msg}" />" data-ng-if="account.status == 'ENABLED' || account.status == 'DISABLED'" data-ng-click="suspendUserAccount(account)">
                                                     <span class="fa fa-ban text-center"> </span>
                                                </button>
                                                <button class="btn btn-default suspend-btn" title="<fmt:message key="common.enable" bundle="${msg}" />" data-ng-if="account.status == 'SUSPENDED'" data-ng-click="enableUserAccount(account)">
                                                     <span class="fa fa-check-circle-o text-center"> </span>
                                                </button>
					                <a data-ng-click="suspendDomain(domain)" data-ng-if="domain.status == 'ACTIVE' || domain.status == 'INACTIVE'" class="btn btn-info m-t-md">Suspend</a>
					                <a data-ng-click="enableDomain(domain)" data-ng-if="domain.status == 'SUSPENDED'" class="btn btn-info m-t-md">Enable</a>
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
	                        	<div class="col-md-10 col-sm-10 col-xsmd-12">
	                        		<div class="flot-chart">
										<canvas linechart options="usageLineOptions" data="usageLineData" height="250" width="740"  ></canvas>
					                </div>
	                        	</div>
	                        	<!--<div class="col-md-4 col-sm-4 col-xsmd-12">
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
	                        	</div>-->
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
		                   <div class="panel-body">
		                        <div class="row">
		                        	<div class="col-md-6">
				                        <div class="text-center m-t-xxxl" data-ng-show="showQuotaLoader">
				                             <img src="images/loading-bars.svg" />
				                         </div>
				                        <div class="row dashboard-quota-area" data-ng-hide="showQuotaLoader">
				                            <div class="col-md-4 col-sm-4 col-xs-6 dashboard-quota" data-ng-repeat="quotaLimit in quotaLimits">
		                                 		<div class="doughnut-fixed-area">
					                                <div class="doughnutchart-value">{{ quotaLimit.percentage }}%</div>
					                                <canvas doughnutchart options="doughnutOptions" data="quotaLimit.doughnutData" width="120" height="85"></canvas>
					                                <div>{{ quotaLimit.label }}</div> <span>Using {{quotaLimit.usedLimit}} of {{quotaLimit.max}}</span>
			                            		</div>
			                            	</div>
			                           	</div>
		                           	</div>
		                           	<div class="col-md-6">
		                           	 	<div data-ng-include src="'app/views/client/clients/resource-allocation.jsp'"></div>
		                           	 </div>
	                           	</div>
		                    </div>
	                </tab>
	                <tab>
	                    <tab-heading>
	                        <i class="fa fa-file-text-o"></i> Invoice
	                    </tab-heading>
	                    <div class="panel-body">
	                        <table cellspacing="1" cellpadding="1" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="label-primary text-white"  data-ng-class="sort.descending && sort.column =='invoiceNumber'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.invoice.no" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='domain.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.company" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='billPeriod'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.billing.period" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='totalCost'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.payable" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='dueDate'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.due.date" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right"  data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                                        <th class="label-primary text-white text-right" ><fmt:message key="common.action" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody data-ng-hide="invoiceList.invoice.length > 0">
                                    <tr>
                                        <td class="col-md-6 col-sm-6" colspan="6"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-show="invoiceList.invoice.length > 0">
                                    <tr data-ng-repeat=" invoice in filteredCount = (invoiceList.invoice | filter: quickSearch| orderBy:sort.column:sort.descending)">
                                        <td>{{ invoice.invoiceNumber}}</td>
                                       	<td class="text-right">{{ invoice.domain.name}}</td>
                                        <td class="text-right">{{ invoice.billPeriod}}</td>
                                        <td class="text-right">{{ invoice.totalCost}}</td>
                                        <td class="text-right">{{ invoice.dueDate | date:'yyyy-MM-dd'}}</td>
                                        <td class="text-right">
                                            {{ invoice.status}}</td>
                                        <td class="text-right">
                                            <a data-ng-if="invoice.status == 'DUE'" class="m-l-sm btn btn-sm btn-default " data-ng-click="viewInvoice(invoice, 'Chinese')">Chinese </a>
                                            <a data-ng-if="invoice.status == 'DUE'" class="m-l-sm btn btn-sm btn-info" data-ng-click="viewInvoice(invoice, 'English')">English </a>
                                            <button data-ng-if="invoice.status == 'DRAFT'" class="m-l-sm btn btn-sm btn-info" data-ng-click="generateDueInvoice(invoice)">Generate Invoice</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
	                    </div>
	                </tab>
	                <tab>
	                    <tab-heading>
	                        <i class="fa fa-money"></i> Payments
	                    </tab-heading>
	                    <div class="panel-body">	                        
	                        <table cellspacing="1" cellpadding="1" class="table  table-bordered ">
                                <thead>
                                    <tr>
                                    	<th class="label-primary text-white"  data-ng-class="sort.descending && sort.column =='invoiceNumber'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.invoice.no" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='domain.name'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.company" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='billPeriod'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.billing.period" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='totalCost'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.payable" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='dueDate'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.due.date" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='paidOn'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.paid.on" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='transactionReference'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.transaction.reference" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='paymentMethod'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.payment.method" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"  data-ng-class="sort.descending && sort.column =='status'? 'sorting_desc' : 'sorting_asc' " ><fmt:message key="common.status" bundle="${msg}" /></th>
                                    	<th class="label-primary text-right text-white"><fmt:message key="common.action" bundle="${msg}" /></th>
                                    </tr>
                                </thead>
                                <tbody data-ng-hide="invoiceList.payment.length > 0">
                                    <tr>
                                        <td class="col-md-10 col-sm-10" colspan="10"><fmt:message key="common.no.records.found" bundle="${msg}" />!!</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-show="invoiceList.payment.length > 0">
                                    <tr data-ng-repeat=" invoice in filteredCount = (invoiceList.payment | filter: quickSearch| orderBy:sort.column:sort.descending)">
                                        <td>{{ invoice.invoiceNumber}}</td>
                                        <td class="text-right">{{ invoice.domain.name}}</td>
                                        <td class="text-right">{{ invoice.billPeriod}}</td>
                                        <td class="text-right">{{ invoice.totalCost}}</td>
                                        <td class="text-right">{{ invoice.dueDate | date:'yyyy-MM-dd'}}</td>
                                        <td class="text-right">{{ invoice.paidOn | date:'yyyy-MM-dd'}}</td>
                                        <td class="text-right"></td>
                                        <td class="text-right">{{ invoice.paymentMethod}}</td>
                                        <td class="text-right">{{ invoice.status}}</td>
                                        <td class="text-right">
                                            <a data-ng-show="invoice.status != 'PAID'" class="btn btn-info btn-sm m-l-sm m-t-xs" title="Mark as Paid" data-ng-click="PayNow('sm', invoice)">Mark as Paid</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
	                        
	                    </div>
	                </tab>
	            </tabset>
            </div>
        </div>
    </div>
</div>
	</div>
</div>
