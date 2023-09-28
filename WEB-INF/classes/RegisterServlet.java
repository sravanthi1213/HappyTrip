import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class RegisterServlet extends HttpServlet{
  public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
	res.setContentType("text/html");
 	PrintWriter out = res.getWriter();
	String username = req.getParameter("username");
       String email = req.getParameter("email");
        String contact = req.getParameter("contact");
         String destiny = req.getParameter("destiny");
	String feed = req.getParameter("feed");
	try{
	 Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?useSSL=false&allowPublicKeyRetrieval=true", "root", "1234");

         String q = "insert into lang(username,email,contact,destiny,feed) values (?,?,?,?,?)";
	 PreparedStatement stm = con.prepareStatement(q);
	 stm.setString(1,username);
       stm.setString(2,email);
       stm.setString(3,contact);
       stm.setString(4,destiny);
	 stm.setString(5,feed);

         int x = stm.executeUpdate();
	 System.out.println("Feedback Updated Successfully..."+x);
	 if(x>0){
 	   res.sendRedirect("hom2.html");
	 }
	 else{
	  out.println("<html>Feedback Not Submitted!</html>");
	 }
       con.close();
	 }catch(Exception e){System.out.println(e.getMessage());}
	}
       } 