<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, test.Get_subjects_regulation" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Marks</title>
    <link rel="stylesheet" href="roll_ex1.css"  />
    
     
    
    <style>
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            zoom:155%;
        }a{
        color:#4F4F4F;
        text-decoration:none;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        select, input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .dynamic-content {
        margin:auto;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 15px;
        width:610px;
        display:flex;
        justify-content:space-between;
        
        .d1{
        width:140px;
        height:30px;
        border:2px solid grey;
        text-align:center;
        border-radius:8px;
        }
    }

    .dynamic-content p {
        margin: 0;
        padding: 8px 0;
    }
        
    .
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
   
    <form action="display_delay_report" method="POST">
    
     <h2>Delay Monitor</h2>
        
      
        
       <label for="parameter4">Duration</label>
        <select name="Duration" id="parameter4" required>
            <option class="select-placeholder" value="" disabled selected>Select</option>
            <option value="week">Last Week</option>
            <option value="month">Last Month</option>
           
        </select>
        
       <label for="parameter5">Roll Number</label>
	<input type="text" name="roll_number" required>   <br><br>     
        
        
        
        <input type="submit" value="Filter">
    </form>
    
    <%if(request.getAttribute("attended_count") != null || request.getAttribute("late_count") != null){ %>
   <div class="dynamic-content">
   <div class="d1">
    <% if(request.getAttribute("late_count") != null) { %>
        <p>Late: <%= request.getAttribute("late_count")%></p>
    <% } %></div>
    
     <div class="d1">
    
    <% if(request.getAttribute("attended_count") != null) { %>
        <p>Attendance: <%= request.getAttribute("attended_count")%></p>
    <% } %></div>
</div><%} %>

<%if(request.getAttribute("rowData")!=null){ %>
      
    <table>
        <tr>
            <% 
                List<String> columnNames = (List<String>) request.getAttribute("columnNames");
                for (String columnName : columnNames) {
            %>
            <th><%= columnName %></th>
            <% } %>
        </tr>
        <% 
            Map<String, List<Object>> rowData = (Map<String, List<Object>>) request.getAttribute("rowData");
            for (Map.Entry<String, List<Object>> entry : rowData.entrySet()) {
                List<Object> values = entry.getValue();
        %>
        <tr>
            <% for (Object value : values) { %>
            <td><%= value %></td>
            <% } %>
        </tr>
        <% } %>
    </table>
    <% }%>
</body>
</html>
