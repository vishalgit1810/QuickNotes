<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Note" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.NoteDao" %>
<%@ page import="com.db.HibernateUtil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <%@include file="components/all_css.jsp"%>
     <link rel="stylesheet"  href="components/main.css"/>
</head>
<body>
<%
HttpSession s = request.getSession(false);
Boolean isAdminLoggedIn = (Boolean) s.getAttribute("isAdminLoggedIn");
if (isAdminLoggedIn == null || !isAdminLoggedIn) {
    // Redirect to the login page if the admin is not logged in
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@include file="components/navbarAdmin.jsp"%>

<div class="container">
    <h1 class="text-center">Admin Dashboard</h1>
    
    <c:choose>
                        <c:when test="${not empty successMsg}">
                            <p class="text-center text-dark fs-8">${successMsg}</p>
                            <c:remove var="successMsg" />     
                        </c:when>
                        <c:otherwise>
                            <p class="text-center text-danger fs-8">${failMsg}</p>
                            <c:remove var="failMsg" />
                        </c:otherwise>
                    </c:choose>  

    <!-- Display All Users -->
    <div class="mt-4">
        <h3>All Users</h3>
        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Number of Notes</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
                    List<User> users = userDao.getAllUsers();
                    for (User user : users) { 
                        NoteDao noteDao = new NoteDao(HibernateUtil.getSessionFactory());
                        List<Note> userNotes = noteDao.getallNotes(user);
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getFullName() %></td>
                    <td><%= userNotes.size() %></td>
                    <td>
                        <form action="deleteUserServlet" method="post">
                            <input type="hidden" name="id" value="<%= user.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>


