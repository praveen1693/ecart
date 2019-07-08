<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ecart.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Neworder Page</title>
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

	<%	DateFormat df =new SimpleDateFormat("dd/MM/yyyy");
		String user = (String)session.getAttribute("USERNAME");
		List<Product> cart = (List<Product>) session.getAttribute("CART");
		int orderid = (int)request.getAttribute("ORDERID");
		float subtotal = (float)request.getAttribute("SUBTOTAL");
		String orderDate = df.format(request.getAttribute("ORDERDATE"));
		String dlvDate = df.format(request.getAttribute("DLVDATE"));
		float tax = (float)request.getAttribute("TAX");
		float grandtotal = (float)request.getAttribute("GRANDTOTAL");
	%>
	<div align="center">
	<h3><%=user %>'s Order</h3><br/>
	
	<b>Order ID = <%=orderid %></b>
		
	
		<table border="1" cellpadding="10" >
			<thead>
				<tr>
					<td>Product ID</td>
					<td>Price</td>
					<td>Quantity</td>
					<td>Sub total</td>
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
			<td><%= p.getQuantity()*Integer.parseInt(p.getPrice()) %>
		</tr>
	
	<%
		}
	%>
		</table><br/>
		<br/>
		<b>Total = <%=subtotal %></b><br>
		<b>Tax = <%=tax %></b><br>
		<h2>Grand Total = <%=grandtotal %></h2><br>
		<b>Order Date = <%=orderDate %></b><br>
		<b>Delivery Date = <%= dlvDate %></b>
		</div>
</body>
</html>