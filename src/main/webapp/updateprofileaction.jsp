<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 String email = request.getParameter("email");
 String name = request.getParameter("name");
 Long mobile = Long.parseLong(request.getParameter("mobile"));
 
 
 DB db = new DB();
 String msg="",result="";
 if(db.updatecustprofile(email, name, mobile)){
	 	msg = "Profile Updated Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="updateprofile.jsp"/>
		<%
 }
 else{
	 msg = "Error in profile updation";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="updateprofile.jsp"/>
		<%
 }
 
 %>
