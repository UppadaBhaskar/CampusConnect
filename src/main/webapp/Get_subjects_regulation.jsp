not important servlet
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, java.util.List, test.Get_subjects_regulation" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject and Regulation Dropdowns</title>
</head>
<body>
    <h2>Select Subject and Regulation</h2>
    
    <form action="ProcessSelectionServlet" method="post">
        <label for="subject">Select Subject:</label>
        <select name="subject" id="subject">
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
        
        <label for="regulation">Select Regulation:</label>
        <select name="regulation" id="regulation">
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
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
