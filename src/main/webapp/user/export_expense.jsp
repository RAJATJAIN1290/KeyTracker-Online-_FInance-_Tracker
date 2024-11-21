<%@ page import="com.entity.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Export Expenses</title>
    <!-- Include Bootstrap for better styling -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 10px;
            padding: 20px;
        }
        .btn-export {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .btn-export:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        .export-msg {
            margin-top: 20px;
            font-size: 18px;
            color: #155724;
            background-color: #d4edda;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h3 class="text-center mb-4">Export Your Expenses</h3>
            <% 
                HttpSession usession = request.getSession();
                User user = (User) usession.getAttribute("loginUser");
                if (user != null) {
                    int userId = user.getId();  // Assuming user object has an ID attribute
            %>
            <form action="../ExportCSVServlet" method="get" class="text-center">
                <input type="hidden" name="userId" value="<%= userId %>"> <!-- Pass userId as a hidden input -->
                <button type="submit" class="btn-export">
                    <i class="fas fa-download"></i> Export to CSV
                </button>
            </form>
            <% 
                // Check if export was successful and show message
                String exportMessage = (String) usession.getAttribute("exportMessage");
                if (exportMessage != null) {
            %>
            <div class="export-msg text-center">
                <%= exportMessage %>
            </div>
            <% 
                    usession.removeAttribute("exportMessage"); // Clear the message after displaying
                }
            %>
            <% 
                } else {
                    out.println("<p class='text-center text-danger'>Please log in to export expenses.</p>");
                }
            %>
        </div>
    </div>

    <!-- Include Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
