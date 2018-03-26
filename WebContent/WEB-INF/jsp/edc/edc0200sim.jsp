<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EDC Simulator</title>

<script type="text/javascript">
function getCookieVal(cookieName) {
	  var allCookies = document.cookie;
	  var pos = allCookies.indexOf(cookieName+'=');
	  if (pos == -1) return null;
	  var valueStart = pos + (cookieName.length+1);
	  var valueEnd = allCookies.indexOf(";",valueStart);
	  if (valueEnd == -1) valueEnd = allCookies.length;
	  var value = allCookies.substring(valueStart,valueEnd );
	  value = unescape(value);
	  return value
	}
function test(){
	var session_id = '${pageContext.session.id}';
	alert(session_id);
}
</script>
</head>
<body>
	<form:form id="formOne" modelAttribute="form" action="edcsimreq0200.sdm">
		<div class="container-fluid">
			<div class="panel panel-info">
				<div class="panel-heading">
					<b>CAFIS Request Simulator</b>
				</div>
				<div class="panel-body">
					<div class="form">
						<div class="col-md-12 form-inline">
							<c:out value="${infoMessage}" escapeXml="false"></c:out>
							<fieldset>
								<legend>Details</legend>
							</fieldset>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">PAN (Primary Account No)</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input002" size="50" maxlength="15"/>
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
										<label class="control-label">Point of Service Capture Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input026" size="50" maxlength="2"/>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Amount, Transaction Fee</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input028" size="50" maxlength="9"/>
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
										<label class="control-label">Forwarding Instituition Identification Code</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input033" size="50" maxlength="11"/>
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
										<label class="control-label">Encrypted PIN Block</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input052" size="50" maxlength="50"/>
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
							<div class="row" style="margin-top: 5px;">
								<div class="col-md-12 form-inline">
									<div class="col-md-3">
										<label class="control-label">Private Data</label>
									</div>
									<div class="col-md-9">
										<form:input class="form-control" path="input127" size="50" maxlength="50"/>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 10px;">
							<div class="col-md-8 form-inline">
								<button type="submit" class="btn btn-info" id="butRetrieve">Send</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-info" id="butReset" onclick="test();">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>