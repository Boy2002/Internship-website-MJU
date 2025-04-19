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

public class EditmentorDB {

	public EditmentorDB() {
		// TODO Auto-generated constructor stub
	}


public Mentor SearchMentorid (int id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Mentor mentor = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentor where mentorid = "+id+"";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int mentorid = rs.getInt(1);
				String mentorprefix = rs.getString(2);
				String mentorname = rs.getString(3);
				String lastname = rs.getString(4);	
				String mentornickname = rs.getString(5);
				String mentorposition = rs.getString(6);
				String metoremail = rs.getString(7);
				String mentorline = rs.getString(8);
				String mentorfacebook = rs.getString(9);
				String phonenumber = rs.getString(10);
				String mentorimg = rs.getString(11);	
				String password = rs.getString(12);	
				
				
				mentor = new Mentor(mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password);
		
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mentor;
		
	}

public mentor_student getmentor_studentByMentorid (int id){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	mentor_student mentor_student = null;
	try {
		Statement stmt = con.createStatement();
		String sql = "select * from mentor_student where mentor_mentorid = "+id+"";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			
			int mentor_mentorid = rs.getInt(1);
			String student_studentid = rs.getString(2);
			
			
			mentor_student = new mentor_student(mentor_mentorid,student_studentid);
	
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return mentor_student;
	
}

public int UPDATEMentor(Mentor mentor) {
    ConnectionDB dbcon = new ConnectionDB();
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = dbcon.getConnection();
        
        String sql = "UPDATE mentor SET mentorprefix = ?, mentorname = ?, mentorlastname = ?, mentornickname = ?, "
                   + "mentorposition = ?, metoremail = ?, mentorline = ?, mentorfacebook = ?, "
                   + "phonenumber = ?, mentorimg = ?, password = ?, keypass = ? WHERE mentorid = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mentor.getMentorprefix());
        pstmt.setString(2, mentor.getMentorname());
        pstmt.setString(3, mentor.getMentorlastname());
        pstmt.setString(4, mentor.getMentornickname());
        pstmt.setString(5, mentor.getMentorposition());
        pstmt.setString(6, mentor.getMetoremail());
        pstmt.setString(7, mentor.getMentorline());
        pstmt.setString(8, mentor.getMentorfacebook());
        pstmt.setString(9, mentor.getPhonenumber());
        pstmt.setString(10, mentor.getMentorimg());
        pstmt.setString(11, mentor.getPassword());
        pstmt.setString(12, mentor.getKeypass());
        pstmt.setInt(13, mentor.getMentorid());

        // Execute the update
        int affectedRows = pstmt.executeUpdate();
        return affectedRows; // return the number of affected rows
    } catch (SQLException e) {
        e.printStackTrace(); // print the stack trace for debugging
        return -1; // return -1 for an error
    } finally {
        // Close resources in the finally block to avoid resource leaks
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

public int UPDATEMentornotpassword(Mentor mentor) {
    ConnectionDB dbcon = new ConnectionDB();
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = dbcon.getConnection();
        
        String sql = "UPDATE mentor SET mentorprefix = ?, mentorname = ?, mentorlastname = ?, mentornickname = ?, "
                   + "mentorposition = ?, metoremail = ?, mentorline = ?, mentorfacebook = ?, "
                   + "phonenumber = ?, mentorimg = ? WHERE mentorid = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mentor.getMentorprefix());
        pstmt.setString(2, mentor.getMentorname());
        pstmt.setString(3, mentor.getMentorlastname());
        pstmt.setString(4, mentor.getMentornickname());
        pstmt.setString(5, mentor.getMentorposition());
        pstmt.setString(6, mentor.getMetoremail());
        pstmt.setString(7, mentor.getMentorline());
        pstmt.setString(8, mentor.getMentorfacebook());
        pstmt.setString(9, mentor.getPhonenumber());
        pstmt.setString(10, mentor.getMentorimg());
        pstmt.setInt(11, mentor.getMentorid());

        // Execute the update
        int affectedRows = pstmt.executeUpdate();
        return affectedRows; // return the number of affected rows
    } catch (SQLException e) {
        e.printStackTrace(); // print the stack trace for debugging
        return -1; // return -1 for an error
    } finally {
        // Close resources in the finally block to avoid resource leaks
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

	
	public int UPDATEMentorED(Mentor mentor,Mentor mentorT)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE mentor SET mentorprefix = '"+mentor.getMentorprefix()+"' ,mentorname = '"+mentor.getMentorname()+"',mentorlastname ='"+mentor.getMentorlastname()+"',mentornickname ='"+mentor.getMentornickname()+"',mentorposition ='"+mentor.getMentorposition()+"',metoremail ='"+mentor.getMetoremail()+"',mentorline ='"+mentor.getMentorline()+"',mentorfacebook ='"+mentor.getMentorfacebook()+"',phonenumber = '"+mentor.getPhonenumber()+"',mentorimg = '"+mentor.getMentorimg()+"',password = '"+mentor.getPassword()+"',keypass = '"+mentor.getKeypass()+"' WHERE mentorid = '"+mentorT.getMentorid()+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	

	
}
