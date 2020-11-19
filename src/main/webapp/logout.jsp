<%
String type = (String)session.getAttribute("type");
session.removeAttribute("login");
session.removeAttribute("email");
session.invalidate();

if(type.equals("customer"))
	response.sendRedirect("customer.jsp");
else if(type.equals("investor"))
	response.sendRedirect("investor.jsp");
else
	response.sendRedirect("admin.jsp");



%>