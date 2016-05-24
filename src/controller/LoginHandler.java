package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Contact;
import model.ContactDAO;

@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String button = request.getParameter("button");

		if (button.equals("login")) {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			Contact contact = new ContactDAO().loginContact(username, password);

			if (contact != null) {

				request.getSession().setAttribute("contact", contact);

				if (contact.getIsAdmin() == 1) {
					response.sendRedirect("login.jsp");
				} else {
					response.sendRedirect("index.jsp");
				}
			} else {
				request.getSession().setAttribute("loginFailed", "Login Failed! Please try again.");
				response.sendRedirect("index.jsp");
			}

		} else if (button.equals("logout")) {

			request.getSession().removeAttribute("contact");

			response.sendRedirect("index.jsp");
		}
	}
}