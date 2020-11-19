<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 String email = request.getParameter("email");
 String oldpwd = request.getParameter("opassword");
 String newpwd = request.getParameter("npassword");
 
 
 DB db = new DB();
 String msg="",result="";
 if(db.adminchangepwd(email, oldpwd, newpwd)){
	 	msg = "Password Updated Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="adminchangepwd.jsp"/>
		<%
 }
 else{
	 msg = "Error in changing password";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="adminchangepwd.jsp"/>
		<%
 }
 
 %>
