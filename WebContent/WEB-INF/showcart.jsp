<%@page import="com.ecart.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Cart</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" >
	
		function setData()
		{
			var grid = document.getElementById("cartTable");
	        var checkBoxes = grid.getElementsByTagName("INPUT");
	        var message = "";
	        for (var i = 0; i < checkBoxes.length; i++) {
	            if (checkBoxes[i].checked) {
	            	 var row = checkBoxes[i].parentNode.parentNode;
	                 message += row.cells[0].innerHTML;
	                 document.getElementById("hdnpid2").value += message;
	             }
	        }
		}
		
		function submitForm() {
			document.enter.submit();
		}
	
</script>
<style>
.navbar {
    padding-top: 15px;
    padding-bottom: 15px;
    border: 0;
    border-radius: 0;
    margin-bottom: 0;
    font-size: 12px;
    letter-spacing: 5px;
  }
  .navbar-nav  li a:hover {
    color: #1abc9c !important;
  }
  
  .button {
  background-color: #ddd;
  border: none;
  color: black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 16px;
}
</style>
</head>
<body>
		<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    	<a class="navbar-brand" href="#">Ecart</a>
    	
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="MenuServlet">Shop</a></li>
        <li><a href="OrderServlet">My Orders</a></li>
        
      </ul>
    </div>
  </div>
</nav>
	<%
		List<Product> cart = (List<Product>) session.getAttribute("cart");
		String user = (String)session.getAttribute("USERNAME");
	%>
	<div align="center">
	<h4>Your Cart</h4><br/>
	
		
	
	<form name="cartform" action="ShowCart" method="post">
		<input type="hidden" name="hdnpid" id="hdnpid" value=""/>
	</form>
	
		<table id="cartTable" border="1" align="center" cellpadding="10" >
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>select</th>
				</tr>
			</thead>
	<%
		for(Product p : cart)
		{
	%>
		<tr>
			<td><%= p.getPid() %></td>
			<td><%= p.getPrice() %></td>
			<td><%= p.getQuantity() %></td>
			<td> <input type="checkbox" onclick="setData()"/> </td>
		</tr>
	
	<%
		}
	%>
		</table><br/>
		
	<form name="enter" action="ShowCart" method="post">
		<input type="hidden" name="hdnpid2" id="hdnpid2" value=""/>
		
		<button class="button" type="submit" onclick="submitForm()">Delete</button>
	</form>
		
		<%  String route;
			if(user==null)
			{
				route = "LoginServlet";
			}else
			{
				route = "OrderServlet";
			}
			%>
		<form action="<%=route%>" method = "post">
			
			<button class="button" type="submit">Purchase</button>
		</form>
		</div>
</body>
</html>