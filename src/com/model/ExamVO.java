package com.model;

public class ExamVO {
	private int id;
    private String title;
    private int duration;
    private int total_questions;
    private int added_questions;
    
	public int getAdded_questions() {
		return added_questions;
	}

	public void setAdded_questions(int added_questions) {
		this.added_questions = added_questions;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getTotal_questions() {
		return total_questions;
	}
	public void setTotal_questions(int total_questions) {
		this.total_questions = total_questions;
	}
}
