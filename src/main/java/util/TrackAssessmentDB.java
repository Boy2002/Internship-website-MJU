package util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.*;
import util.HibernateConnection;

public class TrackAssessmentDB {

	public TrackAssessmentDB() {
		// TODO Auto-generated constructor stub
	}

	public List<mentoranswer> ListmentoranswerByStuid(String stuid) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<mentoranswer> Listma = new ArrayList<>();
	    String sql = "SELECT * FROM mentoranswer WHERE studentid_ans = ?; ";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, stuid);
	        System.out.println("TrackAssessmentMentor studentid_ans ="+stuid);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
				 
				 int mentorformid_ans = rs.getInt(1); 
				 int questionid_ans = rs.getInt(2); 
				 int mentorid_ans = rs.getInt(3); 
				 String studentid_ans = rs.getString(4); 
				 String mentoranswertext = rs.getString(5);
				 Double score = rs.getDouble(6);
			
				
				 mentoranswer ma = new mentoranswer (mentorformid_ans,questionid_ans,mentorid_ans,studentid_ans,mentoranswertext,score);
			     Listma.add(ma);
	        
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return Listma;
	}
	
	public List<teacheranswer> ListteacheranswerByStuid(String stuid) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    List<teacheranswer> Listta = new ArrayList<>();
	    String sql = "SELECT * FROM teacheranswer WHERE studentid_answer = ?; ";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, stuid);
	        System.out.println("TrackAssessmentTeacher studentid_answer ="+stuid);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {			 
				 
					int teacherformid_answer = rs.getInt(1);
					int questionid_answer = rs.getInt(2); 
					int teacherid_answer = rs.getInt(3);
					String studentid_answer = rs.getString(4);
					String teacheranswertext = rs.getString(5);
					Double score = rs.getDouble(6);
			
				
					teacheranswer ta = new teacheranswer (teacherformid_answer,questionid_answer,teacherid_answer,studentid_answer,teacheranswertext,score);
			     Listta.add(ta);
	        
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return Listta;
	}
	

	   

}
