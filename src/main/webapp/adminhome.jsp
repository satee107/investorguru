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

String login = (String)session.getAttribute("login");

if(login==null){
	response.sendRedirect("admin.jsp");
}

%>
</div>

<div class="ariclecontent">
<h1>Welcome to Admin</h1>
</div>

</main>

<footer>
<p>&copy; 2020 All Rights Reserded</p>
</footer>


</div>

</body>
</html>
