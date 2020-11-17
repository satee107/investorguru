<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
 
 <jsp:useBean id="idea" class="fit.Idea"/>
 <jsp:setProperty property="*" name="idea"/>
 
    
 <%

 String email = (String) session.getAttribute("email");
 idea.setCustemail(email);
 
 DB db = new DB();
 String msg="",result="";
 if(db.addidea(idea)){
	 	msg = "Idea posted Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaadd.jsp"/>
		<%
 }
 else{
	 msg = "Error in idea sending";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaadd.jsp"/>
		<%
 }
 
 %>
