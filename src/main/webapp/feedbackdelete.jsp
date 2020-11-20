<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 int  id = Integer.parseInt(request.getParameter("id"));

 
 
 DB db = new DB();
 String msg="",result="";
 if(db.deletefeedback(id)){
	 	msg = "feedback deleted Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="adminviewfeedback.jsp"/>
		<%
 }
 else{
	 msg = "Error in feedback deletion";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="adminviewfeedback.jsp"/>
		<%
 }
 
 %>
