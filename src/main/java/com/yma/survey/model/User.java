package com.yma.survey.model;

public class User {
	private Long id;
	private String username;
	private String email;
	private String password;
	private String creationDate;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(Long id, String username, String email, String password, String creationDate) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.creationDate = creationDate;
	}

	public User(String username, String email, String password) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
	}
	
	public User(Long id, String username) {
		this.id = id;
		this.username = username;
	}
	
	public User(Long id) {
		this(id, null);
	}
	
	public User( String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getCreationDate() {
		return creationDate;
	}
	
	

}
