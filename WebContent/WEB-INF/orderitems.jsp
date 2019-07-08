<%@page import="com.ecart.entity.OrderItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Items Page</title>

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
		String user = (String)session.getAttribute("USERNAME");
		List<OrderItem> orders = (List<OrderItem>) session.getAttribute("orderitemslist");
		int i =0;
	%>
	<div align="center">
<h1><%=user %>'s previous Order</h1><br/>

<table border="1">
			<thead>
				<tr>
					<td>Sl no.</td>
					<td>Order ID</td>
					<td>Product ID</td>
					<td>Quantity</td>
					<td>Sub total</td>
					
				</tr>
			</thead>
	<%
		for(OrderItem o : orders)
		{
	%>
		<tr>
			<td><%= i%></td>
			<td><%=o.getOrderId() %></td>
			<td><%=o.getProductId() %></td>
			<td><%=o.getQuantity() %></td>
			<td><%=o.getSubtotal() %></td>
			
		</tr>
	
	<%
			i+=1;
		}
	%>
		</table><br/>
</div>

</body>
</html>