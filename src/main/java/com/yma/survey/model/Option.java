package com.yma.survey.model;

public class Option {
	private Long optionId;
	private String optionText;
	private Double dataPercentage;
	private int count;

	public Option(Long optionId, String optionText, Double dataPercentage, int count) {
		super();
		this.optionId = optionId;
		this.optionText = optionText;
		this.dataPercentage = dataPercentage;
		this.count = count;
	}

	public Long getOptionId() {
		return optionId;
	}

	public void setOptionId(Long optionId) {
		this.optionId = optionId;
	}

	public String getOptionText() {
		return optionText;
	}

	public void setOptionText(String optionText) {
		this.optionText = optionText;
	}

	public Double getDataPercentage() {
		return dataPercentage;
	}

	public void setDataPercentage(Double dataPercentage) {
		this.dataPercentage = dataPercentage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}