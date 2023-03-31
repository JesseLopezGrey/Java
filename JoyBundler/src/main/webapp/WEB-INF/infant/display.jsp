<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">
						<h1 class="text-center">title</h1>
						<div class="card-body">
							<table class="table table-dark">
								<thead>
									<th>Name</th>
									<th>Posted By</th>
									<th>Gender</th>
									<th>Origin</th>	
									<th>Meaning</th>								
									<th>Posted By</th>
									<th>Actions</th>
								</thead>
								<tbody>
									<div class="d-flex ">
									</div>
										<tr>
											<td><c:out value="${infant.name}" /></td>
											<td><c:out value="${infant.userCreator.name}" /></td>
											<td><c:out value="${infant.gender}" /></td>											
											<td><c:out value="${infant.origin}" /></td>	
											<td><c:out value="${infant.meaning}" /></td>
											<td><c:out value="${infant.userCreator.name}" /></td>											
											<td class="d-flex justify-content-between">
										    <c:if test="${user_id == infant.userCreator.id}">
												    <a class="btn btn-warning" href="/names/${infant.id}/edit">Edit</a>
													<form action="/names/${infant.id}" method="POST">
														<input type="hidden" name="_method" value="delete" />
														<button class="btn btn-danger">Delete</button>
													</form>
											</c:if>	
											<a class="btn btn-secondary" href="/home">Back</a>
											</td>
										</tr>								
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