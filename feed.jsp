<%-- 
    Document   : feed.jsp
    Created on : Oct 30, 2018, 9:49:17 PM
    Author     : kamma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
            String firstname=request.getParameter("firstname");
            String email=request.getParameter("email");
            String address=request.getParameter("message");
            
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/vishwa","root","root");
       
                PreparedStatement ps = con.prepareStatement("insert into feedback values(?,?,?)");
                
                ps.setString(1,firstname);
                ps.setString(2,email);
                ps.setString(3,address);
                
                
               ps.executeUpdate();
               response.sendRedirect("sample.html");
              
                /*if(rs.next())
                    response.sendRedirect("homepage.html");
                else
                    response.sendRedirect("errorpage.html");*/
                con.close();
                %>
    </body>
</html>
