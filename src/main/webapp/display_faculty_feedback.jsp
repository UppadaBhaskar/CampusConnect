<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, test.Get_subjects_regulation" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>feedback</title>
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
            background-color: white;
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
            font-weight:bold;
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
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
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
    
    <form action="display_faculty_feedback" method="POST">
    <h2>FILTER</h2>
    
    
        
      <label for="parameter1">faculty:</label>
        <select name="faculty" id="parameter1" required>
        	<option class="select-placeholder" value="" disabled selected>Select</option>
            <%
                List<String> faculty = Get_subjects_regulation.get_faculty_names();
                for (String f : faculty) {
            %>
            <option value="<%= f %>"><%= f %></option>
            <%
                }
            %>
        </select>
    
    
        
      <label for="parameter2">Regulation:</label>
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
        
      <label for="parameter3">Branch / Specialization :</label>
        <select name="Branch" id="parameter3" required>
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
        
        
       <label for="parameter4">Semester:</label>
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
        
        
        
        
        <input type="submit" value="Filter">
    </form>

      <%if(request.getAttribute("rowData")!=null){ %>
        
    <table>
        <tr>
        
            <th>Faculty Name</th>
            <th>Subject Knowledge</th>
            <th>Teaching Methodology</th>
            <th>Clarity of Explanation</th>
            <th>Accessibility and Approachability</th>
            <th>Feedback and Assessment</th>
            <th>Use of Resources</th>
            <th>Encouragement of Critical Thinking</th>
            <th>Engagement with Current Research and Trends</th>
            <th>Respect for Diversity and Inclusivity</th>
            <th>Professionalism and Ethical Conduct</th>
            <th>Feedback</th>
            
        </tr>
        <% 
            Map<String, List<Object>> rowData = (Map<String, List<Object>>) request.getAttribute("rowData");
            for (Map.Entry<String, List<Object>> entry : rowData.entrySet()) {
                List<Object> values = entry.getValue();
        %>
        <tr>
        	<td><%=values.get(1) %></td>
            <% for (int i=3;i<13;i++) { %>
            <td><%= values.get(i) %></td>
            <% } %>
            <td><%= values.get(2)%></td>
        </tr>
        <% } %>
    </table>
    <% } %>
    
</body>
</html>
