package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ContactDAO {

	/* Connection to database */


	public void addContact(Contact contact) {
		String query = "INSERT INTO kontakti (firstName, lastName, username, password, phoneNumber, address, city, isAdmin) values (?,?,?,?,?,?,?,?)";
		try (Connection conn = DBConnection.connect();
			PreparedStatement prepStmnt = conn.prepareStatement(query)) {
			prepStmnt.setString(1, contact.getFirstName());
			prepStmnt.setString(2, contact.getLastName());
			prepStmnt.setString(3, contact.getUsername());
			prepStmnt.setString(4, contact.getPassword());
			prepStmnt.setString(5, contact.getPhoneNumber());
			prepStmnt.setString(6, contact.getAddress());
			prepStmnt.setString(7, contact.getCity());
			prepStmnt.setInt(8, contact.getIsAdmin());
			prepStmnt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateContact(Contact contact) {
		String query = "UPDATE kontakti SET firstName = ?, lastName = ?,"
				+ " username = ?, password  = ?, phoneNumber = ?, address = ?," + " city = ?, isAdmin = ? WHERE id = ?";
		try (Connection conn = DBConnection.connect();
PreparedStatement prepStmnt = conn.prepareStatement(query)) {
			prepStmnt.setString(1, contact.getFirstName());
			prepStmnt.setString(2, contact.getLastName());
			prepStmnt.setString(3, contact.getUsername());
			prepStmnt.setString(4, contact.getPassword());
			prepStmnt.setString(5, contact.getPhoneNumber());
			prepStmnt.setString(6, contact.getAddress());
			prepStmnt.setString(7, contact.getCity());
			prepStmnt.setInt(8, contact.getIsAdmin());
			prepStmnt.setInt(9, contact.getId());
			prepStmnt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteContactById(int id) {
		String query = "DELETE FROM kontakti WHERE id = ?";
		try (Connection conn = DBConnection.connect(); 
				PreparedStatement prepStmnt = conn.prepareStatement(query)) {
			prepStmnt.setInt(1, id);
			prepStmnt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public void deleteContactsByUsername(String username) {
		String query = "DELETE FROM kontakti WHERE username = ?";
		try (Connection conn = DBConnection.connect();
				PreparedStatement prepStmnt = conn.prepareStatement(query)) {
			prepStmnt.setString(1, username);
			prepStmnt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public boolean isExist(String username) {
		String query = "SELECT * FROM kontakti WHERE username = ?";
		boolean itEgzist = false;
		try (Connection conn = DBConnection.connect();
				PreparedStatement prepStmnt = conn.prepareStatement(query)) {

			prepStmnt.setString(1, username);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				itEgzist = rs.next();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itEgzist;
	}


	public boolean login(String username, String password) {
		String query = "SELECT * FROM kontakti WHERE username = ? AND password = ?";
		boolean isOk = false;
		try (Connection conn = DBConnection.connect(); 
				PreparedStatement prepStmnt = conn.prepareStatement(query)) {

			prepStmnt.setString(1, username);
			prepStmnt.setString(2, password);

			try (ResultSet rs = prepStmnt.executeQuery()) {
				if (rs.next()) {
					isOk = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isOk;
	}


	public Contact loginContact(String username, String password) {
		Contact contact = null;
		String query = "SELECT * FROM kontakti WHERE username = ? AND password = ?";
		try (Connection conn = DBConnection.connect();
PreparedStatement prepStmnt = conn.prepareStatement(query)) {

			prepStmnt.setString(1, username);
			prepStmnt.setString(2, password);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				if (rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setFirstName(rs.getString("firstName"));
					contact.setLastName(rs.getString("lastName"));
					contact.setUsername(rs.getString("username"));
					contact.setPassword(rs.getString("password"));
					contact.setPhoneNumber(rs.getString("phoneNumber"));
					contact.setAddress(rs.getString("address"));
					contact.setCity(rs.getString("city"));
					contact.setIsAdmin(rs.getInt("isAdmin"));
				}
			}
			return contact;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contact;
	}

	/* ------------- Metodi za pretragu korisnika u bazi -------------- */

	
	public ArrayList<Contact> getAllContacts() {
		ArrayList<Contact> contacts = new ArrayList<>();
		String query = "SELECT * FROM kontakti ORDER BY firstName";

		try (Connection conn = DBConnection.connect();
				PreparedStatement stmnt = conn.prepareStatement(query);
				ResultSet rs = stmnt.executeQuery()) {
			while (rs.next()) {
				contacts.add(new Contact(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
						rs.getString("username"), rs.getString("password"), rs.getString("phoneNumber"),
						rs.getString("address"), rs.getString("city"), rs.getInt("isAdmin")));
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}

		return contacts;
	}

	
	public ArrayList<Contact> findContactByNameAndLastName(String firstName, String lastName) {
		ArrayList<Contact> contacts = new ArrayList<>();
		String query = "SELECT * FROM kontakti WHERE firstName = ? and lastName = ?";

		try (Connection conn = DBConnection.connect();
				PreparedStatement prepStmnt = conn.prepareStatement(query);) {
			prepStmnt.setString(1, firstName);
			prepStmnt.setString(2, lastName);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				while (rs.next()) {
					contacts.add(new Contact(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("username"), rs.getString("password"), rs.getString("phoneNumber"),
							rs.getString("address"), rs.getString("city"), rs.getInt("isAdmin")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contacts;
	}

	
	public ArrayList<Contact> findByFistName(String firstName) {
		ArrayList<Contact> contacts = new ArrayList<>();
		String query = "SELECT * FROM kontakti WHERE firstName = ? ORDER BY firstName";

		try (Connection con = DBConnection.connect(); 
				PreparedStatement prepStmnt = con.prepareStatement(query)) {
			prepStmnt.setString(1, firstName);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				while (rs.next()) {
					contacts.add(new Contact(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("username"), rs.getString("password"), rs.getString("phoneNumber"),
							rs.getString("address"), rs.getString("city"), rs.getInt("isAdmin")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contacts;
	}

	
	public ArrayList<Contact> findByLastName(String lastName) {
		ArrayList<Contact> contacts = new ArrayList<>();
		String query = "SELECT * FROM kontakti WHERE lastName = ?";

		try (Connection con = DBConnection.connect();
				PreparedStatement prepStmnt = con.prepareStatement(query)) {
			prepStmnt.setString(1, lastName);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				while (rs.next()) {
					contacts.add(new Contact(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("username"), rs.getString("password"), rs.getString("phoneNumber"),
							rs.getString("address"), rs.getString("city"), rs.getInt("isAdmin")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contacts;
	}


	public ArrayList<Contact> findByPhoneNumber(String phoneNumber) {
		ArrayList<Contact> contacts = new ArrayList<>();
		String query = "SELECT * FROM kontakti WHERE phoneNumber = ?";

		try (Connection con = DBConnection.connect();
				PreparedStatement prepStmnt = con.prepareStatement(query)) {
			prepStmnt.setString(1, phoneNumber);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				while (rs.next()) {
					contacts.add(new Contact(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("username"), rs.getString("password"), rs.getString("phoneNumber"),
							rs.getString("address"), rs.getString("city"), rs.getInt("isAdmin")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contacts;
	}

	
	public ArrayList<Contact> findByCity(String city) {
		ArrayList<Contact> contacts = new ArrayList<>();
		String query = "SELECT * FROM kontakti WHERE city = ? ORDER BY firstName";

		try (Connection con = DBConnection.connect();
				PreparedStatement prepStmnt = con.prepareStatement(query)) {
			prepStmnt.setString(1, city);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				while (rs.next()) {
					contacts.add(new Contact(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("username"), rs.getString("password"), rs.getString("phoneNumber"),
							rs.getString("address"), rs.getString("city"), rs.getInt("isAdmin")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contacts;
	}

	
	public Contact findById(int id) {
		String query = "SELECT * FROM kontakti WHERE id = ?";
		Contact contact = null;
		try (Connection conn = DBConnection.connect(); 
				PreparedStatement prepStmnt = conn.prepareStatement(query)) {

			prepStmnt.setInt(1, id);
			try (ResultSet rs = prepStmnt.executeQuery()) {
				if (rs.next()) {
					contact = new Contact();
					contact.setId(rs.getInt("id"));
					contact.setFirstName(rs.getString("firstName"));
					contact.setLastName(rs.getString("lastName"));
					contact.setUsername(rs.getString("username"));
					contact.setPassword(rs.getString("password"));
					contact.setPhoneNumber(rs.getString("phoneNumber"));
					contact.setAddress(rs.getString("address"));
					contact.setCity(rs.getString("city"));
					contact.setIsAdmin(rs.getInt("isAdmin"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contact;
	}
}