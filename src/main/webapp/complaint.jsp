<!DOCTYPE html>
<html>
<head>
    <title>Complaint Form</title>
    <link rel="stylesheet" href="roll_ex1.css"  />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
            zoom:150%;
        }
        a{
        color:#4F4F4F;
        text-decoration:none;
        }
        .container {
            width: 50%;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            padding-bottom:70px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            text-align: center;
            color: #333;
        }
        
        form {
            width: 80%;
            margin: 0 auto;
        }
        
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        textarea {
            height: 150px;
        }
        
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top:20px;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .msg{
        text-align:center;
        }
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
    <div class="container">
        <h2>Complaint Form</h2>
        <form action="complaint" method="post">
            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required>
            
            <label for="complaint">Complaint:</label>
            <textarea id="complaintText" name="complaint" required></textarea>
            
            <input type="submit" value="Submit">
        </form>
    </div>
    <div class="msg">
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.println(message);
            }
        %>
    </div>
</body>
</html>