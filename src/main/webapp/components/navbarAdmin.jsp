<%@page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<div class="container-fluid">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4">
		<a href="#"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-primary text-decoration-none fw-bold fs-2">
			QuickNotes </a>

		<!-- <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="home.jsp" class="nav-link px-2 link-secondary">Home</a></li>
			<li><a href="about.jsp" class="nav-link px-2 link-dark">Features</a></li>
			<li><a href="about.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
			<li><a href="about.jsp" class="nav-link px-2 link-dark">About</a></li>
		</ul> -->

		<div class="col-md-3 text-end">						
				<a href="adminLogoutServlet" type="button" class="btn btn-primary">Logout</a>			
		</div>
	</header>
</div>
