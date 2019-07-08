<%@page import="com.ecart.entity.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Order Page</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


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
        <li><a href="CartServlet">Cart</a></li>

      </ul>
    </div>
  </div>
</nav>

	<%
		String user = (String)session.getAttribute("USERNAME");
		List<Order> orders = (List<Order>) request.getAttribute("ORDERS");
		int i=1;
	%>
	<div align="center">
	<h1><%=user %>'s Order</h1><br/>
	
	<table border="1">
			<thead>
				<tr>
					<td>Sl no.</td>
					<td>Order ID</td>
					<td>Order Date</td>
					<td>Delivery Date</td>
					<td>Sub Total</td>
					<td>Tax</td>
					<td>Grand Total</td>
					<td>Status</td>
				</tr>
			</thead>
	<%
		for(Order o : orders)
		{
	%>
		<tr>
			<td><%= i%></td>
			<td><a href="OrderItemServlet?o=<%= o.getOrderId() %>"><%= o.getOrderId() %></a></td>
			<td><a href="OrderItemServlet?o=<%= o.getOrderDate() %>"><%= o.getOrderDate() %></a></td>
			<td><a href="OrderItemServlet?o=<%= o.getDlvDate() %>"><%= o.getDlvDate() %></a></td>
			<td><a href="OrderItemServlet?o=<%= o.getSubtotal() %>"><%= o.getSubtotal() %></a></td>
			<td><a href="OrderItemServlet?o=<%= o.getTax() %>"><%= o.getTax() %></a></td>
			<td><a href="OrderItemServlet?o=<%= o.getGrandtotal() %>"><%= o.getGrandtotal() %></a></td>
			<td><a href="OrderItemServlet?o=<%= o.getStatus() %>"><%= o.getStatus() %></a></td>
		</tr>
	
	<%
			i+=1;
		}
	%>
		</table><br/>

</div>

</body>
</html>