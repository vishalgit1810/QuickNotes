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

@WebServlet("/userRegisterServlet")
public class userRegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    String fullName = req.getParameter("fullName");
		    String email = req.getParameter("email");
		    String password = req.getParameter("password");
		    String about = req.getParameter("about");
		    
		    User user = new User(fullName, email, password, about);
		    
		    UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		    boolean f = dao.saveUser(user);
		    
		    HttpSession session; // An HttpSession is an object that represents a user's session on the server.
		    if(f) {
		    	session = req.getSession();
		    	session.setAttribute("successMsg", "Register Successfully, Please ");
		    	resp.sendRedirect("register.jsp");
		    }
		    else {
		    	session = req.getSession();
		    	session.setAttribute("failmsg", " Something went wrong, Please again...");
		    	resp.sendRedirect("register.jsp");
		    }
		    
		    
	}
	
	

}
