<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 int  id = Integer.parseInt(request.getParameter("id"));
 String email = (String) session.getAttribute("email");
 
 
 DB db = new DB();
 String msg="",result="";
 if(db.idealike(id,email)){
	 	msg = "Idea liked Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaview.jsp"/>
		<%
 }
 else{
	    msg = "Already Liked";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaview.jsp"/>
		<%
 }
 
 %>
