package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Note;
import com.entity.User;

import jakarta.persistence.Query;

public class UserDao {	
	
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}	

	public boolean saveUser(User user)            //to save the details of user in DB
	{
		boolean f = false; 
		
		try {
			session = factory.openSession();
			tx = session.beginTransaction();			
			
			session.persist(user);
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
	
	public User userLogin(String email, String password)
	{
		User u = null;
		
		session = factory.openSession();
		
		Query qu = session.createQuery("from User where email = :x and password =:y");
		qu.setParameter("x", email);
		qu.setParameter("y", password);
		
		return u = (User)((org.hibernate.query.Query) qu).uniqueResult();		//Executes the query and retrieves a single result using uniqueResult().
		                                                                     //The result is cast to a User object and assigned to the variable u. If no result is found,
		                                                                    //u will remain null.
		  
	}
	
	public boolean adminLogin(String email, String password) 
	{		
		
		if(email.equalsIgnoreCase("quicknotes@admin.com") && password.equals("12345")) {
			return true;
		}
		return false;
	}
	
	
	
	
	public boolean updateUser(User user)            //to update the details of user in DB
	{
		boolean f = false; 
		
		try {
			session = factory.openSession();
			tx = session.beginTransaction();	
			
			session.saveOrUpdate(user);
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
	
	public List<User> getAllUsers() {
		  List<User> userList = new ArrayList<>();
		  try (Session session = factory.openSession()) {
		   userList = session.createQuery("FROM User", User.class).getResultList();
		  } catch (Exception e) {
		   e.printStackTrace();
		  }
		  return userList;
		 }
	
	public boolean deleteUser(int id) {
	    boolean f = false;
	    try {
	        session = factory.openSession();
	        tx = session.beginTransaction();    

	        // Delete associated notes for the user
	        Query deleteQuery = session.createQuery("DELETE FROM Note WHERE user.id = :userId");
	        deleteQuery.setParameter("userId", id);
	        int deletedRows = deleteQuery.executeUpdate();

	        // Now delete the user
	        User ex = session.get(User.class, id);
	        session.delete(ex);

	        tx.commit();
	        f = true;
	    } catch (Exception e) {
	        if (tx != null) {
	            tx.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return f;
	}




}
