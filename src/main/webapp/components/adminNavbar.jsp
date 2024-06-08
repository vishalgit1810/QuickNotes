<%@page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <!-- Nav Bar hai bhai ye -->
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-coins"></i> QuickNotes</a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">                 
              
                 <li class="nav-item"><a class="nav-link active" href="adminPage.jsp"><i class="fa-solid fa-plus"></i> Admin</a></li>
                   
                 <li class="nav-item"><a class="nav-link active" href="userLogoutServlet" tabindex="-1"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            </ul>

            

        </div>
    </div>
</nav>
