<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String userid=request.getParameter("UserId");
String password=request.getParameter("pass");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	PreparedStatement ps=con.prepareStatement("update registration2 set pass=? where UserId=?");
	ps.setString(2,userid);
	ps.setString(1,password);
	int i=ps.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("success5.jsp");
	}
	else{
		response.sendRedirect("index.html");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
	%>
</body>
</html>