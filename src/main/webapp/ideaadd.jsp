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
	<div class="col-md-1"></div>
	<div class="col-md-4">
	
	<%
	if(id==null){
	%>
		<h2>Post Idea</h2>
		<form action="ideasave.jsp" method="post">
			<div class="form-group">
			<label for="title">Enter Title</label>
			<input type="text" class="form-control" name="title"  required />
			</div>
			<div class="form-group">
			<label for="description">Enter Description</label>
			<input type="text" class="form-control" name="description" required/>
			</div>
			<div class="form-group">
			<label for="domain">Domain</label>
			<input type="text" class="form-control" name="domain" required/>
			</div>
			<input type="submit" value="Post Idea" class="btn btn-primary"/>
			
		</form>
		<%}
	else{
		String title=request.getParameter("title");
		String desc = request.getParameter("desc");
		String domain = request.getParameter("domain");
		%>
		<h2>Update Idea</h2>
		<form action="ideaedit.jsp" method="post">
			<input type="hidden" class="form-control" name="id"  value="<%= id %>" required />
			
			<div class="form-group">
			<label for="title">Enter Title</label>
			<input type="text" class="form-control" name="title"  value="<%= title %>" required />
			</div>
			<div class="form-group">
			<label for="description">Enter Description</label>
			<input type="text" class="form-control" name="description" value="<%= desc %>" required/>
			</div>
			<div class="form-group">
			<label for="domain">Domain</label>
			<input type="text" class="form-control" name="domain" value="<%= domain %>"  required/>
			</div>
			<input type="submit" value="Update Idea" class="btn btn-primary"/>
			
		</form>
		<%
	}
	
	%>
	</div>
	<%
	DB db = new DB();
	List<Idea> list = db.viewideas(email);
	%>
	<div class="col-md-6">
	<h2>Manage Ideas (<%= list.size() %>)</h2>
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
			Idea idea = list.get(i);
			%>
			
			<div class="card p-3 m-1">
				<h3><%= idea.getTitle() %></h3>
  				<p>
  					<%= idea.getDescription() %>
  				</p>
  				<div class="inline">
  				<p><i class="fa fa-align-justify text-primary"></i> <%= idea.getDomain() %></p>
  				<p><i class="fa fa-table"></i> <%= idea.getPdate() %></p>
  				<p><i class="fa fa-thumbs-up text-success"></i> <%= idea.getLikes() %></p>
  				<p><i class="fa fa-thumbs-down text-danger"></i> <%= idea.getDislikes() %></p>
  				</div>
  				<div class="inline">
  				<a href="ideadelete.jsp?id=<%= idea.getId() %>" class="btn btn-danger" onclick="return check();"><i class="fa fa-trash"></i> Delete</a>
  				<a href="ideaadd.jsp?id=<%= idea.getId() %>&title=<%= idea.getTitle() %>&desc=<%= idea.getDescription() %>&domain=<%= idea.getDomain() %>" class="btn btn-success">
  				<i class="fa fa-edit"></i> Edit</a>
  				
  				</div>
  				
		</div>
	
			
			<%
		}
	}
	%>
	
		
	
	</div>
	<div class="col-md-1"></div>
	
	
</div>

</main>

<%@ include file="footer.jsp" %>



</div>

</body>
</html>
