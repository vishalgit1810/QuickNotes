package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/userLoginServlet")
public class userLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		
		boolean isAdmin = dao.adminLogin(email, password);  // Checkin user is admin or not
		if(isAdmin) { 
			 HttpSession session = req.getSession();	 
			 
	         session.setAttribute("isAdminLoggedIn", true);
	         
	         resp.sendRedirect("adminPage.jsp"); 
	         return; 
	         
		}		

		
		User user = dao.userLogin(email, password);

		
		 HttpSession session = req.getSession();
		 if(user != null) 
		   { 
		     session.setAttribute("LoggedUser", user); //yaha obj hi pass kare hai to waha obj fetch hoga
		     resp.sendRedirect("home.jsp"); 		//If a valid user is found, the user object is stored as an attribute named "LoggedUser" in the session.
                                            //This attribute can be used to identify the currently logged-in user throughout their session.     
		   }
		 else { 
		    session.setAttribute("failMsg","Invalid Email & Password, Please try again...");	 
		    resp.sendRedirect("login.jsp"); 
		   }
		 
	}

}
