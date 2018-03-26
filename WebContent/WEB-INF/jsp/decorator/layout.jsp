<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<head>
<title><decorator:title /></title>
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
<link rel="stylesheet" href="<c:url value="/resources/style/etp.css"/>" />  

<script src="<c:url value="/resources/script/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/resources/script/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/script/jquery.marquee.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap-submenu.js"/>"></script>
<script src="<c:url value="/resources/script/grid.locale-en.js"/>"></script>
<script src="<c:url value="/resources/script/jquery.jqGrid.src.js"/>"></script>
<script src="<c:url value="/resources/script/etp.js"/>"></script>

<decorator:head></decorator:head>

<style type="text/css">
.marquee {
  width: auto;
  /*height: 30px;
  max-width: 900px;
  border: solid 1px #999;*/
  /*line-height: 2.2em;
  vertical-align: middle;*/
  overflow: hidden;
  font-size: 15px;
}
</style>
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
	$("#alertBlink").hide();
	$("#alertTxt").hide();
	
	blink("#alertBlink", -1, 500);
});

function date_time(id)
{
	<% java.util.Date now = new java.util.Date(); %> 
	date = new Date();
	year = date.getFullYear();
	month = date.getMonth();
	month = month+1;
	if(month<10)
	{
		month = "0"+(month);
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

function blink(elem, times, speed) {
    if (times > 0 || times < 0) {
        if ($(elem).hasClass("blink")) 
            $(elem).removeClass("blink");
        else
            $(elem).addClass("blink");
    }

    clearTimeout(function () {
        blink(elem, times, speed);
    });

    if (times > 0 || times < 0) {
        setTimeout(function () {
            blink(elem, times, speed);
        }, speed);
        times -= .5;
    }
}

</script>
</head>
<body>
	<div class="container-fluid">
	<div class="row">
		<nav class="navbar navbar-info">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<c:url value="/common/welcome.sdm"/>"><img height="30" width="100" src="<c:url value="/resources/images/ntt.jpg"/>"/></a>
				</div>
				<div class=""> 
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle " data-toggle="dropdown" href="#">EDC Sim<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/edc/edc0100sim.sdm"/>">EDC Request</a></li>
								<li><a href="<c:url value="/edc/edc0200sim.sdm"/>">CAFIS Request</a></li>
							</ul>
						</li>
					</ul>
<!-- 					<div class="col-md-12 bg-warning"> -->
<!-- 						<div class="marquee text-info" data-duration="15000" -->
<!-- 							data-duplicated="true" data-gap="1000" data-speed="20"> -->
<%-- 							<b>${msgBroadCast}</b> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<ul class="nav navbar-nav navbar-left">
						<li style="margin-top:7px"><form class="navbar-form navbar-left">
								<div class="form-group form-inline">
									<div class="col-md-12">
										<div class="btn btn-info" id="date_time" ></div>
            							<script type="text/javascript">date_time('date_time');</script> 							
									</div>
								</div>
								</form>
						</li>
					</ul>
<!-- 					<ul class="nav navbar-nav navbar-right"> -->
<!-- 						<li class="dropdown"> -->
<%-- 							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><c:out value="${user.caMemName}"/>(<c:out value="${user.caMemberNo}"/>) <c:out value="${user.caTraderName}"/>(<c:out value="${user.caTraderNo}"/>) </b><span class="caret"></span></a> --%>
<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li><a href="#">User Profile</a></li> -->
<!-- 								<li><a href="#">Setting</a></li> -->
<!-- 								<li role="separator" class="divider"></li> -->
<%-- 								<li><a href="<c:url value="/common/logout.etp"/>">Logout</a></li> --%>
<!-- 							</ul></li> -->
<!-- 					</ul> -->
					</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
							
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