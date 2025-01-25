package com.yma.survey.model;

import java.util.ArrayList;

public class ResponseResult {
	private Long questionId;
	private String question;
	private String questionType;
	private ArrayList<Option> options;

	public ResponseResult(Long questionId, String question, String questionType,  ArrayList<Option> options) {
		super();
		this.questionId = questionId;
		this.question = question;
		this.options = options;
		this.questionType = questionType;
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public ArrayList<Option> getOptions() {
		return options;
	}

	public void setOptions(ArrayList<Option> options) {
		this.options = options;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	
	

}


