package com.yma.survey.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Survey {
	private Long surveyId;
	private String title;
	private String description;
	private User user;
	private Category category;
	private boolean isPublic;
	private String creationDate;
	private LocalDateTime endDate;
	private LocalDateTime startDate;
	private boolean isActive;
	private int noOfPeopleCompleted;
	private boolean surveyStarted;
	private boolean completedByCurrentUser;

	private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	public Survey(Long surveyId, String title, String description, User user, Category category, boolean isPublic,
			String creationDate, String startDate, String endDate) {
		this.surveyId = surveyId;
		this.title = title;
		this.description = description;
		this.user = user;
		this.category = category;
		this.isPublic = isPublic;
		this.creationDate = creationDate;
		this.startDate = LocalDateTime.parse(startDate, FORMATTER);
		this.endDate = LocalDateTime.parse(endDate, FORMATTER);
		this.isActive = LocalDateTime.now().isBefore(this.endDate);
		this.surveyStarted = LocalDateTime.now().isAfter(this.startDate);
	}

	public Survey(String title, String description, User user, Category category, boolean isPublic, String startDate,
			String endDate) {
		this(null, title, description, user, category, isPublic, null, endDate, startDate);
	}

	public Long getSurveyId() {
		return surveyId;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public User getUser() {
		return user;
	}

	public Category getCategory() {
		return category;
	}

	public boolean getIsPublic() {
		return isPublic;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public LocalDateTime getEndDate() {
		return endDate;
	}

	public LocalDateTime getStartDate() {
		return startDate;
	}

	public boolean getIsActive() {
		return isActive;
	}

	public int getNoOfPeopleCompleted() {
		return noOfPeopleCompleted;
	}

	public void setNoOfPeopleCompleted(int noOfPeopleCompleted) {
		this.noOfPeopleCompleted = noOfPeopleCompleted;
	}

	public boolean isSurveyStarted() {
		return surveyStarted;
	}

	public void setSurveyStarted(boolean isSurveyStarted) {
		this.surveyStarted = isSurveyStarted;
	}

	public static DateTimeFormatter getFormatter() {
		return FORMATTER;
	}

	public void setSurveyId(Long surveyId) {
		this.surveyId = surveyId;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}

	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public boolean isCompletedByCurrentUser() {
		return completedByCurrentUser;
	}

	public void setCompletedByCurrentUser(boolean isCompletedByCurrentUser) {
		this.completedByCurrentUser = isCompletedByCurrentUser;
	}
	
	
	
	

}
