<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

        <div class="row">
            <div class="col-md-offset-4 col-md-4">
               <div class="hpanel hblue">
                   <div class="panel-heading"><b class="text-info font-uppercase">Payment Processing</b></div>
                    <div class="panel-body">
							Processing Please Wait ......
                        <div class="table-responsive m-t-md payment-info">
                            <table cellspacing="1" cellpadding="1" class="table table-bordered ">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <div class="pull-left">Order ID : <span>CKP32160990</span> </div>
                                        <div class="pull-right">Date : <span>05-Apr-2016</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">
                                        Status  : <span><b>Processing</b></span> <br>
                                    </td>
                                    <td class="bg-light text-right">
                                        <div class="m-t-sm"><span><b>RMB.1709.00</b></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="pull-left">Transaction ID : <span>CKP32160990</span> </div>
                                        <div class="pull-right">Invoice No  : <span><b>54654654</b></span> <br>(KVM Linux VPS Slice 1 Slices) </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

