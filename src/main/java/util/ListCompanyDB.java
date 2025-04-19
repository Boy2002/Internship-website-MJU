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

public class ListCompanyDB {

	public ListCompanyDB() {
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

public int SearchcompanyName (String name){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	int companyid = 0;
	try {
		Statement stmt = con.createStatement();
		String sql = "select * from company where companyname like '%"+name+"%'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			 companyid = rs.getInt(1);			
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return companyid;
	
}
	
public List<Company> SearchcompanyALL(String semester){
	
	List<Company> ListCompany = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT company.*, GROUP_CONCAT(student.studentid) AS student_ids FROM company INNER JOIN student ON company.companyid = student.Company_companyid WHERE semester LIKE '%"+semester+"' GROUP BY company.companyid";
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

public List<Company> SearchcompanyALL1(){
	
	List<Company> ListCompany = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM company ";
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


public List<Company> SearchcompanyALLname(String name){
	
	List<Company> ListCompany = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM company where companyname like '%"+name+"%'";
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

public List<Company> Searchcompanyname(String name , String semester){
	
	List<Company> ListCompany = new ArrayList<>();
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT company.* FROM company INNER JOIN student on company.companyid = student.Company_companyid WHERE semester LIKE '%"+semester+"%' AND companyname like '%"+name+"%' GROUP BY company.companyid";
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



public int COUNTstu (String semester , int id){
	
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	int stu = 0;
	try {
		Statement stmt = con.createStatement();
		String sql = "SELECT COUNT(studentid) FROM company INNER JOIN student on company.companyid = student.Company_companyid where semester like '%"+semester+"' and companyid = '"+id+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			 stu = rs.getInt(1);
			
		}
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return stu;
	
}


public int getMaxCompany(){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	Statement stmt = null ;

	int result = 0;
	try {
	stmt = con.createStatement();
	String sql = "Select MAX(companyid) from company";
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


public int addCompany(Company company){
	ConnectionDB condb = new ConnectionDB();
	Connection con = condb.getConnection();
	try {
	Statement statment = con.createStatement();
	statment.execute("insert into company values('"+company.getCompanyid()+"','"+company.getCompanyname()+"','"+company.getCompanyaddress()+"','"+company.getCoordinatorname()+"','"+company.getPhonenumber()+"','"+company.getEmail()+"','"+company.getWebsite()+"','"+company.getFacebook()+"',0)");
	con.close();
	return 1;
	
	}catch(Exception e){
	System.out.println(e);
	
	return -1;
	}
	}


public int UPDATECompany(Company company)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("UPDATE company SET companyname = '"+company.getCompanyname()+"' , companyaddress = '"+company.getCompanyaddress()+"' , coordinatorname = '"+company.getCoordinatorname()+"' , phonenumber = '"+company.getPhonenumber()+"' , email = '"+company.getEmail()+"' ,website = '"+company.getWebsite()+"' ,facebook = '"+company.getFacebook()+"' where companyid = '"+company.getCompanyid()+"' "); 
   conn.close(); 
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	}   


public int UPDATECompanyname(Company company)    {  
	try{  
		ConnectionDB dbcon = new ConnectionDB();
   Connection conn = dbcon.getConnection();   
   Statement statment = conn.createStatement(); 
   statment.execute("UPDATE company SET companyname = '"+company.getCompanyname()+"' , companyaddress = '"+company.getCompanyaddress()+"' , coordinatorname = '"+company.getCoordinatorname()+"' , phonenumber = '"+company.getPhonenumber()+"' , email = '"+company.getEmail()+"' ,website = '"+company.getWebsite()+"' ,facebook = '"+company.getFacebook()+"' where companyname like '%"+company.getCompanyname()+"%'"); 
   conn.close(); 
   return 1; 
   }catch(Exception e){          
	   return -1; }   
	
	}  

}
