package util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.*;
import util.HibernateConnection;


public class ListmentorDB {
	public ListmentorDB() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Mentor> AllListmentor(String id){
		List<Mentor> listMentor = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select mentorid,mentorprefix,mentorname,mentorlastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password FROM mentor INNER JOIN mentor_student ON mentor_student.mentor_mentorid = mentor.mentorid where mentor_student.student_studentid = '"+id+"';";
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
				
				
				Mentor mentor = new Mentor(mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password);
				listMentor.add(mentor);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listMentor;
		
	}
	
	public List<Mentor> AllListmentorManage(String Semester){
		List<Mentor> listMentor = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select DISTINCT m.mentorid,m.mentorprefix,m.mentorname,m.mentorlastname,m.mentornickname,m.mentorposition,m.metoremail,m.mentorline,m.mentorfacebook,m.phonenumber,m.mentorimg,m.password from mentor m inner join mentor_student ms on m.mentorid = ms.mentor_mentorid inner join student s on ms.student_studentid = s.studentid where s.semester like '%"+Semester+"%'";
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
				
				
				Mentor mentor = new Mentor(mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password);
				listMentor.add(mentor);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listMentor;
		
	}
	
	public List<Mentor> SearchAllListmentorManage(String Semester,String Name){
		List<Mentor> listMentor = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select DISTINCT m.mentorid,m.mentorprefix,m.mentorname,m.mentorlastname,m.mentornickname,m.mentorposition,m.metoremail,m.mentorline,m.mentorfacebook,m.phonenumber,m.mentorimg,m.password from mentor m inner join mentor_student ms on m.mentorid = ms.mentor_mentorid inner join student s on ms.student_studentid = s.studentid where s.semester like '%"+Semester+"%' and m.mentorname like '%"+Name+"%'";
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
				
				
				Mentor mentor = new Mentor(mentorid,mentorprefix,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password);
				listMentor.add(mentor);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listMentor;
		
	}
	
	public List<Mentor> AllListmentorNOstudentManage() {
	    List<Mentor> listMentor = new ArrayList<>();
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        Statement stmt = con.createStatement();
	        // ใช้ LEFT JOIN เพื่อเช็ค mentor ที่ไม่มีใน mentor_student
	        String sql = "SELECT DISTINCT m.mentorid, m.mentorprefix, m.mentorname, m.mentorlastname, " +
	                     "m.mentornickname, m.mentorposition, m.metoremail, m.mentorline, " +
	                     "m.mentorfacebook, m.phonenumber, m.mentorimg, m.password " +
	                     "FROM mentor m " +
	                     "LEFT JOIN mentor_student ms ON m.mentorid = ms.mentor_mentorid " +
	                     "LEFT JOIN student s ON ms.student_studentid = s.studentid " +
	                     "WHERE ms.mentor_mentorid IS NULL ";

	        ResultSet rs = stmt.executeQuery(sql);
	        while (rs.next()) {
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

	            Mentor mentor = new Mentor(mentorid, mentorprefix, mentorname, lastname, mentornickname, mentorposition, metoremail, mentorline, mentorfacebook, phonenumber, mentorimg, password);
	            listMentor.add(mentor);
	        }
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return listMentor;
	}

	
	public List<mentor_student> Listmentor_studentByid(int mid){
		List<mentor_student> listmentor_student = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentor_student where mentor_mentorid = "+mid+" ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int mentor_mentorid = rs.getInt(1);
				String student_studentid = rs.getString(2);
				
				
				mentor_student mentor_student = new mentor_student(mentor_mentorid,student_studentid);
				listmentor_student.add(mentor_student);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listmentor_student;
		
	}
	
	public List<mentor_student> Listmentor_studentBystudentid(String sid){
		List<mentor_student> listmentor_student = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentor_student where student_studentid = "+sid+" ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int mentor_mentorid = rs.getInt(1);
				String student_studentid = rs.getString(2);
				
				
				mentor_student mentor_student = new mentor_student(mentor_mentorid,student_studentid);
				listmentor_student.add(mentor_student);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listmentor_student;
		
	}
	
	
	
	public int deletmentor(String id,String stuID){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "delete from mentor_student where  mentor_mentorid = '"+id+"' and student_studentid = '"+stuID+"'";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
			}
			
		catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;		
		
	}
	
	public int deleteMentorForTeacherCASCADE(String id) {
	    ConnectionDB condb = new ConnectionDB();
	    Connection con = condb.getConnection();
	    try {
	        Statement stmt = con.createStatement();
	        // Delete from mentor table only
	        String sql = "DELETE FROM mentor WHERE mentorid = '" + id + "'";
	        int result = stmt.executeUpdate(sql);
	        con.close();
	        return result;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1; // Indicate an error
	}

	
	public int deletementornothavestu(String id){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "delete from mentor where mentorid = '"+id+"'";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
			}
			
		catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;		
		
	}
	
	
}
