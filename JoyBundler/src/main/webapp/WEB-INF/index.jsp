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
					<h1 class="text-center">CyberPunk</h1>
						<div class="card-body">
							<a class="btn btn-info" href="/login">Login</a>
							<a class="btn btn-success" href="/register">Register</a>
							<a class="btn btn-primary" href="/home">Home</a>
							<a class="btn btn-secondary" href="/logout">Logout</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>