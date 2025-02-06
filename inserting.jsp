<%-- 
    Document   : inserting
    Created on : Oct 25, 2018, 7:26:59 PM
    Author     : Priyanka
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
 <%
        String papa=request.getParameter("papa");
        String pop=""+session.getAttribute("u");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/vishwa","root","root");
        Statement stm=con.createStatement();
   
        stm.executeUpdate("insert into passed (email,statuss) values('"+pop+"','"+papa+"')");
        
 
   %>
   
    </body>
</html>

