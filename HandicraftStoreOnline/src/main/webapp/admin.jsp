<%@page import="java.sql.*" %>
<%!
  private Connection con;
  private PreparedStatement pstmt;
  private ResultSet rs;
%>
<%
  //capture the form data
  String uname = request.getParameter("uname");
  String pwd = request.getParameter("pwd");
  
  Class.forName("com.mysql.cj.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","Klueng@123");
  
  String vsql = "select * from admin where username=? and password=?";
  
  pstmt = con.prepareStatement(vsql);
  
  //set the uname and pwd values into query
  pstmt.setString(1,uname);
  pstmt.setString(2,pwd);
  
  //execute the query
  rs = pstmt.executeQuery();
  
  if(rs.next()){
    session.setAttribute("uname",uname);
    %>
    <jsp:forward page="/getFeedback.jsp" />
    <%
  }else{
    %>
    <center>
      <h2>Invalid Username or Password. Login Fail</h2>
      <jsp:include page="/admin.html"></jsp:include>
    </center>
    <%
  }
%>