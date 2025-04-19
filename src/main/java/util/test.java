package util;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.Date;

public class test {

	public static void main(String[] args) {
//		addTeacherDB at = new addTeacherDB();
//		
//		System.out.println("max teacher"+at.getMaxTeacher());
		 Calendar cal = Calendar.getInstance();
	        int year = cal.get(Calendar.YEAR);
	        int month = cal.get(Calendar.MONTH) + 1;
	        int day = cal.get(Calendar.DAY_OF_MONTH) - 1;
	        int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	        
	        for (int i = day; i < daysInMonth; i++) {
	            day += 1;
	            String formattedDay = String.format("%02d", day);
	            String formattedMonth = String.format("%02d", month);
	            System.out.println(formattedDay + "/" + formattedMonth + "/" + year);    
	        }
	    }

	}


