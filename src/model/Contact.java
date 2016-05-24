package model;


public class Contact {
	/* Data fields */
	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private String phoneNumber;
	private String address;
	private String city;
	private int isAdmin;
	
	/**
	 * no-arg constructor
	 */
	public Contact() {
		
	}
	
	/* Constructor for registration new contacts */
	public Contact(String firstName, String lastName, String username, String password, String phoneNumber, String address, String city) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.city = city;
		this.isAdmin = 0; // default is zero (not administrator)
	}
	
	/* Consructor for database */
	public Contact(int id, String firstName, String lastName, String username, String password, String phoneNumber, String address, String city, int isAdmin) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.city = city;
		this.isAdmin = isAdmin;
	}

	/* ------------- Getters and setters --------------- */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	/* for activity log purpose */
	@Override
	public String toString() {
		return "\nID: " + id +
				"\nFirst Name: " + firstName +
				"\nLast Name: " + lastName +
				"\nUsername: " + username +
				"\nPassword: " + password +
				"\nPhone: " + phoneNumber +
				"\nAddress: " + address + 
				"\nCity: " + city +
				"\nRole: " + (isAdmin == 0 ? "User" : "Admin");
	}
}