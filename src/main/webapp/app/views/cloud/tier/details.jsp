<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty language ? language : pageContext.request.getAttribute('language')}" scope="session" />
<fmt:setBundle basename="i18n/messages_${language}" var="msg" scope="session" />

  <div class="row" >

                <div class="col-lg-12 col-md-12 col-sm-7">
                <div class="panel panel-info">
                   <div class="panel-heading">
                       <h3 class="panel-title"><i class="fa fa-cloud"></i>&nbsp;&nbsp;TIER SUMMARY</h3>
                   </div>
                   <div class="panel-body">
                       <div class="row">
                       <div class="col-md-6">
                           <table class="table table-condensed table-striped" cellspacing="1" cellpadding="1">
                               <tbody>
                                   <tr>
                                       <td class="col-md-4 col-sm-4"><b>Name</b></td>
                                       <td class="col-md-8 col-sm-8">{{ tier.name }}</td>
                                   </tr>
                                   <tr>
                                       <td><b>Description</b></td>
                                       <td> {{ tier.description }}</td>
                                   </tr>
                                   <tr>
                                       <td><b>User</b></td>
                                       <td>{{tier.user}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>Network Offering</b></td>
                                       <td>{{ tier.network.offer}} </td>
                                   </tr>
                                   <tr>
                                       <td><b>Type</b></td>
                                       <td>{{tier.type}} </td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                       <div class="col-md-6">
                           <table class="table table-condensed table-striped" cellspacing="1" cellpadding="1">
                               <tbody>
                                   <tr>
                                       <td class="col-md-4 col-sm-4"><b>Gateway</b></td>
                                       <td class="col-md-8 col-sm-8">{{ tier.gateway }}</td>
                                   </tr>
                                   <tr>
                                       <td><b>CIDR</b></td>
                                       <td>{{tier.cidr}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>Netmask</b></td>
                                       <td>{{tier.netmask}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>N/W Domain</b></td>
                                       <td>{{ tier.network.domain}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>State</b></td>
                                       <td>{{ tier.state}}</td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                       </div>
                   </div>
               </div>
            </div>
         </div>