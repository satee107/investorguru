<!doctype html>
<html>
<head>
<title>InvestorGuru - Index Page</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <%@ include file="headercode.jsp"%>

</head>
<body>
<div class="fluid-container">
<!-- header code started -->

<%@ include file="header.jsp"%>

<!-- header code completed -->
<main>
<hr/>
<div>
<%

String msg = (String)session.getAttribute("msg");
String result = (String)session.getAttribute("result");

if(result!=null){
	if(result.equals("success")){
		%>
			<div class="alert alert-success alert-dismissible col-md-6 ml-5">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			  <strong> Success! </strong> <%= msg %>
			</div>
		<%
	}
	else{
		%>
			<div class="alert alert-danger alert-dismissible col-md-6 ml-5">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			  <strong>Failed!</strong> <%= msg %>
			</div>
		<%
		
	}
	session.removeAttribute("result");
}
%>
</div>
<h1>Admin</h1>
<div class="row mb-3">
	<div class="col-md-2"></div>
	<div class="col-md-6">
		<h2>Login Here</h2>
		<form action="adminlogin.jsp" method="post">
			<div class="form-group">
			<label for="email">Enter Email</label>
			<input type="email" class="form-control" name="email" required/>
			</div>
			<div class="form-group">
			<label for="password">Enter Password</label>
			<input type="password" class="form-control" name="password" required/>
			</div>
			<input type="submit" value="Login" class="btn btn-primary"/>
		</form>
	</div>
	<div class="col-md-2"></div>
	
</div>

</main>

<%@ include file="footer.jsp" %>



</div>

</body>
</html>
