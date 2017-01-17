package com.web.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DataFormat {

	public static Date stringToDate(String str) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return new Date(dateFormat.parse(str).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean isNull(String str) {
		if (str == null || str.equals(""))
		return true;
		else return false;
	}
	
}
