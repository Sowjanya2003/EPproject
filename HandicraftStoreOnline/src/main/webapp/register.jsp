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
  String pwd = request.getParameter("pwd");
  
  Class.forName("com.mysql.cj.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","Klueng@123");
  
  String vsql1="insert into logincred values(?,?,?)";
  
  PreparedStatement pstmt=con.prepareStatement(vsql1);
  //set the uname and pwd values into query
  pstmt.setString(1, uname);
  pstmt.setString(2, mb);
  pstmt.setString(3, pwd);
  
  //execute the query
  
  
  boolean capitalFlag = false;
  boolean lowerCaseFlag = false;
  boolean numberFlag = false;
  boolean flag = false;
  boolean special = false;
  char ch;
  for(int i=0;i < pwd.length();i++) {
      ch = pwd.charAt(i);
      if( Character.isDigit(ch)) {
          numberFlag = true;
      }
      else if (Character.isUpperCase(ch)) {
          capitalFlag = true;
      } else if (Character.isLowerCase(ch)) {
          lowerCaseFlag = true;
      }
      else if(ch=='@' || ch=='#' || ch=='$' || ch=='%' || ch=='&' || ch=='*'){
    	  special = true;
      }
      if(numberFlag && capitalFlag && lowerCaseFlag && special)
          flag=true;
  }

  
  if((mb.length()!=10) && flag==false){
	  %>
	    <center>
	    <h2 style="color: red;">Mobile Number should contain 10 digits</h2></br>
	      <h2 style="color: red;">AND</h2></br>
	      <h2 style="color: red;">Password should contain:</h2></br>
	      <h4 style="color: red;">1) Minimum 6 characters</h4></br>
	      <h4 style="color: red;">2) Atleast one digit</h4></br>
	      <h4 style="color: red;">3) Atleast one uppercase alphabet</h4></br>
	      <h4 style="color: red;">4) Atleast one special symbol (@,#,$,%,&,*)</h4>
	      <jsp:include page="/login.html"></jsp:include>
	    </center>
	   <%
  }
  else if(mb.length()!=10){
	  %>
	    <center>
	      <h2 style="color: red;">Mobile Number should contain 10 digits</h2>
	      <jsp:include page="/login.html"></jsp:include>
	    </center>
	    <%
  }
  else if(flag==false){
	  %>
	    <center>
	      <h2 style="color: red;">Password should contain:</h2></br>
	      <h4 style="color: red;">1) Minimum 6 characters</h4></br>
	      <h4 style="color: red;">2) Atleast one digit</h4></br>
	      <h4 style="color: red;">3) Atleast one uppercase alphabet</h4></br>
	      <h4 style="color: red;">4) Atleast one special symbol (@,#,$,%,&,*)</h4>
	      <jsp:include page="/login.html"></jsp:include>
	    </center>
	   <%
  }
  else{
	  pstmt.executeUpdate();
	  session.setAttribute("uname",uname);
	  %>
	    <center>
	      <h2>Registered Successfully!!</h2>
	      <jsp:include page="/login.html"></jsp:include>
	    </center>
	    <%
	  }
%>