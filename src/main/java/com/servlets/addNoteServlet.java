package com.servlets;

import java.io.IOException;                                               /* add expense servlet hai ye*/
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NoteDao;
import com.db.HibernateUtil;
import com.entity.Note;
import com.entity.User;

@WebServlet("/addNoteServlet")
public class addNoteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    @Override	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		
		String description = request.getParameter("description");
		
		
		 HttpSession session = request.getSession();  //user nikalege jo loged user hoga
		 User user = (User) session.getAttribute("LoggedUser");
		
		Note exp = new Note(title, date, description, user);
		
		NoteDao expdao = new NoteDao(HibernateUtil.getSessionFactory());
		boolean f = expdao.saveNote(exp);
		
		
		if(f) {
		    	session.setAttribute("successMsg", "Note added successfully");
		    	response.sendRedirect("add_note.jsp");
		    }
		    else {
		    	session.setAttribute("failmsg", "Something went wrong, try again...");
		    	response.sendRedirect("add_note.jsp");
		    }
		
		
		
	}

}
