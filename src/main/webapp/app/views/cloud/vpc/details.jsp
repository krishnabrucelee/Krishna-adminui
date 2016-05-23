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
                       <h3 class="panel-title"><i class="fa fa-cloud"></i>&nbsp;&nbsp;VPC SUMMARY</h3>
                   </div>
                   <div class="panel-body">
                       <div class="row">
                       <div class="col-md-6">
                           <table class="table table-condensed table-striped" cellspacing="1" cellpadding="1">
                               <tbody>
                                   <tr>
                                       <td class="col-md-4 col-sm-4"><b>Name</b></td>
                                       <td class="col-md-8 col-sm-8">{{ vpc.name }}</td>
                                   </tr>
                                   <tr>
                                       <td><b>Description</b></td>
                                       <td> {{ vpc.description }}</td>
                                   </tr>
                                   <tr>
                                       <td><b>User</b></td>
                                       <td>{{vpc.username}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>N/W Domain</b></td>
                                       <td>{{ vpc.network.domain }} </td>
                                   </tr>
                                   <tr>
                                       <td><b>Zone</b></td>
                                       <td>{{vpc.zone.name}} </td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                       <div class="col-md-6">
                           <table class="table table-condensed table-striped" cellspacing="1" cellpadding="1">
                               <tbody>
                                   <tr>
                                       <td class="col-md-4 col-sm-4"><b>CIDR</b></td>
                                       <td class="col-md-8 col-sm-8">{{ vpc.cidr }}</td>
                                   </tr>
                                   <tr>
                                       <td><b>State</b></td>
                                       <td>{{vpc.state}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>Restart Required</b></td>
                                       <td>{{vpc.required}}</td>
                                   </tr>
                                   <tr>
                                       <td><b>ID</b></td>
                                       <td>{{ vpc.vpcId}}</td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                       </div>
                   </div>
               </div>
            </div>
         </div>