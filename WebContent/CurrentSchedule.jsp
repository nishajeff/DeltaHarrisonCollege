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

<title>Current Student Schedule</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="./header.jsp"/>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
			<c:if test="${user.isAdvisor()}">
				<div class="col-sm-8 col-sm-offset-2" style="padding:10px;">
					<h4>Please enter a Student Number to drop him/her from a class:</h4>
					<form  action="CurrentSchedule" method="GET">
					<label for="student">Student Number:</label> 
					<input type = "text" name="student" />										
					<br>					
					<button type="submit" value="submit" class="btn btn-default">Enter</button>
					</form>	
				</div>										
			</c:if>
			<div class="panel panel-primary col-sm-6 col-sm-offset-3">

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<td>Course Name</td>
							<td>Time</td>
							<td>Status</td>
							<td>Action</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="enrollment" items="${enrollments}">
							<tr>
								<td>${enrollment.HClass.HCourse.name}</td>
								<td>${enrollment.HClass.getClassSchedule()}</td>	
								<td>${enrollment.status}</td>		
								<c:choose>
								  <c:when test="${enrollment.status == 'Enrolled'}">
								    <td><a class="btn btn-success" href="Drop?enrollmentId=${enrollment.enrollmentId}&&student=${enrollment.HStudentDetail.studentNumber}">Drop</a></td>
								  </c:when>

								  <c:otherwise>
								   	<td> </td>
								  </c:otherwise>
								</c:choose>	
								
							</tr>
						</c:forEach>
					</tbody>
					

				</table>	
					
						


			
			</div>
			

</body>
</html>
