<%@page import="java.sql.*" %>
<%!
  Connection con;
  Statement stmt;
  
%>
<%
  //connection established
  Class.forName("com.mysql.cj.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","Klueng@123");
  
//retrive emp id from url
  String mb = request.getParameter("mb");
  
  //select query to retrieve data from db
  String vsql = "delete from logincred where mb=" + mb;
  
  //Statement object creation
  stmt = con.createStatement();
  
  //execute query by calling executeQuery() method
  int n = stmt.executeUpdate(vsql);
  
  
 if(n>0){
   %>
     <jsp:forward page = "/getData.jsp" />
   <%  
 }
  
 %>