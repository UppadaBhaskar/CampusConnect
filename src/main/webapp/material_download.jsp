<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, test.Get_subjects_regulation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Material List</title>
<link rel="stylesheet" href="material_download.css"  />
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
        h2 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }
        form {
            max-width: 600px;
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
        select, input[type="text"] {
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
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        h3 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
            list-style:none;
  			display:flex;
  			flex-wrap: wrap;
  			gap:50px;
  			
  			width:70%;
  			margin:auto;
  			justify-content:center;

  			

  			
        }
       
        
        
        
        
        .cards{
    display:flex;
    gap:10px;
    flex-wrap: wrap;
    justify-content: center;
    

}
        
        .card {
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: rgb(59, 112, 131);
    margin-left:0;
    margin-top:30px;
  }
  .card img {
    width: 100%;
    height: auto;
    display: block;
  }
  .card-text {
    text-align: center;
    padding: 10px;
    background-color: #f0f0f0;
  }
  .card-text a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    font-size:25px;
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
    
    <form action="material_list" method="post">
    <h2>Materials</h2>
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
        <select name="Subject" id="parameter6" >
        
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

        <label for="material_name">Material Name:</label>
        <input type="text" id="material_name" name="material_name" ><br><br>

        <input type="submit" value="Filter">
    </form>
<% 
if(request.getAttribute("msg")!=null){%>
<h3>No files founded...</h3>
<%} else{%>


    <%-- Display the list of materials --%>
    <% List<String> materials = (List<String>) request.getAttribute("list");
    List<String> material_names = (List<String>) request.getAttribute("material_names");
       if (materials != null && !materials.isEmpty()) { %>
        
        <ul>
        
            <% for(int i=0;i<materials.size();i++) { %>
            
           <li> <a href="FileDownloadServlet?fileName=<%= materials.get(i) %>">
           <div  class="card">
    <img src="assets/academic.png" alt="Image">   
    <div   class="card-text">
      <a href="FileDownloadServlet?fileName=<%= materials.get(i) %>"><%= material_names.get(i) %></a>
    </div>
  </div></a></li>
            
            
            <% } %>
            
        </ul>
        
    <% }  }%>
</body>
</html>
