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
}
%>
</div>
<div class="row mb-3">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<h2>Change Password</h2>
		<form action="adminpwdaction.jsp" method="post">
			<div class="form-group">
			<label for="email">Enter Email</label>
			<input type="email" class="form-control" name="email" value="<%= email %>" required readonly/>
			</div>
			<div class="form-group">
			<label for="opassword">Enter Old Password</label>
			<input type="password" class="form-control" name="opassword" required/>
			</div>
			<div class="form-group">
			<label for="npassword">Enter New Password</label>
			<input type="password" class="form-control" name="npassword" required/>
			</div>
			<input type="submit" value="Change Password" class="btn btn-primary"/>
			
		</form>
	</div>
	<div class="col-md-3"></div>
	
	
</div>

</main>

<%@ include file="footer.jsp" %>



</div>

</body>
</html>
