<%@page import="java.sql.*"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?useSSL=false", "root", "1234");
    Statement stm = con.createStatement();
    ResultSet rs = stm.executeQuery("SELECT * FROM login WHERE username='" + username + "' AND password='" + password + "'");
    
    if (rs.next()) {
        response.sendRedirect("hom1.html");
    } else {
        out.println("<html><b><center><h1>Invalid Username</h1></center></b></html>");
    }
    
    con.close();
} catch (Exception e) {
    out.println(e.getMessage());
}
%>
