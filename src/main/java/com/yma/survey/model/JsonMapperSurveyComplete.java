package com.yma.survey.model;

import java.util.List;

public class JsonMapperSurveyComplete {
	private Long userId;
	private List<Question> questions;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

}
