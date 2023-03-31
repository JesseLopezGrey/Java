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
						<h1 class="text-center">Change <c:out value="${infantObj.name }" /></h1>
						<div class="card-body">
							<div>
								<form:form method="POST" action="/names/${infantObj.id }/edit"
									modelAttribute="infantObj">
									<input type="hidden" name="_method" value="put">
									<form:input type="hidden" path="userCreator" value="${user_id}" />
									<div>
										New Name:
										<form:input type="text" path="name" />
										<form:errors class="text-danger" path="name" />
									</div>
									<div>
										Gender:
										<form:select path="gender">
											<form:option value="Female">
												<c:out value="Female" />
											</form:option>
											<form:option value="Male">
												<c:out value="Male" />
											</form:option>
										</form:select>
									</div>
									<div>
										Origin:
										<form:input type="text" path="origin" />
										<form:errors class="text-danger" path="origin" />
									</div>
									<div>
										Meaning:
										<form:input type="text" path="meaning" />
										<form:errors class="text-danger" path="meaning" />
									</div>

									<button class="btn btn-primary">Submit Edit</button>
								</form:form>
								<div class="d-flex justify-content-between">
									<a class="btn btn-danger" href="/home">Cancel</a>
									<form action="/names/${infantObj.id }" method="POST">
										<input type="hidden" name="_method" value="delete" />
										<button class="btn btn-danger">Delete</button>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>