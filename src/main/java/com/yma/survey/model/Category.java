package com.yma.survey.model;

public class Category {
	private Long categoryId;
	private String categoryName;

	public Category() {
		// TODO Auto-generated constructor stub
	}
	
	public Category(Long categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	public Category(Long categoryId) {
		super();
		this.categoryId = categoryId;
	}

	public Category(String categoryName) {
		super();

		this.categoryName = categoryName;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

}
