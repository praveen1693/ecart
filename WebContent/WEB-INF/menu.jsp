<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">

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
  
  .row {
  margin: 10px -16px;
}

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
 
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
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
        <li><a href="ShowCart">Cart</a></li>
        <li><a href="OrderServlet">My Orders</a></li>
        
      </ul>
    </div>
  </div>
</nav>

<!-- Portfolio Gallery Grid -->
<div class="row">
  <div class="column nature">
    <div class="content" align="center">
      <img src="Pictures/poco-f1.png" alt="Poco" style="width:100%">
      <h4>Poco f1</h4>
      <p>&#8360;20000</p>
      <a href="CartServlet?pid=pocof1&price=20000" class="btn btn-default">Add to Cart</a>
    </div>
  </div>
  <div class="column nature">
    <div class="content" align="center">
    <img src="Pictures/lg-q7.jpg" alt="LG" style="width:100%">
      <h4>LG Q7</h4>
      <p>&#8360;15000</p>
      <a href="CartServlet?pid=lgq7&price=15000" class="btn btn-default">Add to Cart</a>
    </div>
  </div>
  <div class="column nature">
    <div class="content" align="center">
    <img src="Pictures/vivo-x20.jpg" alt="vivo" style="width:100%">
      <h4>Vivo X20</h4>
      <p>&#8360;18000</p>
      <a href="CartServlet?pid=vivox20&price=18000" class="btn btn-default">Add to Cart</a>
    </div>
  </div>
  
  <div class="column cars">
    <div class="content" align="center">
      <img src="Pictures/oneplus-6t.jpg" alt="oneplus" style="width:100%">
      <h4>Oneplus 6t</h4>
      <p>&#8360;28000</p>
      <a href="CartServlet?pid=oneplus6t&price=28000" class="btn btn-default">Add to Cart</a>
    </div>
  </div>
  <div class="column cars">
    <div class="content" align="center">
    <img src="Pictures/Samsung Galaxy A7.jpg" alt="Samsung" style="width:90%">
      <h4>Samsung Galaxy A7</h4>
      <p>&#8360;30000</p>
      <a href="CartServlet?pid=SamsungGA7&price=30000" class="btn btn-default">Add to Cart</a>
    </div>
  </div>
  <div class="column cars">
    <div class="content" align="center">
    <img src="Pictures/huawei-mate-20-pro.jpg" alt="huawei" style="width:100%">
      <h4>Huawei mate 20 Pro</h4>
      <p>&#8360;40000</p>
      <a href="CartServlet?pid=huaweim20pro&price=40000" class="btn btn-default">Add to Cart</a>
    </div>
  </div>
</body>
</html>