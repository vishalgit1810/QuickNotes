package com.servlets;

import java.io.IOException;

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

@WebServlet("/noteEditServlet")
public class updateNoteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id")); //expense ki id milrahi hai jisko update karna hai DB me //ye id arhi hai edit_expense.jsp me hidden field se
		
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		
		String description = request.getParameter("description");
		
		 HttpSession session = request.getSession();  //user nikalege jo loged user hoga
		 User user = (User) session.getAttribute("LoggedUser");
		
		Note exp = new Note(title, date, description, user);
		exp.setId(id);
		
		NoteDao expdao = new NoteDao(HibernateUtil.getSessionFactory());
		boolean f = expdao.updateNote(exp);
		
		
		if(f) {
	    	session.setAttribute("successMsg", "Note updated successfully");
	    	response.sendRedirect("view_notes.jsp");
	    }
	    else {
	    	session.setAttribute("failmsg", "Something went wrong, try again...");
	    	response.sendRedirect("view_notes.jsp");
	    }
	}
	

}
