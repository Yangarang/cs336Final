<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
<%
// set parameter info to Strings
String Player1 = request.getParameter("Player1");
String Player2 = request.getParameter("Player2");
String DeckType1 = request.getParameter("DeckType1");
String DeckType2 = request.getParameter("DeckType2"); 
String MatchID = request.getParameter("MatchID");
%>

	<meta charset="utf-8">
	<title>Hearthsone Techpedia </title>
	<meta name="description" content="Hearthstone Techpedia">
	<!-- Latest compiled and minified CSS -->
	 <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
</head>

	<style>
	body{
		padding-top: 40px;
	}
	</style>

<body data-spy="scroll" data-target="#my-navbar">

  <!-- Navbar -->
  	<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
  		<div class="container">
  			<div class="navbar-header">
  				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  					<span class="icon-bar"></span>
  				</button>

  				<a href="#jumbotron" class="navbar-brand">Hearthstone Techpedia</a>
  			</div><!-- Navbar Header-->
  			<div class="collapse navbar-collapse" id="navbar-collapse">
  				
  				<ul class="nav navbar-nav">
  					<li><a href="#search">Search</a> 
  					<li><a href="#results">Results</a> 
  					<li><a href="#statistics">Statistics</a> 
  					<li><a href="#gallery">Gallery</a> 
  					<li><a href="#decklist">Decklist</a> 
  					<li><a href="#faq">FAQ</a> 
  				</ul>
  			</div>
  		</div><!-- End Container-->
  	</nav><!-- End navbar -->

  	<!-- jumbotron-->
  	<div class="jumbotron" id="jumbotron">
  		<div class="container text-center">
  			<h1>Hearthstone Techpedia</h1>
  			<p> A Hearthstone Application for Beginners and Experts! </p>
  		</div><!-- End container -->
  	</div><!-- End jumbotron-->

  	<!-- Match Feedback-->
  	<div class="container" id="search">
    <br>
  		<section>
  			<div class="page-header">
  				<h2>Search<small> Select History of Matches</small></h2>
  			</div>

			<form method="get" action="Main.jsp#results" enctype=text/plain>
  			<div class="row">
  				<div class="col-md-6">
  					<blockquote>
  						<div class="form-group">
							<label for="Player1">Player 1</label>
							<input type="text" class="form-control" id="Player1" placeholder="All" name="Player1">
							<br>
							<label for="DeckType1">DeckType 1</label>
							<select class="form-control" id="DeckType1" name="DeckType1"> 
								<option value="" selected="selected">All</option>
								<option value="Aggro Druid" >Aggro Druid</option>
								<option value="Mid-Range Druid" >Mid-Range Druid</option>
								<option value="Control Warrior" >Control Warrior</option>
								<option value="Patron Warrior" >Patron Warrior</option>
								<option value="Demonhandlock Warlock" >Demonhandlock Warlock</option>
								<option value="Dragon Priest" >Dragon Priest</option>
								<option value="Face Hunter" >Face Hunter</option>
								<option value="Freeze Mage" >Freeze Mage</option>
								<option value="Mech Mage" >Mech Mage</option>
								<option value="Mech Shamen" >Mech Shamen</option>
								<option value="Mid-Range Hunter" >Mid-Range Hunter</option>
								<option value="Oil Rogue" >Oil Rogue</option>
								<option value="Secret Paladin" >Secret Paladin</option>
								<option value="Tempo Mage" >Tempo Mage</option>
								<option value="Zoo Warlock" >Zoo Warlock</option>								
							</select>					
							<br>
						</div>
  					</blockquote>
  				</div>
  				<div class="col-md-6">
  					<blockquote>
  						<div class="form-group">
							<label for="Player2">Player 2</label>
							<input type="text" class="form-control" id="Player2" placeholder="All" name="Player2">
							<br>
							<label for="DeckType2">DeckType 2</label>
							<select class="form-control" id="DeckType2" name="DeckType2"> 
								<option value="" selected="selected">All</option>
								<option value="Aggro Druid" >Aggro Druid</option>
								<option value="Mid-Range Druid" >Mid-Range Druid</option>
								<option value="Control Warrior" >Control Warrior</option>
								<option value="Patron Warrior" >Patron Warrior</option>
								<option value="Demonhandlock Warlock" >Demonhandlock Warlock</option>
								<option value="Dragon Priest" >Dragon Priest</option>
								<option value="Face Hunter" >Face Hunter</option>
								<option value="Freeze Mage" >Freeze Mage</option>
								<option value="Mech Mage" >Mech Mage</option>
								<option value="Mech Shamen" >Mech Shamen</option>
								<option value="Mid-Range Hunter" >Mid-Range Hunter</option>
								<option value="Oil Rogue" >Oil Rogue</option>
								<option value="Secret Paladin" >Secret Paladin</option>
								<option value="Tempo Mage" >Tempo Mage</option>
								<option value="Zoo Warlock" >Zoo Warlock</option>								
							</select>				
							<br>
						</div>
  					</blockquote>  					
  				</div>
  				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
				<br>
  			</div><!-- End row -->
			</form>
  		</section>
  	</div><!--End Container-->

<!-- call to action -->
	<section>
		<div class="well" id="results">
		<br>
			<div class="container text-center">
				<div class="page-header">
 				<h2>Results<small> Table of Matches </small></h2>
 				</div>
				<form action="" class="form-inline">
					<% 
					try {
			    	//Create a connection string
					//String url = "jdbc:mysql://your_VM:3306/your_db";
			    	String url = "jdbc:mysql://hstech.clgxpevwehke.us-east-1.rds.amazonaws.com:3306/hstech_cs336";
			    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
				    Class.forName("com.mysql.jdbc.Driver");
			    			
				    // convert to nulls
				    if(Player1 == "") {
				    	Player1 = null;
				    }
				    if(Player2 == "") {
				    	Player2 = null;
				    }
				    if(DeckType1 == "") {
				    	DeckType1 = null;
				    }
				    if(DeckType2 == "") {
				    	DeckType2 = null;
				    }

			    	//Create a connection to your DB
				   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
				    Connection con = DriverManager.getConnection(url, "admin", "nathanisstupid");
			    	//Create a SQL statement
				    Statement stmt = con.createStatement();
				    String str = "";

			    	// when website first starts up
			    	if (Player1 == null && Player2 == null && DeckType1 == null && DeckType2 == null) {
			    		%>
						<h4> Latest 25 Matches </h4>			    	
			    		<%
			    		str = "SELECT * FROM Matches ORDER BY MatchID DESC LIMIT 25";
			    	}
			    	// no players picked all decktype picked
			    	else if(Player1 == null && Player2 == null && DeckType1 != null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType1 +
						"' AND DeckType2 = '" + DeckType2 + "') OR (DeckType1 = '" + DeckType2 +
						"' AND DeckType2 = '" + DeckType1 + "')";
				    }	
			    	// player 1 picked all decktype
			    	else if(Player1 != null && Player2 == null && DeckType1 != null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player1 +
						"' AND DeckType1 = '" + DeckType1 +
						"' AND DeckType2 = '" + DeckType2 + "') OR (Player2 = '" + Player1 +
						"' AND DeckType1 = '" + DeckType2 +
						"' AND DeckType2 = '" + DeckType1 + "')";
				    }	
			    	// player 2 picked all decktype
			    	else if(Player1 == null && Player2 != null && DeckType1 != null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player2 +
						"' AND DeckType1 = '" + DeckType1 +
						"' AND DeckType2 = '" + DeckType2 + "') OR (Player2 = '" + Player2 +
						"' AND DeckType1 = '" + DeckType2 +
						"' AND DeckType2 = '" + DeckType1 + "')";
				    }	
			    	// player 1 picked no decktype
			    	else if(Player1 != null && Player2 == null && DeckType1 == null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player1 +
						"') OR (Player2 = '" + Player1 + "')";
				    }	
			    	// player 2 picked no decktype
			    	else if(Player1 == null && Player2 != null && DeckType1 == null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player2 +
						"') OR (Player2 = '" + Player2 + "')";
				    }	
			    	// no decktype picked all player picked
			    	else if(Player1 != null && Player2 != null && DeckType1 == null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player1 +
						"' AND Player2 = '" + Player2 + "') OR (Player1 = '" + Player2 +
						"' AND Player2 = '" + Player1 + "')";
				    }	
			    	// decktype 1 picked all players picked
			    	else if(Player1 != null && Player2 != null && DeckType1 != null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player1 +
						"' AND Player2 = '" + Player2 + "' AND DeckType1 = '" + DeckType1 +
						"') OR (Player1 = '" + Player2 +
						"' AND Player2 = '" + Player1 + "' AND DeckType2 = '" + DeckType1 + "')";
				    }
			    	// decktype 2 picked all players picked
			    	else if(Player1 != null && Player2 != null && DeckType1 == null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player1 +
						"' AND Player2 = '" + Player2 + "' AND DeckType1 = '" + DeckType2 +
						"') OR (Player1 = '" + Player2 +
						"' AND Player2 = '" + Player1 + "' AND DeckType2 = '" + DeckType2 + "')";
				    }
			    	// decktype 1 picked no players picked
			    	else if(Player1 == null && Player2 == null && DeckType1 != null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType1 +
						"') OR (DeckType2 = '" + DeckType1 + "')";
				    }
			    	// decktype 2 picked no players picked
			    	else if(Player1 == null && Player2 == null && DeckType1 == null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType2 +
						"') OR (DeckType2 = '" + DeckType2 + "')";
				    }
			    	// decktype 1 picked, player 1 picked
			    	else if(Player1 != null && Player2 == null && DeckType1 != null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType1 +
						"' AND Player1 = '" + Player1 + "') OR (DeckType2 = '" + DeckType1 + 
						"' AND Player2 = '" + Player1 + "')";
				    }
			    	// decktype 1 picked, player 2 picked
			    	else if(Player1 == null && Player2 != null && DeckType1 != null && DeckType2 == null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType1 +
						"' AND Player2 = '" + Player2 + "') OR (DeckType2 = '" + DeckType1 + 
						"' AND Player1 = '" + Player2 + "')";
				    }
			    	// decktype 2 picked, player 1 picked
			    	else if(Player1 != null && Player2 == null && DeckType1 == null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType2 +
						"' AND Player2 = '" + Player1 + "') OR (DeckType2 = '" + DeckType2 + 
						"' AND Player1 = '" + Player1 + "')";
				    }
			    	// decktype 2 picked, player 2 picked
			    	else if(Player1 == null && Player2 != null && DeckType1 == null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (DeckType1 = '" + DeckType2 +
						"' AND Player1 = '" + Player2 + "') OR (DeckType2 = '" + DeckType2 + 
						"' AND Player2 = '" + Player2 + "')";
				    }
			    	
			    	// all stuff are filled out - all picked
			    	else if(Player1 != null && Player2 != null && DeckType1 != null && DeckType2 != null) {
						str = "SELECT * FROM Matches WHERE (Player1 = '" + Player1 +
						"' AND Player2 = '" + Player2 + "' AND DeckType1 = '" + DeckType1 +
						"' AND DeckType2 = '" + DeckType2 + "') OR (Player1 = '" + Player2 +
						"' AND Player2 = '" + Player1 + "' AND DeckType1 = '" + DeckType2 +
						"' AND DeckType2 = '" + DeckType1 + "')";
				    }
			    	else {
			    		%>
						<h4> Latest 25 Matches </h4>			    	
			    		<%
			    		str = "SELECT * FROM Matches ORDER BY MatchID DESC LIMIT 25";
			    	}
			    	//Run the query against the database.		
				    ResultSet resultset = stmt.executeQuery(str);
					%>
					
					<TABLE cellpadding="0" cellspacing="0" width="100%" border="1">
					<tr>
						<TH> Match ID</TH>
		                <TH> Player 1</TH>
		                <TH> Rank of Player 1</TH>		                
		                <TH> Player 2</TH>
		                <TH> Rank of Player 2</TH>
		                <TH> DeckType 1</TH>
		                <TH> DeckType 2</TH>
		                <TH> Winner</TH>
		            </tr>
		            <% int numberRows = 0;
					while(resultset.next()){ %>
		            <TR>
		            	<%String link = "Main.jsp?MatchID="+resultset.getString(6)+"#match";
		            	%>
		                <TD> <a href=<%out.print(link);%>><%=resultset.getString(6)%></a></td>		            	
		                <TD> <%= resultset.getString(1) %></td>
		                <TD> <%= resultset.getString(2) %></td>
		                <TD> <%= resultset.getString(3) %></TD>
		                <TD> <%= resultset.getString(4) %></td>
		                <TD> <%= resultset.getString(7) %></TD>
		                <TD> <%= resultset.getString(38) %></TD>
		                <TD> <%= "Player " + resultset.getString(5) %></TD>
		            </TR>
		            <%
		            numberRows++;		                
		            } 
		            con.close();
					} catch (Exception e) {
						out.print("Failed to retrieve data.");
					}
		            %>
		        	</TABLE>        	
		        	<br>
		        	
		        	<% 
		        	// Print Match Details
		        	double winner = 1;
		        	if (MatchID != null) {
		        		%>		        		
  						<div class="container" id="match">
  						<br>
  						<br>
 						<h2>Match Details <small>Match ID: <% out.print(MatchID); %></small></h2>
		        		<%
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
						    String str = "";
						    str = "SELECT * FROM Matches WHERE MatchID = " + MatchID;

					    	//Run the query against the database.		
						    ResultSet resultset = stmt.executeQuery(str);
							%>
							
							<TABLE cellpadding="0" cellspacing="0" width="100%" border="1">
							<tr>
								<TH> </TH>
				                <TH> Player 1</TH>
				                <TH> Player 2</TH>	
				            </tr>
				            <%
							while(resultset.next()){ 
  							    winner = Double.parseDouble(resultset.getString(5));
				            	%>
					            <TR>	       
					                <th> <%= "Player Name" %></th>  
					                <TD> <%= resultset.getString(1) %></td>  
					                <TD> <%= resultset.getString(3) %></td> 
					            </TR>						            
					            <TR>	       
					                <th> <%= "Rank" %></th>  
					                <TD> <%= resultset.getString(2) %></td>  
					                <TD> <%= resultset.getString(4) %></td> 
					            </TR>						            
					            <TR>	       
					                <th> <%= "Deck Type" %></th>  
					                <TD> <%= resultset.getString(7) %></td>  
					                <TD> <%= resultset.getString(38) %></td> 
					            </TR>	

					            <% 					
				            	int row = 1;
				            	while(row < 31) {%>
					            <TR>	       	       
					                <th> <%= "Card " + row %></th>       
					                <TD> <%= resultset.getString(row+7) %></td>
					                <TD> <%= resultset.getString(row+38) %></td>
					            </TR> <%	 
					            row++;
								}
					            Player1 = resultset.getString(1);
					            Player2 = resultset.getString(3);
					            DeckType1 = resultset.getString(7);
					            DeckType2 = resultset.getString(38);
					            %>
					            <h4>
					        	<%
					        	// display winner
					        	if(winner == 1) {
					        		out.print("Winner: " + Player1 + " (" + DeckType1 + ")");
					        	}
					        	else {
					        		out.print("Winner: " + Player2 + " (" + DeckType2 + ") ");		        		
					        	}
					        	%>	
					        	</h4>
					        	<%
					        	} 
				            con.close();
							} catch (Exception e) {
								out.print("Failed to retrieve data.");
							}
			        }
		        	%>		        	
		        	</TABLE> 
		        	</div>
 			
				</form>
			</div><!-- end Container-->

		</div><!-- end well-->
		<div class="container text-center" id="statistics">
				<br>
				<div class="page-header">
 					<h2>Statistics<small> Stats of Matches </small></h2>
 				</div>
  				<div class="col-sm-6">
  					<div class="panel panel-default text-center">
  						<div class="panel-body">
  							<span class="glyphicon glyphicon-ok"></span>
  							<h4> - DeckType 1 - <br><%out.println(DeckType1);%></h4>
  							<p>
  							<%
  							String wins = "";
  							String totalwins = "";
  							double dwins;
  							double dtotalwins;
  							if(DeckType1 != null) {
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
  								    String str = "";
  							    	//Make a SELECT query from the table specified by the 'command' parameter
									str = "SELECT COUNT(Win) FROM Matches WHERE DeckType2 = '" + DeckType1 + "' AND Win = 2 OR DeckType1 = '" + DeckType1 + "' AND Win = 1";
  								    ResultSet resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Wins: " + resultset.getString(1));
									wins = resultset.getString(1);
  							    	
  							    	%> <br> <%
									str = "SELECT COUNT(Win) FROM Matches WHERE DeckType2 = '" + DeckType1 + "' OR DeckType1 = '" + DeckType1 + "'";
  								    resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Games: " + resultset.getString(1));
	  							    totalwins = resultset.getString(1);

  							    	%> <br> <%
	  							    dwins = Double.parseDouble(wins);
	  							    dtotalwins = Double.parseDouble(totalwins);
	  							    out.print("Win Percentage: " + Math.round((dwins/dtotalwins)*100) + "%");
	  							    
  							    	if(DeckType2 != null) {
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (DeckType2 = '" + DeckType1 + 
  										"' AND DeckType1 = '" + DeckType2 + "' AND Win = 2) OR (DeckType1 = '" +DeckType1 + 
  										"' AND DeckType2 = '" + DeckType2 + "' AND Win = 1)";
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Number of Wins Against " +DeckType2 + ": " + resultset.getString(1));
  										wins = resultset.getString(1);
  	  							    	
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (DeckType2 = '" + DeckType1 + 
  										"' AND DeckType1 = '" + DeckType2 + "') OR (DeckType1 = '" +DeckType1 + 
  										"' AND DeckType2 = '" + DeckType2 + "')";
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Total Number of Games Against " +DeckType2 + ": " + resultset.getString(1)); 
  		  							    totalwins = resultset.getString(1);

  	  							    	%> <br> <%
  		  							    dwins = Double.parseDouble(wins);
  		  							    dtotalwins = Double.parseDouble(totalwins);
  		  							    out.print("Win Percentage Against " + DeckType2 + ": " + Math.round((dwins/dtotalwins)*100) + "%");
  		  							    
  		  							    //
  							    	}  							    	
  						            con.close();  						             
  								} catch (Exception e) {
  									out.print("Failed to retrieve stats.");
  								}
  							}
  							else {
  								out.print("No inputted DeckType");
  							}
  							%>  							 								
							</p>
							</div>
  					</div>
  				</div>

  				<div class="col-sm-6">
  					<div class="panel panel-default text-center">
  						<div class="panel-body">
  							<span class="glyphicon glyphicon-star"></span>
  							<h4> - DeckType 2 - <br><%out.println(DeckType2);%></h4>
  							<p>
  							<%
  							if(DeckType2 != null) {
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
  								    String str = "";
  							    	//Make a SELECT query from the table specified by the 'command' parameter
									str = "SELECT COUNT(Win) FROM Matches WHERE DeckType2 = '" + DeckType2 + "' AND Win = 2 OR DeckType1 = '" + DeckType2 + "' AND Win = 1";	
  								    ResultSet resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Wins: " + resultset.getString(1));
									wins = resultset.getString(1);
									
  							    	%> <br> <%
									str = "SELECT COUNT(Win) FROM Matches WHERE DeckType2 = '" + DeckType2 + "' OR DeckType1 = '" + DeckType2 + "'";
  								    resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Games: " + resultset.getString(1));
	  							    totalwins = resultset.getString(1);

  							    	%> <br> <%
	  							    dwins = Double.parseDouble(wins);
	  							    dtotalwins = Double.parseDouble(totalwins);
	  							    out.print("Win Percentage: " + Math.round((dwins/dtotalwins)*100) + "%");
  							    	
  							    	if(DeckType1 != null) {
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (DeckType2 = '" + DeckType2 + 
  										"' AND DeckType1 = '" + DeckType1 + "' AND Win = 2) OR (DeckType1 = '" +DeckType2 + 
  										"' AND DeckType2 = '" + DeckType1 + "' AND Win = 1)";	
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Number of Wins Against " +DeckType1 + ": " + resultset.getString(1));
  										wins = resultset.getString(1);
  	  							    	
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (DeckType2 = '" + DeckType2 + 
  										"' AND DeckType1 = '" + DeckType1 + "') OR (DeckType1 = '" +DeckType2 + 
  										"' AND DeckType2 = '" + DeckType1 + "')";
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Total Number of Games Against " +DeckType1 + ": " + resultset.getString(1));
  	  							    	totalwins = resultset.getString(1);

	  							    	%> <br> <%
		  							    dwins = Double.parseDouble(wins);
		  							    dtotalwins = Double.parseDouble(totalwins);
		  							    out.print("Win Percentage Against " + DeckType1 + ": " + Math.round((dwins/dtotalwins)*100) + "%");
							    	
  							    	}  	
  							    	
  						            con.close();  						             
  								} catch (Exception e) {
  									out.print("Failed to retrieve stats.");
  								}
  							}
  							else {
  								out.print("No inputted DeckType");
  							}
  							%>  							 								
							</p>							
							</div>
  					</div>
  				</div>
		</div>
		<div class="container text-center" id="statistics">
  				<div class="col-sm-6">
  					<div class="panel panel-default text-center">
  						<div class="panel-body">
  							<span class="glyphicon glyphicon-play-circle"></span>
  							<h4> - Player 1 - <br><%out.println(Player1);%></h4>  							
  							<p>
  							<%
  							if(Player1 != null) {
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
  								    String str = "";
  							    	//Make a SELECT query from the table specified by the 'command' parameter
									str = "SELECT COUNT(Win) FROM Matches WHERE Player2 = '" + Player1 + "' AND Win = 2 OR Player1 = '" + Player1 + "' AND Win = 1";
  							    	//Run the query against the database.		
  								    ResultSet resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Wins: " + resultset.getString(1));
									wins = resultset.getString(1);
									
  							    	%> <br> <%
									str = "SELECT COUNT(Win) FROM Matches WHERE Player2 = '" + Player1 + "' OR Player1 = '" + Player1 + "'";
  								    resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Games: " + resultset.getString(1));
	  							    totalwins = resultset.getString(1);

  							    	%> <br> <%
	  							    dwins = Double.parseDouble(wins);
	  							    dtotalwins = Double.parseDouble(totalwins);
	  							    out.print("Win Percentage: " + Math.round((dwins/dtotalwins)*100) + "%");
  							    	
  							    	
  							    	if(DeckType2 != null) {
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player1 + 
  										"' AND DeckType1 = '" + DeckType2 + "' AND Win = 2) OR (Player1 = '" + Player1 + 
  										"' AND DeckType2 = '" + DeckType2 + "' AND Win = 1)";		
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Number of Wins Against " +DeckType2 + ": " + resultset.getString(1));  
  										wins = resultset.getString(1);	
  	  							    	
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player1 + 
  										"' AND DeckType1 = '" + DeckType2 + "') OR (Player1 = '" + Player1 + 
  										"' AND DeckType2 = '" + DeckType2 + "')";	
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Total Number of Games Against " +DeckType2 + ": " + resultset.getString(1)); 
	  	  							    totalwins = resultset.getString(1);
	
	  							    	%> <br> <%
		  							    dwins = Double.parseDouble(wins);
		  							    dtotalwins = Double.parseDouble(totalwins);
		  							    out.print("Win Percentage Against " + DeckType2 + ": " + Math.round((dwins/dtotalwins)*100) + "%");
							    	
  							    	}
  							    	if(Player2 != null) {
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player1 + 
  										"' AND Player1 = '" + Player2 + "' AND Win = 2) OR (Player1 = '" + Player1 + 
  										"' AND Player2 = '" + Player2 + "' AND Win = 1)";	
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Number of Wins Against Player " + Player2 + ": " + resultset.getString(1));
  										wins = resultset.getString(1);	  	

  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player1 + 
  										"' AND Player1 = '" + Player2 + "') OR (Player1 = '" + Player1 + 
  										"' AND Player2 = '" + Player2 + "')";
  	  							    	//Run the query against the database.		
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Total Number of Games Against Player " + Player2 + ": " + resultset.getString(1));
	  	  							    totalwins = resultset.getString(1);
	  	  							
	  							    	%> <br> <%
		  							    dwins = Double.parseDouble(wins);
		  							    dtotalwins = Double.parseDouble(totalwins);
		  							    out.print("Win Percentage Against Player " + Player2 + ": " + Math.round((dwins/dtotalwins)*100) + "%");
							    	
  							    	}  							    	
  						            con.close();  						             
  								} catch (Exception e) {
  									out.print("Failed to retrieve stats.");
  								}
  							}
  							else {
  								out.print("No inputted Player");
  							}
  							%>  							 								
							</p>
						</div>
  					</div>
  				</div>
  				
  				<div class="col-sm-6">
  					<div class="panel panel-default text-center">
  						<div class="panel-body">
  							<span class="glyphicon glyphicon-asterisk"></span>
  							<h4> - Player 2 - <br><%out.println(Player2);%></h4>  							
  							<%
  							if(Player2 != null) {
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
  								    String str = "";
  							    	//Make a SELECT query from the table specified by the 'command' parameter
									str = "SELECT COUNT(Win) FROM Matches WHERE Player2 = '" + Player2 + "' AND Win = 2 OR Player1 = '" + Player2 + "' AND Win = 1";
  							    	//Run the query against the database.		
  								    ResultSet resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Wins: " + resultset.getString(1));
									wins = resultset.getString(1);
									
  							    	%> <br> <%
									str = "SELECT COUNT(Win) FROM Matches WHERE Player2 = '" + Player2 + "' OR Player1 = '" + Player2 + "'";
  							    	//Run the query against the database.		
  								    resultset = stmt.executeQuery(str);
  							    	resultset.next();
  							    	out.print("Total Number of Games: " + resultset.getString(1));
	  							    totalwins = resultset.getString(1);

  							    	%> <br> <%
	  							    dwins = Double.parseDouble(wins);
	  							    dtotalwins = Double.parseDouble(totalwins);
	  							    out.print("Win Percentage: " + Math.round((dwins/dtotalwins)*100) + "%");
	  							    
  							    	if(DeckType1 != null) {
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player2 + 
  										"' AND DeckType1 = '" + DeckType1 + "' AND Win = 2) OR (Player1 = '" + Player2 + 
  										"' AND DeckType2 = '" + DeckType1 + "' AND Win = 1)";		
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Number of Wins Against " + DeckType1 + ": " + resultset.getString(1)); 
  										wins = resultset.getString(1); 	
  	  							    	
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player2 + 
  										"' AND DeckType1 = '" + DeckType1 + "') OR (Player1 = '" + Player2 + 
  										"' AND DeckType2 = '" + DeckType1 + "')";	
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Total Number of Games Against " + DeckType1 + ": " + resultset.getString(1));
	  	  							    totalwins = resultset.getString(1);
	
	  							    	%> <br> <%
		  							    dwins = Double.parseDouble(wins);
		  							    dtotalwins = Double.parseDouble(totalwins);
		  							    out.print("Win Percentage Against " + DeckType1 + ": " + Math.round((dwins/dtotalwins)*100) + "%");
							    	 
  							    	}
  							    	if(Player1 != null) {
  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player2 + 
  										"' AND Player1 = '" + Player1 + "' AND Win = 2) OR (Player1 = '" + Player2 + 
  										"' AND Player2 = '" + Player1 + "' AND Win = 1)";	
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Number of Wins Against Player " + Player1 + ": " + resultset.getString(1));  
  										wins = resultset.getString(1); 		

  	  							    	%> <br> <%
  										str = "SELECT COUNT(Win) FROM Matches WHERE (Player2 = '" + Player2 + 
  										"' AND Player1 = '" + Player1 + "') OR (Player1 = '" + Player2 + 
  										"' AND Player2 = '" + Player1 + "')";
  	  							    	//Run the query against the database.		
  	  								    resultset = stmt.executeQuery(str);
  	  							    	resultset.next();
  	  							    	out.print("Total Number of Games Against Player " + Player1 + ": " + resultset.getString(1)); 
	  	  							    totalwins = resultset.getString(1);
	  	  							
	  							    	%> <br> <%
		  							    dwins = Double.parseDouble(wins);
		  							    dtotalwins = Double.parseDouble(totalwins);
		  							    out.print("Win Percentage Against Player " + Player1 + ": " + Math.round((dwins/dtotalwins)*100) + "%");
							    	
  							    	}
  						            con.close();  						             
  								} catch (Exception e) {
  									out.print("Failed to retrieve stats.");
  								}
  							}
  							else {
  								out.print("No inputted Player");
  							}
  							%>  		
						</div>
  					</div>
  				</div>
  			</div><!-- end row -->
	</section><!-- Call to action -->

<!-- Gallery -->
	<div class="container" id="gallery">
    <br>
		<section>
			<div class="page-header">
  				<h2> Gallery <small> Hearthstone Classes</small></h2>
  			</div>

  			<div class="carousel slide" id="screenshot-carousel" data-ride="carousel">
  				<ol class="carousel-indicators">
  					<li data-target="#screenshot-carousel" data-slide-to="0" class="active"></li>
  					<li data-target="#screenshot-carousel" data-slide-to="1"></li>
  					<li data-target="#screenshot-carousel" data-slide-to="2"></li>
  				</ol>
  				<div class="carousel-inner">
  					<div class="item active">
  						<img src="resources/Hearthstone Title.jpg" alt="Hearthstone">
  						<div class="carousel-caption">
  							<h3>Hearthstone</h3>
  							<p>Opening Screen</p>
  						</div>
  					</div>
  					<div class="item">
  						<img src="resources/Screenshot.jpg" alt="Screenshot">
  						<div class="carousel-caption">
  							<h3>Gameplay</h3>
  							<p>Screenshot of Hearthstone Gameplay</p>
  						</div>
  					</div>
  				  	<div class="item">
  						<img src="resources/Wallpaper.jpg" alt="Screenshot">
  						<div class="carousel-caption">
  							<h3>Wallpaper</h3>
  							<p>Hearthstone Wallpaper</p>
  						</div>
  					</div>

  				</div><!-- End Carousel inner -->
  				<a href="#screenshot-carousel" class="left carousel-control" data-slide="prev">
  					<span class="glyphicon glyphicon-chevron-left"></span>
  				</a>
  				<a href="#screenshot-carousel" class="right carousel-control" data-slide="next">
  					<span class="glyphicon glyphicon-chevron-right"></span>
  				</a>
  			</div><!-- End Carousel -->

		</section>
	</div>

<!-- Decklist -->
	<div class="container" id="decklist">
    <br>
		<section>
			<div class="page-header">
  				<h2>Decklist<small> Top Meta-Decks </small></h2>
  			</div><!-- End Page Header -->

  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Patron Warrior</h3>
  					<h4>Difficulty: 8/10</h4>
  					<p>
  					Simultaneously removes the opponent's board, while swarming your side with Grim Patrons. 
  					The deck utilizes a heavy draw engine to reliably find it's combo pieces. 
  					Against aggro, a huge Grim Patron turn usually spells defeat for the opponent. 
  					The problem for many player is the intricate play Patron Warrior demands from the pilot, 
  					for that reason many do not run it, but it is still an extremely effective deck. 
  					Against control decks, saving Warsong Commander, some Whirlwind procs, and a Frothing Berserker 
  					can easily bring the opponent from 20+ HP to zero in a single turn. 
  					The most difficult match-up for Grim Patron Warrior is against Handlock 
  					as the Warrior is punished by many of Handlock's AoE removal spells.
  					</p>
  					</div>
  				<div class="col-sm-5">
  					<img src="resources/PatronWarriorDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div><!-- End row -->
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Secret Paladin</h3>
  					<h4>Difficulty: 6/10</h4>
  					<p>
 					With a month passing since the release of the Grand Tournament expansion, we see Secrets Paladin 
 					being the strongest new deck. Originally, a more aggressive approach was taken, with the Aggro Paladin 
 					being the backbones of the deck, and 8-10 secrets and 2 Mysterious Challengers being added. However, 
 					the deck has since taken a slower approach with the addition of Piloted Shredders, Loatheb, Dr Boom 
 					and Tirion Fordring. This tactic is seen to be more consistent then the aggressive approach, as you are 
 					not dependent on getting value off your Divine Favors to keep up the pressure in the mid to late game. 
 					Secrets Paladin has proved to be a Tier 1 deck since its creation, and will continue to do so for the 
 					foreseeable future, as its reliability remains to a force to be reckoned with on the ladder. A few counter 
 					decks have surfaced in the meta, however the deck has plenty of favorable match-ups, and with a somewhat 
 					decent curve no deck can stop it.
  					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/SecretPaladinDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Aggro Druid</h3>
  					<h4>Difficulty: 5/10</h4>
  					<p>
  					A much faster variation of Druid than it's Mid-Range counterpart, Aggro Druid features more low drops than most 
  					other Druid lists, running minions like Leper Gnome, Knife Juggler, and Druid of the Saber. These cards apply 
  					early pressure leading into the mid-game where you aim to drop strong tempo cards like Fel Reaver to keep the 
  					pressure on your opponent. The goal is to close out the game with the classic Force of Nature + Savage Roar 
  					combo pieces around turns 7-9.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/AggroDruidDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Mid-Range Druid</h3>
  					<h4>Difficulty: 6/10</h4>
  					<p>
					Druid is a heavy mid-range deck with the theme of cheating the mana curve by using class cards like Wild Growth, 
					Innervate, and the newest addition: Darnassus Aspirant. It can be quite flexible as to whether you play a more
					control play style, or take the initiative and put on the pressure early. It is important to remember that your 
					main win condition does revolve around the Force of Nature + Savage Roar combo, so taking an aggressive stance, 
					whenever possible, is generally a good game plan.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/MidRangeDruidDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Demon Handlock Warlock</h3>
  					<h4>Difficulty: 7/10</h4>
  					<p>
					Handlock is the classic control variation of Warlock. Demon Handlock was the variation popularized in the last 
					few weeks before the release of The Grand Tournament, which took the premise of Handlock and applied the demon 
					synergy of Demonlock. Warlock is known for his numerous and extremely effective board clear spells, which can 
					completely reset the board, dashing the hopes of aggro players, and ruining carefully compiled late-game threats 
					from control decks. The addition of Voidcaller and demon synergy can give the Warlock game winning swing turns, 
					it also improves match-ups against aggro and tempo decks.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/DemonHandlockDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Tempo Mage</h3>
  					<h4>Difficulty: 5/10</h4>
  					<p>
					Tempo Mage utilizes spell synergy with Mana Wyrm, Sorcerers Apprentice, Arcane Missile, and Flamewaker to seize 
					tempo early and make it very difficult for your opponent to recover. Typically Tempo Mage closes out with burn 
					spells fairly quickly, thanks to recurring Mana Wyrm damage, but can sometimes curve into late game threats such 
					as Ragnaros, Rhonin, and Dr. Boom, with a Flamestrike or two. Tempo Mage has also evolved into a slightly more 
					consistent deck since The Grand Tournament was released. Cards such as Nexus-Champion Saraad, Spellslinger, and 
					Effigy all add a lot to the deck, providing more consistency with the spell synergetic deck.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/TempoMageDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Freeze Mage</h3>
  					<h4>Difficulty: 9/10</h4>
  					<p>
					Freeze Mage operates as the name suggest: by using every freeze spell in Jaina's book to stall out the game. Frost 
					Nova, Ice Barrier, Ice Block, Blizzard, each card contributes to holding a board of any size at bay while cycling 
					as many cards as possible to draw into Alexstrasza. Then Freeze Mage finishes off her opponents with burn spells. 
					Although this deck has been around for countless seasons, it has developed modern versions that drove a spike in 
					popularity recently. The arrival of Emperor Thaurissan with Blackrock Mountain made the deck more viable, but forced 
					a choice between Antonidas, Pyroblast, and/or Malygos.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/FreezeMageDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Control Warrior</h3>
  					<h4>Difficulty: 7/10</h4>
  					<p>
					Standard Control Warrior is the quintessential control deck that picks up value through weapon removal in the early 
					stages of the game. The Warrior uses low costing cards like Acolyte of Pain to cycle through his deck into big threats. 
					With a late game focused mana curve, paired with the Warrior's innate hero ability paired with cheap 1-mana removals 
					provide incredible sustainability. Entering into the late game, the Warrior aims to overwhelm his opponent with heavy 
					hitting late-game minions.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/ControlWarriorDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Dragon Priest</h3>
  					<h4>Difficulty: 6/10</h4>
  					<p>
					Dragon Priest is a deck that trys to exploit the dragon synergies in order to play out strong midrange minions on 
					curve. The dragon priest deck packs strong minions for every phase of the game. The gameplan of the deck is to play out 
					minions on curve and heal them in order to get the most value of of them, eventually saturating the opponent out of 
					answers. The power of the deck lies in the amount of value it can generate through the dragon package available in the 
					deck. The hero power of Priest suits the mid to late game approach of Dragon decks as well, making Priest one of the most 
					powerful Dragon deck. Strong plays from turn 1 to turn 9 is what makes Dragon Priest a strong deck and a heavy contender 
					in the meta.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/DragonPriestDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Mid-Range Hunter</h3>
  					<h4>Difficulty: 5/10</h4>
  					<p>
					Mid-Range Hunter aims to take control of the board with early game minions that are worth more than their mana cost 
					(Mad Scientist/Animal Companion). Past that point, you try and solidify your control of the board with Freezing Trap, Hunter's 
					Mark, and the removal spells: Quick Shot, and Kill Command. These early control tools allow you to curve into Savannah 
					Highmane and Dr. Boom with complete board control. The mid/late game threats in Houndmaster, Poloted Shredder, Savannah 
					Highmane, Loatheb, and Dr. Boom should be enough to win the game so long as you can solidify boad control. Houndmaster's 
					effect allows you to create value trades, race, or provide survival vs aggro. Aggro decks will be your weaker match-ups 
					as your control tools are a bit weaker. Knife Juggler + Unleash the Hounds can help take back the board against aggro decks, 
					gaining board control to take the game. TGT introduced King's Elekk and Ram Wrangler, which arguably adds a little extra power; 
					when their effects hit they can decide the game.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/MidRangeHunterDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Mech Mage</h3>
  					<h4>Difficulty: 5/10</h4>
  					<p>
					Mech Mage gains early tempo by pushing out low-cost mech synergy minions like Cogmaster, Mechwarper and the like. The traditional 
					Mech Mage lists will run a strong early curve with Mad Scientist + Mirror Entity synergy. If Tinkertown Technician and Goblin 
					Blastmage are activated (which is difficult not to activate with this much mech), it can add a lot of early game power. Class 
					cards like Frostbolt and Fireball provide reach that can deal with large threats, giving Mech Mage and extra turn or two to get 
					lethal. Current lists have been experimenting with removing the Mad Scientist + Mirror Entity combo, as Patron Warrior has made it 
					ineffective in the meta.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/MechMageDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Face Hunter</h3>
  					<h4>Difficulty: 3/10</h4>
  					<p>
					Face Hunter is a deck built to win by completely optimizing their damage. Using efficient 1-drops, charge minions, inexpensive, and 
					reloadable weapons along with burn; Face Hunter finds itself often winning games by turn 7. While Face Hunter itself is not that 
					powerful, it is the synergies that make the deck much more than the sum of it's parts. Face Hunter historically struggles against 
					any particular strategy with lots of taunts and lifegain, while absolutely crushing other aggro decks. Face Hunter is one of the 
					few decks from before TGT that remains popular due solely to the fact that it is a low cost deck with fast games. It is very easy 
					for any player to pick up and get a lot of games in - it can be a stepping stone for new players looking to get in to Ranked Play.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/FaceHunterDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Oil  Rogue</h3>
  					<h4>Difficulty: 5/10</h4>
  					<p>
					Oil Rogue is a deck that gains tempo and establishes her board early by utilizing hero power and tools like Backstab, Si-7, and 
					Preparation. The addition of 1-2 copies of Tinker's Sharpsword Oil means that the Rogue can do more than cheaply clear any board 
					state, but Oil Rogue has the potential to threaten lethal if a minion is ever left on her board in the mid-game. Overall Oil Rogue 
					is an extremely flexible archetype, able to defeat a wide variety of decks. Cards like Edwin and Violet Teacher allow the Rogue 
					to grind out more value in certain match-ups, when necessary, while also being able to make great tempo plays against aggro decks.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/OilRogueDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			<br>
  			<div class="row">
  				<div class="col-sm-7">
  					<h3>Mech Shamen</h3>
  					<h4>Difficulty: 6/10</h4>
  					<p>
					With the League of Explorers exspansion, in particular Tunnel Trogg, comes an alternative aggressive shaman deck, aptly named 
					'Aggro Shaman'. Aggro Shaman is similar to Mech Shaman in that they both aim to curve lower than their opponent, drawing minions 
					first to push damage through a tempo lead and the burn spells second to finish. The Mech Shaman opperates with a Mech Shell aiming 
					to abuse Whirling Zapomatic and Powermace, which results in being generally slower than Aggro Shaman but more effective against 
					Midrange Decks due to powermaces ability to control the board. Aggro Shaman is the faster variant opting for Leper Gnomes and charge 
					minons aiming to end the game before their minons lack of value begins to matter.
					</p>
  				</div>
  				<div class="col-sm-5">
  					<img src="resources/MechShamenDeck.jpg" class="img-responsive" alt="image">
  				</div>
  			</div>
  			
  			<hr>
		</section>
	</div><!-- End Container -->

<!-- FAQ -->

    <div class="container" id="faq">
    <br>
      <section>
        <div class="page-header">
          <h2>FAQ<small> Frequently Asked Questions </small></h2>
        </div><!-- End Page Header -->

        <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title">
                <a href="#collapse-1" data-toggle="collapse" data-parent="#accordion">
                  What is Hearthstone?
                </a>
              </div><!-- End panel title -->
              <div id="collapse-1" class="panel-collapse collapse in">
                <div class="panel-body">
                  Hearthstone is a free-to-play digital strategy card game where players choose nine epic Warcraft heroes to play as, 
                  then take turns playing cards from their customized decks to crush their opponent.
				  This game has evolved competitively thus forming meta-decks. Meta-decks are decks that use the most efficient tactic available. 
                </div>
              </div><!-- End Panel collapse -->
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title">
                <a href="#collapse-2" data-toggle="collapse" data-parent="#accordion">
                  What is a Hearthstone Tech?
                </a>
              </div><!-- End panel title -->
              <div id="collapse-2" class="panel-collapse collapse">
                <div class="panel-body">
                A Hearthstone Tech is when a player modifies an existing meta-deck in order to allow it combat different decks better by changing 
                cards in the deck. An example can be seen in the freeze mage deck by replacing the card “Pyroblast” with another card “Explosive Sheep”, 
                which allows freeze mage to deal with the aggressive decks better.             
				</div>
              </div><!-- End Panel collapse -->
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title">
                <a href="#collapse-3" data-toggle="collapse" data-parent="#accordion">
                  How does Hearthstone Techpedia work?
                </a>
              </div><!-- End panel title -->
              <div id="collapse-3" class="panel-collapse collapse">
                <div class="panel-body">
				Hearthstone Tech is a website that will help you climb over barrier of entry that exist within the game. Like all card games, there exist 
				some cards that are just plain better than others. Hearthstone Tech will guide you up the Ranked Ladder which in turn will get you more 
				golden cards at the end of the season which can be disenchanted into tons of dust which allows you to craft better cards!
				</div>
              </div><!-- End Panel collapse -->
            </div>
          </div>
        </div><!-- End panel group -->

      </section>
    </div><!-- End container -->


<!-- About Us -->

  <div class="container" id="about">
  <br>
    <section>
      <div class="page-header">
          <h2>About<small>  </small></h2>
        </div><!-- End Page Header -->

        <div>
            <p>Send us a message, or contact us at <a href="mailto:hstechpedia@gmail.com">hstechpedia@gmail.com</a>
			</p>
          
        </div><!-- End the row -->

    </section>
  </div>

<!-- Footer -->

    <footer>
      <hr>
        <div class="container text-center">
		<A HREF="http://us.battle.net/hearthstone/en/" onMouseOver="window.status='Hearthstone'; return true">
		<IMG SRC="resources/banner.png" BORDER="0" ALT="Hearthstone"></A>
  			
        <hr>
        <ul class="list-inline">
          <li><a href="Main.jsp">Back to Top</a></li>
        </ul>

        <p>&copy; Created by Jonathan Yang and Nathan del Carmen - 2015</p>

      </div><!-- end Container-->
      

    </footer>

	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>	
</html>
<style>
th {
text-align: center;
}
</style>