package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/ExportCSVServlet")
public class ExportCSVServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		   
		
		 String userIdParam = req.getParameter("userId");
	        int userId = -1;

	        // Validate and parse the userId
	        if (userIdParam != null && !userIdParam.isEmpty()) {
	            try {
	                userId = Integer.parseInt(userIdParam);
	            } catch (NumberFormatException e) {
	                e.printStackTrace();
	                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID");
	                return;
	            }
	        }

	        
	        ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
	        List<Expense> expenses = expenseDao.getExpensesByUserId(userId); // Fetch expenses by user ID

	        if (expenses == null || expenses.isEmpty()) {
	            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No expenses found for this user.");
	            return;
	        }

	        
	        resp.setContentType("text/csv");
	        resp.setHeader("Content-Disposition", "attachment; filename=\"expenses.csv\"");

	        
	        PrintWriter writer = resp.getWriter();
	        
	        // Write CSV header
	        writer.println("Title,Expense");

	        
	        for (Expense expense : expenses) {
	            writer.println(expense.getTitle() + "," + expense.getPrice());
	        }

	        writer.flush();
	        writer.close();
	    }
			
		
}
		
