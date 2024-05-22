<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="roll_ex1.css"  />
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            zoom:155%;
        }
        .txt{
        text-align:center;
        }
        p{
        text-align:center;}
        a{
        color:#4F4F4F;
        text-decoration:none;
        }
        h2{
        text-align:center;
        margin-top:50px;
        margin-bottom:5px;}
        
        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .message {
            margin-top: 20px;
            text-align: center;
            color: #4CAF50;
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
<p> Marks already uploaded. Please Update them.</p>
<h2>Update Marks</h2>
	<form action="Edit_marks" method="post">
	<label for="roll_number">Roll number</label>
	<input type="text" name="roll_number">
	
	<label for="mark">marks</label>
	<input type="text" name="mark">
	<input type="submit" value="Update">
	
	
		<input type="hidden" name="Examination_Type" value="<%= request.getAttribute("Examination_Type") %>">
        <input type="hidden" name="Regulation" value="<%= request.getAttribute("Regulation") %>">
        <input type="hidden" name="Year" value="<%= request.getAttribute("Year") %>">
        <input type="hidden" name="Semester" value="<%= request.getAttribute("Semester") %>">
        <input type="hidden" name="Branch" value="<%= request.getAttribute("Branch") %>">
        <input type="hidden" name="Subject" value="<%= request.getAttribute("Subject") %>">
	
	</form>
	
	<div class="txt">
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.println(message);
            }
        %>
    </div>
	


</body>
</html>