<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #80daeb;
            background-image:url(C:\Program Files\Apache Software Foundation\Tomcat 8.5\webapps\jasmine\back.jpeg);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 40px;
        }

        h2 {
            margin-top: 30px;
            color: #333;
        }

        p {
            color: #666;
            margin-bottom: 10px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color:#ffcff1;
            padding: 30px;
            margin-top: 40px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>About Destiny</h1>
        
        <%-- Retrieve the destiny name from the request parameter --%>
        <% String destiny = request.getParameter("destiny"); %>
        
        <%-- Database query to retrieve the row based on the destiny name --%>
        <% try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Create a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?useSSL=false", "root", "1234");
            
            // Prepare the SQL statement
            String sql = "SELECT * FROM lang WHERE destiny = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, destiny);
            
            // Execute the query
            ResultSet rs = pstmt.executeQuery();
            
            // Process the result set
            if (rs.next()) {
                // Retrieve the column values
                String username = rs.getString("username");
                String contact = rs.getString("contact");
                String feed = rs.getString("feed");
                
                // Display the retrieved data
                out.println("<h2>Name: " + username + "</h2>");
                out.println("<p>Contact: " + contact + "</p>");
                out.println("<p>About me: " + feed + "</p>");
                // ... Display other column values as needed
            } else {
                out.println("<p class='error-message'>No data found for the given destiny.</p>");
            }
            
            // Close the database connections
            rs.close();
            pstmt.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p class='error-message'>Error: " + e.getMessage() + "</p>");
        } %>
    </div>
</body>
</html>
