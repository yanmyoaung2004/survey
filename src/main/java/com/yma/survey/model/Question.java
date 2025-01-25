package com.yma.survey.model;

import java.util.List;

public class Question {
	private Long questionId;
	private String question;
	private Long surveyId;
	private String questionType;
	private List<String> answers;

	public Question(Long questionId, String question, Long surveyId, String questionType, List<String> answers) {
		super();
		this.questionId = questionId;
		this.question = question;
		this.surveyId = surveyId;
		this.questionType = questionType;
		this.answers = answers;
	}

	public Question(String question, Long surveyId, String questionType, List<String> answers) {
		this(null, question, surveyId, questionType, answers);
	}
	
	public Question(Long questionId, String question, String questionType, List<String> answers) {
		this(questionId, question, null, questionType, answers);
	}
	
	public Question(Long questionId) {
		this(questionId, null, null, null);
	}
	

	public Long getQuestionId() {
		return questionId;
	}

	public String getQuestion() {
		return question;
	}

	public Long getSurveyId() {
		return surveyId;
	}

	public String getQuestionType() {
		return questionType;
	}
	public List<String> getAnswers(){
		return answers;
	}

}
