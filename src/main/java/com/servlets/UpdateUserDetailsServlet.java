package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/updateUserDetails")
public class UpdateUserDetailsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		String email = request.getParameter("email");;
		
		 HttpSession session = request.getSession();                   //user nikalege jo loged user hoga
		 User user = (User) session.getAttribute("LoggedUser");
		 int id = user.getId();
		
		User us = new User(fullName, email, password, about);
		us.setId(id);
		
		UserDao expdao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = expdao.updateUser(us);
		
		if(f) {
	  
	    	response.sendRedirect("userLogoutServlet");
	    }
	    else {
	    	
	    	response.sendRedirect("userLogoutServlet");
	    }
	}
	

}
