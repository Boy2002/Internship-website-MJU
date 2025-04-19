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

public class LoginbyStudentDB {

	public LoginbyStudentDB() {
		// TODO Auto-generated constructor stub
	}



	public Student verifyLoginSTU(Student stu){
		Student s = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from student where studentid = '"+stu.getIdstudent()+"' and password = '"+stu.getPassword()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 String idstudent = rs.getString(1);
				 String studentname = rs.getString(2);
				 String studentlastname = rs.getString(3);
				 String password = rs.getString(4);
				 String workposition = rs.getString(5);
				 Date startdate = rs.getDate(6);
			     Date enddate = rs.getDate(7);
				 String semester = rs.getString(8);
				 int Teacher_teacherid = rs.getInt(9);
				 int Company_companyid = rs.getInt(10);
			
				
				s= new Student (idstudent,studentname,studentlastname,password,workposition,startdate,enddate,semester,Teacher_teacherid,Company_companyid);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	

	
	public teacher verifyLoginTC(teacher Teacher){
		teacher TC = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacher where teacheremail = '"+Teacher.getTeacheremail()+"' and password = '"+Teacher.getPassword()+"' and (status like 'อยู่' or status like 'กำลังศึกษาต่อ' )";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int teacherid = rs.getInt(1);
				 String teachername = rs.getString(2);
				 String teacherlastname = rs.getString(3);
				 String phonenumber = rs.getString(4);
				 String teacheremail = rs.getString(5);			 
				 String password = rs.getString(6);
				 String teachertype = rs.getString(7);
				 String teacherimg = rs.getString(8);
				 String status = rs.getString(9);
				
				TC = new teacher (teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return TC;
	}
	
	public teacher verifyLoginTCByEmail(teacher Teacher){
		teacher TC = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacher where teacheremail = '"+Teacher.getTeacheremail()+"' and (status like 'อยู่' or status like 'กำลังศึกษาต่อ' )";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int teacherid = rs.getInt(1);
				 String teachername = rs.getString(2);
				 String teacherlastname = rs.getString(3);
				 String phonenumber = rs.getString(4);
				 String teacheremail = rs.getString(5);			 
				 String password = rs.getString(6);
				 String teachertype = rs.getString(7);
				 String teacherimg = rs.getString(8);
				 String status = rs.getString(9);
				
				TC = new teacher (teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return TC;
	}
	
	
	public teacher verifyLoginNameTC(teacher Teacher){
		teacher TC = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacher where teacheremail = '"+Teacher.getTeacheremail()+"' and (status like 'อยู่' or status like 'กำลังศึกษาต่อ' )";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next() && rs.getRow()==1 ) {
				
				 int teacherid = rs.getInt(1);
				 String teachername = rs.getString(2);
				 String teacherlastname = rs.getString(3);
				 String phonenumber = rs.getString(4);
				 String teacheremail = rs.getString(5);			 
				 String password = rs.getString(6);
				 String teachertype = rs.getString(7);
				 String teacherimg = rs.getString(8);
				 String status = rs.getString(9);
				
				TC = new teacher (teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return TC;
	}
	
	//---------------------------------------Mentor
		public Mentor verifyLoginMentor(Mentor mentor){
			Mentor MT = null;
			ConnectionDB condb = new ConnectionDB();
			Connection con = condb.getConnection();
			try {
				Statement stmt = con.createStatement();
				String sql = "select * from mentor where metoremail = '"+mentor.getMetoremail()+"' and password = '"+mentor.getPassword()+"'";
				ResultSet rs = stmt.executeQuery(sql);
				
				if(rs.next() && rs.getRow()==1 ) {
					
					 int mentorid = rs.getInt(1);
					 String mentorprefix = rs.getString(2);
					 String mentorname = rs.getString(3);
					 String mentorlastname = rs.getString(4);
					 String mentornickname = rs.getString(5);
					 String mentorposition = rs.getString(6);
					 String mentoremail = rs.getString(7);	
					 String mentorline= rs.getString(8);	
					 String mentorfacebook = rs.getString(9);	
					 String phonenumber = rs.getString(10);
					 String mentorimg = rs.getString(11);		 
					 String password = rs.getString(12);
					 
					 
					 
					
					MT = new Mentor (mentorid,mentorprefix,mentorname,mentorlastname,mentornickname,mentorposition,mentoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password);
				}
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return MT;
			
		}
		
		public Mentor verifyLoginNameMT(Mentor mt){
			Mentor MT = null ;
			ConnectionDB condb = new ConnectionDB();
			Connection con = condb.getConnection();
			try {
				Statement stmt = con.createStatement();
				String sql = "select * from mentor where metoremail = '"+mt.getMetoremail()+"' ";
				ResultSet rs = stmt.executeQuery(sql);
				
				if(rs.next() && rs.getRow()==1 ) {
					
	 
					int mentorid = rs.getInt(1);
					String mentorprefix = rs.getString(2);
					String mentorname = rs.getString(3);
					String mentorlastname = rs.getString(4);
					String mentornickname = rs.getString(5);
					String mentorposition = rs.getString(6);
					String metoremail = rs.getString(7);
					String mentorline = rs.getString(8);
					String mentorfacebook = rs.getString(9);
					String phonenumber = rs.getString(10);
					String mentorimg = rs.getString(11);
					String password = rs.getString(12);
					
					MT = new Mentor (mentorid,mentorprefix,mentorname,mentorlastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,password);
				}
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return MT;
		}



		public String getEncryptedPasswordByUsername(String uname) {
		    String password = "";
		    ConnectionDB condb = new ConnectionDB();
		    Connection con = condb.getConnection();
		    
		    // ใช้ try-with-resources เพื่อจัดการการปิด Connection, Statement และ ResultSet
		    String sql = "SELECT password FROM mentor WHERE metoremail = ?";
		    
		    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setString(1, uname); // กำหนดค่าใน PreparedStatement
		        try (ResultSet rs = pstmt.executeQuery()) {
		            if (rs.next()) { // เช็คว่ามีแถวใน ResultSet หรือไม่
		                password = rs.getString("password");
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return password;
		}
		
		public String getEncryptedKeyByUsername(String uname) {
		    String key = "";
		    ConnectionDB condb = new ConnectionDB();
		    Connection con = condb.getConnection();
		    
		    // ใช้ try-with-resources เพื่อจัดการการปิด Connection, Statement และ ResultSet
		    String sql = "SELECT keypass FROM mentor WHERE metoremail = ?";
		    
		    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setString(1, uname); // กำหนดค่าใน PreparedStatement
		        try (ResultSet rs = pstmt.executeQuery()) {
		            if (rs.next()) { // เช็คว่ามีแถวใน ResultSet หรือไม่
		                key = rs.getString("keypass");
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return key;
		}

		
		
	
}
