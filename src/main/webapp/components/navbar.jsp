<%@page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!-- navbar when user is logged in-->
   <c:if test="${not empty LoggedUser }"> 
<div class="container-fluid">
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4" >
    <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-primary text-decoration-none fw-bold fs-2">
      QuickNotes
    </a>
    
    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">  
      <li><a href="home.jsp" class="nav-link px-2 link-secondary">Home</a></li>      
       
      <li><a href="add_note.jsp" class="nav-link px-2 link-dark">Add Notes</a></li>
      <li><a href="view_notes.jsp" class="nav-link px-2 link-dark">View Notes</a></li> 
      	<li><a href="about.jsp" class="nav-link px-2 link-dark">About</a></li>
    </ul> 
   
  
    <div class="col-md-3 text-end">
      <!-- Modal trigger should be the user's name -->
      <a href="" class="btn btn-outline-primary me-2" type="submit" data-toggle="modal" data-target="#exampleModal">
        <i class="fa-solid fa-circle-user"></i>${LoggedUser.fullName}
      </a>
      <!-- Logout button -->
     <a href="userLogoutServlet" type="button" class="btn btn-primary">Logout</a>
    </div>
 
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="container text-center">
              <i class="fa fa-user fa-3x"></i>
              <h5></h5>
              <table class="table">
                <tbody>
                  <tr>
                    <th>User Id</th>
                    <td>${LoggedUser.id}</td>
                  </tr>
                  <tr>
                    <th>User Name</th>
                    <td>${LoggedUser.fullName}</td>
                  </tr>
                  <tr>
                    <th>Email Id</th>
                    <td>${LoggedUser.email}</td>
                  </tr>
                </tbody>
              </table>
              <div>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <a href="editUserdetails.jsp"><button class="btn btn-danger">Edit</button></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>   
   
           
  </header>
</div>
 </c:if>    
 
 
   
   <!-- navbar when user is not logged in -->
   
 <c:if test="${empty LoggedUser }">   
<div class="container-fluid">
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4" >
    <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-primary text-decoration-none fw-bold fs-2">
      QuickNotes
    </a>
    
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">  
      <li><a href="home.jsp" class="nav-link px-2 link-secondary">Home</a></li>     
  
        <li><a href="about.jsp" class="nav-link px-2 link-dark">Features</a></li>
		<li><a href="about.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
		<li><a href="about.jsp" class="nav-link px-2 link-dark">About</a></li>
     </ul>
     
    <div class="col-md-3 text-end">
	    <a href="register.jsp" type="button" class="btn btn-outline-primary me-2">Sing Up</a>					
		<a href="login.jsp" type="button" class="btn btn-primary">Sign In</a>
		<a href="adminLogin.jsp" type="button" class="btn btn-primary">Admin</a>
			
    </div>			
			
            
  </header>
</div>
</c:if>	

