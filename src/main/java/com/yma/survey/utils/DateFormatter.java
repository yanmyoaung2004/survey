package com.yma.survey.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {
	
	public static String formatToCustom(String inputDate) throws Exception {
		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = inputFormat.parse(inputDate);
		SimpleDateFormat outputFormat = new SimpleDateFormat("MMM dd, yyyy");
		return outputFormat.format(date);
	}

	public static String formatToOriginal(String inputDate) throws Exception {
		SimpleDateFormat inputFormat = new SimpleDateFormat("MMM dd, yyyy");
		Date date = inputFormat.parse(inputDate);
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return outputFormat.format(date);
	}


}
