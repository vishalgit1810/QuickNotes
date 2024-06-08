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

@WebServlet("/deleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		UserDao expdao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = expdao.deleteUser(id);
		
		
		HttpSession session = request.getSession();
		if(f) {
		    	session.setAttribute("successMsg", "User deleted successfully");
		    	response.sendRedirect("adminPage.jsp");
		    }
		    else {
		    	session.setAttribute("failmsg", "Something went wrong, try again...");
		    	response.sendRedirect("adminPage.jsp");
		    }
	}

	

}
