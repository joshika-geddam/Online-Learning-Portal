<%-- 
    Document   : check.jsp
    Created on : Oct 23, 2018, 8:39:12 AM
    Author     : Priyanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

 <%
  String fname=request.getParameter("First_Name");
  String lname=request.getParameter("Last_Name");
  String pass=request.getParameter("passw");
  String email=request.getParameter("Email_Id");
  String date1=request.getParameter("date");
  String addre=request.getParameter("Address");
  String pho=request.getParameter("Mobile_Number");
  String city=request.getParameter("City");
  String state=request.getParameter("State");
  String pin=request.getParameter("Pin_Code");
  String country=request.getParameter("Country");
  String gender[]=request.getParameterValues("Gender");
  String select[] = request. getParameterValues("u");

   
           try{

	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/vishwa", "root","root");
           Statement st=con.createStatement();
           
    
           for(int i=0; i < select.length ; i++)
           {          
               
               //phno, gender, address, city, state, pin, country, COURSES
                                                                                                                                                            //    phno, gender, address, city, state, pin, country, COURSES     
             st.executeUpdate(" insert into  student (fname, lname, pass, date1,email,phno, gender, address, city, state, pin, country, COURSES) values ('"+fname+"','"+lname+"','"+pass+"','"+date1+"','"+email+"','"+pho+"','"+gender[0]+"','"+addre+"','"+city+"','"+state+"','"+pin+"','"+country+"','"+select[i]+"')");
          
           
           }
           
           response.sendRedirect("loginpage.html");
           con.close();
}
    catch(Exception e){
    out.println(e);
}

%>