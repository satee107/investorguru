<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>
    
 <%
 int  id = Integer.parseInt(request.getParameter("id"));
 String type=request.getParameter("type");
 
 
 DB db = new DB();
 String msg="",result="";
 if(db.updatecustomerstatus(id, type)){
	 	msg = "status updated Successfully";
		result="success";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="adminviewcustomers.jsp"/>
		<%
 }
 else{
	 msg = "Error in updation";
		result="fail";
		session.setAttribute("msg", msg);
		session.setAttribute("result", result);
		%>
		<jsp:forward page="adminviewcustomers.jsp"/>
		<%
 }
 
 %>
