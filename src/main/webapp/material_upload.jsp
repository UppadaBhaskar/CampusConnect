<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List, test.Get_subjects_regulation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>File Upload</title>
<link rel="stylesheet" href="material_upload.css"  />
 <style>
        body {
            font-family: Arial, sans-serif;  
            margin: 0;       
            padding: 0;
            background-color: white;
            zoom:150%;
        }
        a{
        color:#4F4F4F;
        text-decoration:none;
        }
        p{
        text-align:center;}
        h2{
        text-align:center;
        margin-bottom:40px;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
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
        select, input[type="text"], input[type="file"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        p {
            color: green;
        }
        p.error {
            color: red;
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

<form method="post" action="FileUploadServlet" enctype="multipart/form-data">
<h2>UPLOAD MATERIALS</h2>

<label for="parameter1">Branch / Specialization :</label>
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

<label for="parameter2">Subject:</label>
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
<label for="parameter3">Material Name</label>
<input type="text" name="material_name" />

<label for="parameter4">Upload File</label>
<input type="file" name="file" />

<input type="submit" value="Upload"/>
</form>

<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <p><%= msg %></p>
<%
    }
%>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color: red;"><%= error %></p>
<%
    }
%>

</body>
</html>




