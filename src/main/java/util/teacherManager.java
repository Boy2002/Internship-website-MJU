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

public class teacherManager {

	public teacherManager() {
		// TODO Auto-generated constructor stub
	}

	
public teacher Searchteacherid (int id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		teacher teacher = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from teacher where teacherid = "+id+"";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				int teacherid = rs.getInt(1);
				String teachername = rs.getString(2);
				String teacherlastname = rs.getString(3);
				String phonenumber = rs.getString(4);
				String teacheremail = rs.getString(5);
				String password = rs.getString(6);
				String teachertype = rs.getString(7);
				String teacherimg = rs.getString(8);
				String status = rs.getString(9);
				
				
				teacher = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
		
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teacher;
		
	}

public int Searchteachername (String name , String lastname){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	int teacherid = 0;
	try {
		Statement stmt = con.createStatement();
		String sql = "select * from teacher where teachername like '%"+name+"%' and teacherlastname like '%"+lastname+"%' ";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			 teacherid = rs.getInt(1);
				
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return teacherid;
	
}


public List<teacher> SearchteacherALL(){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	List<teacher> listteacher = new ArrayList<>();
	try {
		Statement stmt = con.createStatement();
		String sql = "select * from teacher ";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int teacherid = rs.getInt(1);
			String teachername = rs.getString(2);
			String teacherlastname = rs.getString(3);
			String phonenumber = rs.getString(4);
			String teacheremail = rs.getString(5);
			String password = rs.getString(6);
			String teachertype = rs.getString(7);
			String teacherimg = rs.getString(8);
			String status = rs.getString(9);
			
			
			teacher teacher1 = new teacher(teacherid,teachername,teacherlastname,phonenumber,teacheremail,password,teachertype,teacherimg,status);
			listteacher.add(teacher1);
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return listteacher;
	
}

public int DELETEevaluatereport(String Tid , int rid)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("DELETE FROM evaluatereport WHERE Teacher_teacherid = '"+Tid+"' and Report_reportid = '"+rid+"'"); 
   conn.close(); 
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	} 

public int DELETEevaluatevideo1(String Tid , int videoid)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("DELETE FROM evaluatevideo WHERE Teacher_teacherid = '"+Tid+"' and Video_videoid = '"+videoid+"'"); 
   conn.close(); 
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	} 


}
