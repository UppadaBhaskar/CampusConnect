<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, test.Get_subjects_regulation" %>

<!DOCTYPE html>
<html lang="en-GB">
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
        }a{text-decoration:none;
        color:#4D4D4D;
        }

        h2 {
            text-align: center;
            font-size:20px;
            margin-bottom:40px;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: 500;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select, input[type="submit"], button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"], button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #45a049;
        }
        .select-placeholder {
            color: #999; 
        }
    </style>
    <link rel="stylesheet" href="nav_css.css"  />
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
    
    <form action="Check_for_column_availability" method="POST">
    <h2>MARKS UPLOAD</h2>
        <label for="parameter1">Examination Type:</label>
        <select name="Examination_Type" id="parameter1" required>
            <option class="select-placeholder" value="" disabled selected>Select</option>
            <option value="1">Weekly Examination</option>
            <option value="2">Mid Term Examination</option>
            <option value="3">Semester Examination</option>
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
        <br><br>
        
        <label for="parameter3">Year:</label>
        <select name="Year" id="parameter3" required>
            <option class="select-placeholder" value="" disabled selected>Select</option>
            <option value="1">I</option>
            <option value="2">II</option>
            <option value="3">III</option>
            <option value="4">IV</option>
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
        <label for="parameter5">Branch / Specialization :</label>
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
        <br><br>
        
        <label for="parameter6">Subject:</label>
        <select name="Subject" id="parameter6" required>
        
        <option class="select-placeholder" value="" disabled selected>Select</option>
            <%
                List<String> subjects = Get_subjects_regulation.getSubjectNames();
                for (String subject : subjects) {
            %>
            <option value="<%= subject %>"><%= subject %></option>
            <%
                }
            %>
        </select>
        <br><br>
        
        <input type="submit" value="Add">
        <button
            
            onclick=
"window.location.href = 'display_marks.jsp';"
        >
            View Marks
        </button>
    </form>
     
</body>
</html>
