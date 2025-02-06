<%-- 
    Document   : login.jsp
    Created on : Oct 23, 2018, 9:35:44 AM
    Author     : Priyanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
  String fname=request.getParameter("u");
  String pass=request.getParameter("p");
  session.setAttribute("u",fname);
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost/vishwa","root","root");
  PreparedStatement ps=con.prepareStatement("select * from student where fname=? and pass=?");
  ps.setString(1, fname);
  ps.setString(2, pass);
  ResultSet rs=ps.executeQuery();
  if(rs.next())
    response.sendRedirect("sample.html");
  else
  response.sendRedirect("errorpage.html");
  %>
  
  