<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <span class="pull-left">
                            <a class="btn btn-info" href="#/configuration/chargeback"  title="Back" ><span class="fa fa-arrow-circle-left fa-lg "></span> Back</a>
                        </span>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">
                <div class="col-md-6 col-sm-6">
             <div class="form-group">
                        <div class="row">
                            <label class="col-md-3 col-sm-3 control-label">Currency:
                             </label>

                            <div class="col-md-7 col-sm-7">
                                <input type="text" name="currency" value="CNY" readonly   class="form-control" >
                                <i class="pe-7s-help1 pe-lg m-l-n-sm tooltip-icon" tooltip="The default currency which applies for cost everywhere on this panel.This currency is vary from different countries.Here you cannot update the default currency.While you install this panel  which currency format is your choosing is apply through out the panel." ></i>



                            </div>

                        </div>
             </div>
                </div>
            </div>
        </div>

    </div>

</div>