<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/style/ui.jqgrid.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/jquery-ui.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-combobox.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-submenu.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/bootstrap-theme.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/ui.jqgrid-bootstrap.css"/>" /> 
<link rel="stylesheet" href="<c:url value="/resources/style/jquery-ui.theme.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/style/jquery-ui.structure.min.css"/>" /> 

<script src="<c:url value="/resources/script/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/resources/script/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap-combobox.js"/>"></script>
<script src="<c:url value="/resources/script/jquery.marquee.min.js"/>"></script>
<script src="<c:url value="/resources/script/bootstrap-submenu.js"/>"></script>
<script src="<c:url value="/resources/script/grid.locale-en.js"/>"></script>
<script src="<c:url value="/resources/script/etp.js"/>"></script>
<script>
function submitLogin(){
	$("#formOne").attr("action","welcome.etp");
	$("#formOne").submit();
}
setTimeout(function(){
	$("input:text:visible:first").focus()
}, 500);
</script>
</head>
<body>
<br><br><br><br><br><br><br><br><br>
<div class="container-fluid">
<form:form modelAttribute="form" id="formOne" action="welcome.sdm">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" style="height: 100px; background-image: url('../resources/images/ntt.jpg'); background-repeat: no-repeat; background-size: 100% 100%;">
                        <h3 class="panel-title" align="right"></h3>
                    </div>
                    <div class="panel-body">
                            <fieldset>
                                <div class="form-group">
                                    <form:input path="username" class="form-control" placeholder="Username" name="email" maxlength="10" autocomplete="off"/>
                                </div>
                                <div class="form-group">
                                    <form:input path="password" class="form-control" placeholder="Password" name="password" type="password" autocomplete="off" />
                                </div>
                                <input type="submit" class="btn btn-lg btn-info btn-block" name="Login" value="Login"/>
                            </fieldset>
                        <c:if test="${success!='' && error==''}">
							<div class="alert alert-success">
							 	<strong>${success}</strong> 
							</div>
						</c:if>
						<c:if test="${success=='' && error!=''}">
							<div class="alert alert-danger">
								<strong>${error}</strong>
							</div>
						</c:if>
                    </div>
                    <div class="panel-body bg-danger"><b>
                    THIS IS EDC SIMULATOR.
                    </b></div>
                </div>
            </div>
        </div>
       </form:form>
    </div>
</body>
</html>