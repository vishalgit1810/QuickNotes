package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NoteDao;
import com.db.HibernateUtil;

@WebServlet("/noteDeleteServlet")
public class DeleteNoteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	NoteDao expdao = new NoteDao(HibernateUtil.getSessionFactory());
	boolean f = expdao.deleteNote(id);
	
	
	HttpSession session = request.getSession();
	if(f) {
	    	session.setAttribute("successMsg", "Note deleted successfully");
	    	response.sendRedirect("view_notes.jsp");
	    }
	    else {
	    	session.setAttribute("failmsg", "Something went wrong, try again...");
	    	response.sendRedirect("view_notes.jsp");
	    }
	
	
	
	}

}
