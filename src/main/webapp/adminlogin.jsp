<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>


<%
String email = request.getParameter("email");
String password = request.getParameter("password");

DB db = new DB();
boolean b = db.adminlogin(email,password);
String msg="",result="";
if(b){
	session.setAttribute("login", "success");
	session.setAttribute("type", "admin");
	session.setAttribute("email", email);
	
	%>
	<jsp:forward page="adminhome.jsp"/>
	<%
}
else{
	msg = "Login failed due to invalid username or password";
	result="fail";
	session.setAttribute("msg", msg);
	session.setAttribute("result", result);
	%>
	<jsp:forward page="admin.jsp"/>
	<%
}



%>
