package com.model;

public class userVO {
	private int id;
	private String name;
	private String email;
	private String role;
	
	private int attemptedExams;

	// Getter and Setter
	public int getAttemptedExams() {
	    return attemptedExams;
	}

	public void setAttemptedExams(int attemptedExams) {
	    this.attemptedExams = attemptedExams;
	}

	

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getRole() {
		return role;
	}
	
	
	
	
}
