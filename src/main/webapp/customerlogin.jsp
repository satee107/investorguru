<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>

<jsp:useBean id="customer" class="fit.Customer"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>
<%
DB db = new DB();
boolean b = db.logincustomer(customer);
String msg="",result="";
if(b){
	session.setAttribute("login", "success");
	session.setAttribute("type", "customer");
	session.setAttribute("email", customer.getEmail());
	%>
	<jsp:forward page="customerhome.jsp"/>
	<%
}
else{
	msg = "Login failed due to invalid username or password";
	result="fail";
	session.setAttribute("msg", msg);
	session.setAttribute("result", result);
	%>
	<jsp:forward page="customer.jsp"/>
	<%
}



%>
