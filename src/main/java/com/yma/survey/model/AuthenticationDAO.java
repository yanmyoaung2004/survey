package com.yma.survey.model;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.hostmdy.expense.crypto.PasswordEncoder;
import com.hostmdy.expense.crypto.PasswordValidator;

public class AuthenticationDAO {
	private Connection connection;
	private Statement statement;
	private ResultSet rs;
	private PreparedStatement pStmt;
	private DataSource dataSource;

	public AuthenticationDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	private void closeConnection() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean createUser(User user) {
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
			pStmt.setString(1, user.getUsername());
			pStmt.setString(2, user.getEmail());
			try {
				pStmt.setString(3, PasswordEncoder.encode(user.getPassword()));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int rowAffected = pStmt.executeUpdate();
			if (rowAffected > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return false;
	}

	public User authenticateUser(User user) {
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery("SELECT * FROM users WHERE email = '" + user.getEmail() + "' AND password ='"
					+ user.getPassword() + "';");
			if (rs.next()) {
				return new User(rs.getLong("user_id"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("creation_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean isAuthenticated(String email, String password) {
		User user = getUserByEmail(email);
		
		try {
			if(user != null  && PasswordValidator.validatePassword(password, user.getPassword()) ) 
				return true;
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public User getUserByEmail(String email) {
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery("SELECT * FROM users WHERE email = '" + email + "';");
			if (rs.next()) {
				return new User(rs.getLong("user_id"), rs.getString("username"), rs.getString("email"), rs.getString("password"), rs.getString("creation_date"));			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
