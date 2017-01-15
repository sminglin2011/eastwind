package com.web.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateFormat {

	public static Date stringToDate(String str) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return new Date(dateFormat.parse(str).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
