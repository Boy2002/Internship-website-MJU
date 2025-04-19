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

public class EditStudentProfileDB {

	public EditStudentProfileDB() {
		// TODO Auto-generated constructor stub
	}


public Company Searchcompanyid (int id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Company company = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from company where companyid = "+id+"";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				int companyid = rs.getInt(1);
				String companyname = rs.getString(2);
				String companyaddress = rs.getString(3);
				String coordinatorname = rs.getString(4);
				String phonenumber = rs.getString(5);
				String email = rs.getString(6);
				String website = rs.getString(7);
				String facebook = rs.getString(8);
				double average = rs.getDouble(9);
				
				company = new Company(companyid,companyname,companyaddress,coordinatorname,phonenumber,email,website,facebook,average);
		
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return company;
		
	}

	public int UPDATEStudent(Student stu)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE student SET studentname = '"+stu.getStudentname()+"',studentlastname = '"+stu.getStudentlastname()+"',password ='"+stu.getPassword()+"',workposition = '"+stu.getWorkposition()+"' WHERE studentid = '"+stu.getIdstudent()+"'"); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	

	
	public Student verifySTU(String stuid){
		Student s = null ;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from student where studentid = '"+stuid+"'";
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
	
	
}
