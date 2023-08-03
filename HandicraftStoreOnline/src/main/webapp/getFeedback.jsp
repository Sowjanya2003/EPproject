<%@page import="java.sql.*" %>
<%!
	Connection con;
	Statement stmt;
	ResultSet rs;
%>
<%
	//connection establishment
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	try{
  	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","Klueng@123");
  	//select query to retrive data from db
  	String vsql = "select * from feedback";
  	//statement object creation
  	stmt = con.createStatement();
  	//execute query by calling executeQuery() method
  	rs = stmt.executeQuery(vsql);
  	%>
  	<body bgcolor="aqua">
  	<center>
  		<table border="1">
  			<tr>
  				<th>USERNAME<th>MOBILE NUMBER<th>COMMENT</th>
  			</tr>
  			<%
  			int i=0;
  				while(rs.next()){
  					%>
  					<tr>
  						<td><%=rs.getString("username") %></td>
  						<td><%=rs.getString("mb") %></td>
  						<td><%=rs.getString("comment") %></td>
  						<td><a href="deleteData.jsp?mb=<%=rs.getString("mb") %>">DELETE</a></td>
  					</tr>
  					<tr>
  						<td><a href="mainhome.html">LOGOUT</a></td>
  					</tr>
  					<%
  					i++;
  				}
	}
	catch (Exception e) {
		e.printStackTrace();
	}
  			%>
  		</table>
	</center>
	</body>
	
  	<%
%>
