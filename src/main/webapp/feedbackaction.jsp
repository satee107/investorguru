<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 String email = request.getParameter("email");
 String name = request.getParameter("name");
 String message = request.getParameter("message");
 
 
 DB db = new DB();
 String msg="",result="";
 if(db.addFeedback(email, name, message)){
	 	msg = "Feedback sent Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="feedback.jsp"/>
		<%
 }
 else{
	 msg = "Error in feedback sending";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="feedback.jsp"/>
		<%
 }
 
 %>
