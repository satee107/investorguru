<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>

<jsp:useBean id="investor" class="fit.Investor"></jsp:useBean>
<jsp:setProperty property="*" name="investor"/>
<%
DB db = new DB();
boolean b = db.loginInvestor(investor);
String msg="",result="";
if(b){
	session.setAttribute("login", "success");
	session.setAttribute("type", "investor");
	session.setAttribute("email", investor.getEmail());
	
	%>
	<jsp:forward page="investorhome.jsp"/>
	<%
}
else{
	msg = "Login failed due to invalid username or password";
	result="fail";
	session.setAttribute("msg", msg);
	session.setAttribute("result", result);
	%>
	<jsp:forward page="investor.jsp"/>
	<%
}



%>
