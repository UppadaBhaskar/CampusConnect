<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, test.Get_subjects_regulation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Student</title>
<link rel="stylesheet" href="roll_ex1.css"  />
    <style>
   body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
           
            display: flex;
            flex-direction: column;
            align-items: center;
            
            
            zoom:155%;
        }a{
        color:#4F4F4F;
        text-decoration:none;
        }
        .navbar{
        margin-top:0;}

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-top:70px;
        }

        h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            width: calc(100% - 10px);
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #f8d7da;
            color: #721c24;
            border-radius: 4px;
            border: 1px solid #f5c6cb;
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
    <form action="add_student" method="post">
    <h2>Add Student</h2>
        <label for="rollNumber">Roll Number:</label><br>
        <input type="text" id="rollNumber" name="rollNumber" required><br><br>
        
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="phoneNumber">Phone Number:</label><br>
        <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="parentNumber">Parent Number:</label><br>
        <input type="text" id="parentNumber" name="parentNumber"><br><br>
        
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address"><br><br>
        
        <label for="age">Age:</label><br>
        <input type="text" id="age" name="age"><br><br>
        
         <label for="department">Department:</label><br>
        <select name="department" id="department">
        <option class="select-placeholder" value="" disabled selected>Select</option>
            <%
                List<String> departments = Get_subjects_regulation.getDepartments();
                for (String department : departments) {
            %>
            <option value="<%= department %>"><%= department %></option>
            <%
                }
            %>
        </select>
        <br><br>
        
       
        <label for="regulation">Regulation:</label><br>
        <select name="regulation" id="regulation">
        <option class="select-placeholder" value="" disabled selected>Select</option>
            <%
                List<String> regulations = Get_subjects_regulation.getRegulationNames();
                for (String regulation : regulations) {
            %>
            <option value="<%= regulation %>"><%= regulation %></option>
            <%
                }
            %>
        </select>
        <br><br>
        
        <input type="submit" value="Submit">
    </form>
    <% if (request.getAttribute("message") != null) { %>
        <div><%= request.getAttribute("message") %></div>
    <% } %>
</body>
</html>
