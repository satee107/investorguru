<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 int  id = Integer.parseInt(request.getParameter("id"));

 
 
 DB db = new DB();
 String msg="",result="";
 if(db.deleteidea(id)){
	 	msg = "Idea deleted Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaadd.jsp"/>
		<%
 }
 else{
	 msg = "Error in idea deletion";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaadd.jsp"/>
		<%
 }
 
 %>
