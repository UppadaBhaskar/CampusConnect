<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Input Marks</title>
    <link rel="stylesheet" href="roll_ex1.css"  />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            zoom: 150%;
            
        }
        a{
        color:#4F4F4F;
        text-decoration:none;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-top: 30px;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        h1 {
            color: red;
            text-align: center;
            margin-top: 30px;
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
    <h2>Input Marks</h2>
    <form action="marks_sub" method="post">
    
    
        <% try {
        	for (String rollNumber : (List<String>) request.getAttribute("rollNumbers")) { %>
            <label for="<%= rollNumber %>">Roll Number <%= rollNumber %>:</label>
            <input type="number" name="<%= rollNumber %>" id="<%= rollNumber %>" required><br>
        <% } }
        catch (NullPointerException e) {
    %>
    
    
    <br>
    <h1>No roll numbers available in database!</h1>
    <br>
    
    
    <%
    
    System.out.println("Caught NullPointerException: " + e.getMessage());
    e.printStackTrace();
}%>

		<input type="hidden" name="Examination_Type" value="<%= request.getAttribute("Examination_Type") %>">
        <input type="hidden" name="Regulation" value="<%= request.getAttribute("Regulation") %>">
        <input type="hidden" name="Year" value="<%= request.getAttribute("Year") %>">
        <input type="hidden" name="Semester" value="<%= request.getAttribute("Semester") %>">
        <input type="hidden" name="Branch" value="<%= request.getAttribute("Branch") %>">
        <input type="hidden" name="Subject" value="<%= request.getAttribute("Subject") %>">
        <input type="submit" value="Submit">
    </form>
</body>
</html>



