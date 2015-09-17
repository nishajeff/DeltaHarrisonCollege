<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>
<title>Student Transcript</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="./header.jsp"/>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<h4>Please pay $5 to receive your official transcript.</h4>
			<div align="center">
			<form action="Transcript" method="GET" > 
			<label >Credit Card Number: </label> 
 			<input  type="text" name="CardNum" required ><br> 
 			<input  type="hidden" name="type" value="official" ><br> 
 			<input type="submit" value="Pay" id="submit"> 
 			</form> 			
			</div>
${message1}
${message}
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Course Name</th>
							<th>Semester</th>
							<th>Grade</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="currentTranscript" items="${currentTranscript}">
							<tr>
								<td>${currentTranscript.HClass.HCourse.name}</td>
								<td>${currentTranscript.HClass.HSemester.season} ${currentTranscript.HClass.HSemester.year}</td>
								<td>${currentTranscript.grade}</td>							
								<td>${currentTranscript.status}</td>	
							</tr>
						</c:forEach>
							<tr>
								<td colspan="3" alight="right">Overall GPA = </td>
								<td>${gpa}</td>
							</tr>
					
					</tbody>
					

				</table>	
					
						


			
			</div>			
</body>
</html>