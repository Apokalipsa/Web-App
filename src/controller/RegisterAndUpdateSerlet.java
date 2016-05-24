package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Contact;
import model.ContactDAO;


@WebServlet("/RegisterUpdate")
public class RegisterAndUpdateSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String errorMessage = "";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ContactDAO dao = new ContactDAO();
		String button = request.getParameter("button");

		if (button.equals("adminSelectEdit")
				|| button.equals("adminSelectDelete")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Contact contactEdit = dao .findById(id);
		
			if (id == 0) {
				
				request.getSession().setAttribute("errorregistration",
						"You must select the user!");
				
				response.sendRedirect("login.jsp");
				
				return;
			}
			
			if (button.equals("adminSelectDelete")) {
				request.getSession().setAttribute("deletion", "Deletion");
			}
			
			request.getSession().setAttribute("contactEdit", contactEdit);
		
			response.sendRedirect("register.jsp");
			
			return;
		}
		
		if (button.equals("adminDelete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			dao.deleteContactById(id);
			request.getSession().setAttribute("updateMessage",
					"You successfully deleted contact!");
			response.sendRedirect("login.jsp");
		}

	

		String firstName = request.getParameter("firstName");
		if (firstName.length() > 0) {
			firstName = firstName.substring(0, 1).toUpperCase()
					+ firstName.substring(1, firstName.length());
		}
		
		validateFirstName(firstName);
		String lastName = request.getParameter("lastName");
		if (lastName.length() > 0) {
			lastName = lastName.substring(0, 1).toUpperCase()
					+ lastName.substring(1, lastName.length());
		}
		validateLastName(lastName);
		
		String username = request.getParameter("username");
		validateUsername(username);
		
		String password = request.getParameter("password");
		validatePassword(password);
		
		String phoneNumber = request.getParameter("phoneNumber");
		validatePhoneNumber(phoneNumber);

		String address = request.getParameter("address");
		validateAddress(address);
		String city = request.getParameter("city");
		if (city.length() > 0) {
			city = city.substring(0, 1).toUpperCase()
					+ city.substring(1, city.length());
		}
		validateCity(city);

		
		if (button.equals("register") && dao.isExist(username)) {
			
			setErrorMessage("Username is ocupied! Please try again.");
		} else if (button.equals("adminRegister") && dao.isExist(username)) {
			setErrorMessage("Username is ocupied! Please choose diferent.");
		}

		
		if (errorMessage.equals("")) {
			
			if (button.equals("register") && !dao.isExist(username)) {
			
				Contact contact = new Contact(firstName, lastName, username,
						password, phoneNumber, address, city);
				dao.addContact(contact);
				
				request.getSession().setAttribute("contact", contact);
				request.getSession().setAttribute("addmessage",
						"You are successfuly registred! And currently logged!");
				response.sendRedirect("index.jsp");
			} else if (button.equals("update") || button.equals("adminUpdate")) {
				
				Contact contactEdit = (Contact) request.getSession()
						.getAttribute(
								button.equals("update") ? "contact"
										: "contactEdit");
				contactEdit.setFirstName(firstName);
				contactEdit.setLastName(lastName);
				
				if (contactEdit.getUsername().equals(username)
						|| !dao.isExist(username)) {
					
					contactEdit.setUsername(username);
				} else {
					
					setErrorMessage("Username is ocupied! Please try another.");
					request.getSession().setAttribute("errorregistration",
							errorMessage);
					response.sendRedirect("login.jsp");
					errorMessage = "";
					return;
				}
				contactEdit.setPassword(password);
				contactEdit.setPhoneNumber(phoneNumber);
				contactEdit.setAddress(address);
				contactEdit.setCity(city);
				
				if (button.equals("update")) {
					
					request.getSession().removeAttribute("contact");
					
					request.getSession().setAttribute("contact", contactEdit);
					
					dao.updateContact(contactEdit);
					request.getSession().setAttribute("updateMessage",
							"You successfully updated your information!");
					response.sendRedirect("index.jsp");
				} else {
					
					int role = Integer.parseInt(request.getParameter("role"));
					contactEdit.setIsAdmin(role);
					request.getSession().removeAttribute("contactEdit");
					dao.updateContact(contactEdit);
					request.getSession().setAttribute("updateMessage",
							"You successfully updated contact's information!");
					response.sendRedirect("login.jsp");
				}
			} else if (button.equals("adminRegister")) {
				
				Contact contact = new Contact(firstName, lastName, username,
						password, phoneNumber, address, city);
				dao.addContact(contact);
				request.getSession().setAttribute("addmessage",
						"You are successfuly registred new contact!");
				response.sendRedirect("login.jsp");
			}
		}

		else { 
			if (button.equals("register") || button.equals("update")) {
				request.getSession().setAttribute("errorregistration",
						errorMessage);
				response.sendRedirect("index.jsp");
				errorMessage = "";
			} else if (button.equals("adminRegister")
					|| button.equals("adminUpdate")) {
				request.getSession().setAttribute("errorregistration",
						errorMessage);
				response.sendRedirect("login.jsp");
				errorMessage = "";
			}
		}
	}

	
	 public void validateFirstName(String name) {
		
		if (name.length() < 3) {
			
			setErrorMessage("First name is too short");
		}
		
		for (int i = 0; i < name.length(); i++) {
			
			if (name.charAt(i) >= '0' && name.charAt(i) <= '9') {
				
				setErrorMessage("First name contains invalid characters!");
				
				break;
			}
		}
	}

	
	public void validateLastName(String lastName) {
		if (lastName.length() < 3) {
			setErrorMessage("Last name is too short");
		}
		for (int i = 0; i < lastName.length(); i++) {
			if (lastName.charAt(i) >= '0' && lastName.charAt(i) <= '9') {
				setErrorMessage("Last name contains invalid characters!");
				break;
			}
		}
	}

	
	 public void validateCity(String city) {
		if (city.length() < 3) {
			setErrorMessage("City name is too short");
		}
		for (int i = 0; i < city.length(); i++) {
			if (city.charAt(i) >= '0' && city.charAt(i) <= '9') {
				setErrorMessage("City name contains invalid characters!");
				break;
			}
		}
	}

	public void validateUsername(String username) {
		if (username.length() < 4) {
			setErrorMessage("Username must be at least 4 character long!");
		}
	}

	public void validatePassword(String password) {
		if (password.length() < 4) {
			setErrorMessage("Password must be at least 4 character long!");
		}
	}

	
	public void validatePhoneNumber(String number) {
		if (number.length() < 9) {
			setErrorMessage("Phone number is too short! Phone number must have at least 9 digits.");
		}

		for (int i = 0; i < number.length(); i++) {
			if (number.charAt(i) < '0' || number.charAt(i) > '9') {
				setErrorMessage("Phone number must contain only digits!");
				break;
			}
		}
	}



	 
	public void validateAddress(String addr) {
		if (addr.length() < 3) {
			setErrorMessage("Invalid street address!");
		}
	}


	public static void setErrorMessage(String msg) {
		errorMessage = errorMessage + msg + "<br>";
	}
}