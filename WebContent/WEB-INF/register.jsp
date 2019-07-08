<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register Page</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <script type="text/javascript">
  	function registerValidate()
  	{
  		var userName = document.forms["RegisterForm"]["userName"];
  		var password = document.forms["RegisterForm"]["password"];
  		var name = document.forms["RegisterForm"]["name"];
  		var phNo = document.forms["RegisterForm"]["phNo"];
  		var emailId = document.forms["RegisterForm"]["emailId"];
  		 
  		
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
  		
  		if (name.value == "")                                  
  	    { 
  	        window.alert("Please enter profile name"); 
  	        name.focus(); 
  	        return false; 
  	    } 
  		
  		var numbers = /^[0-9]+$/;
  		var phNo_len = phNo.value.length;
  		if(phNo.value.match(numbers) && phNo_len == 10)
  		{
  			return true;
  		}
  		else
  		{
  			alert("Phone number must have 10 numeric characters");
  			phNo.reset();
  			phNo.focus();
  			return false;
  		}
  		  		
  		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  		if(emailId.value.match(mailformat))
  		{
  			return true;
  		}
  		else
  		{
  			alert("You have entered an invalid email address!");
  			emailId.focus();
  			return false;
  		}
  	}
  
  </script>

  <style>
  @import "font-awesome.min.css";
@import "font-awesome-ie7.min.css";
/* Space out content a bit */
body {
  padding-top: 20px;
  padding-bottom: 20px;
}

/* Everything but the jumbotron gets side spacing for mobile first views */
.header,
.marketing,
.footer {
  padding-right: 15px;
  padding-left: 15px;
}

/* Custom page header */
.header {
  border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
  padding-bottom: 19px;
  margin-top: 0;
  margin-bottom: 0;
  line-height: 40px;
}

/* Custom page footer */
.footer {
  padding-top: 19px;
  color: #777;
  border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: 730px;
  }
}
.container-narrow > hr {
  margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
  text-align: center;
  border-bottom: 1px solid #e5e5e5;
}
.jumbotron .btn {
  padding: 14px 24px;
  font-size: 21px;
}

/* Supporting marketing content */
.marketing {
  margin: 40px 0;
}
.marketing p + h4 {
  margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
  /* Remove the padding we set earlier */
  .header,
  .marketing,
  .footer {
    padding-right: 0;
    padding-left: 0;
  }
  /* Space out the masthead */
  .header {
    margin-bottom: 30px;
  }
  /* Remove the bottom border on the jumbotron for visual effect */
  .jumbotron {
    border-bottom: 0;
  }
}
  </style>
  
 
</head>
<body>
	<div class="container">
    <h1 class="well">Registration Form</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form action="RegisterServlet" method="post" name="RegisterForm" onsubmit="return registerValidate()">
					<div class="col-sm-12">
						
							<div class="form-group">
								<label>Username</label>
								<input name="userName" type="text" placeholder="Enter Username" class="form-control">
							</div>
							<div class="form-group">
								<label>Profile Name</label>
								<input name="name" type="text" placeholder="Enter Profile Name" class="form-control">
							</div>
							<div class="form-group">
								<label>Phone Number</label>
								<input name="phNo" type="text" placeholder="Enter Phone Number" class="form-control">
							</div>		
							<div class="form-group">
								<label>Email Address</label>
								<input name="emailId" type="text" placeholder="Enter Email Address" class="form-control">
							</div>
							<div class="form-group">
								<label>Password</label>
								<input name="password" type="password" placeholder="Enter the Password" class="form-control">
							</div>				
							
							<div class="row" align="center">
							<div class="col-sm-6 form-group">					
								<button type="submit" class="btn btn-lg btn-info">Register</button>		
							</div>
							<div class="col-sm-6 form-group">					
								<button type="reset" class="btn btn-lg btn-info" value="Reset">Reset</button>		
							</div>
							</div>
							<div class="form-group" align="center">					
								Already have an account? <a href="LoginServlet" class="btn btn-lg btn-info">Login</a>		
							</div>						
				</form> 
				</div>
	</div>
	</div>
	
</body>
</html>