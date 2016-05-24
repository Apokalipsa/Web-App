package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Contact;
import model.ContactDAO;

@WebServlet("/Search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String button = request.getParameter("button");

		ContactDAO dao = new ContactDAO();

		ArrayList<Contact> contacts = new ArrayList<>();

		String search = request.getParameter("search");

		if (search.equals("iamgod") || search.equals("showAll")) {
			contacts = dao.getAllContacts();
		}

		String[] firstAndLast = search.split(" ");
		if (firstAndLast.length > 1) {
			contacts = dao.findContactByNameAndLastName(firstAndLast[0], firstAndLast[1]);
		}

		if (contacts.size() == 0 && firstAndLast.length > 1) {

			contacts = dao.findContactByNameAndLastName(firstAndLast[1], firstAndLast[0]);
		}

		if (contacts.size() == 0) {

			contacts = dao.findByFistName(search);
		}

		if (contacts.size() == 0) {
			contacts = dao.findByLastName(search);
		}

		if (contacts.size() == 0) {
			contacts = dao.findByPhoneNumber(search);
		}

		if (contacts.size() == 0) {

			contacts = dao.findByCity(search);
		}

		if (contacts.size() == 0) {

			if (button.equals("neRegistrovani")) {
				if (!search.equals("") || search != null) {
					request.setAttribute("errorFind", "No results were found.");
				}
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else if (button.endsWith("registrovaniSearch")) {
				if (!search.equals("") || search != null) {
					request.setAttribute("errorFind", "No results were found.");
				}
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else {

			if (button.equals("neRegistrovani")) {
				request.setAttribute("searchContacts", contacts);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else if (button.equals("registrovaniSearch")) {
				request.setAttribute("searchContacts", contacts);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}
}