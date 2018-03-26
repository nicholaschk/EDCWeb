<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>ETP Input</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/style/ui.jqgrid.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/jquery-ui.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-submenu.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-theme.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/ui.jqgrid-bootstrap.css"/>" /> 
<link rel="stylesheet" href="<c:url value="/resources/style/jquery-ui.theme.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/jquery-ui.structure.min.css"/>" /> 

<script src="<c:url value="/resources/script/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/resources/script/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/script/jquery.marquee.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap-submenu.js"/>"></script>
<script src="<c:url value="/resources/script/grid.locale-en.js"/>"></script>
<script src="<c:url value="/resources/script/jquery.jqGrid.min.js"/>"></script>
<script src="<c:url value="/resources/script/etp.js"/>"></script>
<decorator:head></decorator:head>
<script type="text/javascript">
$(document).ready(function() {
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
});
function gotoScreen(){
	//alert(<c:url value="/"/>+$("#screenDDL").val());
	window.location.href = <c:url value="/"/>+$("#screenDDL").val();
}

function date_time(id)
{
	date = new Date;
	year = date.getFullYear();
	month = date.getMonth();
	if(month<10)
	{
		month = "0"+(month+1);
	}
	months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
	d = date.getDate();
	if(d<10)
	{
	        d = "0"+d;
	}
	day = date.getDay();
	days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
	h = date.getHours();
	if(h<10)
	{
	        h = "0"+h;
	}
	m = date.getMinutes();
	if(m<10)
	{
	        m = "0"+m;
	}
	s = date.getSeconds();
	if(s<10)
	{
	        s = "0"+s;
	}
	result = ''+days[day]+', '+d+'/'+month+'/'+year+' '+h+':'+m+':'+s;
	document.getElementById(id).innerHTML = result;
	setTimeout('date_time("'+id+'");','1000');
	return true;
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-info">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> 
							<span class="icon-bar"><span class="caret"></span></span> 
						</button>
						<a class="navbar-brand" href="#">ETP System</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Configure<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/system/1015.etp"/>">[1015] Update User Information</a></li>
									<li><a href="<c:url value="/system/1013.etp"/>">[1013] Manage Password</a></li>
									<li><a href="<c:url value="/system/0283.etp"/>">[0283] Login Status</a></li>
									<li><a href="<c:url value="/system/1084.etp"/>">[1084] Trader Address Book</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="<c:url value="/system/0299.etp"/>">[0299] ETP System Version Information</a></li>
									<li><a href="<c:url value="/system/0130.etp"/>">[0130] Help</a></li>
									<%-- <li><a href="<c:url value="/system/0140.etp"/>">[0140] Print</a></li>
									<li><a href="<c:url value="/system/0110.etp"/>">[0110] Setup</a></li> --%>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">System<span class="caret"></span></a>
								<ul class="dropdown-menu ">
									<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">Management</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/system/1001.etp"/>">[1001] Common Management</a></li>
											<li><a href="<c:url value="/system/1011.etp"/>">[1011] Register Trader (Bursa)</a></li>
											<li><a href="<c:url value="/system/1611.etp"/>">[1611] Trader Task Assignment Entry (Bursa)</a></li>
											<li><a href="<c:url value="/system/1022.etp"/>">[1022] Screen Assignment (Bursa)</a></li>
											<li><a href="<c:url value="/system/1014.etp"/>">[1014] Register Branch</a></li>
											<li><a href="<c:url value="/system/1085.etp"/>">[1085] Deleted Trader</a></li>
											<li><a href="<c:url value="/system/1086.etp"/>">[1086] Trader Change History</a></li>
											<li><a href="<c:url value="/system/1087.etp"/>">[1087] FIX Parameter Setting</a></li>
											<li><a href="<c:url value="/system/1089.etp"/>">[1089] FIX Change History</a></li>
											<li><a href="<c:url value="/system/1092.etp"/>">[1092] Order Response Time Check</a></li>
										</ul>
									</li>
									<li class="dropdown-submenu "><a tabindex="0" data-toggle="dropdown">System Management</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/system/1081.etp"/>">[1081] System Connection Status</a></li>
											<li><a href="<c:url value="/system/1082.etp"/>">[1082] System Connection Status (Detail)</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin<span class="caret"></span></a>
								<ul class="dropdown-menu">
								 <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Group/User Managemet</a>
								  <ul class="dropdown-menu">
									<li><a href="<c:url value="/admin/2000.etp"/>">[2000] Group Management</a></li>
									<li><a href="<c:url value="/admin/2001.etp"/>">[2001] User Management</a></li>
								  </ul>
								 </li>
								 <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Copy User Profile</a>
								  <ul class="dropdown-menu">
									<li><a href="<c:url value="/admin/2002.etp"/>">[2002] Copy Screen</a></li>
									<li><a href="<c:url value="/admin/2003.etp"/>">[2003] Copy User Config</a></li>
									<li><a href="<c:url value="/admin/2004.etp"/>">[2004] New User Config</a></li>
								  </ul>
								 </li>
								 <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Group/User Audit Trail</a>
								  <ul class="dropdown-menu">
									<li><a href="<c:url value="/admin/2061.etp"/>">[2061] Audit Trail - User</a></li>
									<li><a href="<c:url value="/admin/2062.etp"/>">[2062] Audit Trail - User Login</a></li>
									<li><a href="<c:url value="/admin/2063.etp"/>">[2063] Audit Trail - User Password</a></li>
									<li><a href="<c:url value="/admin/2064.etp"/>">[2064] Audit Trail - Group</a></li>
									<li><a href="<c:url value="/admin/2065.etp"/>">[2065] Audit Trail - Group Screen</a></li>
									<li><a href="<c:url value="/admin/2066.etp"/>">[2066] Audit Trail - User Screen</a></li>
									<li><a href="<c:url value="/admin/2067.etp"/>">[2067] Audit Trail - New User Config</a></li>
								  </ul>
								 </li>
								 <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Alert Audit Trail</a>
								  <ul class="dropdown-menu">
									<li><a href="<c:url value="/admin/2071.etp"/>">[2071] Audit Trail - Alert Status</a></li>
									<li><a href="<c:url value="/admin/2072.etp"/>">[2072] Audit Trail - Alert Reason Type</a></li>
								  </ul>
								 </li>
							 	</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">Alert<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/alert/2010.etp"/>">[2010] Alert Consultation and Details</a></li>
									<li><a href="<c:url value="/alert/2011.etp"/>">[2011] Reason Type Management</a></li>
									<li><a href="<c:url value="/alert/2012.etp"/>">[2012] Summary of Detected Alerts</a></li>
									<li><a href="<c:url value="/alert/2013.etp"/>">[2013] Alert Details</a></li>
									<li><a href="<c:url value="/alert/2014.etp"/>">[2014] Alert on Alerts</a></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Parameter<span class="caret"></span></a>
							 <ul class="dropdown-menu">
							  <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Parameter Consultation</a>
							   <ul class="dropdown-menu">
							    <li><a href="<c:url value="/parameter/2020.etp"/>">[2020] Parameter Consultation - Default</a></li>
							    <li><a href="<c:url value="/parameter/2021.etp"/>">[2021] Parameter Consultation - Admin</a></li>
							    <li><a href="<c:url value="/parameter/2022.etp"/>">[2022] Parameter Consultation - Temp</a></li>
							    <li><a href="<c:url value="/parameter/2025.etp"/>">[2025] Parameter Consultation - Temp2</a></li>
							    <li><a href="<c:url value="/parameter/2120.etp"/>">[2120] Parameter Consultation - Band Default</a></li>
							    <li><a href="<c:url value="/parameter/2121.etp"/>">[2121] Parameter Consultation - Band Admin</a></li>
							    <li><a href="<c:url value="/parameter/2122.etp"/>">[2122] Parameter Consultation - Band Temp</a></li>
							    <li><a href="<c:url value="/parameter/2125.etp"/>">[2125] Parameter Consultation - Band Temp2</a></li>
							   </ul>
							  </li>
							  <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Parameter Management</a>
							   <ul class="dropdown-menu">
							    <li><a href="<c:url value="/parameter/2023.etp"/>">[2023] Parameter Management - Admin</a></li>
							    <li><a href="<c:url value="/parameter/2024.etp"/>">[2024] Parameter Management - Temp</a></li>
							    <li><a href="<c:url value="/parameter/2026.etp"/>">[2026] Parameter Management - Temp2</a></li>
							    <li><a href="<c:url value="/parameter/2123.etp"/>">[2123] Parameter Management - Band Admin</a></li>
							    <li><a href="<c:url value="/parameter/2124.etp"/>">[2124] Parameter Management - Band Temp</a></li>
							    <li><a href="<c:url value="/parameter/2126.etp"/>">[2126] Parameter Management - Band Temp2</a></li>
							   </ul>
							  </li>
							 </ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Market and Member Analysis<span class="caret"></span></a>
							 <ul class="dropdown-menu">
							  <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Market Analysis</a>
							   <ul class="dropdown-menu">
							    <li><a href="<c:url value="/marketAnalysis/2030.etp"/>">[2030] Market Analysis</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2031.etp"/>">[2031] Market Analysis - Chart View</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2032.etp"/>">[2032] Order List</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2033.etp"/>">[2033] NCBO Analysis</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2041.etp"/>">[2041] Market Analysis - MTM Chart View</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2042.etp"/>">[2042] Market Analysis - MTM</a></li>
							   </ul>
							  </li>
							  <li class="dropdown-submenu"><a tabindex="0" data-toggle="dropdown">Member Analysis</a>
							   <ul class="dropdown-menu">
							    <li><a href="<c:url value="/marketAnalysis/2034.etp"/>">[2034] Member Analysis - Mbr vs Acc</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2038.etp"/>">[2038] Member Analysis - Mbr vs Trd</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2035.etp"/>">[2035] Member Analysis - Mbr vs Ins</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2036.etp"/>">[2036] Member Analysis - Acc vs Acc</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2037.etp"/>">[2037] Member Analysis - Acc vs Ins</a></li>
							    <li><a href="<c:url value="/marketAnalysis/2040.etp"/>">[2040] Member Analysis - Trd vs Ins</a></li>
							   </ul>
							  </li>
							 </ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Market Information<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/marketInfo/2051.etp"/>">[2051] Master Information</a></li>
									<li><a href="<c:url value="/marketInfo/1561.etp"/>">[1561] Market Session Inquiry</a></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Announcement</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/0211.etp"/>">[0211] Announcement List</a></li>
											<li><a href="<c:url value="/marketInfo/0212.etp"/>">[0212] Announcement Details</a></li>
											<li><a href="<c:url value="/marketInfo/0213.etp"/>">[0213] Announcement Entry</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Single Price Summary</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1300.etp"/>">[1300] Today Summary</a></li>
											<li><a href="<c:url value="/marketInfo/1301.etp"/>">[1301] Daily Summary by Date</a></li>
											<li><a href="<c:url value="/marketInfo/1302.etp"/>">[1302] Daily Summary by Stock</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Turnover</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1303.etp"/>">[1303] Turnover List</a></li>
											<li><a href="<c:url value="/marketInfo/1304.etp"/>">[1304] Benchmark Turnover List</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Chart & Graph</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1305.etp"/>">[1305] Daily Securities Turnover</a></li>
											<li><a href="<c:url value="/marketInfo/1306.etp"/>">[1306] Daily Top 10 Stocks</a></li>
											<li><a href="<c:url value="/marketInfo/1307.etp"/>">[1307] Daily Stock Movements</a></li>
											<li><a href="/1082.etp">[1082] System Connection
													Status (Detail)</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Primary Information</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1630.etp"/>">[1630] Band Information</a></li>
											<li><a href="<c:url value="/marketInfo/1631.etp"/>">[1631] Facility Information</a></li>
											<li><a href="<c:url value="/marketInfo/1632.etp"/>">[1632] Stock General Information</a></li>
											<li><a href="<c:url value="/marketInfo/1633.etp"/>">[1633] Stock Rating / Coupon Information</a></li>
											<li><a href="<c:url value="/marketInfo/1634.etp"/>">[1634] Stock Detail Information</a></li>
											<li><a href="<c:url value="/marketInfo/1640.etp"/>">[1640] Outstanding Amount</a></li>
											<li><a href="<c:url value="/marketInfo/1641.etp"/>">[1641] Auction Calendar</a></li>
											<li><a href="<c:url value="/marketInfo/1642.etp"/>">[1642] MGS Indicative Price</a></li>
											<li><a href="<c:url value="/marketInfo/1701.etp"/>">[1701] Stock Information History</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Bond Price Index</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1500.etp"/>">[1500] BPI Inquiry on Date Basis</a></li>
											<li><a href="<c:url value="/marketInfo/1501.etp"/>">[1501] BPI Inquiry on Time Basis</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Yield Curve</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1650.etp"/>">[1650] Benchmark Band Yield Curve</a></li>
											<li><a href="<c:url value="/marketInfo/1651.etp"/>">[1651] Benchmark Stock Yield Curve</a></li>
											<li><a href="<c:url value="/marketInfo/1652.etp"/>">[1652] Instrument Yield Curve on Stock</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Calculation</a>
										<ul class="dropdown-menu ">
											<li><a href="/1081.etp">[1081] System Connection
													Status</a></li>
											<li><a href="/1082.etp">[1082] System Connection
													Status (Detail)</a></li>
										</ul></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle "
								data-toggle="dropdown" href="#">Order Matching<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/1105.etp">[1105] Best 5 Quotes & Matches
											Data</a></li>
									<li><a href="<c:url value="/orderMatching/1109.etp"/>">[1109] Market Session Time</a></li>
									<li><a href="/1106.etp">[1106] Favourite Stocks &
											Quotes Stocks</a></li>
									<li><a href="/1119.etp">[1119] Order Info by Members
											for Admin</a></li>
									<li><a href="/1121.etp">[1121] Match Info by Members
											for Admin</a></li>
									<li><a href="/1120.etp">[1120] Traded Stock Info for
											Admin</a></li>
									<li><a href="/1113.etp">[1113] Order History for Admin</a></li>
									<li><a href="/1118.etp">[1118] Rejected Order History
											for Admin</a></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle "
								data-toggle="dropdown" href="#">Negotiation<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/1171.etp">[1171] Negotiation History for
											Admin (OBS/WI)</a></li>
									<li><a href="/1172.etp">[1172] Negotiation History for
											Admin (Repo/SBBA)</a></li>
									<li><a href="/1170.etp">[1170] Chatting List for Admin</a></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle "
								data-toggle="dropdown" href="#">Reporting<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/reporting/1203.etp"/>">[1203] Reporting List (OBS/WI)</a></li>
									<li><a href="<c:url value="/reporting/1213.etp"/>">[1213] Reporting List (Repo/SBBA)</a></li>
									<li><a href="/reporting/1223.etp">[1223] Reporting List (SBL)</a></li>
									<li><a href="<c:url value="/reporting/1233.etp"/>">[1233] Reporting List (Re-allotment)</a></li>
									<li><a href="/reporting/1200.etp">[1200] Reporting Entry by Initiator (OBS/WI)</a></li>
									<li><a href="<c:url value="/reporting/1210.etp"/>">[1210] Reporting Entry by Initiator (Repo/SBBA)</a></li>
									<li><a href="/reporting/1220.etp">[1220] Reporting Entry by Initiator (SBL)</a></li>
									<li><a href="/reporting/1230.etp">[1230] Reporting Entry by Initiator (Re-allotment)</a></li>
									<li><a href="<c:url value="/reporting/1256.etp"/>">[1256] Reporting List for Admin BM (OBS/WI)</a></li>
									<li><a href="<c:url value="/reporting/1266.etp"/>">[1266] Reporting List for Admin BM (Repo/SBBA)</a></li>
									<li><a href="<c:url value="/reporting/1276.etp"/>">[1276] Reporting List for Admin BM (SBL)</a></li>
									<li><a href="/reporting/1286.etp">[1286] Reporting List for Admin BM (Re-allotment)</a></li>
									<li><a href="<c:url value="/reporting/1250.etp"/>">[1250] Reporting Entry by BM (OBS/WI)</a></li>
									<li><a href="<c:url value="/reporting/1260.etp"/>">[1260] Reporting Entry by BM (Repo/SBBA)</a></li>
									<li><a href="<c:url value="/reporting/1270.etp"/>">[1270] Reporting Entry by BM (SBL)</a></li>
									<li><a href="/reporting/1280.etp">[1280] Reporting Entry by BM (Re-allotment)</a></li>
									<li><a href="<c:url value="/reporting/1205.etp"/>">[1205] Reporting Detail (OBS/WI)</a></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle "
								data-toggle="dropdown" href="#">Advertisement<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Benchmark Indicative Quotes</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/advertise/1401.etp"/>">[1401] Benchmark Indicative Inquiry</a></li>
											<li><a href="<c:url value="/advertise/1402.etp"/>">[1402] Benchmark Indicative Administration</a></li>
											<li><a href="<c:url value="/advertise/1403.etp"/>">[1403] Best Benchmark Indicative Inquiry</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">MGS Futures Indicative Quotes</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/advertise/1411.etp"/>">[1411] MGS Futures Indicative Inquiry</a></li>
											<li><a href="<c:url value="/advertise/1412.etp"/>">[1412] MGS Futures Indicative Administration</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Price Advertisement (OBS/WI)</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/advertise/1421.etp"/>">[1421] Advertisement Inquiry (OBS/WI)</a></li>
											<li><a href="<c:url value="/advertise/1422.etp"/>">[1422] Advertisement Administration (OBS/WI)</a></li>
											<li><a href="<c:url value="/advertise/1423.etp"/>">[1423] Best Advertisement Inquiry (OBS/WI)</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Price Advertisement (Repo/SBBA)</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/advertise/1431.etp"/>">[1431] Advertisement Inquiry (Repo/SBBA)</a></li>
											<li><a href="<c:url value="/advertise/1432.etp"/>">[1432] Advertisement Administration (Repo/SBBA)</a></li>
											<li><a href="<c:url value="/advertise/1433.etp"/>">[1433] Best Advertisement Inquiry (Repo/SBBA)</a>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Price Advertisement (SBL)</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/advertise/1441.etp"/>">[1441] Advertisement Inquiry (SBL)</a></li>
											<li><a href="<c:url value="/advertise/1442.etp"/>">[1442] Advertisement Administration (SBL)</a></li>
											<li><a href="<c:url value="/advertise/1443.etp"/>">[1443] Best Advertisement Inquiry (SBL)</a>
										</ul></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle "
								data-toggle="dropdown" href="#">Market Management<span
									class="caret"></span></a>
								<ul class="dropdown-menu pull-right">
									<li class="dropdown-submenu"><a tabindex="0"
										data-toggle="dropdown">Market Operation</a>
										<ul class="dropdown-menu">
											<li><a href="<c:url value="/marketInfo/1550.etp"/>">[1550] Market Parameter Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1555.etp"/>">[1555] Calendar Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1560.etp"/>">[1560] Market Session Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1561.etp"/>">[1561] Market Session Inquiry</a></li>
											<li><a href="<c:url value="/marketInfo/1565.etp"/>">[1565] MGS Future Basket Entry</a>
											<li><a href="<c:url value="/marketInfo/1566.etp"/>">[1566] MGS Future Settlement Price Entry</a>
											<li><a href="<c:url value="/marketInfo/1570.etp"/>">[1570] BPI Basket Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1575.etp"/>">[1575] Denomination Entry</a></li>
											<li><a href="/1082.etp">[1082] System Connection
													Status (Detail)</a></li>
											<li><a href="<c:url value="/marketInfo/1580.etp"/>">[1580] Advertisement Spread Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1586.etp"/>">[1586] Stock Suspension Approval Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1587.etp"/>">[1587] Instrument Assignment Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1588.etp"/>">[1588] Matching Tradability ValueDate Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1589.etp"/>">[1589] Fee Information Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1590.etp"/>">[1590] Instrument Public/Private Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1591.etp"/>">[1591] Ticker Message Entry</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">Member Operation</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1600.etp"/>">[1600] Member Information Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1601.etp"/>">[1601] Member Information Inquiry</a></li>
											<li><a href="<c:url value="/marketInfo/1602.etp"/>">[1602] Member Suspension Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1603.etp"/>">[1603] Member Suspension Approval Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1604.etp"/>">[1604] Task Assignment Entry</a>
											<li><a href="<c:url value="/marketInfo/1605.etp"/>">[1605] Member Task Assignment Entry</a></li>
											<li><a href="<c:url value="/marketInfo/1606.etp"/>">[1606] Member Task Suspension Entry</a></li>
										</ul></li>
									<li class="dropdown-submenu "><a tabindex="0"
										data-toggle="dropdown">RENTAS Reconciliantion</a>
										<ul class="dropdown-menu ">
											<li><a href="<c:url value="/marketInfo/1510.etp"/>">[1510] RENTAS Report Inquiry</a></li>
											<li><a href="<c:url value="/marketInfo/1511.etp"/>">[1511] RENTAS Reconciliation Summary Inquiry</a></li>
											<li><a href="<c:url value="/marketInfo/1512.etp"/>">[1512] RENTAS Inconsistency Inquiry</a></li>
											<li><a href="<c:url value="/marketInfo/1601.etp"/>">[1601] Member Information Inquiry</a></li>
										</ul></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Transaction<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value='/common/input.etp'/>">Input
											Test</a></li>
									<li><a href="<c:url value="/transaction/1320.etp"/>">[1320] Band Trading Without
											Stock Assignment</a></li>
									<li><a href="<c:url value="/transaction/1330.etp"/>">[1330] Transaction List for
											Admin</a></li>
									<li><a href="<c:url value="/transaction/1398.etp"/>">[1398] Request & Response List
											for BM</a></li>
									<li><a href="<c:url value="/transaction/1362.etp"/>">[1362] Trade Amendment Hsitory
											for Admin</a></li>
									<li><a href="<c:url value="/transaction/1520.etp"/>">[1520] Regulated Short Selling Entry</a></li>
									<li><a href="<c:url value="/transaction/1521.etp"/>">[1521] Regulated Short Selling
											Inquiry</a></li>
									<li><a href="<c:url value="/transaction/1380.etp"/>">[1380] Market Summary for
											Admin</a></li>
									<li><a href="<c:url value="/transaction/1670.etp"/>">[1670] Transaction Summary</a></li>
									<li><a href="<c:url value="/transaction/1615.etp"/>">[1615] Client Information
											Entry</a></li>
									<li><a href="<c:url value="/transaction/1680.etp"/>">[1680] Fee List for Admin</a></li>
									<li><a href="<c:url value="/transaction/1682.etp"/>">[1682] Fee List</a></li>
								</ul>
							</li>
						</ul>
						<!-- <ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">User Profile</a></li>
									<li><a href="#">Setting</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Logout</a></li>
								</ul></li>
						</ul> -->
					</div>
				</div>
			</nav>
		</div>
		<div class="col-md-12">
			<div class="row">
				<div class="marquee text-info" data-duration="15000" data-duplicated="true" data-gap="100" data-speed="20">
					<b>${msgBroadCast}</b>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="container-fluid">
				<div class="col-md-1">
					&nbsp;
				</div>
				<div class="col-md-10">
					<decorator:body></decorator:body>
				</div>	
				<div class="col-md-1">
					&nbsp;
				</div>						
			</div>
		</div>
	</div>
</body>
</html>