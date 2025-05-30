package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.NoteTaker;
import com.helper.FactoryProvider;


public class SaveNoteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public SaveNoteServelet() {
      
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NoteTaker note = new NoteTaker(title, content, new Date());
			
			//System.out.println(note.getId()+ ":" + note.getTitle().toString());
			
			//Hibernate save
			SessionFactory sessionFactory=FactoryProvider.getFactory();
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.persist(note);
			
			tx.commit();
			session.close();
			response.sendRedirect("note_saved.jsp");
			
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

}
