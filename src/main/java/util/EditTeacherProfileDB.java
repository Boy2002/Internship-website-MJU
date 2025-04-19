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

public class EditTeacherProfileDB {

	public EditTeacherProfileDB() {
		// TODO Auto-generated constructor stub
	}



	public int UPDATESTeacher(teacher TC)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
  
       statment.execute("UPDATE teacher SET teachername = '"+TC.getTeachername()+"',teacherlastname = '"+TC.getTeacherlastname()+"',phonenumber ='"+TC.getPhonenumber()+"',teacheremail = '"+TC.getTeacheremail()+"',password = '"+TC.getPassword()+"',teacherimg = '"+TC.getTeacherimg()+"' WHERE teacherid = '"+TC.getTeacherid()+"'"); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	
	public int UPDATESTeachernotPassword(teacher TC)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
  
       statment.execute("UPDATE teacher SET teachername = '"+TC.getTeachername()+"',teacherlastname = '"+TC.getTeacherlastname()+"',phonenumber ='"+TC.getPhonenumber()+"',teacheremail = '"+TC.getTeacheremail()+"',teacherimg = '"+TC.getTeacherimg()+"' WHERE teacherid = '"+TC.getTeacherid()+"'"); 
       conn.close(); 
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	

	
}
