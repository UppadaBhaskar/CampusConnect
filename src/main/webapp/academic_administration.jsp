<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title><link rel="stylesheet" href="roll_ex1.css"  />
<style>
body{
zoom:155%;
}
a{
        color:#4F4F4F;
        text-decoration:none;
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
  }</style>
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
<div class="cards">
  <div class="card">
        <img src="assets/student.jpg" alt="Image">
        <div class="card-text">
         <a href="add_student.jsp">Add Student</a> 
        </div>
      </div>

  <div class="card">
        <img src="assets/student.jpg" alt="Image">
        <div class="card-text">
<a href="add_department.jsp">Add Department</a>        </div>
      </div>
    
      <div class="card">
        <img src="assets/student.jpg" alt="Image">
        <div class="card-text">
<a href="add_Regulation.jsp">Add Regulation</a>
        </div>
      </div>
      
       <div class="card">
        <img src="assets/student.jpg" alt="Image">
        <div class="card-text">
<a href="add_subjects.jsp">Add Subjects</a>
        </div>
      </div>
      </div>





</body>
</html>