<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Marks Added</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            margin: 0;
            padding: 0;
            zoom:150%;
        }

        h2 {
            color: #007bff;
            margin-top: 50px;
        }

        a, button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        a:hover, button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Marks Added Successfully</h2>
    <a href="Score_board1.jsp">Add More Marks</a> 
	<button
            onclick="window.location.href = 'display_marks.jsp';"
        >
            View Marks
        </button>
</body>
</html>
