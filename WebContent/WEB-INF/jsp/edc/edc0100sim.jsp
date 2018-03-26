<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EDC Simulator</title>

<script type="text/javascript">
function validatePerkata(){
	var regex1 =  /^[0-9a-z]+$/;
	var perkara = "qwerty  qwe123";
	alert(perkara.match(regex1));
}
function alphanumeric()  {  
 var perkara = "qwer  123@!";
 var letterNumber = /^[0-9a-zA-Z ]+$/;  
 if((perkara.match(letterNumber))){  
	 alert("Is Alpha numeric");
	 return true;  
 }else{   
   alert("Is not Alpha numeric");   
   return false;   
  }  
}  
function outoffSys(){
	$("#formOne").attr("action","logoff.sdm");	
	$("#formOne").submit();
}
</script>
</head>
<body>
	<form:form id="formOne" modelAttribute="form" action="edcsimreq0100.sdm">
		<div class="container-fluid">
			<div class="panel panel-info">
				<div class="panel-heading">
					<b>EDC Request Simulator</b>
					<input type="button" class="btn btn-info" name="btnLogoff" onclick="outoffSys();" value="Log off"/>
				</div>
				<div class="panel-body">
					<div class="form">
						<c:out value="${infoMessage}" escapeXml="false"></c:out>
						<div class="col-md-12 form-inline">
							<fieldset>
								<legend>Details</legend>
							</fieldset>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">PAN (Primary Account No)</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input002" size="50"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Processing Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input003" size="50" maxlength="6"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Amount Transaction</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input004" size="50" maxlength="12"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Transmission Date and Time</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input007" size="50" maxlength="10"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">System Trace Number</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input011" size="50" maxlength="6"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Local Transaction Time</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input012" size="50" maxlength="6"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Local Transaction Date</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input013" size="50" maxlength="4"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Card Expiry Date</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input014" size="50" maxlength="4"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Merchant Category Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input018" size="50" maxlength="4"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Country Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input019" size="50" maxlength="3"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Point of Service Entry Mode</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input022" size="50" maxlength="3"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">POS - Condition Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input025" size="50" maxlength="2"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">BIN Number / Acquiring Instituition Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input032" size="50" maxlength="11"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Track-2 Data</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input035" size="50" maxlength="37"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Retrieval Reference Number</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input037" size="50" maxlength="12"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Terminal ID</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input041" size="50" maxlength="8"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Card Acceptor Identification Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input042" size="50" maxlength="15"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Card Acceptor Name and Location</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input043" size="50" maxlength="40"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Transaction Currency Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input049" size="50" maxlength="3"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Advice Reason Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input060" size="50" maxlength="999"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Point of Service (POS) Data</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input061" size="50" maxlength="200"/>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 10px;">
							<div class="col-md-8 form-inline">
								<button type="submit" class="btn btn-info" id="butRetrieve">Send</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-info" id="butReset" onclick="resetScreen();">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>