<%@page import="java.sql.*" %>
<%!
  private Connection con;
  private PreparedStatement pstmt;
  private ResultSet rs;
%>
<%
  //capture the form data
  String uname = request.getParameter("uname");
String mb = request.getParameter("mb");
  String comment = request.getParameter("comment");
  
  Class.forName("com.mysql.cj.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","Klueng@123");
  
  String vsql1="insert into feedback values(?,?,?)";
  
  PreparedStatement pstmt=con.prepareStatement(vsql1);
  //set the uname and pwd values into query
  pstmt.setString(1, uname);
  pstmt.setString(2, mb);
  pstmt.setString(3, comment);
  
  int n=pstmt.executeUpdate();
	  
	  %>
	    <center>
	      <h2>Feedback Submitted!!</h2>
	      <jsp:include page="/feedback.html"></jsp:include>
	    </center>
	    <%
%>