<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
 pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="roll_ex1.css"  />


<style>
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
    h2{
    text-align:center;
    font-size:30px;
    }

    .complaint {
    
        background-color: #fff;
        margin:auto;
        
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        gap:100px;
        margin-top:70px;
        
        width:80%;
    }

    .c1 {
    	text-align:center;
        margin-bottom: 10px;
        color:white;
        background-color:#5D7FFF;
        font-size:20px;
        
    }
    .c2{
    margin:30px 30px;
    
    	text-align:center;
        margin-bottom: 10px;
         font-size:20px;
        
        
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
<h2>COMPLAINT FEEDBOX</h2>

<%List<List<String>> complaints = (List<List<String>>) request.getAttribute("subjects");
                for (List<String> complaint : complaints) {%>
                	<div class="complaint">
                	<% 
                for(int i=0;i<complaint.size();i++){%>
                <% if(i==0){%>
             <div class= "c1">
           <%= complaint.get(i) %>
           </div>
           <% } %>
           
           
           <% if(i==1){%>
             <div class= "c2">
           <%= complaint.get(i) %>
           </div>
           <% } %>
           
           
               <% }%>
               
               </div>
               
               <% }%>
</body>
</html>