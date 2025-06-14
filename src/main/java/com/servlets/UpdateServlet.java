package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.NoteTaker;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			NoteTaker t=s.get(NoteTaker.class, noteId);
			t.setTitle(title);
			t.setContent(content);
			t.setAddedDate(new Date());

			
			
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
