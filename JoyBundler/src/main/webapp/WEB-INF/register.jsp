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
					<h1 class="text-center">Register</h1>
						<div class="card-body">
									<form:form class="form-control" action="/register" method="post" modelAttribute="newUser">
			<div>
				Name:
				<form:input path="name" />
				<form:errors class="text-danger" path="name" />
			</div>
			<div>
				Email:
				<form:input path="email" />
				<form:errors class="text-danger" path="email" />
			</div>
			<div>
				Password:
				<form:input path="password" />
				<form:errors class="text-danger" path="password" />
			</div>
			<div>
				Confirm Password:
				<form:input path="confirm" />
				<form:errors class="text-danger" path="confirm" />
			</div>
			<button>Register</button>
		</form:form>
		<a class="btn btn-primary" href="/">Dashboard</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>