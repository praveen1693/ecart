<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  	function loginValidate()
  	{
  		var userName = document.forms["loginForm"]["userName"];
  		var password = document.forms["loginForm"]["password"];
  		
  		if (userName.value == "")                                  
  	    { 
  	        window.alert("Please enter your name."); 
  	        userName.focus(); 
  	        return false; 
  	    } 
  		
  		if (password.value == "")                        
  	    { 
  	        window.alert("Please enter your password"); 
  	        password.focus(); 
  	        return false; 
  	    } 
  	}
  </script>
  
  <style>
  .modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
  </style>
</head>
<body>
	<div class="container">
   
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
           <a href="index.html"  class="close" data-dismiss="modal">&times;</a>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form name="loginForm" onsubmit="return loginValidate()" role="form" action="LoginServlet" method="post">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" name="userName" placeholder="Enter username">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="password" placeholder="Enter password">
            </div>         
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
               <div class="form-group">
              
              </div>
          </form>
        </div>
        <div class="modal-footer">
            <p>Not a member? <a href="RegisterServlet">Sign Up</a></p>
        </div>
      </div>
      
    </div>
 </div>
</body>
</html>