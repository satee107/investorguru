<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
 
 <jsp:useBean id="idea" class="fit.Idea"/>
 <jsp:setProperty property="*" name="idea"/>
 
    
 <%

 
 DB db = new DB();
 String msg="",result="";
 if(db.updateidea(idea)){
	 	msg = "Idea updated Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaadd.jsp"/>
		<%
 }
 else{
	 msg = "Error in idea updation";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="ideaadd.jsp"/>
		<%
 }
 
 %>
