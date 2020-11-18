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
	response.sendRedirect("investor.jsp");
}

%>
</div>

<div class="ariclecontent">
<h1>Welcome to Investorgguru (<%= email %>)</h1>
<p>The Peterborough Region Angel Network (PRAN) brings together individual investors from the Peterborough area. Peterborough Angels combine their wealth of knowledge and experience to collaborate and invest in early stage growth companies. Our particular areas of focus for investment include: information & communication technology (ICT), medical technology, green technology (cleantech), biotechnology and life-sciences.</p>
</div>

</main>

<footer>
<p>&copy; 2020 All Rights Reserded</p>
</footer>


</div>

</body>
</html>
