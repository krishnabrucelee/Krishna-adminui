<form name="computeForm" data-ng-submit="update(computeForm)" data-ng-controller="computeEditCtrl" method="post" novalidate="" >
    <div class="hpanel">
        <div class="panel-body">
            <div class="row  ">
                <div class="col-md-12"><h4><label><fmt:message key="edit.compute.offering" bundle="${msg}" /></label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" ng-class="{'text-danger': computeForm.name.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.name" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input required="true" type="text" name="name" data-ng-model="compute.name" class="form-control" data-ng-class="{'error': computeForm.name.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="computeForm.name.$invalid && formSubmitted" ><i  tooltip="Compute Offer Name is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" ng-class="{'text-danger': computeForm.description.$invalid && formSubmitted}">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.description" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input required="true" type="text" name="displayText" data-ng-model="compute.displayText" class="form-control" data-ng-class="{'error': computeForm.displayText.$invalid && formSubmitted}">
                                <div class="error-area" data-ng-show="computeForm.displayText.$invalid && formSubmitted" ><i  tooltip="Description is Required" class="fa fa-warning error-icon"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row" >
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.storagetype" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="storagetype" data-ng-model="compute.type.name" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.hosttag" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" name="hosttag" data-ng-model="compute.hostTags" class="form-control" readonly >
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.storagetag" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" name="storagetag" data-ng-model="compute.storageTags" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.memory" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-number name="memory" data-ng-model="compute.memory" class="form-control" readonly >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.vcpu.core" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number name="vcpucore" data-ng-model="compute.numberOfCores" class="form-control"readonly >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.speed" bundle="${msg}" /><span class="text-danger">*</span></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input valid-number type="text" name="speed" data-ng-model="compute.clockSpeed" class="form-control" readonly >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.networkrate" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number name="network" data-ng-model="compute.networkRate" class="form-control"readonly >

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group"  >
                        <div class="row" >
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal" ><fmt:message key="compute.diskio" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <select data-ng-init="compute.diskio = diskio.diskioList[0]" class="form-control input-group" name="diskio" data-ng-model="compute.diskio" ng-options="diskio.name for diskio in diskio.diskioList" >
                                </select>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal" ><fmt:message key="common.diskreadratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-number name="diskreadrate" data-ng-model="compute.diskBytesReadRate" class="form-control" >

                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group" >
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal" ><fmt:message key="common.diskwriteratebps" bundle="${msg}" />
                            </label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-number name="diskwriterate" data-ng-model="compute.diskBytesWriteRate" class="form-control" >

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.diskreadrateiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number  name="diskreadrateiops" data-ng-model="compute.diskIopsReadRate" class="form-control" >

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4  col-sm-12 col-xs-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.diskwriterateiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-number name="diskwriterateiops" data-ng-model="compute.diskIopsWriteRate" class="form-control" >

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-4" >
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.miniops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="diskreadrateiops" valid-number  data-ng-model="compute.miniops" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-4" >
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 col-xs-4 control-label font-normal"><fmt:message key="common.maxiops" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="diskwriterateiops" valid-number  data-ng-model="compute.maxiops" class="form-control" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.cpucap" bundle="${msg}" /></label>
                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="cpucap" data-ng-model="compute.cpuCapacity" class="form-control"readonly >
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.offerha" bundle="${msg}" /></label>
                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="offerha" data-ng-model="compute.isHighAvailabilityEnabled" class="form-control"readonly >
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="compute.public" bundle="${msg}" /></label>
                            <div class="col-md-7 col-sm-7">
                                <input  type="text" name="public" data-ng-model="compute.public" class="form-control"readonly >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row  ">
                <div class="col-md-12"> <h4><label><fmt:message key="common.pricinginfo" bundle="${msg}" /></label><hr></h4></div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">

                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.zonename" bundle="${msg}" /></label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" name="zonename" data-ng-model="compute.zone.name" class="form-control" readonly >

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.instancerunningcostmonth" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input  type="text" valid-decimal name="instancerunningmonth" data-ng-model="compute.instancerunningmonth" class="form-control" placeholder="10.00">
                                <span class="help-block m-b-none" ng-show="computeForm.instancerunningmonth.$invalid && formSubmitted" ></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-5 col-sm-5 control-label font-normal"><fmt:message key="common.instancerunningcosthour" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <b> <p class="text-danger">0.01389</p></b>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-5 col-sm-5 control-label font-normal"><fmt:message key="common.instancestoppagecostmonth" bundle="${msg}" /> (<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-decimal name="instancestop" data-ng-model="compute.instancestop" class="form-control" placeholder="12.00" >

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.setupcost" bundle="${msg}" />(<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <input type="text" valid-decimal name="cost" data-ng-model="compute.cost" class="form-control" placeholder="1" >

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-md-4 col-sm-4 control-label font-normal"><fmt:message key="common.instancestoppagecosthour" bundle="${msg}" /> (<app-currency class="text-danger"></app-currency>)</label>
                            <div class="col-md-7  col-sm-7 col-xs-7">
                                <b> <p class="text-danger">0.01667</p></b>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12  col-sm-12">
                        <span class="pull-right">
                            <a class="btn btn-default btn-outline"  ui-sref="servicecompute.list-compute"><fmt:message key="common.cancel" bundle="${msg}" /></a>
                            <button class="btn btn-info" type="submit" ng-disabled="form.computeForm.$invalid" ><fmt:message key="common.apply" bundle="${msg}" /></button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


