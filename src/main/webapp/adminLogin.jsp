 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuickNotes-Login</title>
 <%@include file="components/all_css.jsp" %> 
 <link rel="stylesheet"  href="components/main.css"/>
 
 <style type="text/css">
   .card-sh{
      box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
   }
 </style>
 
</head>
<body>
   <%@include file="components/navbar.jsp" %>      
     
   
   
   <div class="continer p-3"> 
       <div class="row" >   
          <div class="col-md-4 offset-md-4">
              <div class="card card-sh">
              
                  <div class="card-header text-center bg-custom">
                  <i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
                  <h4 class="text-center fs-3">Admin Login</h4>
                     
                     
                      <c:if test="${not empty failMsg}">
                        <p class="text-center text-danger fs-8">${failMsg}</p>
                        <c:remove var="failMsg"/>
                      </c:if>
                      
                       <c:if test="${not empty logoutMsg}">
                        <p class="text-center text-success fs-8">${logoutMsg}</p>
                        <c:remove var="logoutMsg"/>
                      </c:if>
                     
                  </div>
                  
                  <div class="card-body">
                  
                     <form action="adminLoginServlet" method="post">
                     
                         <div class="mb-3">
                             <label>Email ID</label>
                             <input type="email" name="email" class="form-control">
                              <small	id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
                         </div>
                         
                         <div class="mb-3">
                             <label>Password</label>
                             <input type="password" name="password" class="form-control">
                         </div>                         
                        
                         <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
                       
                         
                     </form>
                  
                  </div>
                  
              </div>
          
          </div>  
       </div> 
   </div>                                                          
        
     
                                                      
</body>
</html>