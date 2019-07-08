package com.ecart.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecart.exception.ECartException;
import com.ecart.service.ECartService;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println(userName + " - " + password);
		HttpSession session = request.getSession(true);
		boolean login = false;
		
		if(ECartService.loginCheck(userName,password))
		{
			//validating the user login
			
			System.out.println(session.getId());
			
			session.setAttribute("USERNAME", userName);
			login=true;
			request.setAttribute("login_status", login);
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/menu.jsp");
			rd.forward(request, response);
		}
		else
		{
			System.out.println("Invalid login");
			login = false;
			request.setAttribute("login_status", login);
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/errorLogin.jsp");
			rd.forward(request, response);

		}		
		
	}


}
