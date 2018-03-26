<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title><decorator:title /></title>
<decorator:head></decorator:head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-combobox.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-submenu.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-theme.css"/>" />
<script src="<c:url value="/resources/script/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap-combobox.js"/>"></script>
<script src="<c:url value="/resources/script/jquery.marquee.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap-submenu.js"/>"></script>
<style type="text/css">
.marquee {
  width: auto;
  height: 30px;
  /*max-width: 900px;
  border: solid 1px #999;*/
  line-height: 2.2em;
  vertical-align: middle;
  overflow: hidden;
  font-size: 15px;
}
</style>
<script type="text/javascript">
		$(document).ready(function() {
			$('.combobox').combobox();
			$('.dropdown-toggle').dropdown();
			$('.dropdown-submenu > a').submenupicker();
			$mq = $('.marquee').marquee();
			//stop
			$mq.marquee('resume');
			//on hover start
			$mq.hover(function() {
				$mq.marquee('pause');
			}, function() {
				$mq.marquee('resume');
			});
			var d = new Date();
			//document.getElementById("displayDate").innerHTML = d.toDateString(); //DDD MMM dd yyyy
			//document.getElementById("displayDate").innerHTML = d.toLocaleDateString(); //dd/MM/yyyy
			document.getElementById("displayDate").innerHTML = d.toLocaleString(); //dd/MM/yyyy hh:mm:ss 
			//document.getElementById("displayDate").innerHTML = d.toLocaleTimeString(); //hh:mm:ss
			//document.getElementById("displayDate").innerHTML = d.toString(); //DDD MMM dd yyyy hh:mm:ss
			//document.getElementById("displayDate").innerHTML = d.toTimeString(); //hh:mm:ss +GMT
			//document.getElementById("displayDate").innerHTML = d.toUTCString();
		});
		function gotoScreen(){
			alert(<c:url value="/"/>+$("#screenDDL").val());
			
		}
	</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 text-nowrap">
				<img align="left" border="0" src="<c:url value="/resources/images/dsgn_top1.jpg" />" height="66" width="250" hspace="0" /> 
				<img align="left" border="0" src="<c:url value="/resources/images/dsgn_top2.jpg" />" height="66" width="278" hspace="0" /> 
				<img align="left" border="0" src="<c:url value="/resources/images/dsgn_top_logo.gif" />" hspace="0" />
			</div>
		</div>
		<div class="row">
			<div align="justify" class="col-md-12">
				<div class="marquee text-info bg-info" data-duration="15000"
					data-duplicated="true" data-gap="100">
					<b>Whether it's a weekday or the busiest weekend of the
						year, flying can be a terrible experience. There is one
						easy way to make the process a little bit better, and it
						starts with sticking to the Golden Rule: treat others the
						way you would want to be treated. </b>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" align="left">
				<form class="form-inline">
					<div class="form-group">
						<form:select path="" class="form-control" style="width: 150px;" name="inline" id="screenDDL">
							<form:option value="">Search...</form:option>
							<c:forEach items="${screenList}" var="item">
								<form:option value="${item.value}"><c:out value="${item.key}" /></form:option>
							</c:forEach>
						 </form:select>
			 <input class="btn btn-info " type="button" value="Go" onclick="gotoScreen()"/> <div class="btn btn-info" id="displayDate" ></div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="container-fluid">
				<ul class="nav nav-pills nav-sm">
					<li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Configure<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/1015.etp">[1015] Update User Information</a></li>
							<li><a href="/1013.etp">[1013] Manage Password</a></li>
							<li><a href="/0283.etp">[0283] Login Status</a></li>
							<li><a href="/1084.etp">[1084] Trader Address Book</a></li>
							<li><a href="/0299.etp">[0299] ETP System Version Information</a></li>
							<li><a href="/0130.etp">[0130] Help</a></li>
							<li><a href="/0140.etp">[0140] Print</a></li>
							<li><a href="/0110.etp">[0110] Setup</a></li>
						</ul>
					</li>
					<li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">System<span class="caret"></span></a>
						<ul class="dropdown-menu ">
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Management</a>
								<ul class="dropdown-menu ">
									<li><a href="<c:url value="/system/1001.etp"/>">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
									<li><a href="/1611.etp">[1611] Trader Task Assignment Entry (Bursa)</a></li>
									<li><a href="/1022.etp">[1022] Screen Assignment (Bursa)</a></li>
									<li><a href="/1014.etp">[1014] Register Branch</a></li>
									<li><a href="/1085.etp">[1085] Delete Trader</a></li>
									<li><a href="/1086.etp">[1086] Trader Change History</a></li>
									<li><a href="/1087.etp">[1087] FIX Parameter Setting</a></li>
									<li><a href="/1089.etp">[1089] FIX Change History</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">System Management</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<%-- <li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">User Screen<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/0900.etp">[0900] Matching</a></li>
							<li><a href="/0901.etp">[0901] Reporting</a></li>
							<li><a href="/0902.etp">[0902] Reg Trader</a></li>
							<li><a href="/0903.etp">[0903] Transaction</a></li>
							<li><a href="/0950.etp">[0950] Empty Scr</a></li>
						</ul>
					</li> --%>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Market Information<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/1561.etp">[1561] Market Session Inquiry</a></li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Announcement</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Single Price Summary</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Turnover</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Chart & Graph</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">info Information</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Bond Price Index</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Yield Curve</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Calculation</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Order Matching<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/1105.etp">[1105] Best 5 Quotes & Matches Data</a></li>
							<li><a href="/1109.etp">[1109] Market Session Time</a></li>
							<li><a href="/1106.etp">[1106] Favourite Stocks & Quotes Stocks</a></li>
							<li><a href="/1119.etp">[1119] Order Info by Members for Admin</a></li>
							<li><a href="/1121.etp">[1121] Match Info by Members for Admin</a></li>
							<li><a href="/1120.etp">[1120] Traded Stock Info for Admin</a></li>
							<li><a href="/1113.etp">[1113] Order History for Admin</a></li>
							<li><a href="/1118.etp">[1118] Rejected Order History for Admin</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Negotiation<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/1171.etp">[1171] Negotiation History for Admin (OBS/WI)</a></li>
							<li><a href="/1172.etp">[1172] Negotiation History for Admin (Repo/SBBA)</a></li>
							<li><a href="/1170.etp">[1170] Chatting List for Admin</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Reporting<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/1256.etp">[1256] Reporting List for Admin BM (OBS/WI)</a></li>
							<li><a href="/1266.etp">[1266] Reporting List for Admin BM (Repo/SBBA)</a></li>
							<li><a href="/1276.etp">[1276] Reporting List for Admin BM (SBL)</a></li>
							<li><a href="/1286.etp">[1286] Reporting List for Admin BM (Re-allotment)</a></li>
							<li><a href="/1250.etp">[1250] Reporting Entry by BM (OBS/WI)</a></li>
							<li><a href="/1260.etp">[1260] Reporting Entry by BM (Repo/SBBA)</a></li>
							<li><a href="/1270.etp">[1270] Reporting Entry by BM (SBL)</a></li>
							<li><a href="/1280.etp">[1280] Reporting Entry by BM (Re-allotment)</a></li>				
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Advertisement<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Benchmark Indicative Quotes</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">MGS Futures Indicative Quotes</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Price Advertisement (OBS/WI)</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Price Advertisement (Repo/SBBA)</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Price Advertisement (SBL)</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Market Management<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Market Operation</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Member Operation</a>
								<ul class="dropdown-menu ">
									<li><a href="/1001.etp">[1001] Common Management</a></li>
									<li><a href="/1011.etp">[1011] Register Trader (Bursa)</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">RENTAS Reconciliantion</a>
								<ul class="dropdown-menu ">
									<li><a href="/1081.etp">[1081] System Connection Status</a></li>
									<li><a href="/1082.etp">[1082] System Connection Status (Detail)</a></li>
								</ul>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle "
						data-toggle="dropdown" href="#">Transaction<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/common/input.etp'/>">Input Test</a></li>
							<li><a href="/1320.etp">[1320] Band Trading Without Stock Assignment</a></li>
							<li><a href="/1330.etp">[1330] Transaction List for Admin</a></li>
							<li><a href="/1398.etp">[1398] Request & Response List for BM</a></li>
							<li><a href="/1362.etp">[1362] Trade Amendment Hsitory for Admin</a></li>
							<li><a href="/1521.etp">[1521] Regulated Short Selling Inquiry</a></li>
							<li><a href="/1380.etp">[1380] Market Summary for Admin</a></li>
							<li><a href="/1670.etp">[1670] Transaction Summary</a></li>
							<li><a href="/1615.etp">[1615] Client Information Entry</a></li>
							<li><a href="/1680.etp">[1680] Fee List for Admin</a></li>
						</ul></li>
				</ul>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="container-fluid">
				<decorator:body></decorator:body>
				
			</div>
		</div>
	</div>
</body>
</html>