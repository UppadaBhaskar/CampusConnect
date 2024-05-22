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
    table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 8px;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            zoom:155%;
        }
        a{
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

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
	input[type="submit"]{
		width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid blue;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            color:white;
		background-color:#007BFF;}
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top:30px;
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
    <h2>Filter Marks</h2>
    <form action="display_marks" method="GET">
    
    
        
      <label for="parameter1">Regulation:</label>
        <select name="Regulation" id="parameter2" required>
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
        
      <label for="parameter2">Branch / Specialization :</label>
        <select name="Branch" id="parameter5" required>
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
        
        
       <label for="parameter3">Semester:</label>
        <select name="Semester" id="parameter4" required>
            <option class="select-placeholder" value="" disabled selected>Select</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="7">8</option>
        </select>
        
        
        <label for="parameter4">Examination Type:</label>
        <select name="Examination_Type" id="parameter1" required>
            <option class="select-placeholder" value="" disabled selected>Select</option>
            <option value="1">Weekly Examination</option>
            <option value="2">Mid Term Examination</option>
            <option value="3">Semester Examination</option>
            <!-- Add more options if needed -->
        </select>
        
        <input type="submit" value="Filter">
    </form>
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
            <td><%= value.toString() %></td>
            <% } %>
        </tr>
        <% } %>
    </table>
    <% }%>
</body>
</html>
