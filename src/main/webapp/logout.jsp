<%
String type = (String)session.getAttribute("type");
session.removeAttribute("login");
session.removeAttribute("email");
session.invalidate();

if(type.equals("customer"))
	response.sendRedirect("customer.jsp");
else
	response.sendRedirect("investor.jsp");


%>