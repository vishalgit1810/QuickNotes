<%@page import="com.entity.User"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit-User Details</title>

<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

  <style type="text/css">                        /*   shadow diya hai */
   .card-sh{
      box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
   }
 </style>

</head>
<body>

<c:if test="${empty LoggedUser }">         <!-- // kabhi user loged in nhi hai to redirect karwa dege -->
 
   <c:redirect url="login.jsp"></c:redirect>

</c:if>

<%

//int id = Integer.parseInt(request.getParameter("id"));          /* id fectch kar rahe hai */
HttpSession ses = request.getSession();                   //user nikalege jo loged user hoga
User user = (User) ses.getAttribute("LoggedUser");
/* int id = user.getId(); */

/* UserDao dao= new UserDao(HibernateUtil.getSessionFactory());
User  = dao.getUserById(id); */



%>


	<%@include file="components/navbar.jsp"%>

	<div class="container p-3" >
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card card-sh">
					<div class="class-header text-center">
						<p class="fs-3">Edit User Details</p>
						
					</div>
					<div class="card-body">
					
						<form action="updateUserDetails" method="get">                     <!--  yaha object se values fetch karke input feild me data show karw rahe hai -->
						
							<div class="mb-3">
								<label>Name</label> <input type="text" name="fullName"
									class="form-control" value="<%=user.getFullName() %>" />
							</div>

							<div class="mb-3">
								<label>Email ID</label> <input type="text" name="email"
									class="form-control" value="${LoggedUser.email}"/>
							</div>

							<div class="mb-3">
								<label>Password</label> <input type="text" name="password"
									class="form-control" value="<%=user.getPassword() %>"/>
							</div>
							
							<div class="mb-3">
								<label>About</label> <input type="text" name="about"
									class="form-control" value="<%=user.getAbout() %>"/>
							</div>
							
							
							
							<button type="submit" class="btn btn-success col-md-12">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>