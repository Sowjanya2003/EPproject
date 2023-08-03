<%@page import="java.sql.*" %>
<%!
  private Connection con;
  private PreparedStatement pstmt;
  private ResultSet rs;
%>
<%
  //capture the form data
	String mb = request.getParameter("mb");
  String new_pwd = request.getParameter("new_pwd");
  
  Class.forName("com.mysql.cj.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","Klueng@123");
  
  String vsql1="update logincred set password=? where mb="+mb;
  
  PreparedStatement pstmt=con.prepareStatement(vsql1);
  //set the uname and pwd values into query
  pstmt.setString(1,new_pwd);
  
  //execute the query
  int n=pstmt.executeUpdate();
 	  %>
	    <center>
	      <h2>password updated Successfully!!</h2>
	      <jsp:forward page="/login.html"></jsp:forward>
	    </center>
	    <%
	  
%>