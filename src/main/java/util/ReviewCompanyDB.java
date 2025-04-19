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

public class ReviewCompanyDB {

	public ReviewCompanyDB() {
		// TODO Auto-generated constructor stub
	}

	
	public int getMaxreview(){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Statement stmt = null ;

		int result = 0;
		try {
		stmt = con.createStatement();
		String sql = "Select MAX(reviewid) from review";
		ResultSet rs = stmt.executeQuery(sql);

		System.out.println(rs);
		while(rs.next()) {
		int id = rs.getInt(1);
		result = id;
		}

		}catch(SQLException e) {
		e.printStackTrace();
		}

		return result ;

		}
		
	
	public int addreview(Review review){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
		Statement statment = con.createStatement();
		statment.execute("insert into review values('"+review.getReviewid()+"','"+review.getReviewpicture()+"','"+review.getReviewdetails()+"','"+review.getReviewdate()+"','"+review.getReviewrating()+"','"+review.getStatus()+"','"+review.getStudent_studentid()+"')");
		con.close();
		return 1;
		
		}catch(Exception e){
		System.out.println(e);
		
		return -1;
		}
		}

	
public Review Searchreviewid (String id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Review review = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from review where Student_studentid = "+id+"";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				int reviewid = rs.getInt(1);
				String reviewpicture = rs.getString(2);
				String reviewdetails = rs.getString(3);
				String reviewdate = rs.getString(4);
				double reviewrating = rs.getDouble(5);
				String status = rs.getString(6);
				String Student_studentid = rs.getString(7);
				
				
				review = new Review(reviewid,reviewpicture,reviewdetails,reviewdate,reviewrating,status,Student_studentid);
		
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return review;
		
	}


public int UPDATEreview(Review review)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("UPDATE review SET reviewpicture = '"+review.getReviewpicture()+"',reviewdetails = '"+review.getReviewdetails()+"',reviewdate ='"+review.getReviewdate()+"',reviewrating ='"+review.getReviewrating()+"' ,status = '"+review.getStatus()+"' WHERE Student_studentid = '"+review.getStudent_studentid()+"'"); 
   conn.close();
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	} 

public List<Review> reviewALL(int id){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	List<Review> reviewlist = new ArrayList<>();
	try {
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM review INNER JOIN student ON review.Student_studentid = student.studentid where student.Company_companyid = "+id+" and review.status = 'ผ่าน' ";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int reviewid = rs.getInt(1);
			String reviewpicture = rs.getString(2);
			String reviewdetails = rs.getString(3);
			String reviewdate = rs.getString(4);
			double reviewrating = rs.getDouble(5);
			String status = rs.getString(6);
			String Student_studentid = rs.getString(7);
			
			
			Review review = new Review(reviewid,reviewpicture,reviewdetails,reviewdate,reviewrating,status,Student_studentid);
			reviewlist.add(review);
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return reviewlist;
	
}

public List<Review> reviewstatus(){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	List<Review> reviewlist = new ArrayList<>();
	try {
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM review INNER JOIN student ON review.Student_studentid = student.studentid where status = 'ไม่ผ่าน'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int reviewid = rs.getInt(1);
			String reviewpicture = rs.getString(2);
			String reviewdetails = rs.getString(3);
			String reviewdate = rs.getString(4);
			double reviewrating = rs.getDouble(5);
			String status = rs.getString(6);
			String Student_studentid = rs.getString(7);
			
			
			Review review = new Review(reviewid,reviewpicture,reviewdetails,reviewdate,reviewrating,status,Student_studentid);
			reviewlist.add(review);
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return reviewlist;
	
}


public List<VDO> Approvevdo(){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	List<VDO> VDOlist = new ArrayList<>();
	try {
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM video where status = 'ไม่ผ่าน'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			int videoid = rs.getInt(1);
			String filename = rs.getString(2);
			String sentdate = rs.getString(3);
			String status = rs.getString(4);
			String semester = rs.getString(5);
			int Company_companyid = rs.getInt(6);
			
			VDO VDO = new VDO(videoid,filename,sentdate,status,semester,Company_companyid);
			VDOlist.add(VDO);
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return VDOlist;
	
}

public List<Company> companyALLDESC(){
	
	List<Company> ListCompany = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM company where average > 0 ORDER BY average DESC LIMIT 0,3 ";
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
			
			Company cp = new Company(companyid,companyname,companyaddress,coordinatorname,phonenumber,email,website,facebook,average);
			ListCompany.add(cp);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return ListCompany;
	
}

public List<Company> companyALL1DESC(){
	
	List<Company> ListCompany = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM company where average > 0 ORDER BY average DESC  ";
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
			
			Company cp = new Company(companyid,companyname,companyaddress,coordinatorname,phonenumber,email,website,facebook,average);
			ListCompany.add(cp);
		}
		
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return ListCompany;
	
}

public double getscoreAVG(int idCom){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	Statement stmt = null ;

	double result = 0;
	try {
	stmt = con.createStatement();
	String sql = "SELECT AVG(reviewrating) FROM review INNER JOIN student ON student.studentid = review.Student_studentid where Company_companyid = '"+idCom+"' and review.status = 'ผ่าน'";
	ResultSet rs = stmt.executeQuery(sql);

	System.out.println(rs);
	while(rs.next()) {
	double id = rs.getDouble(1);
	result = id;
	}

	}catch(SQLException e) {
	e.printStackTrace();
	}

	return result ;

	}

public int UPDATEAVG(double AVG , int idCOM)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("UPDATE company SET average = '"+AVG+"' WHERE companyid ='"+idCOM+"' "); 
   conn.close();
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	} 

public String getscorING(int idCom){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	Statement stmt = null ;
	String result = null;
	System.out.println("idCom : "+idCom);
	try {
	stmt = con.createStatement();
	String sql = "SELECT reviewpicture FROM review INNER JOIN student ON student.studentid = review.Student_studentid where Company_companyid = '"+idCom+"' and review.status = 'ผ่าน'";
	ResultSet rs = stmt.executeQuery(sql);

	System.out.println(rs);
	while(rs.next()) {
	String id = rs.getString(1);
	result = id;
	}

	}catch(SQLException e) {
	e.printStackTrace();
	}

	return result ;

	}


public int UPDATEstatusreview(String status , String idreview)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("UPDATE review SET status = '"+status+"' WHERE reviewid ='"+idreview+"' "); 
   conn.close();
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	} 

public int UPDATEstatusreVDO(String status , String videoid)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("UPDATE video SET status = '"+status+"' WHERE videoid ='"+videoid+"' "); 
   conn.close();
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	} 
	
}
