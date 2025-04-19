package util;
import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.*;
import util.HibernateConnection;

public class AssisgnTeacherDB {

	public AssisgnTeacherDB() {
		// TODO Auto-generated constructor stub
	}

	public teacher ShowNameTeacher(int id, String semest) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    teacher teacher = null;
	    String sql = "SELECT t.teachername, t.teacherlastname FROM teacher t inner join assignsupervision a on t.teacherid = a.teacherid where a.companyid = ? AND a.semester = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        pstmt.setString(2, semest);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {

	            String teachername = rs.getString(1);
	        	String teacherlastname = rs.getString(2);
	            

	        	teacher = new teacher(teachername,teacherlastname); 
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return teacher;
	}
	
	public Assignsupervision CheckCompany(int id, String semest) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    Assignsupervision as = null;
	    String sql = "SELECT * FROM assignsupervision WHERE companyid = ? AND semester = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        pstmt.setString(2, semest);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	String companyid = rs.getString("companyid");
	            String teacherid = rs.getString("teacherid");
	            String semester = rs.getString("semester");
	            String date = rs.getString("date");
	            String time = rs.getString("time");
	            String methods = rs.getString("methods");
	            String status = rs.getString("status");
	            
	            

	            as = new Assignsupervision(companyid,teacherid,semester,date, time, methods,status);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return as;
	}
	
	
	public Assignsupervision CheckDateTime(String Date, String Time , String Teacherid) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    Assignsupervision as = null;
	    String sql = "SELECT * FROM assignsupervision WHERE date = ? AND time = ? AND teacherid = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, Date);
	        pstmt.setString(2, Time);
	        pstmt.setString(3, Teacherid);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	String companyid = rs.getString("companyid");
	            String teacherid = rs.getString("teacherid");
	            String semester = rs.getString("semester");
	            String date = rs.getString("date");
	            String time = rs.getString("time");
	            String methods = rs.getString("methods");
	            String status = rs.getString("status");
	            
	            

	            as = new Assignsupervision(companyid,teacherid,semester,date, time, methods,status);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return as;
	}
	
	public List<Assignsupervision> CheckDate(String Date, String Teacherid) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<Assignsupervision> ListAs = new ArrayList<>();
	    String sql = "SELECT * FROM assignsupervision WHERE date = ? AND teacherid = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, Date);
	        pstmt.setString(2, Teacherid);
	        System.out.println("CheckDateParameter="+Date);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	String companyid = rs.getString("companyid");
	            String teacherid = rs.getString("teacherid");
	            String semester = rs.getString("semester");
	            String date = rs.getString("date");
	            String time = rs.getString("time");
	            String methods = rs.getString("methods");
	            String status = rs.getString("status");
	            
	            

	            Assignsupervision as = new Assignsupervision(companyid,teacherid,semester,date, time, methods,status);
	             
	            ListAs.add(as);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ListAs;
	}
	
	public List<Assignsupervision> SearchAssignALL(){
		
		List<Assignsupervision> ListAs = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM assignsupervision";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				String companyid = rs.getString("companyid");
	            String teacherid = rs.getString("teacherid");
	            String semester = rs.getString("semester");
	            String date = rs.getString("date");
	            String time = rs.getString("time");
	            String methods = rs.getString("methods");
	            String status = rs.getString("status");
	            
	            

	            Assignsupervision as = new Assignsupervision(companyid,teacherid,semester,date, time, methods,status);
				ListAs.add(as);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ListAs;
		
	}
	
	
	public List<Assignsupervision> SearchAssignSemester(String smt) {
	    List<Assignsupervision> ListAs = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    String sql = "SELECT * FROM assignsupervision WHERE semester LIKE ? ORDER BY date";

	    try {
	        PreparedStatement stmt = con.prepareStatement(sql);
//	        stmt.setString(1, "%" + smt + "%");
	        stmt.setString(1, "%" + smt.trim() + "%");//ระบบเดิมมีช่่องว่างระบบเทอมทำให้หาไม่เจอ 
//	        System.out.println("Prepared SQL: " + stmt.toString());
//	        System.out.println("Input semester: " + smt);

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	        	String companyid = rs.getString("companyid");
	            String teacherid = rs.getString("teacherid");
	            String semester = rs.getString("semester");
	            String date = rs.getString("date");
	            String time = rs.getString("time");
	            String methods = rs.getString("methods");
	            String status = rs.getString("status");
	            
	            

	            Assignsupervision as = new Assignsupervision(companyid,teacherid,semester,date, time, methods,status);
	            ListAs.add(as);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ListAs;
	}

	
	public Assignsupervision assignsupervisionBycomidAndsemester(int id, String semest) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    Assignsupervision as = null;
	    String sql = "SELECT * FROM assignsupervision WHERE companyid = ? AND semester = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        pstmt.setString(2, semest);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	String companyid = rs.getString("companyid");
	            String teacherid = rs.getString("teacherid");
	            String semester = rs.getString("semester");
	            String date = rs.getString("date");
	            String time = rs.getString("time");
	            String methods = rs.getString("methods");
	            String status = rs.getString("status");
	                 
	            String convertDate = convertDate(date); 

	            as =  new Assignsupervision(companyid,teacherid,semester,convertDate, time, methods,status);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return as;
	}
	
	public static String convertDate(String inputDate) {
        try {
            // Define input and output formats
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

            // Parse the input date
            Date date = inputFormat.parse(inputDate);

            // Use Calendar to handle year manipulation
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);

            // Convert BE year to AD year
            int yearBe = calendar.get(Calendar.YEAR);
            int yearAd = yearBe;

            // Set the AD year back to the Calendar instance
            calendar.set(Calendar.YEAR, yearAd);

            // Format the date to yyyy-MM-dd
            return outputFormat.format(calendar.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return ""; // Return empty string if parsing fails
        }
    }
	


}
