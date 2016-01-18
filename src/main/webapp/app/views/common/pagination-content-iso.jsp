<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<div class="row" data-ng-show="paginationObjectIso.totalItems > 10">
    <div class="col-sm-6">
	    <div class="col-sm-6 shown-page" data-ng-show="paginationObjectIso.totalItems > (((paginationObjectIso.currentPage - 1) * (paginationObjectIso.limit * 1)) + (paginationObjectIso.limit * 1))"><div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing {{ ((paginationObjectIso.currentPage - 1) * paginationObjectIso.limit) + 1}} to {{ ((paginationObjectIso.limit * paginationObjectIso.currentPage/paginationObjectIso.limit) * paginationObjectIso.limit)}} of {{ paginationObjectIso.totalItems}} entries</div></div>

	    <div class="col-sm-6 shown-page" data-ng-hide="paginationObjectIso.totalItems > (((paginationObjectIso.currentPage - 1) * (paginationObjectIso.limit * 1)) + (paginationObjectIso.limit * 1))"><div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing {{ ((paginationObjectIso.currentPage - 1) * paginationObjectIso.limit) + 1}} to {{ paginationObjectIso.totalItems}} of {{ paginationObjectIso.totalItems}} entries</div></div>
	    <div class="col-sm-6 shown-entry">
	        <div class="dataTables_length" id="example1_length"><label>Show
	                <select data-ng-model="paginationObjectIso.limit" data-ng-change="isolist(1)" aria-controls="example1" class="form-control input-sm">
	                    <option value="10">10</option>
	                    <option value="25">25</option>
	                    <option value="50">50</option>
	                    <option value="100">100</option>
	                </select> entries</label>
	        </div>
	    </div>
    </div>
    <div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
            <pagination boundary-links="true" total-items="paginationObjectIso.totalItems" items-per-page="paginationObjectIso.limit" max-size="5"  ng-model="paginationObjectIso.currentPage" ng-change="isolist(paginationObjectIso.currentPage)" class="pagination-sm" previous-text="&lsaquo;" next-text="&rsaquo;" first-text="&laquo;" last-text="&raquo;"></pagination>
        </div>
    </div>

</div>
