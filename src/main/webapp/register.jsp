<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuickNotes-Register</title>
<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body >
	<%@include file="components/navbar.jsp"%>

	<div class="container p-3">
		<a></a>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card card-sh">

					<div class="card-header">
						<h4 class="text-center fs-3">Please Register</h4>

						<c:choose>
							<c:when test="${not empty successMsg}">
								<p class="text-center text-success fs-8">${successMsg}<a href="login.jsp">login</a></p>
									<c:remove var="successMsg" />		
								
							</c:when>
							<c:otherwise>
								<p class="text-center text-danger fs-8">${failMsg}</p>
									<c:remove var="failMsg" />
							</c:otherwise>
						</c:choose>

					</div>

					<div class="card-body">

						<form action="userRegisterServlet" method="post">

							<div class="mb-3">
								<label>Enter Your Name</label> <input type="text"
									name="fullName" class="form-control">
							</div>

							<div class="mb-3">
								<label>Email ID</label> <input type="email" name="email"
									class="form-control"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>

							<div class="mb-3">
								<label>Password</label> <input type="password" name="password"
									class="form-control">
							</div>

							<div class="mb-3">
								<label>About</label> <input type="text" name="about"
									class="form-control">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>

						</form>

					</div>

				</div>

			</div>
		</div>
	</div>



</body>
</html>