<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<c:forEach var="user" items="${allUsers}"><c:if test="${user_id == user.id }"><h2 class="text-center"> Hello <c:out value="${user.name}" /> here are some CyberPsyco name suggestions</h2></c:if> 
						</c:forEach>
						<div class="card-body">
							<a class="btn btn-primary" href="/">DashBoard</a> 
							<a class="btn btn-secondary" href="/logout">Logout</a>							
							<table class="table table-dark">
							<h1>Cyber Punk</h1>
								<thead>
									<th>Name</th>
									<th>Gender</th>
									<th>Origin</th>
									
								</thead>
								<tbody>
									<c:forEach var="infant" items="${allInfants}">
										<tr>
										    <td><a href="/names/${infant.id}"><c:out value="${infant.name}" /></a></td>
											<td><c:out value="${infant.gender}" /></td>
											<td><c:out value="${infant.origin}" /></td>
																		
										</tr>
									</c:forEach>
									<a class="btn btn-success" href="/names/new">New Name</a> 
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>