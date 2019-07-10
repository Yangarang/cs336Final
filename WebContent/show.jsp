<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
</head>
<br>

<body>
<%      
	List<String> list = new ArrayList<String>();

	try {
	    	//Create a connection string
			//String url = "jdbc:mysql://your_VM:3306/your_db";
	    	String url = "jdbc:mysql://hstech.clgxpevwehke.us-east-1.rds.amazonaws.com:3306/hstech_cs336";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
		    Connection con = DriverManager.getConnection(url, "admin", "nathanisstupid");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();
	    	//Get the selected radio button from the HelloWorld.jsp
		    String entity = request.getParameter("command");
	    	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT * FROM " + entity;
	    	//Run the query against the database.
		    //ResultSet result = stmt.executeQuery(str);

		    ResultSet resultSet = stmt.executeQuery(str);
		    ResultSetMetaData rsmd = resultSet.getMetaData();
		    int columnsNumber = rsmd.getColumnCount();

		    while (resultSet.next()) {
		        for (int i = 1; i <= columnsNumber; i++) {
					if(i == 1) {
		            	String columnValue = resultSet.getString(i);
		            	out.print(columnValue + "");
					}
		        }
		        out.println("\n");
		    }
	    	
	    	/*
		    //Make an HTML table to show the results in:
		    out.print("<table>");
		    
	    	   //make a row
		       out.print("<tr>");
	    	   //make a column
		       out.print("<td>");
	    	   //print out column header
		       out.print("name");
		       out.print("</td>");
		       //make a column
		       out.print("<td>");
		       out.print("</td>");
		       out.print("</tr>");
		    
		    //parse out the results
		    while(result.next())
		    {
		       //make a row
		       out.print("<tr>");
		       //make a column
		       out.print("<td>");
		       out.print(result.getString("name"));
		       out.print("</td>");
		       out.print("<td>");
		       out.print("</td>");
		       out.print("</tr>");
		      
		    } 
		    out.print("</table>");
		    */
		    //close the connection.
		    con.close();

	} catch (Exception e) {
		out.print("Fail");
	}
%>

</body>
</html>