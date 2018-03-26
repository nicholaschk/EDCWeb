package com.sdm.edc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String convertDateToString(String aMask, Date date) {
		SimpleDateFormat df = null;
		String dateStr = null;
		df = new SimpleDateFormat(aMask);
		dateStr = df.format(date);
		return (dateStr);
	}
	
	public static Date convertStringToDate(String aMask, String strDate) {
		SimpleDateFormat df = null;
		Date date = null;
		df = new SimpleDateFormat(aMask);

		try{
			date = df.parse(strDate);
			return (date);
		}catch (ParseException pe){
			return getDefaultDate();
		}
	}
	
	public static Date getDefaultDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date df = sdf.parse("1900-01-01");
			return df;
		} catch (Exception ex) {
			return null;
		}
	}
}
