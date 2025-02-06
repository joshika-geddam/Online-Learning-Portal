<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<style>
div#test{ border:#000 1px solid; padding:10px 40px 40px 40px; }
</style>
<script>
  

    // Get todays date and time
   
    // Find the distance between now and the count down date
   
var pos = 0, test, test_status, question, choice, choices, chA, chB, chC,chD, correct = 0;
var questions = [
    [ "	What are the types of linkages?","Internal and External",
       "External, Internal and None",
       "	External and None",
       "	Internal", "B" ],
	[ "	Which of the following special symbol allowed in a variable name?","* (asterisk)",
	"| (pipeline)",
"	- (hyphen)",
"	_ (underscore)",
, "D" ],
	[ "How would you round off a value from 1.66 to 2.0?", "ceil(1.66)",
"floor(1.66)",
"	roundup(1.66)",
"	roundto(1.66)", "A" ],
	[ "	By default a real number is treated as a?", "float", "double", "long","far double", "B" ],
        ["Is the following statement a declaration or definition extern int i;?","declaration","definition","function","error","A"],
        ["When we mention the prototype of a function?","defining","declaring","prototyping","calling","b"],
        ["	If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?",".","&","*","->","D"],
        ["The operator used to get value at address stored in a pointer variable is?",

	"*",
	"&",
	"&&",
	"||","A"],
    ["who is the father of c language?","strousstrup","gosling","dennis ritchie","codd","C"],
    ["c was primarily developed as?","system programming language","data processinglanguage","general purpose","none","A"],
  
];
function _(x){
	return document.getElementById(x);
}
function renderQuestion(){
	test = _("test");
	if(pos >= questions.length){
		
		test.innerHTML = "<h2>You got "+correct+" of "+questions.length+" questions correct</h2>";
		_("test_status").innerHTML = "Test Completed";
		if(correct>=questions.length/2)
                      {
			test.innerHTML="<h2>Congratulations you have been successfully passed ur examination and your certificate will be sent to your mail within 3-4 days</h2>";
                         <%
                                String papa="passed";
                                String pop=""+session.getAttribute("u");
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/vishwa","root","root");
                                Statement stm=con.createStatement();

                                stm.executeUpdate("insert into passed (fname,statuss) values('"+pop+"','"+papa+"')");

                                
                        %>
   
                      }
		else
			test.innerHTML="<h2>Sorry!!!Not Passed please prepare the courses again and reattempt the exam</h2>";
                       <%
                                String papo="NOt passed";
                                String pop0=""+session.getAttribute("u");
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/vishwa","root","root");
                                Statement stmt=conn.createStatement();

                                stm.executeUpdate("insert into passed (fname,statuss) values('"+pop+"','"+papa+"')");

                                con.close();
                        %>
		pos = 0;
		correct = 0;
		return false;
	}
	_("test_status").innerHTML = "Question "+(pos+1)+" of "+questions.length;
	question = questions[pos][0];
	chA = questions[pos][1];
	chB = questions[pos][2];
	chC = questions[pos][3];
	chD = questions[pos][4];
	test.innerHTML = "<h3>"+question+"</h3>";
	test.innerHTML += "<input type='radio' name='choices' value='A'> "+chA+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='B'> "+chB+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='C'> "+chC+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='D'> "+chD+"<br><br>";
	test.innerHTML += "<button onclick='checkAnswer()'>Submit Answer</button>";
}
function checkAnswer(){
	choices = document.getElementsByName("choices");
	for(var i=0; i<choices.length; i++){
		if(choices[i].checked){
                    
			choice = choices[i].value;
		}
	}
	if(choice == questions[pos][5]){
		correct++;
	}
	pos++;
	renderQuestion();
}
window.addEventListener("load", renderQuestion, false);

</script>
</head>
<body>
<h2 id="test_status"></h2>
<div id="test"></div>
</body>

</html>