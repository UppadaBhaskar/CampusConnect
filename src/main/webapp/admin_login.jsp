<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="roll_ex1.css"  />
        
    
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            
            justify-content: center;
            
            height: 100vh;
            zoom:155%;
            
        }a{
        color:#4F4F4F;
        text-decoration:none;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            max-width: 80%;
            margin:auto;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #007bff;
            margin-bottom: 20px;
        }

        a:hover {
            color: #0056b3;
        }

        .message {
            text-align: center;
            color: #721c24;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 4px;
            margin-top: 20px;
        }
        .foot{
        display:flex;
justify-content:space-between;        }
    </style>
    
</head>
<body>  
<hr class="f">
  
<div  class="navbar">
  
  <div class="middle_nav">
    <img class="logo" src="assets/logo.png"/>

    <div class="cc"> Campus Connect</div>
     
 </div>
 

     
  <ul>

    <li><a href="home_page_admin.jsp">Home Page</a></li>
    <li><a href="about_us.jsp">About us</a></li>
    <li><a href="contact.jsp">Contact</a></li>
   

  </ul>
</div>

<%if(request.getAttribute("msg")!=null){ %>
    <%= request.getAttribute("msg")%>
    <%} %>

    <h2>Login</h2>
    <form action="admin_login" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
        <div class="foot"><a href="forgotPassword.jsp">Forgot Password?</a><a href="admin_register.jsp">Sign Up</a>
    </div>
   
    </form>
    
    
    <%if(request.getAttribute("msg1")!=null){ %>
    <%= request.getAttribute("msg1")%>
    <%} %>
</body>
</html>
