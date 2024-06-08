package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Note;
import com.entity.User;

import jakarta.persistence.Query;

public class NoteDao {
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public NoteDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}	

	public boolean saveNote(Note note)            //to save the details of expense in DB
	{
		boolean f = false; 
		
		try {
			session = factory.openSession();
			tx = session.beginTransaction();	
			
			session.persist(note);
			tx.commit();
			f=true;
			
		} catch (Exception e) {
			if( tx!= null) {
				 f=false;
				 e.printStackTrace();
			}			
		}		
		return f;
	}
	
	public List<Note> getallNotes(User user)         // jo user login hoga wo yaha ayega or expense table me uske related jo bhi data hoga wo yaha fecth ho jayega
	{
		List<Note> list = new ArrayList<Note>();
		try {
			session = factory.openSession();
			Query q = session.createQuery("FROM Note WHERE user = :x ORDER BY id DESC");
			q.setParameter("x", user);
		    list = q.getResultList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	public List<Note> getAllNotes() {
        List<Note> notes = new ArrayList<>();
        try (Session session = factory.openSession()) {
            notes = session.createQuery("FROM Note ORDER BY id DESC", Note.class).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notes;
    }
	
	public Note getNoteById(int id)                        //ye method expense objcet degi mtlb expense details or edit page par jo data show hoga wo yahi se show h0ga
	{
		Note ex = null;
		
		try {
			session = factory.openSession();
			Query q = session.createQuery("from Note where id=:x");
			q.setParameter("x", id);
			ex = (Note) ((org.hibernate.query.Query) q).uniqueResult();
		}
		catch (Exception e) {
				e.printStackTrace();
			}
			
		
		return ex;
	}
	
	public boolean updateNote(Note note)            //to update the details of expense in DB
	{
		boolean f = false; 
		
		try {
			session = factory.openSession();
			tx = session.beginTransaction();	
			
			session.saveOrUpdate(note);
			tx.commit();
			f=true;
			
		} catch (Exception e) {
			if( tx!= null) {
				 f=false;
				 e.printStackTrace();
			}			
		}		
		return f;
	} 
	
	public boolean deleteNote(int id)
	{
		boolean f=false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();	
			
			Note ex = session.get(Note.class, id);             // Expense se id ke hisab se data ko fetch kiya hai
			session.delete(ex);
			
			tx.commit();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;	
		
	}
	
	
	
	
}
