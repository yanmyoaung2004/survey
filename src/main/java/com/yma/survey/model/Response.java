package com.yma.survey.model;

public class Response {
	private Long responseId;
	private User user;
	private Question question;
	private Long optionId;
	private String responseText;
	private String responseDate;

	public Response(Long responseId, User user, Question question, Long optionId, String responseText,
			String responseDate) {
		super();
		this.responseId = responseId;
		this.user = user;
		this.question = question;
		this.optionId = optionId;
		this.responseText = responseText;
		this.responseDate = responseDate;
	}

	public Response(User user, Question question, Long optionId, String responseText) {
		this(null, user, question, optionId, responseText, null);
	}

	public Long getResponseId() {
		return responseId;
	}

	public void setResponseId(Long responseId) {
		this.responseId = responseId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Long getOptionId() {
		return optionId;
	}

	public void setOptionId(Long optionId) {
		this.optionId = optionId;
	}

	public String getResponseText() {
		return responseText;
	}

	public void setResponseText(String responseText) {
		this.responseText = responseText;
	}

	public String getResponseDate() {
		return responseDate;
	}

	public void setResponseDate(String responseDate) {
		this.responseDate = responseDate;
	}

}
