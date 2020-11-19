<!doctype html>
<%@ page import="fit.*,java.util.*" %>
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


String id = request.getParameter("id");
%>
</div>
<div class="row mb-3">
	<div class="col-md-2"></div>
	
	<%
	
	DB db = new DB();
	List<Customer> list = db.viewCustomers();
	%>
	<div class="col-md-8">
	<h2>View Customers (<%= list.size() %>)</h2>
	<%
	
	if(list.size()==0){
		
		%>
		<div class="card p-3">
				<h3>No Data Found</h3>	
		</div>
		<%
	}
	else{
		for(int i=0;i<list.size();i++){
			Customer customer = list.get(i);
			%>
			
			<div class="card p-3 m-1">
				<h3><%= customer.getName() %></h3>
  				
  				<div class="inline">
  				<p><i class="fa fa-envelope text-primary"></i> <%= customer.getEmail() %></p>
  				<p><i class="fa fa-mobile text-success"></i> <%= customer.getMobile() %></p>
  				
  				
  				</div>
  				
  				
		</div>
	
			
			<%
		}
	}
	%>
	
		
	
	</div>
	<div class="col-md-2"></div>
	
	
</div>

</main>

<%@ include file="footer.jsp" %>



</div>

</body>
</html>
