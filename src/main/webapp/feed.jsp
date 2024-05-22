<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, test.Get_subjects_regulation " %>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
        <title>Star rating demo</title>
        <link rel="stylesheet" href="jquery.rating.css">
        <script src="jquery.js"></script>
        <script src="jquery.rating.js"></script>
        <link rel="stylesheet" href="roll_ex1.css"  />
         <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
            zoom:150%;
        }a{
        color:#4F4F4F;
        text-decoration:none;
        }
        h2{margin-top:20px;
        text-align:center;
        
        }
        h3{
                text-align:center;
        
        }
        h5{
        text-align:center;
        font-weight:normal;}
        hr{
        width:300px;}
        
        

        form {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size:10px;
            
        }
        .stars {
            margin-bottom: 20px;
            text-align:center;
            input{
            width:30px;
            height:30px;
            }
        }

        .stars input[type="radio"] {
            
        }

        .stars input[type="radio"] + label {
            font-size: 24px;
            color: #ccc;
            cursor: pointer;
        }

        .stars input[type="radio"]:checked + label:before {
            content: "\2605";
            color: #ffc107;
        }

        select, input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
input[type="text"]{
margin-left:30px;
text-align:center;
border:2px solid grey;
width:90%;
margin-top:20px;
height:150px;
}
        

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size:20px;
            width:150px;
            margin:10px auto;
            margin-left:40%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
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
    <h2>Lecturer Feedback Form</h2>
    
    <%if(request.getAttribute("msg")!=null){ %>
    <%= request.getAttribute("msg")%>
    <%} %>
        <form action="feed" method="POST">
        
        <label for="parameter1">faculty name:</label>
        <select name="faculty" id="parameter1" required>
        	<option class="select-placeholder" value="" disabled selected>Select</option>
            <%
                List<String> faculty = Get_subjects_regulation.get_faculty_names();
                for (String element : faculty) {
            %>
            <option value="<%= element %>"><%= element %></option>
            <%
                }
            %>
        </select>
        <br><br>
        
    
        
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
        
        
        <label for="parameter3">Semester:</label>
        <select name="Semester" id="parameter3" required>
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
        <label for="parameter4">Branch / Specialization :</label>
        <select name="Branch" id="parameter4" required>
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
        
        <label for="parameter5">Subject:</label>
        <select name="Subject" id="parameter5" required>
        
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
        <h3>FEEDBACK</h3>
        
        <hr>
        <br>
        
        
        <h5>Subject Knowledge</h5>
        <div class="stars">
            <input type="radio" name="rating1" value="1" class="star">
            <input type="radio" name="rating1" value="2" class="star">
            <input type="radio" name="rating1" value="3" class="star">
            <input type="radio" name="rating1" value="4" class="star">
            <input type="radio" name="rating1" value="5" class="star"> </div>
        <h5>Teaching Methodology</h5>
        <div class="stars">
            <input type="radio" name="rating2" value="1" class="star">
            <input type="radio" name="rating2" value="2" class="star">
            <input type="radio" name="rating2" value="3" class="star">
            <input type="radio" name="rating2" value="4" class="star">
            <input type="radio" name="rating2" value="5" class="star"> </div>
        <h5>Clarity of Explanation</h5>
        <div class="stars">
            <input type="radio" name="rating3" value="1" class="star">
            <input type="radio" name="rating3" value="2" class="star">
            <input type="radio" name="rating3" value="3" class="star">
            <input type="radio" name="rating3" value="4" class="star">
            <input type="radio" name="rating3" value="5" class="star"> </div>
        <h5>Accessibility and Approachability</h5>
        <div class="stars">
            <input type="radio" name="rating4" value="1" class="star">
            <input type="radio" name="rating4" value="2" class="star">
            <input type="radio" name="rating4" value="3" class="star">
            <input type="radio" name="rating4" value="4" class="star">
            <input type="radio" name="rating4" value="5" class="star"> </div>
        
        <h5>Use of Resources</h5>
        <div class="stars">
            <input type="radio" name="rating5" value="1" class="star">
            <input type="radio" name="rating5" value="2" class="star">
            <input type="radio" name="rating5" value="3" class="star">
            <input type="radio" name="rating5" value="4" class="star">
            <input type="radio" name="rating5" value="5" class="star"> </div>
        <h5>Encouragement of skills</h5>
        <div class="stars">
            <input type="radio" name="rating6" value="1" class="star">
            <input type="radio" name="rating6" value="2" class="star">
            <input type="radio" name="rating6" value="3" class="star">
            <input type="radio" name="rating6" value="4" class="star">
            <input type="radio" name="rating6" value="5" class="star"> </div>
        <h5>Engagement with Students</h5>
        <div class="stars">
            <input type="radio" name="rating7" value="1" class="star">
            <input type="radio" name="rating7" value="2" class="star">
            <input type="radio" name="rating7" value="3" class="star">
            <input type="radio" name="rating7" value="4" class="star">
            <input type="radio" name="rating7" value="5" class="star"> </div>
        <h5>Respect for Diversity</h5>
        <div class="stars">
            <input type="radio" name="rating8" value="1" class="star">
            <input type="radio" name="rating8" value="2" class="star">
            <input type="radio" name="rating8" value="3" class="star">
            <input type="radio" name="rating8" value="4" class="star">
            <input type="radio" name="rating8" value="5" class="star"> </div>
        <h5>Professionalism</h5>
        <div class="stars">
            <input type="radio" name="rating9" value="1" class="star">
            <input type="radio" name="rating9" value="2" class="star">
            <input type="radio" name="rating9" value="3" class="star">
            <input type="radio" name="rating9" value="4" class="star">
            <input type="radio" name="rating9" value="5" class="star"> </div>
            <h5>Feedback and Assessment</h5>
        <div class="stars">
            <input type="radio" name="rating10" value="1" class="star">
            <input type="radio" name="rating10" value="2" class="star">
            <input type="radio" name="rating10" value="3" class="star">
            <input type="radio" name="rating10" value="4" class="star">
            <input type="radio" name="rating10" value="5" class="star"> </div>
	
         	<input type="text" placeHolder="Message..." name="feedback">
            
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>









