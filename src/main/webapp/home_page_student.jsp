<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="home_page1.css"  />
</head>
<style>
a{
text-decoration:none;
color:#484848;}</style>
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
    <li><a href="admin_login.jsp">Admin Login</a></li>

  </ul>
</div>

<div class="container">
<div class="cards">

<a href="display_delay_report.jsp">
<div class="card">
    <img src="assets/delay.png" alt="Image">
    <div class="card-text">
       <a href="display_delay_report.jsp">Delay Monitor</a> 
    </div>
  </div>
  </a>
  <a href="display_marks.jsp">
  <div class="card">
    <img src="assets/marks.png" alt="Image">
    <div class="card-text">
       <a href="display_marks.jsp">Score Board</a> 
    </div>
  </div>
  </a>
  <a href="material_download.jsp">
  <div class="card">
        <img src="assets/academic.png" alt="Image">
        <div class="card-text">
         <a href="material_download.jsp">Academic content</a> 
        </div>
      </div>
      </a>
  <a href="feed.jsp">
  <div class="card">
    <img src="assets/form.png" alt="Image">
    <div class="card-text">
       <a href="feed.jsp">Faculty Feedback</a> 
    </div>
  </div>
  </a>
  <a href="complaint.jsp">
   <div class="card">
    <img src="assets/complaint.png" alt="Image">
    <div class="card-text">
       <a href="complaint.jsp">complaint Box</a> 
    </div>
  </div>
  </a>
  <a href="FileDownloadServlet?fileName=hand_book.pdf">
  <div class="card">
    <img src="assets/student.jpg" alt="Image">
    <div class="card-text">
       <a href="FileDownloadServlet?fileName=hand_book.pdf">Student hand Book </a>
 
    </div>
  </div>
</a>

     
</div>


</div>



<div class="foot">
  <hr class="f1">
  <div class="top-footer">
    <ul>
      <li><a>Events</a></li>
      <li><a>Organizations</a></li>
      <li><a>Festivals</a></li>
    </ul>
</div>

<div class="bottom-footer">
  <p>Copyright Š 2024 Campus Connect</p>
</div>



</div>
    
</body>

</html>
