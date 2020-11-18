<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="fit.*"%>

<jsp:useBean id="investor" class="fit.Investor"></jsp:useBean>
<jsp:setProperty property="*" name="investor"/>
<%
DB db = new DB();
int n = db.addInvestor(investor);
String msg="",result="";
if(n==1){
	msg = "Registrtaion successfull";
	result = "success";
}
else{
	msg = "Registartion failed";
	result="fail";
}

session.setAttribute("msg", msg);
session.setAttribute("result", result);

%>
<jsp:forward page="investor.jsp"/>